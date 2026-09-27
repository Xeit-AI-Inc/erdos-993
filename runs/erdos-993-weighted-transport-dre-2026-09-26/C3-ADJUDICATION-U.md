# Orientation Adjudication

Orientation U (formal / structural), Cycle 3 Stage 5, r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`), Erdős #993,
weighted mixed-boundary transport. Portfolio: returns `U1` (`C3-U-01 LEAN-INV-QUOTIENT-NM-AND-LEMMA-U`) and `U2`
(`C3-U-02 PRODUCT-FORM-FLOW-CERTIFICATE-ON-CB-ROWS`), and their critiques `C-U1-F`, `C-U1-T`, `C-U2-F`, `C-U2-T`. Date 2026-09-26.

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` (in two ranges,
because the tool display truncated it) and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I loaded no other
VerityOS subsystem. The harness put the project `CLAUDE.md` and the user auto-memory index into context at session start. I did
not open either as a source, and nothing below relies on them.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

| Object | Stored / expected | Recomputed | Result |
|---|---|---|---|
| Dispatch `control/dispatch/c3-stage5/DISPATCH-ADJ-U.md` | `506c9218f6267a8ba6c81342fce4bab13b9f5efb3d3fbda2144be10bd01372ff` | same, computed before the file was read | match |
| **Capsule seal** `control/c3-adjudicator-capsules/U-PACKET-MANIFEST.json` (canonical JSON without `seal_sha256`: sort_keys, `(",", ":")`, no trailing newline) | `ce4350457339e7411a3e9d416e929d405d4bfbb906fc82f8937fe4923f6bce58` | `ce4350457339e7411a3e9d416e929d405d4bfbb906fc82f8937fe4923f6bce58` | **match; this is the capsule seal I report** |
| The 20 capsule members (bytes and SHA-256 each) | manifest | recomputed (`scratchpad/c3-adj-U/verify_capsule.py`) | 20/20 match |
| Stage 2 packet manifest seal (1051 files) | `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416` | same | match; also equals the Stage 3 admission's `source_seal` |
| Stage 3 packet manifest seal (35 files) | `64c6c84aabe2392394f680abb3c8862a349f06a4f8043a9960b706f35b294797` | same | match; its rows for both U returns equal the capsule's |
| Stage 4 packet manifest seal (53 files) | `25f6f51a07ff8427379ef50c03c5e172dc260cafa72f1def8afb6dc67424d495` | same | match; its rows for the four U critiques and every shared control file equal the capsule's |
| `U1/RETURN.md`, `U2/RETURN.md` | `d206b783…41ce`, `7970cdbf…a72b` | same | match (capsule, Stage 3 manifest, Stage 3 admission) |
| Critiques `U1/F`, `U1/T`, `U2/F`, `U2/T` | `6ccf94cb…`, `5fc90fe1…`, `c772e68c…`, `0b7ab261…` | same | match (capsule, Stage 4 manifest, Stage 4 admission; all `retained_narrowed`, `headline_resolved: no`) |
| Replayed scratch before copy-out: U1 `Main.lean` | `f3b21020433375b01e1bcdd89d8996dd2198ad2ac438557bda8774b73a57b180` | same, in `c3-U1/` and both critic copies | match; scaffold files byte-identical across the three projects |
| Critic Lean files `CriticQuot.lean`, `CriticNM.lean` (C-U1-F); `CritAdv.lean`, `CritNM.lean` (C-U1-T) | `63814f60…`, `82afd1a2…`, `8de15f02…`, `19883e92…` (critique inventories) | same | match |
| C1-LA1 / C2-LA1 `Main.lean` copies in `scratchpad/c3-crit-U1-F/` | `86b59c6c…e0cb` / `a9cf3b81…7fc4` (allocation prefixes; full values quoted by U1 and both critics) | same | match |
| Frozen `sources/lower-region/instruments/cb-switch-cut/RESULTS.json` | `SOURCE-DIGESTS.json`: 1,519,804 B, `873cf922…d5d5` | same, checked before reading | match |

**Controller facts** (`control/C3-STAGE5-CONTROLLER-FACTS-U.json`, `fc58e996…`): read as one more instrument, never as
authority. The replay records it cites (`control/controller-facts/CF-REPLAY-c3*.json`) and the disclosures addendum
(`control/C3-STAGE3-READ-BOUNDARY-DISCLOSURES.addendum.json`) are not capsule members, so I did not read them. CF-U1 and CF-U2
agree with everything I replayed below.

**Process record of the portfolio.**
- U1's disclosures (PIN.json read before its digest check, clean; two non-recursive `ls`; targeted reads of sealed Cycle 1–2
  records) are adequate.
- U2's return discloses one above-grant non-recursive `ls -la scratchpad/` and one harness-backgrounded job stopped by
  `TaskStop`. The Stage 3 disclosures record says "none reported". Both U2 critics flag this. CF-2 records a controller addendum
  correcting it. The return is the verbatim record.
- C-U1-F disclosed a stray `/tmp` write (deleted at once, never read back) and exact-path reads of the two `runs/` award files.
- C-U1-T and C-U2-T each ran one background job or none, and confirmed it gone.

**My read-boundary disclosures.**
1. Harness context injection (the project `CLAUDE.md` and auto-memory index): not opened, not used.
2. Non-recursive `ls` of granted scratch directories only: `c3-U1/` and its `LeanProject/`, `LeanProject/LeanProof/`,
   `LeanProject/.lake/`; the same levels of `c3-crit-U1-F/` and `c3-crit-U1-T/`. I never listed `scratchpad/` itself.
3. Single-file `grep` over my own copied-out `Main.lean` and critic files. One `find` for `__pycache__`, rooted in my own scratch
   directory: empty.
4. I read the digest-checked frozen `cb-switch-cut/RESULTS.json` (authorized `sources/`). I wrote nothing under `sources/`.
5. One `lake build LeanProof` was auto-run in the harness background (task `bl2yq7tdz`). It exited 0 on its own, and its shell
   PID 95837 was confirmed gone. Every later `lake`/`lean` call ran in the foreground, after `cd` into
   `scratchpad/c3-adj-U/LeanProject`. Mathlib is bound by a manual symlink of `.lake/packages` to
   `/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages`. I never ran `lake update` or
   `lake clean`.
6. I read no other orientation's portfolio or adjudication, no prior synthesis, no `runs/` or `second-reads/` file, no other
   experiment root and no external source. No network, no installs.

## Route-by-route decisions

### U1 — `C3-U-01 LEAN-INV-QUOTIENT-NM-AND-LEMMA-U`: route verdict `compiled`, retained narrowed

The paired critics agree on every claim. I resolve each claim below, weighting replays above self-reports.

| # | Claim (U1) | C-U1-F | C-U1-T | Adjudicator replay | Ruling |
|---|---|---|---|---|---|
| 1 | Baseline is C1-LA1 byte-identical plus C2-LA1 entries 22–77 with the duplicate entry 31 removed | narrowed (one blank separator line also dropped) | backed (reconstruction hashes to `a9cf3b81…`) | `carry_adj.py`: U1 file prefix = C1-LA1 exactly; every C2-LA1 block 22–77 except 31 occurs verbatim; C2 31 body = C1 24 body; C2 entries 1–21 = C1 1–21 | **backed at entry-block level**. U1's gloss "re-carried the whole C1-LA1 base" is struck; C2-LA1 carries C1 entries 1–21 plus entry 24 as its entry 31 only |
| 2 | `lake build LeanProof` succeeds (8657 jobs), no `sorry`/`admit`/`native_decide`/`axiom`/`decide` | backed | backed | rebuilt from an empty `.lake/build`: `Build completed successfully (8657 jobs)`, `LeanProof.Main` built in 32 s, 19 linter warnings, 0 errors | **backed** |
| 3 | `#print axioms`: "nine load-bearing declarations (three inherited, six new)" | struck: ten / seven | struck: ten / seven | ten declarations print exactly `[propext, Classical.choice, Quot.sound]` (`adj_axioms.txt`) | **count struck (ten: three inherited, seven new)**. U1's inventory ships **no** axioms log (0 axiom lines in `build_final.txt` and `build_full2.txt`), so U1's axiom literals are backed only by three replays (the two critics and mine), not by U1's own shipped evidence |
| 4 | Lemma U `exists_transportRel_iff`, fully discharged, graph-generic | backed; 578,153 triples, 0 mismatches | backed; 827,972 checks, 0 mismatches | kernel-checked (axioms clean); my own statement-semantics check (`adj_checks2.py`), every labelled graph `n ≤ 5`, every rank: 13,224 checks, 0 mismatches, 2,717 targets with no in-arc | **backed as `compiled`**. Its alias to SR-C2-4's Lemma U / P10 is U1's quotation; the second reads are outside my capsule, so the alias is unverified here and carries no weight |
| 5 | Orbit lemmas `orbitOf`, `mem_orbitOf_self`, `orbitOf_subset_of_mem_invariant`, `invariant_iff_orbitOf_subset`, `covered_orbitUnion`, `supply_orbitOf` | backed; `hXsub` unused in two statements | backed; same | compiled; axioms clean | **backed**. The unused binders are harmless |
| 6 | Remaining gap in (INV): representatives plus a "harder" capacity-side analogue | struck (`cov = supply ∘ covered` by `rfl`) | struck | the critics' closures compile (below) | **struck**. The only real gap was the partition plus disjoint-sum bookkeeping |
| 7 | `regular_bipartite_shadow_bound` is "strictly more general" than NM's core; "new compiled material" | narrowed (special case of `Finset.card_mul_le_card_mul`) | narrowed (same, ten-line derivation) | compiled; statement read | **narrowed** to "a restatement of pinned-Mathlib double counting". It is not a run key and should not become one |
| 8 | Replay in `scratchpad/c3-U1-replay/` with `AxCheck.lean` | unbacked by the shipped inventory | unverified | outside my grant | **unbacked; superseded** by three independent rebuilds |
| 9 | `Fintype (G ≃g G)` does not synthesize at the pin | backed by probe | backed by probe | not re-probed; not load-bearing | **backed** by two probes |
| 10 | Grades: all `compiled`, no key requested | backed | backed | — | **backed**. "Fully discharged … no remaining gap" is read as "kernel-checked in scratch, no grade" (ruling 23) |

**Critic-derived advances on U1 (critic-attributed; compiled scratch; no grade until a governed award):**
- **(INV), quotient clause, for `Γ = Aut(G)` and `F = F_p(G)`.** Both critics produced it independently:
  - C-U1-F: `weightedHall_iff_quotientHall`, with named definitions `orbits`, `orbitArc`, `QuotientHall`;
  - C-U1-T: `crit_weightedHall_iff_orbitQuotientHall`, with the quotient condition written inline.

  I rebuilt both on the copied-out baseline, built both modules as oleans, and proved in Lean that the two statements are the
  same proposition: `adj_two_quotient_forms_agree` in `AdjAx.lean`, axioms `[propext, Classical.choice, Quot.sound]`. There is no
  paired-critic disagreement here. Two independent formalizations agree, and the kernel confirms the agreement.
- **NM poset half (C-U1-T).** `down_card` (down-degree = rank), `up_card` (up-degree = `2(N − rk)`), `rk_of_Rdel`, and
  `shadow_degree_bound` (`|X|·k ≤ |∂X|·2(N+1−k)`) on `Fin N → Option Bool`. Rebuilt; axioms clean.
- **NM ratio form (C-U1-F).** `critic_normalized_matching` (needs `0 < dbot` and the global count), plus the weakened
  double-count `critic_shadow_bound_weak`. Compiles with no errors.

### U2 — `C3-U-02 PRODUCT-FORM-FLOW-CERTIFICATE-ON-CB-ROWS`: route verdict `bounded_evidence`, retained narrowed

Obligation (a), an exact certificate on the full mixed networks of `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`, is **not
achieved**. The return says so, and both critics and I concur. Claim by claim:

| # | Claim (U2) | C-U2-F | C-U2-T | Adjudicator replay | Ruling |
|---|---|---|---|---|---|
| 1 | Row values `n, α, x, |F|, supply, capacity, S` on `CB(1,7)/10`, `CB(2,5)/10`, `CB(3,5)/13–14`, `CB(4,4)/14`, the three `CB(8,·)` rows; `CB(8,92)` `S` = frozen `aggregate` | backed (own instrument; verified flows) | backed (dual-number weight DP; certificate checker) | `adj_cb_big.py`: `S` from a generic rooted forest DP (removed vertices, identical-subtree powers), independent of `W(x)`; supply/capacity from `W(x)`; `CB(3,5)/13` = 38,064,305 / 54,292,890 / −16,228,585; all three `CB(8,·)` rows eligible, `F_p` = all `dm+1` leaves (v and a private-leaf orbit representative), `Δ_x < 0 ≤ Δ_{x−1}`, `supply − capacity = S` from independent sides, and my `CB(8,92)/492` `S` equals the frozen integer | **backed** |
| 2 | Digit-count annotations for the `CB(8,·)` rows; "no literal typed by hand" | struck | struck (11 of 15 wrong) | actual digit counts, 86 / 89 / 92 rows: `Δ_x` 326 / 337 / 349; `Δ_{x−1}` 327 / 338 / 350; supply = capacity digits 330 / 342 / 353; `S` 328 / 340 / 351 | **struck**; the values themselves stand |
| 3 | Candidate 1, whole-network `W(x) = x²(1+2x)^{dm} + m·d·x²(1+x)^{d−1}(1+2x)·Br(x)^{m−1}`, `Br = x(1+x)^d + (1+2x)^d`, `F` = full leaf set | correct; Tier-3 record, not a key | correct; Tier-3 record, not a key | matches literal enumeration at every rank on 8 shapes, `(d,m) ∈ {(1,1),(2,1),(1,2),(2,2),(3,1),(1,3),(3,2),(2,3)}` | **mathematics correct (proved_informal-quality: two critic re-derivations plus three instruments); ruled a Tier-3 record attached to `R30-CB-RECORD`, not an `E993-R30-…` key.** It carries no transport content, since its only downstream use is supply − capacity = `S` (WID). Any row use requires `F_p(CB(d,m))` = leaf set to be derived at that row; C-U2-T's `CB(5,2)/7` is a row where it is not |
| 4 | Candidate 2, `CB(2,2)/4` sector: deletion-only 24 < 32, (D) ∪ (S) saturates 32; "smallest"; "first" | bounded record; "smallest" struck (`CB(4,1)/4`, order 12, smaller); "first" struck | bounded record; deletion half = the registered sector-deficit formula at `t = 1, M = 4, k = 3`; "first" struck | `adj_instr.py`: sector 32; deletion-only flow 24 (violator = the whole sector, deficit 8); full flow 32 (verified). Whole network: supply 148, capacity 116, `S = +32`, both max-flows 116. `CB(4,1)/4` sector: 24 → 32 | **retained as a `bounded_computation` record at a non-eligible rank of a tree with no eligible rank; not a key.** "Smallest" and all "first" literals struck |
| 5 | `CBstar(2,2,2)` "corroborates" `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` ("`t ≥ 2`: never deletion-deficient at any rank"), `deletion_only_Hall_holds` | struck: whole-sector inequality only; key misquoted; `p = 7` eligible and unreported; no `S` assertion | struck: same four points; non-eligible `t ≥ 2` deficits exist | `CBstar(2,2,2)`: `n 17, α 11, x 5`, window `[7,7]`, `|F| 9`. `p = 5`: 4275 / 2816 / +1459. `p = 6`: 3888 / 4275 / −387. **`p = 7` (eligible): 2194 / 3888 / −1694**, deletion-only flow 2194 (saturates); every sector subfamily has deficit 0 at `p = 5, 6, 7`. Non-eligible `t ≥ 2` sector deletion deficits reproduced: `CBstar(1,1,2)/2` 2, `CBstar(1,2,2)/3` 3, `CBstar(2,1,2)/3` 3, `CBstar(1,1,3)/2` 3 | **struck as a corroboration and as a Hall statement**; the paraphrase "at any rank" is false. The registered key (eligible ranks) stands untouched. The eligible row `CBstar(2,2,2)/7` (critic-derived row data) is a `bounded_computation` record, not evidence for (HALL) |
| 6 | `CB(1,7)/10`, `CB(2,5)/10` full max-flows; "first genuine max-flow solves" | values backed; "first" struck; "exhibited flow" narrowed to "max-flow value" | values backed; "first" struck | not re-run (already-saturating rows; repetition is not evidence) | **values backed by two critic instruments; priority struck; no evidential weight (allocation standing state)** |
| 7 | `CB(2,5)/10` "data-quality correction" of Cycle 2 U2's table | outside grant | "not a contribution" (already a controller fact per the attack brief) | the correct values 259,980 / 396,460 / −136,480 are replayed by both critics | **not a contribution**; the correct values stand |
| 8 | Verification lemma (a rational saturating flow implies WeightedHall for every `X`) required on the face | missing; supplied by the critic | missing; supplied by the critic | proof read: three lines, correct | **missing from the return; critic-derived (both critics), proved_informal-quality, STATED** |
| 9 | Obligation (c), switch-load-bearing saturation on a whole tree | met in its non-eligible reading by the critic: `CB(4,1)/4` and an order-8 tree | Candidate 2 is only a sector; `CB(2,2)/4` whole network not switch-load-bearing | `CB(4,1)/4` whole tree: supply 60 = capacity 60, `S = 0`, deletion-only 52 (violator: 32 against 24), full 60 (verified). Order-8 tree `0–1, 1–2, 2–3, 2–6, 2–7, 3–4, 3–5`, `p = 3`: `i = (1,8,21,24,12,2)`, `α 5, x 3`, window `[5,3]`, `|F| 5`, 29 / 32 / −3, deletion-only 27 (violator 9 members, 22 against 20), full 29 (verified) | **no disagreement.** (c) in its eligible reading (the target) is not met by anyone. In its non-eligible reading it is met by C-U2-F (critic-attributed, `bounded_computation`, replayed by me) |

**Critic-derived advances on U2 (critic-attributed; STATED; each needs an isolated second read before registration):**
- The verification lemma (both critics).
- C-U2-T's `CB(1,m)` lemma: every (S)-target of a root-plus-arm source has active weight 0, for any tag set. I checked the
  argument line by line and it is correct. My replay agrees for `m ≤ 5`: 910 switch targets, 0 with positive weight.
- C-U2-T's `CB(d,1)` whole-sector sums at `p = k+1`: `2^k·C(d,k)` against `C(d,k−1)(2^{k−1}+k−1)`. My replay agrees on all 15 rows
  with `d = 2..7` where `F_p` = all leaves. The non-eligible (D) ∪ (S) sector deficits `CB(3,1)/3` (12 against 9),
  `CB(5,1)/4` (80 against 60) and `CB(6,1)/5` (240 against 220) are reproduced.
- C-U2-F's whole-tree switch search: 1,292 non-eligible rows through order 15 are deletion-deficient but saturate under
  (D) ∪ (S). I replayed only its smallest witness and `CB(4,1)/4`, not the census, so the count stands at C-U2-F's single-instrument
  `bounded_computation`.

## Cross-route reconciliation

- **The U routes do not conflict.** U1 (formal) and U2 (certificate) share no claim. Their critiques converge on two structural
  facts, and I confirm both.
  1. **The class-union reduction is now formally sound but not feasible at the target rows.** The orbit-quotient Hall equivalence
     (C-U1-F / C-U1-T) makes an `Aut`-class-union cut search a faithful Hall test on any finite simple graph, and it gives the
     Hall-level converse that ruling 25 demands: a quotient deficit `𝒮` yields the explicit invariant original deficient family
     `𝒮.biUnion id`. But it supplies no feasibility. The orbit spaces at the three `CB(8,·)` rows are about 3·10^37 per layer, so
     neither the quotient nor U2's totals-only `W(x)` touches the coupled families (sector + positive-weight V + positive-weight
     S/O).
  2. **Switch arcs are load-bearing on whole trees, but so far only below the window.** This narrows the standing-state sentence
     "switch arcs have NEVER been load-bearing on any computed tree row" to **eligible** rows:
     - C-U2-F's order-8 tree (`S = −3`) and `CB(4,1)/4` (`S = 0`) are whole-tree switch-necessary saturations at non-eligible
       ranks, replayed by me;
     - C-U2-T's `CB(d,1)` and `CB(1,m)` results show that switch rescue of the sector fails at non-eligible ranks (`CB(3,1)/3`,
       `CB(5,1)/4`, and every `CB(1,m)`).

     So any sector switch-rescue lemma must carry eligibility, with `F_p` derived, as a load-bearing hypothesis. No eligible
     switch-necessary row below `CB(8,86)/460` is known.
- **An observed coincidence, not a claim.** On every row I computed, the full network saturates exactly when `S(T,p) ≤ 0`:
  - saturating: `CB(4,1)/4` (`S = 0`), the order-8 tree, `CBstar(2,2,2)/6,7`;
  - failing: `CB(2,2)/4`, `CB(3,1)/3`, `CB(5,1)/4`, `CBstar(2,2,2)/5`, all with `S > 0`.

  This matches C-U2-F's observation through order 15. "`S > 0` ⇒ Hall fails" is trivial (take `X = I_{p+1}`). The converse,
  "on trees, `S(T,p) ≤ 0` ⇒ a saturating flow at every rank `p`", is an unregistered **conjecture** (critic-attributed,
  `bounded_computation`). It would make (HALL) equivalent to the primary aggregate on trees. It is recorded as a falsification
  target, never as evidence.
- **The controller's prior (CF-U1, CF-U2)**, weighed as one more replay, agrees with every item above, including the
  `CB(2,2)/4` whole-layer 148 > 116 and the `CB(3,1)/3` 12 against 9.

## Established results

Grades are those of `SOLUTION-CONTRACT.md` §4. "Compiled" means kernel-checked in scratch, with no grade until a governed award.

**Exact theorems (compiled; rebuilt by the adjudicator; axioms exactly `propext`, `Classical.choice`, `Quot.sound`):**

1. `E993Transport.exists_transportRel_iff` (U1). Every finite simple graph (`Fintype V`, `DecidableEq V`, `DecidableRel G.Adj`),
   every rank `p`, every `A ∈ indepFamily G p`: `A` has a (D) ∪ (S) in-arc iff `A` is not maximal, or some `u ∈ A` has a
   non-adjacent pair `y ≠ z` with `N(y) ∩ A = N(z) ∩ A = {u}`.
   - Hypotheses consumed: `A`'s cardinality and independence only.
   - Not consumed: `IsTree`, eligibility, `x`, the selector.
   - Authored in-run. Content: SR-C2-4's Lemma U per U1's quotation (unverified here).
2. U1's orbit block, on the full `Aut(G)`: `orbitOf`, `mem_orbitOf_self`, `orbitOf_subset_of_mem_invariant`,
   `invariant_iff_orbitOf_subset` (an invariant family in the layer is exactly a union of orbits), `covered_orbitUnion`, and
   `supply_orbitOf` (an orbit's supply is `|O|·w_F(B)` for `F = F_p(G)`).
   - Hypotheses consumed: the unconditional `Aut`-invariance of `favorableLeaves` (C2-LA1 entry 41).
   - Any finite simple graph.
3. **The (INV) quotient clause (critic-derived; C-U1-F and C-U1-T independently):**

   ```text
   theorem crit_weightedHall_iff_orbitQuotientHall (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) :
       WeightedHall G (favorableLeaves G p) p ↔
         ∀ 𝒮 ⊆ (indepFamily G (p + 1)).image (orbitOf G (p + 1)),
           ∑ O ∈ 𝒮, supply G (favorableLeaves G p) O ≤
             ∑ O' ∈ ((indepFamily G p).image (orbitOf G p)).filter
                 (fun O' => ∃ O ∈ 𝒮, ∃ B ∈ O, ∃ A ∈ O', transportRel G B A),
               supply G (favorableLeaves G p) O'
   ```

   - This is equivalent in Lean (my `adj_two_quotient_forms_agree`) to C-U1-F's `weightedHall_iff_quotientHall :
     WeightedHall G (favorableLeaves G p) p ↔ QuotientHall G (favorableLeaves G p) p`.
   - Scope: any finite simple graph, any rank `p`, `Γ = Aut(G)` (all automorphisms), `F = favorableLeaves G p`. Orbit-total
     supplies and capacities; an orbit arc iff some member pair is joined by (D) ∪ (S).
   - The proof composes C2-LA1's companion `weightedHall_iff_invariant` (entry 76), which rests on the supermodularity and
     `canonMin` chain of entries 22–75, with U1's orbit block and the critics' partition and class-union lemmas.
   - As mathematics it is complete. I verified it at full scope, and it contains no appeal to flows or to (LIFT).
4. NM poset facts (C-U1-T): `down_card`, `up_card`, `rk_of_Rdel`, `shadow_degree_bound` on `Fin N → Option Bool`. Abstract
   poset only.
5. Carried and re-verified, not re-proved: `activeWeightAggregateIdentity` (WID, `formally_verified`, C1-LA1),
   `weightedHall_iff_invariant` (C2-LA1 companion), and `exists_aut_invariant_deficient_of_not_weightedHall` (C2-LA1 terminal,
   `formally_verified`).

**Informal results (STATED at a review stage; critic-attributed; proved_informal-quality; each needs an isolated second read
before registration):**
- The verification lemma, rational saturating flow ⇒ (HALL-COND) for every `X` (C-U2-F, C-U2-T). With (HALL⇒FLOW) it yields an
  integral flow; with C1-LA2 it yields `S ≤ 0`.
- The `CB(1,m)` switch-weight-zero lemma (C-U2-T).
- The `CB(d,1)` whole-sector sum formulas (C-U2-T). The derivation is sketched on the face; my 15-row replay agrees.
- `W(x)` for `CB(d,m)` with `F` = the leaf set (U2; re-derived by both critics). A Tier-3 record, not a key.

**Bounded computations (exact; relation (D) ∪ (S) or deletion-only as named; weight `w_F` literal; `F_p` derived; `x` through
`α`; `supply − capacity = S` asserted from independent sides on every row listed):**
- Every U2 row value in its tables (claim 1 above).
- `CBstar(2,2,2)/7`, eligible: 2194 / 3888 / −1694, saturates deletion-only.
- Non-eligible witnesses: `CB(2,2)/4` sector; `CB(4,1)/4` and order-8 whole-tree switch-necessary saturations; `CB(3,1)/3` and
  `CB(5,1)/4` sector (D) ∪ (S) deficits; four `t ≥ 2` sector deletion deficits.

None of these is a (CUT): every deficit is at a non-eligible rank, and every eligible row computed saturates.

**Record corrections (for the synthesis):**
- U1: axiom count "ten / seven"; the carry description; the (INV) gap statement.
- U2: the `CB(8,·)` digit counts; the `CBstar` paraphrase; "smallest" and the "first" literals.
- The Stage 3 disclosures entry for U2 (already addended per CF-2).
- Narrow the standing-state sentence on switch arcs to eligible rows.

## Rejected and narrowed mechanisms

- **Struck, never cited as evidence:**
  - U2's `CBstar(2,2,2)` "corroboration", and `deletion_only_Hall_holds` (a whole-sector inequality is not (HALL-COND)).
  - U2's paraphrase "`t ≥ 2`: never deletion-deficient at any rank", which is false at non-eligible ranks (four replayed
    deficits).
  - U2's "smallest" `CB(2,2)/4` and its three "first" claims.
  - U2's hand-typed digit counts.
  - U2's inventory claim of a `dm ≤ 16` sweep (no generator shipped).
  - U1's "capacity-side analogue (harder)" obligation.
  - U1's nine / six axiom count.
  - U1's replay-directory literal (`AxCheck.lean` not shipped).
- **Narrowed:**
  - `regular_bipartite_shadow_bound` is a restatement of Mathlib `Finset.card_mul_le_card_mul`; no key.
  - U1's carry wording.
  - "Exhibited flow" on the U2 full rows becomes "max-flow value (Dinic)".
  - Candidate 2 is a non-eligible sector record.
  - `W(x)` is a Tier-3 record.
- **No refuted mechanism revived.**
  - Lemma U is a reachability characterization of the literal relation, not a Hall or SDR mechanism.
  - The quotient theorem is an equivalence of Hall conditions for the full `Aut(G)`. It is not `…-FIXED-GAMMA-HALL`, and it
    does not treat (LIFT) as feasibility.
  - The deletion-only failures in the portfolio are r30 active-weight statements asserted as failures, not as mechanisms. They
    are distinct from `E993-R23-LITERAL-DELETE-ONLY-HALL`, since the weight, demand and relation all differ.
  - Nothing uses own-support unit capacity, per-leaf injectivity, occupancy domination, Delete/Retag, signed cross-tag or
    covariance.
- **Fences held.**
  - No closed region is re-proved.
  - The already-saturating `CB(1,7)/10` and `CB(2,5)/10` carry no weight.
  - No census value enters a proof.
  - No RTree wording.
  - `D, C ≥ 0` is never used as a budget.
  - The primary aggregate is untouched.

## Lean readiness

This is the central ruling. It is decided per award group, against (a) a complete informal proof with a closed dependency DAG,
(b) compiled fragments covering the DAG nodes sorry-free, and (c) named open nodes.

**(WID) at `SOLUTION-CONTRACT.md` §2.** Already `formally_verified` (C1-LA1 `86b59c6c…`). In my orientation it is carried
byte-identically and rebuilt: `activeWeightAggregateIdentity` has clean axioms. No new award is needed. Nothing here changes it.

**Group U-A — the (INV) quotient clause: CONTRACT-READY (subject to the fences below).**
- (a) Complete. The DAG:
  1. `WeightedHall` ⇔ Hall on `Aut`-invariant families (C2-LA1 entry 76);
  2. invariant ⇔ union of orbits (U1);
  3. orbits partition the layer (`crit_orbitOf_eq_of_mem`, `crit_orbits_pairwiseDisjoint`);
  4. supply of a union of orbits = the sum of orbit totals (`crit_supply_eq_sum_orbits`, `crit_sum_biUnion_orbits`);
  5. the covered set of an invariant family is a union of target orbits, equal to the union of the target orbits joined to the
     source orbits (`covered_orbitUnion`, and the two inclusions in the terminal proof; C-U1-F's `covered_biUnion` gives the
     equality);
  6. the terminal iff.
- (b) Every node is compiled sorry-free; my rebuild is `adj_axioms.txt`.
- (c) No open node.
- **Exact statement (recommended terminal theorem):** C-U1-T's inline form above, renamed without the `crit_` prefix (for
  example `weightedHall_iff_autOrbitQuotientHall`). It adds exactly one new definition (`orbitOf`) beyond the carried vocabulary,
  which keeps the fidelity review smallest. C-U1-F's named form (`orbits`, `orbitArc`, `QuotientHall`) is an equivalent
  alternative; the synthesis freezes one.
- **Hypotheses:** `{V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)`. No `IsTree`, no
  eligibility, no `p ≥ 1`. `Γ` = all of `G ≃g G`. The tag set is `favorableLeaves G p`, invariant unconditionally.
- **Carried fragments:**
  - C1-LA1 `Main.lean` entries 1–36 (`86b59c6c…e0cb`), byte-identical;
  - C2-LA1 `Main.lean` (`a9cf3b81…7fc4`, receipt-bound) entries 22–30 and 32–76, byte-identical.
- **New declarations:**
  - U1: `orbitOf`, `mem_orbitOf_self`, `orbitOf_subset_of_mem_invariant`, `invariant_iff_orbitOf_subset`,
    `covered_orbitUnion`, and optionally `supply_orbitOf` with `crit_supply_orbit_eq_card_mul` as the product-form companion;
  - C-U1-T: `crit_map_map_aut`, `crit_orbitOf_eq_of_mem`, `crit_orbitOf_subset`, `crit_orbits_pairwiseDisjoint`,
    `crit_biUnion_orbits`, `crit_supply_eq_sum_orbits`, `crit_sum_biUnion_orbits`, and the terminal theorem;
  - or C-U1-F's equivalent chain.
- **Fences:**
  1. **Binder diff against the registered text** of `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`, which is outside every
     capsule this cycle. The diff checks: `Γ` (all of `Aut(G)`, or an arbitrary subgroup); the tag set (`F_p`, or any invariant
     degree-one set); graph or tree scope; orbit totals; and the orbit-arc definition. If the registered text is wider, the award
     registers at this proved scope as its exact scope, or the proof is widened (the partition and sum lemmas go through for any
     subgroup), and the award does not overclaim.
  2. **C2-LA1's duplicate entry 31** (= C1-LA1 entry 24) is dropped. C2-LA1's terminal theorem, entry 77, is not needed by this
     proof and is not carried. If it is carried, it becomes a `lemma` so that one terminal `theorem` remains (R29-N-12).
  3. U1's declarations use the keyword `theorem`; companions become `lemma`. Keep the harmless unused `hXsub` binders
     byte-identical, or record their removal as a statement change.
  4. The award is an equivalence of Hall conditions. It proves no quotient feasibility, it is not (HALL), and it must say so on
     its face.
  5. **Attribution:** C1-LA1 and C2-LA1 carried; U1 (Claude Sonnet 5) for the orbit block; critic-derived C-U1-T / C-U1-F
     (Claude Opus 5.5) for the partition, the class-union identity and the terminal theorem; Codex for (LIFT)'s conventions.
  6. The critic-derived statement was first stated at a review stage. An isolated second read of the binder diff, before
     registration, is required by `SOLUTION-CONTRACT.md` §4.

**Group U-B — Lemma U (`exists_transportRel_iff`): LEAN-READY, but not an award group of its own on my evidence.**
- (a), (b) and (c): complete, compiled, no open node.
- It is graph-generic, and it is not used by U-A.
- U1 reports that SR-C2-4 ruled it an alias of P10 needing no key; I cannot verify this. It certifies nothing new unless the
  synthesis names a registered key it formalizes.
- Recommendation: carry it as a Lean text of record for the reachability fact, with a governed award only at the controller's
  discretion, the P10 alias recorded, and no new key.

**Group U-C — (NM) `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`: NOT READY.**
- Compiled: the abstract three-state poset degrees and the degree-form bound (C-U1-T); the ratio form (C-U1-F); the Mathlib
  double count.
- **Open nodes:**
  - (N1) The graph encoding. For a graph that is an induced matching of `N` edges (the sector's residual), there is a bijection
    between its independent `k`-sets and the rank-`k` states of `Fin N → Option Bool`, carrying one-vertex deletion to `Rdel`.
  - (N2) The sector correspondence in the tree: sector members of `I_j(T)` (`r, v ∈ B`, no choke) correspond to rank-`(j−2)`
    states. Their in-sector deletion targets are exactly `Rdel`, and the active weight is identically one on members and on
    in-sector targets.
  - (N3) A binder diff against the registered NM text, which I could not read.
- **Smallest unproved lemma: (N1)**, one `Finset` bijection with no dependency on `E993Transport`.

**Outcome-B lemmas and restricted-scope Hall theorems in my portfolio: none exist.**
- The verification lemma is informally complete (three lines) and has no Lean text. It is a candidate companion `lemma` for any
  future certificate award (it needs a ℚ-valued flow definition). It is not a key and not an outcome-B lemma.
- A bounded result never qualifies, so no U2 row, and no critic-derived row, is an award group.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

- **Progress, U orientation.** The allocation's U1 "could close" target was kernel-checked (INV) at its full statement. It is
  reached for the `Aut(G)` / `F_p` scope via two independent critic-derived formalizations that agree in Lean. It is
  contract-ready for a Stage 7 award, subject to the registered-text binder diff.
- Also new this cycle:
  - Lemma U is kernel-checked.
  - NM's poset half is kernel-checked.
  - New proved_informal-quality lemmas (the verification lemma; `CB(1,m)` switch weight zero), STATED and pending second reads.
  - Adversarial-structural findings: whole-tree switch necessity at non-eligible ranks (order 8); switch-rescue failure away from
    the window; the eligible `CBstar(2,2,2)/7` row.
- The plateau test of `SOLUTION-CONTRACT.md` §5 is therefore not met.
- **No material progress on (HALL)'s open part.** No restricted-scope Hall theorem, no certificate and no class-union slack bound
  exists at the three `CB(8,·)` rows. U2's obligation (a) is untouched.
- **Stop gate.** Neither decisive event occurred in my orientation: (HALL) is not formally verified, and there is no confirmed
  (CUT). Every deficit found is at a non-eligible rank. The gate stays ARMED, with no halt from U.

## Headline assessment

headline_resolved: no
status: still_open

Per statement, at my orientation's evidence grade:
- **(HALL)** is still open. There is no complete proof at any scope and no replayed deficient cut at any eligible row. Every
  eligible row computed in this portfolio saturates (`CBstar(2,2,2)/7`, `CB(1,7)/10`, `CB(2,5)/10`).
- **(WID)** is proved (`formally_verified`, C1-LA1; rebuilt, axioms clean).
- **(INV)'s quotient clause** is proved at full mathematical scope for `Aut(G)` and `F_p` (informal mathematics verified; compiled
  sorry-free). The key stays `proved_informal` until its governed award.
- **(NM)** stays `proved_informal`; its Lean text is partial.
- No outcome-B candidate is stated in my portfolio. The verification lemma and C-U2-T's `CB(1,m)` lemma are proved (informal,
  critic-attributed, STATED).
- The primary aggregate is untouched.

## Next-route allocation

**Exact remaining obligation, U orientation.**
1. The Stage 7 award of Group U-A, after the binder diff against the registered (INV) text.
2. NM's open nodes (N1)–(N3).
3. U2's obligation (a), which is the orientation's share of (HALL)'s open part: an exact per-subfamily certificate (a rational
   saturating flow over branch-type classes, carrying the verification lemma, or an LP-dual potential) on the full (D) ∪ (S)
   networks of `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`, covering the coupled families. The smallest unproved lemma
   of (HALL) is unchanged from the allocation: Hall on the choke forest `T′ = T − {r, s, v}` at `CB(8,86)/460`.

**Route 1 — `U-LEAN-NM-SECTOR-ENCODING` (with the U-A award, if the synthesis schedules it this cycle).**
- Seed from C1-LA1 and C2-LA1 byte-identically.
- Prove (N1) as a standalone `Finset` bijection for an induced matching, then (N2) on the sector of a `CB(d,m)`-type tree (or on
  the registered NM class), with weight one. Compose with `shadow_degree_bound` and `Finset.card_mul_eq_card_mul` into the
  normalized-matching ratio.
- Could close in one cycle: NM contract-ready at its registered statement (after the binder diff), plus the ℚ-flow verification
  lemma compiled as a companion for any later certificate.

**Route 2 — `U-SWITCH-SHARE-ALLOCATION-ON-CHECKABLE-SWITCH-NECESSARY-TREES`.**
- Use the now-known small whole-tree switch-necessary rows (order 8; `CB(4,1)/4`; C-U2-F's non-eligible rows), the
  non-eligible `CB(d,1)` sectors (where C-U2-T's closed sums locate exactly when switches rescue), and the eligible
  `CBstar(2,2,2)/7` as brute-forceable laboratories.
- Construct an explicit rational switch-share allocation rule and verify it by exact summation against literal max-flow.
- State the rule as an (SW) lemma at an exact family scope, with eligibility and derived `F_p` as named hypotheses (C-U2-T shows
  that rescue fails without them). Then attempt its lift to the `CB(8,·)` coupled families.
- Could close in one cycle: an (SW) outcome-B lemma at `proved_informal` on a named family, or a sharp statement of where
  per-class allocation fails. The latter feeds F1's adversary on exactly the coupled families.
- The conjecture "`S ≤ 0` ⇒ saturation at every rank on trees" is to be handed to the F orientation as a falsification target,
  not used.

## Artifact inventory

All adjudicator scratch is under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-adj-U/`. Python runs used
`python3 -B` and the standard library only, with exact integers. No `__pycache__` was created.

| File | SHA-256 | Role |
|---|---|---|
| `verify_capsule.py` | `9161b266505c96372d879e267f2af2fa4a71a79c9b025590bb898336adcb299d` | capsule seal and member digests |
| `adj_instr.py` / `adj_instr_RESULT.json` | `5b613a0575fde051aaeb91837b39148bfb6aba93f4a58548640a36be7534f8a1` / `870653d6c5873e2e3c36371030005c45521100ae31a960c912edd6fd68d283ad` | own instrument (tree test with separate acyclicity and connectivity checks; `x` through `α`; `F_p` derived; `S` from `H_v`/`R_v`; literal `w_F`, (D) ∪ (S); Dinic with an independent flow verifier and min-cut violator). Rows: `K_{1,12}/8`; path-star `(2,3,4)/7`; order-8; `CB(2,2)/4`, `CB(4,1)/4`, `CB(3,1)/3`, `CB(5,1)/4` (full and sector); `CBstar(2,2,2)/5–7`. Canonical payload digest `690eeb81…9eb92` |
| `adj_cb_big.py` / `adj_cb_big_RESULT.json` | `3626d1b07aaf5a6238dcf0d6e8242186edf040d816698f332a95a8e6dc3f4717` / `034be0be882c99912511008132b0ea7a37c61a10236f37721ebd7fbf8a8f7632` | generic forest DP for `S`; `W(x)` validated on 8 shapes; `CB(3,5)/13`; the three `CB(8,·)` rows with digit counts; frozen-aggregate equality |
| `adj_checks2.py` / `adj_checks2_RESULT.json` | `d0d1115990d273957a0452febb0ee547281c050b1dcf6e1452ac014ea7bfc967` / `deee2f94a36723441fb00902a460744dc5ac52cb161153352e6ab413d34c4014` | Lemma U semantics (`n ≤ 5`); the `CB(1,m)` switch-weight-zero check; `CB(d,1)` sector sums |
| `adj_cbstar_small_RESULT.json` | `6268f41a4465b9cb4e3a81ce7e9d95b783f146092c8ab77e015c685a0736c959` | four non-eligible `t ≥ 2` sector deletion deficits |
| `carry_adj.py` / `carry_adj_RESULT.json`; `carry/C1LA1-Main.lean`, `carry/C2LA1-Main.lean` (copied out of `c3-crit-U1-F/`) | `320951ec…de39` / `b29dd868…912c`; `86b59c6c…e0cb`, `a9cf3b81…7fc4` | byte-carry audit |
| `LeanProject/` (copy-out of `c3-U1/LeanProject`; `.lake/packages` a manual symlink), `LeanProof/Main.lean` | `f3b21020433375b01e1bcdd89d8996dd2198ad2ac438557bda8774b73a57b180` | rebuild input |
| `LeanProof/CriticQuot.lean`, `CriticNM.lean`, `CritAdv.lean`, `CritNM.lean` (copy-outs) | `63814f60…7935`, `82afd1a2…bf18`, `8de15f02…b59b`, `19883e92…6ca694` | critic Lean, rebuilt as oleans |
| `LeanProof/AdjAx.lean` | `22f84f5d86b524590c38824d94d522208b9fb7dc93c43188029050d3a8eb7ac9` | axiom driver (18 declarations); `adj_two_quotient_forms_agree` |
| `build_adj.txt`, `critic_compile.txt`, `adj_axioms.txt` | `c72adba0…dd8a`, `aefb47e8…bba`, `e117b35e1c764b9677c08063d1d7e13ca6156b2283302d6010d07b3fdcbf64ba` | build log (8657 jobs, 0 errors); critic-file compiles (0 errors); axioms output (all `[propext, Classical.choice, Quot.sound]`) |

**Replay:**
- Python: `cd <scratch> && python3 -B adj_instr.py && python3 -B adj_cb_big.py && python3 -B adj_checks2.py && python3 -B carry_adj.py`
- Lean: `cd <scratch>/LeanProject && lake build LeanProof LeanProof.CriticQuot LeanProof.CritAdv LeanProof.CritNM && lake env lean LeanProof/AdjAx.lean`

**Background jobs:** one, the initial `lake build` (harness task `bl2yq7tdz`, shell PID 95837). It completed with exit 0 and was
confirmed not running before this write. No job remains.
