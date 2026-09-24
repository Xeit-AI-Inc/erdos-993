# Orientation Adjudication

Stage 5 adjudicator of origin orientation **U** (formal / structural), Cycle 1, r27
(`erdos-993-math-dre-20260924-r27-forest-degree-extension`). Portfolio: returns `U1`, `U2`, `U3` and
their six cross-orientation critiques (`C-U1-T`, `C-U1-F`, `C-U2-T`, `C-U2-F`, `C-U3-T`, `C-U3-F`).

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading EXACTLY
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`
and nothing else under the VerityOS root outside this experiment. Subsystems loaded: the root
constitution and the identity startup protocol; within `experiments/`, only the members of my sealed
capsule, the frozen `sources/`, my granted replay scratch and the Mathlib package directory. No
`memory/`, `knowledge/`, `conversations/`, `modules/`, `skills/`, `logs/`, `decisions/`, `operations/`
or `inbox/` read.

---

## Identity and seal audit

**Capsule seal reported (duty 1): `44e9389d9d6727137e230f9be7e897f2271eec61a5be1cfc7195e085ed8767ce`** —
recomputed canonically over `control/c1-adjudicator-capsules/U-PACKET-MANIFEST.json` minus
`seal_sha256` (`sort_keys=True`, `separators=(",",":")`, no trailing newline): identical, **MATCH**.
All **24/24** capsule members verify byte-count and SHA-256 exactly, including the three returns and
the six critiques at the digests the Stage 3 and Stage 4 admission reports record.

Recomputed independently, from the manifests themselves:

| Manifest | Declared seal | Recomputed | Members verified |
|---|---|---|---|
| `control/C1-STAGE2-PACKET-MANIFEST.json` | `64d142ed1a3beb3dec7eaaa941d5c862c0bd3381ee678f6aa27c5c43850828e7` | identical | 110/110, 0 mismatches |
| `control/C1-STAGE3-PACKET-MANIFEST.json` | `8e78cf1f781381b34db629d8e596e36891df1d2346b54b5b805a18e0a1c0164d` | identical | 33/33, 0 mismatches |
| `control/C1-STAGE4-PACKET-MANIFEST.json` | `d93b97002be201517a1850acd2a031ca7885a8e2d6a580df5af4a27191d9932a` | identical | 57/57, 0 mismatches |

The Stage 2 value all three returns and all six critiques cite is the value I recompute. Stage 3
admitted 9/9 (one visible `MISSING_IMPORT_LIST` exception, seat F3 — outside my orientation); Stage 4
admitted 18/18, zero findings; my six critiques are the six the Stage 4 admission record names, at the
recorded digests, all `retained_narrowed`.

**Toolchain and binding, verified by me.** `git rev-parse HEAD` inside
`/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages/mathlib` returns
`905b95818eb32af7874a58b427f50c1711a5e96c`, identical to `sources/mathlib-binding/PIN.json` and to Gate
ruling 4. I rebuilt every Lean artifact of this portfolio copy-out-first in
`scratchpad/c1-adj-U/`, binding `.lake/packages` by MANUAL SYMLINK; nothing copied, no `lake update`,
no `lake clean`, no `elan`, no network, no installs, every `lake build` in the foreground.

**Digest corrections confirmed.** `sources/r25/c4-forest-descent-order-bound/LeanProject/LeanProof/Main.lean`
is `736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0`, 17,180 bytes. U1's and U3's
returns both print `736eb9db…`; U3 also prints the wrong tail (`…fdfe0` for `…7dfe0`) and mis-tails
`PIN.json` (`…cfdbd3ba0` for `…bfcbd3ba0`). Three critics caught these independently (C-U1-T C1,
C-U1-F finding 3, C-U3-T S-1, C-U3-F strike 2–3); I confirm from the bytes. **Struck as written; the
files themselves verify.** These are transcription defects in certification text, not fidelity
failures.

**Errata.** R27-E-a (the sealed worker brief's r26 residue `hyp-tree`/`hyp-alpha`/`hyp-eligible`/`(★)`
and the `E993-R26-` namespace): all three U seats mapped it correctly onto this run's actual
hypotheses and used the `E993-R27-` namespace; U2 and U3 each independently diagnosed it. No penalty.
R27-E-b (edgeless forests are `D_k = 0` fixed points, not (DL) tight cases): U2 repeats the contract's
wrong label once while citing the right values; per the standing erratum, not charged. R27-E-c (the
refuted mechanism's registered key is `E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER`, without the
`R25-` segment): C-U1-F re-derived this independently of C-T3-U and additionally established its
registered scope (ordinary paths `P_n`); the seats copied the malformed key from
`SOLUTION-CONTRACT.md` §3.8 and are not penalized. The controller facts record was weighed as one more
replay; nothing in it was taken as authority, and nothing in this adjudication derives from another
orientation's portfolio.

**Read-boundary record.** `control/C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json` carries U1 and U3 (each a
`find /` self-terminated, killed by literal PID, nothing obtained) and not U2. **Ruling: U2's own
`## Read-boundary disclosure` was not owed.** `control/R27-CHARTER-PROMPT.md` is a Stage 2 packet
member (`fa00458bf4b03274695f0e18cc369ef2b5d2c6ebbb41ca344611fcaf4d0bcadf`, 7,867 bytes — I confirmed
it in the manifest), and the Worker Common Brief names it. Both U2 critics reached the same ruling;
the controller's omission of U2 is correct. U1's and U3's breaches are real, disclosed in full, and —
as both pairs of critics verified and as I re-verify below by rebuilding every claim from the seed and
the pin — no shipped result depends on anything they could have returned. The Lean-core names U1 was
hunting (`Nat.find_spec`, `Nat.find_min`) and the Mathlib names U3 was hunting
(`Nat.findGreatest{,_spec,_le,_is_greatest}`) are all reachable in grant and all appear in the
compiled files.

---

## Route-by-route decisions

### U1 — `C1-U-01 LEAN-ARCHITECTURE-AND-CONTRACTS`

**Retained, narrowed.** Replayed in my scratch from the seat's five tracked files: `Build completed
successfully (8657 jobs)`, exit 0, with exactly five `declaration uses 'sorry'` warnings at lines
**567, 572, 578, 582, 586** — the SORRY LEDGER's own lines. The carried r25 award source is a
byte-identical 17,180-byte prefix; the run-local section begins at line 391. `Main.lean` is
`8cc381f413e6b5533995a362f4f38f4930d99119e8eece9a5f1cc323a62dea0d`, 27,328 bytes, 591 lines. No
`admit`, `native_decide`, `decide`, `unsafe`, `set_option`, or `axiom` declaration anywhere.

Narrowings sustained, resolved claim by claim where the two critics differ:

- **Grade on the definition layer.** C-U1-T narrows to "seven lemma-grade declarations, two compiled
  definitions"; C-U1-F narrows to "six lemmas, three definitions ungraded". **C-U1-F is right and
  C-U1-T miscounts.** The nine run-local sorry-free declarations are three `def`s (`indepDegreeSum`,
  `extensionCount`, `firstDescent`) and six propositions (`indepCount_zero`,
  `indepCount_eq_zero_of_card_lt`, `pos_indepCount_of_delta_neg`, `firstDescent_exists`,
  `firstDescent_spec`, `firstDescent_min`) — I read the declaration kinds off the file. A definition
  carries no truth value; `#print axioms` on a `def` is a well-formedness fact. **`formally_verified`
  sustained for six lemmas at their own statements; the three definitions are kernel-elaborated and
  ungraded.** The count "nine sorry-free declarations" stands as a count.
- **The missing statement digests (C-U1-T C2 / C-U1-F strike 1).** Confirmed by direct inspection:
  `THEOREM-CONTRACT.draft.yaml` (`791eb99f7a94d3bea672b2ed83591a9d020692ed47b58cb42c9149223184670a`,
  13,390 bytes) contains exactly **four** `sha256` fields, all in `source_materials`. No per-statement
  digest exists. The return's `## Remaining obligation` (a) points a successor at a digest that is not
  there, in the sentence meant to prevent statement drift. **Struck.** Aggravating and confirmed: the
  YAML's five `expected_statement` blocks say `{X : Type u}` while the shipped declarations say
  `{X : Type v}`, so a byte comparison would have failed even had the digest existed.
- **Generator provenance (C-U1-T C4 / C-U1-F strike 2).** `gen_digests.py` globs `*.lean` and the
  YAML; the three non-Lean rows of the return's digest table were computed by some other means.
  **Struck as written; the three digests are correct** (I recomputed all three).
- **`extensionCount` shipped with no lemma and no contractual hook (C-U1-T A6).** Sustained, and it is
  the reason "definition layer … proved well-behaved" overreaches. C-U1-T closed the gap
  (`critic_mem_extension_set_iff`, `critic_extensionCount_ge`).
- **Namespace hygiene (C-U1-T A7).** Confirmed: the run-local layer is in `section`s, not namespaces,
  so `indepDegreeSum`, `extensionCount`, `firstDescent` and the five targets sit in the **root**
  namespace, while U3's counterparts sit in `Erdos993G1` and U2's in `R27DegreeLemma`. Real and
  actionable — see `## Cross-route reconciliation`, where I settle it.
- **Carrier seam (C-U1-T A5 / C-U1-F Attack 1).** Both critics attacked it; both cleared it by
  compiling the bridge. I replayed both: `crit_LB_of_EX`, `crit_R5_of_LB`, `crit_XR_of_LB` and
  `critic_lb_of_ex`/`critic_r5_of_lb`/`critic_xr_of_lb` all elaborate sorry-free with
  `[propext, Classical.choice, Quot.sound]`. The `[Fintype]`→`[Finite]` seam is not a blocker.

Route verdict `compiled` is correct; `headline_resolved: no` is correct.

### U2 — `C1-U-02 LEAN-DEGREE-LEMMA-CORE`

**Retained, narrowed — with its forward-looking half struck.** Replayed: `Main.lean` is
`d068c00480a205cdbb9edef12592246bc0b0cf20575cb9d434d2458bdae164df`, 26,961 bytes, 499 lines; the file
declares **27** top-level objects (6 `def`, 1 `structure`, 20 propositions), all in namespace
`R27DegreeLemma`, all sorry-free, built against the pin. I printed axioms on every proposition
including the **seven the seat certified but did not evidence** (`mem_closedNbhdCompl`,
`mem_indepFinsets`, `indepFinsets_empty_mem`, `isIndepSet_mono`, `indepFinsets_filter_split`,
`disjoint_split`, `injOn_insert_split`): all clean, six at `[propext, Classical.choice, Quot.sound]`
and `isIndepSet_mono` at `[propext, Quot.sound]`. `SingleEdgeJoin.degOn_root` likewise prints
`[propext, Quot.sound]`. **The seat's literal "every one depends on exactly `propext`,
`Classical.choice`, `Quot.sound`" is narrowed to "a subset of the permitted axioms"**, and its
"Sorry-free nodes (with `#print axioms`)" is narrowed to "thirteen printed; seven certified and now
evidenced by the critics and by me". Its "the one match on the string 'axiom'" is narrowed (fourteen
matches: thirteen `#print axioms` commands and one doc comment; no `axiom` declaration).

Sustained substance: the two single-edge-join theorems
`R27DegreeLemma.SingleEdgeJoin.D_single_edge_join` and `.E_single_edge_join` are correct, are the true
`m = 1` specialisation of (8.4)–(8.5), and hold for an arbitrary simple graph — both critics verified
this at greater generality than the seat tested (C-U2-F on 35,462 join configurations including 1,492
with a cycle inside `T`), and my own instrument reproduces both at every `k` on every labelled tree to
order 7 as the `|A| = 1` collapse of the general join (below). The seat's self-caught `E`-definition
correction (no `x`-shift on `Z_{T−N[r]}`) is genuine, is the paper's form, and was caught before any
theorem depended on it; its disclosure discipline is the good practice of this portfolio.

**Struck:** (i) "not found ready-made in `Mathlib.Combinatorics.SimpleGraph.{Acyclic, Finite, Star}`"
and "the genuine gap … out of reach of this route" — see `## Rejected and narrowed mechanisms`;
(ii) "would let a successor skip formalising (8.4)–(8.5) in full generality entirely" — the
pendant-only induction reaches one rooted class per order; (iii) "`D_zero`/`E_zero` … reproduce as a
special case the paper's single-vertex remark" — they give only the `k = 0` coefficient, and the
single-vertex statement at all `k` is not a theorem of the file. **Narrowed:** the `K₁` fixed point
rests on an unshipped hand computation the return's own `## Numeric claims` declares not to be
evidence; it is true, and it is reproduced by both critics and by my instrument, on their evidence and
mine, not the seat's. **Unnamed and undelivered:** two named deliverables of allocation item 8 —
nonnegativity closed under sum/product, and multiplicativity over separated vertex sets — are absent
from the file and absent from its obstacle report. Both critics found this independently; I sustain it,
and it is load-bearing for the route I fund below.

### U3 — `C1-U-03 LEAN-EXTENSION-COUNT-AND-CONSEQUENCES`

**Retained, narrowed — the strongest compiled return of the orientation.** Rebuilt copy-out-first from
the frozen seed plus the seat's `Extension.lean`
(`116b4f313eedfe4210173226c2f5ef877a6e1ee07061888f4106e908ba6b08a6`, 18,472 bytes, 397 lines):
`Build completed successfully`, exit 0, zero warnings, and all 17 propositions at exactly
`[propext, Classical.choice, Quot.sound]`. Every sub-obligation (a)–(e) of allocation item 9 is
compiled sorry-free. `Main.lean` was never edited; the only change to a seeded file is one `import`
line in the 22-byte root.

**Paired-critic disagreement resolved: the five unaudited definitions.** C-U3-T (A-3) calls the axiom
ledger's coverage a gap and singles out `firstDescent` as "exactly the shape in which a `sorryAx` can
hide inside a definition while every downstream proposition still reports clean". C-U3-F (strike 4)
holds the certification **sound** because `#print axioms` reports the transitive closure and each of
the five definitions is reached by a printed theorem. **C-U3-F's reasoning governs and C-U3-T's
hiding hypothesis is struck**: a `sorryAx` in `firstDescent` would appear in
`delta_firstDescent_neg`'s axiom line, and one in `indepDegreeSum` in
`forest_extension_inequality`'s. C-U3-T's remedy is nonetheless good practice, and I have printed all
five myself (`closedNbhdFinset`, `extensionFinset`, `e`, `indepDegreeSum`, `firstDescent`): all clean.
**Narrow the seat's literal to "all 17 proof declarations, transitively covering the 5 definitions".**

Other narrowings sustained: the static-scan literal ("a grep for `sorry|admit|native_decide|axiom`
returns nothing") is **false as written** — both critics count 18 matches on `axiom`, all in the
`#print axioms` ledger and its section comment; the substance (no such declaration) is true and I
verified it. The Mathlib-pin provenance sentence is garbled (`lakefile.lean` is not a manifest; the
revision lives in the shared project's `lake-manifest.json` and in the package's git head, where I
confirmed it). `firstDescent` is listed among `formally_verified` objects; it is a definition —
**narrowed** exactly as for U1. The seat's "identical across two independent builds" rests on
`scratchpad/c1-U3-replay/`, which neither critic's grant reached; **it stays self-reported**, and both
critics' from-frozen-source rebuilds, plus mine, are the independent confirmation of record. The
registered-claim census was taken on the Stage 1 gate's controller attestation rather than performed;
**the mathematical alias check against the 370 registered statements is not discharged by this seat**
and passes forward (C-U1-T and C-U1-F each ran the lexical half against
`sources/authority/CLAIM-IDENTITY.json` with zero hits for every candidate name).

The two disclosed deviations are benign and now proved so rather than asserted: the carrier choice and
the absent `hG` compose to the contract's literal §2 signatures by application alone. C-U3-T compiled
that composition (`contract_forest_*`, four theorems), C-U3-F compiled it independently (five probe
theorems including `contract_rank5_from_general_DL`, which tests the one place the shapes could have
failed to meet: `2 * (5:ℤ)` against `2 * ((5:ℕ):ℤ)`), and I replayed both sets sorry-free. **C-U3-F's
instance caveat is accepted and is load-bearing: the bridge is free only because §2's
`forest_degree_lemma` binds its instances; a (DL) proved at one fixed `Fintype` instance would not
compose for free.**

---

## Cross-route reconciliation

**1. The U1/U3 definition-coordination gap is closed — by `rfl`.** Five critic items across three
seats (C-U1-T item 1, C-U1-F item 1 and Attack 7, C-U2-T item 6, C-U3-T item 3, C-U3-F item 2) hand
the synthesis the same unresolved obligation: U1 and U3 wrote `indepDegreeSum` and `firstDescent`
independently, coordinated only through contract prose that does not carry the definitions' text, so
"U3 reuses U1's layer" is an assumption. I discharged it. I placed U1's `Main.lean` and U3's
`Extension.lean` in one project (`Build completed successfully (8658 jobs)`, the same five `sorry`s and
nothing else) and compiled, sorry-free, with permitted axioms
(`scratchpad/c1-adj-U/LP-MERGE/Reconcile.lean`):

```lean
theorem indepDegreeSum_agree {X} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k : ℕ) : indepDegreeSum G k = Erdos993G1.indepDegreeSum G k := rfl

theorem firstDescent_agree {Y} [Finite Y] (H : SimpleGraph Y) :
    firstDescent H = Erdos993G1.firstDescent H := rfl
```

Both are `rfl`, notwithstanding that U1 witnesses existence at `k = G.indepNum` and U3 at
`Nat.findGreatest (0 < indepCount G ·) (Fintype.card X)`: `Nat.find` depends on its existence proof
only through a `Prop`, and both seats resolve the `DecidablePred` instance through
`Classical.propDecidable`. **No congruence lemma is needed and no drift occurred.** What remains is
purely a naming decision: the three seats put their run-local layer in three different places (U1 the
root namespace, U3 `Erdos993G1`, U2 `R27DegreeLemma`), so the files compose but do not merge.

**2. The conditional chain is complete and doubly compiled.** C-U1-T's capstone
`critic_all_from_dl : DlHyp → ExHyp ∧ LbHyp` — whose three hypothesis types are *definitionally* U1's
frozen declarations (`example : ExHyp := @forest_extension_inequality` and
`example : LbHyp := @forest_descent_linear_bound` typecheck) — plus `critic_r5_of_lb` and
`critic_xr_of_lb`, discharge four of U1's five `sorry`s conditionally on the fifth. U3's route reaches
the same place through its own unconditional double count, and C-U3-T/C-U3-F land it on the contract's
literal `[Finite X]`/`Nat.card` signatures. I replayed all of it: fourteen critic declarations across
four files, every one sorry-free at `[propext, Classical.choice, Quot.sound]`. **After Cycle 1 the
only mathematically open node under (EX), (LB), (R5) and (XR) is (DL) itself.**

**3. The three U-orientation files do not share a carrier, and the bridge is now built.** U2's
`R27DegreeLemma.Z`/`D`/`E` are `Finset`-relative; U1's and U3's targets are stated in the G1
definitions of record. Both U2 critics named the specialisation `Z G univ k = indepCount G k` as the
one remaining *definitional* gap and neither compiled it (C-U2-T explicitly states it "cannot even be
stated in this project"). I carried the G1 module into a project alongside U2's core and compiled it
(`scratchpad/c1-adj-U/LP-BRIDGE/Bridge.lean`, sorry-free, permitted axioms):

```lean
theorem AdjU.Z_univ_eq_indepCount {X} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k : ℕ) :
    R27DegreeLemma.Z G Finset.univ k = Erdos993G1.indepCount G k

theorem AdjU.degOn_univ_eq_degree {X} [Fintype X] (G : SimpleGraph X) [DecidableRel G.Adj]
    (v : X) : R27DegreeLemma.degOn G Finset.univ v = G.degree v
```

With `R27CriticU2T.degreeSum_le_of_D_nonneg` / `CriticU2F.degree_lemma_of_root` (open node 3, compiled
by both U2 critics) and `CriticU2F.D0_eq`, the whole path from a rooted nonnegativity statement on the
`Finset` carrier to the contract's `forest_degree_lemma` shape is now sorry-free except for the
nonnegativity itself.

**4. Bounded-computation results are consistent across the portfolio.** The attained maxima of `n`
admitting `Δ_k < 0` over forest isomorphism classes agree where the censuses overlap: C-U1-F (horizon
12) gives 0, 4, 8, 11 at `k = 0..3`; C-U3-F (horizon 16, 85,625 classes) gives 0, 4, 8, 11, 15 and
`Δ_5 < 0` attained at order 18. So (LB)'s constant 4 is **exactly attained at `k = 0, 1, 2`** and the
r25 award's `(k+1)² = 9` is provably unattained at `k = 2`. Every C-U1-T, C-U1-F, C-U3-T and C-U3-F
sweep of (DL), (EX), the double count, the per-`J` bound, (LB) and (XR) is a null result at its stated
attained horizon; my own instrument reproduces the fixed points and adds a null over all labelled
forests to order 7. All of this is `bounded_computation` and proves no universal statement.

---

## Established results

Graded at this orientation's evidence, with the hypotheses each consumes named. *No status transfers
to the all-rank aggregate, `E993-BETA-AGG`, transport, TREE, FOREST, `E993-R25-UNR-FOREST-WIDE`,
`E993-G1WIDE-NO-SIZE-CAP`, NR1 or Erdős #993 (`SOLUTION-CONTRACT.md` §3.1).*

**A. Unconditional counting core — `formally_verified`, seat-attributed (U3), independently
re-derived (C-U1-T).** Consumes NO acyclicity, no `hyp-tree`; true of every finite simple graph:

```lean
theorem Erdos993G1.double_count {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k : ℕ) :
    ((k : ℤ) + 1) * Erdos993G1.indepCount G (k + 1) = ∑ J ∈ G.indepSetFinset k, (Erdos993G1.e G J : ℤ)

theorem Erdos993G1.e_ge_sub {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k : ℕ) {J : Finset X} (hJ : G.IsNIndepSet k J) :
    (Erdos993G1.e G J : ℤ) ≥ (Fintype.card X : ℤ) - (k : ℤ) - (∑ v ∈ J, G.degree v : ℤ)
```

Fence: these are graph-general facts and must never be reported as progress on
(DL)/(EX)/(LB)/(R5)/(XR) beyond "the missing bridge is built".

**B. The conditional deduction chain at the frozen §2 shapes — `formally_verified` as implications;
the targets stay `conditional` on (DL).** Critic-attributed (`C-U1-T` for the capstone; `C-U3-T` and
`C-U3-F` for the contract-signature landings; `C-U1-F` for the independent carrier bridge):
`critic_all_from_dl : DlHyp → ExHyp ∧ LbHyp`, `critic_r5_of_lb`, `critic_xr_of_lb`, and the four/five
`contract_forest_*` theorems on `[Finite X]`/`Nat.card`. Consumes (DL) at §2's exact statement with
its instance binders, `hG : G.IsAcyclic`, and — inside (LB) — `Δ_k < 0 ⇒ 0 < i_k`.

**C. Definition layer of record — kernel-elaborated, ungraded as claims, plus six `formally_verified`
supporting lemmas.** `indepDegreeSum`, `extensionCount`/`e`, `firstDescent` (first STRICT descent, by
`Nat.find`; `Δ_k = 0` is not a descent), with existence, spec and minimality; U1's and U3's texts are
now proved definitionally equal (adjudicator-derived, `rfl`). `i_0 = 1`; `i_k = 0` for `k > n`;
`Δ_k < 0 ⇒ i_k > 0`.

**D. The single-edge-join (`m = 1`) recurrences — `formally_verified` as `Finset`-carrier identities,
seat-attributed (U2).** `D (insert r T) r (k+1) = D T r1 (k+1) + E T r1 k` and
`E (insert r T) r k = D T r1 k`, under `SingleEdgeJoin` (`notMem`, `rootMem`, `onlyNbhr`), for an
arbitrary simple graph. Fence: these are not (DL) and they are not about forests; the file states no
statement about trees, forests or acyclic graphs at all.

**E. The general edge-split join — `proved_informal`-grade candidate at best, critic-attributed
(`C-U2-T`), exhaustively corroborated by me.** See the ruling below. It is an unformalized identity;
**no formal grade attaches to it on the strength of any census.**

**F. Adjudicator-derived, this stage (STATED at a review stage; each needs an isolated second read
before registration, `SOLUTION-CONTRACT.md` §4).** `AdjU.Z_univ_eq_indepCount`,
`AdjU.degOn_univ_eq_degree`, `AdjU.indepFinsets_union_of_separated`,
`AdjUReconcile.indepDegreeSum_agree`, `AdjUReconcile.firstDescent_agree` — all sorry-free at
`[propext, Classical.choice, Quot.sound]`; and, informally, the separated-union reduction of §
"Rejected and narrowed mechanisms" item 4.

**Fixed-rank results are recorded but do not qualify.** C-U3-T's `dl_rank_zero`, `dl_rank_one`,
`ex_rank_one`, `lb_rank_one`, `lb_rank_zero` and C-U1-F's `crit_LB_k0`, `crit_LB_k1` are unconditional,
sorry-free and correct (I replayed them). Per §6 of the protocol a **fixed-band result never
qualifies** as an award group; they narrow U1's SORRY LEDGER (`forest_descent_linear_bound` is open
only for `k ≥ 2`) and they are the run's first unconditional forest content, but they are not awards
and `dl_rank_one`'s edge-count argument does not generalise.

---

## Rejected and narrowed mechanisms

**1. U2's leaf-by-leaf shortcut: REFUTED.** Both critics refuted it independently and by the same
mechanism: `D_single_edge_join`/`E_single_edge_join` consume `D T r1` and `E T r1` at the **attachment**
vertex, an arbitrary vertex of `T`, while a pendant-only construction's hypothesis supplies
nonnegativity only at the previously attached vertex. My own instrument settles the reach exactly:
enumerating rooted-tree isomorphism classes and the pendant-only reachable set,

| order | rooted-tree classes | pendant-only reachable |
|---|---|---|
| 3 | 2 | 1 |
| 4 | 4 | 1 |
| 5 | 9 | 1 |
| 6 | 20 | 1 |
| 7 | 48 | 1 |

— exactly the path rooted at an endpoint, one class per order. C-U2-T's table is reproduced digit for
digit and extended by one order. The smallest obstruction is `K_{1,3}`, whose every leaf has the centre
as its unique neighbour, so peeling demands `D`/`E` for `P₃` rooted at its **centre**; my instrument
gives `D(P₃, centre) = (0,0,2,0)` and `E(P₃, centre) = (0,0,1,0)` against `D(P₃, endpoint) ≡ 0` — the
blocked terms are live, not vacuous. **The sentence "would let a successor skip formalising (8.4)–(8.5)
in full generality entirely" is struck.** C-U2-F's F-5 further shows the repair-by-strengthening
("carry the hypothesis at every root") fails *inside the pendant family*: the pendant-with-external-root
identity is not termwise nonnegative (negative in 922 of 24,620 configurations over trees to order 9).
I accept F-5 at its stated scope.

**2. The paired-critic disagreement on U2 — RULED, and it is narrower than it looks.**
C-U2-T holds that its edge-split join for two **arbitrary** rooted pieces closes the all-roots
induction with single-edge splits and needs no leaf-existence lemma. C-U2-F holds that "the product
apparatus of (8.4)–(8.5) is genuinely required". I do not average; I split the claim.

*(a) C-U2-T's identity is exact.* I implemented `Z`, `D`, `E` from `SEMANTIC-CONTRACT.md` §1 and the
definition text of the compiled file — never by executing a seat or critic script — and tested the two
displayed identities

```
D_T(a) = D_A(a)·Z_{B−b} + Z_{A−a}·D_B(b) + x·( E_A(a)·Ẑ_B + Ẑ_A·E_B(b) ) + 2x·Ẑ_B·( Z_{A−a} − Ẑ_A )
E_T(a) = E_A(a)·Z_B   + Z_{A−a}·D_B(b) + ( Z_B − Z_{B−b} )·( Z_{A−a} − Ẑ_A )
```

on **every labelled tree to order 7, split at every edge, in both orientations — 215,754 instances,
exact integers, zero mismatches.** C-U2-T's 5,513-instance verification is reproduced and enlarged by
a factor of 39. **Ruled for C-U2-T on the identity.**

*(b) C-U2-T's nonnegativity closure is exact.* Every one of the seven terms is coefficientwise
nonnegative whenever `D_A, E_A, D_B, E_B` are: zero violations over the same 215,754 instances. The two
structural monotonicities it rests on hold (`Z_{A−a} − Ẑ_A ≥ 0` because `A∖N[a] ⊆ A∖{a}`; `Z_B − Z_{B−b} ≥ 0`
because `B−b ⊆ B`); I checked the first over every (tree, root) pair to order 7. **Ruled for C-U2-T.**

*(c) C-U2-T's induction genuinely reaches every (tree, root) pair.* A root of a tree with ≥ 2 vertices
has a neighbour; every edge of a tree is a bridge, so splitting there yields two strictly smaller
pieces rooted at the split edge's endpoints. I verified the split is well-formed and strictly
decreasing on **2,223,278 (tree, root) pairs to order 8**, zero failures, and confirmed directly that
`D, E ≥ 0` at every root on every labelled tree to order 7. Specialising `A` to a single vertex
collapses the identity to U2's two compiled theorems, which is independent confirmation of them at the
general level. **Ruled for C-U2-T: the m-indexed `∏_{j≠i}` products of (8.4) and the `|S| ≥ 2` subset
sums of (8.5) are NOT required, and neither is leaf existence.**

*(d) But C-U2-T's route is not product-free, and to that extent C-U2-F is right.* Every displayed term
is a **binary convolution** of coefficient families. The edge-split route therefore consumes exactly
the two deliverables of allocation item 8 that U2's file does not contain and does not name —
multiplicativity of `Z` over separated vertex sets, and closure of coefficientwise nonnegativity under
products. C-U2-T's own `## Remaining obligation` item 1 concedes this ("Prerequisite Lean work: …
multiplicativity of `Z` over separated Finsets"). **C-U2-F's F-3 is sustained in full.**

*(e) The disposition.* **C-U2-F's conclusion is NARROWED, not struck:** what is genuinely required is a
**binary product layer**, not "the full product apparatus of (8.4)–(8.5)". F-2/F-5 establish that the
*pendant* family cannot close even with a strengthened hypothesis; they do not bear on the two-piece
edge split, which C-U2-F did not consider. **C-U2-T's edge-split join is the funded Stage 7
architecture for (DL); C-U2-F's product-layer requirement is its prerequisite.** Neither critic is
wrong about what it examined; the disagreement was about scope, and the scopes do not overlap.
Grade for the edge-split join: `proved_informal` at best, pending a Lean proof — never
`formally_verified` on the strength of any census, mine included.

**3. "Leaf existence is missing from Mathlib": REFUTED, confirmed by me at the pin.** By grep inside
the Mathlib package directory at `905b9581…`, in the very file the return says it searched
(`Mathlib/Combinatorics/SimpleGraph/Acyclic.lean`):
`IsAcyclic.induce` (**:96**), `IsAcyclic.isTree_connectedComponent` (**:137**),
`IsTree.minDegree_eq_one_of_nontrivial` (**:494**),
`IsTree.exists_vert_degree_one_of_nontrivial` (**:508**),
`Connected.induce_compl_singleton_of_degree_eq_one` (**:516**). **The return's characterisation of
this as "the single hardest missing lemma" and "a nontrivial multi-lemma undertaking out of reach" is
struck.** C-U2-F went further and compiled the carrier bridge and the peeling step
(`CriticU2F.exists_degOn_eq_one`, `…_of_acyclic`, `degOn_eq_induce_degree`); I replayed them,
sorry-free. Under ruling 2 they are also **off the critical path**.

**4. The multi-component step: the naive single-root product is REFUTED; the correct reduction is
adjudicator-derived and short.** C-U2-T (finding 5) is right that the root-free potential "convolves,
it does not add", and I confirm the naive form fails: on separated `A ⊔ B` with the root `a ∈ A`,
`D_{A∪B}(a) ≠ D_A(a)·Z_B` (first counterexample at `|A| = |B| = 1`: got `(0,2,2,0,…)`, want `0`). What
*is* true, and what neither critic states, I verified exhaustively (1,596 separated-union instances,
zero mismatches):

```
D_{A ⊔ B}(a) = D_A(a)·Z_B + Z_A·D0_B          (D0_B the root-free potential of B)
             ≥ D_A(a)·Z_B + Z_A·D_B(b)        for every b ∈ B, since D0_B = D_B(b) + 2·C_b ≥ D_B(b)
```

so single-root nonnegativity for a **forest** follows from single-root nonnegativity per component in
two lines, using only binary products. This converts C-U2-F's "bounded evidence, worth one cycle's
attempt" and C-U2-T's cautionary finding 5 into a proved reduction; I corroborated the conclusion over
all labelled forests to order 7 (277,952 (forest, root) pairs, `D, E ≥ 0`, zero failures).

**5. Certification literals struck across the orientation** (none touching the mathematics): the
`736eb9db…`/`736eb9df…` slip (U1, U3), U3's `PIN.json` tail, U1's non-existent per-statement digests,
U1's generator-provenance sentence, U2's "the one match on the string 'axiom'" and its absolute
"did not open [the external slice] at all", U3's "a static grep … returns nothing" and "all 17
declarations", U3's garbled pin-provenance sentence, and the grade applied to definitions in both U1
and U3.

**6. Nothing here reopens a refuted mechanism.** `E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER`
(REFUTED, scope: ordinary paths `P_n`) is not a premise in any return, critique, or line of this
adjudication; `firstDescent` is defined on strict descent alone with no maximizer property asserted.

---

## Lean readiness

Decided for each §2 statement on this portfolio's evidence.

| Target | (a) complete informal proof, closed DAG | (b) compiled fragments covering named DAG nodes, sorry-free | (c) named open nodes |
|---|---|---|---|
| (DL) `forest_degree_lemma` | **No.** The paper's mechanism is not reconstructed at statement level in this orientation; the edge-split route is an informally derived identity with exhaustive small-case verification. | Partial: the `m = 1` joins, root conditioning, the weighted split, `D_zero`/`E_zero`, the rooted→root-free bridge, the leaf-peeling step, and (adjudicator) both carrier bridges and the separation characterisation. | The edge-split join; `Z` multiplicativity over separated Finsets; nonnegativity closed under products; the simultaneous all-roots induction; the forest (multi-component) step. |
| (EX) `forest_extension_inequality` | **Yes, given (DL).** | **Yes** — U3, and independently C-U1-T, C-U3-T, C-U3-F, at the frozen text. | (DL) only. |
| (LB) `forest_descent_linear_bound` | **Yes, given (DL)**; unconditional at `k ≤ 1`. | **Yes** — U3, C-U1-T, C-U1-F, C-U3-T, C-U3-F. | (DL) at `k ≥ 2` only. |
| (R5) `forest_rank5_ceiling_20` | **Yes, given (DL)**. | **Yes**, including the `(5:ℤ)`/`((5:ℕ):ℤ)` cast bridge (C-U3-F `contract_rank5_from_general_DL`). | (DL) only. |
| (XR) `forest_descent_restriction` | **Yes, given (DL)**, with the `4r − 4` ℕ-truncation audited (`hx` forces `r ≥ 1`). | **Yes** — U3, C-U1-T, C-U1-F, C-U3-T. | (DL) only. |

**Contract-ready award groups in orientation U**, with exact statements, hypotheses and fences:

- **U-A `E993-R27-INDEP-EXTENSION-DOUBLE-COUNT` and `E993-R27-EXTENSION-LOWER-BOUND`** — the two
  statements of `## Established results` A, verbatim. Hypotheses: `[Fintype X] [DecidableEq X]
  [DecidableRel G.Adj]` and, for the second, `hJ : G.IsNIndepSet k J`; **no acyclicity, no `(★)`, no
  `hyp-alpha`**. Permitted axioms only, sorry-free, replayed by me and by three critics. Fences: not
  forest statements; no status transfer; not evidence for (DL)/(EX). *Ready.*
- **U-B `E993-R27-DEGREE-LEMMA-IMPLIES-EXTENSION-CHAIN`** — `DlHyp → ExHyp ∧ LbHyp` with
  `LbHyp → R5 ∧ XR`, the hypothesis types definitionally U1's frozen declarations. Grade
  `formally_verified` **as implications**; the four targets stay `conditional`. Fence: the implication
  is the award, the targets are not; and C-U3-F's instance caveat travels with it — (DL) must be
  proved with instance binders, not at one fixed `Fintype` instance. *Ready.*
- **U-C the definition layer of record** — `indepDegreeSum`, `extensionCount`/`e`, `firstDescent` with
  existence/spec/minimality, registrable as **definitions of record** with the adjudicator's `rfl`
  agreement lemmas attached. Not an award group; a registration item. *Ready.*

**Not ready, and this is the cycle's central ruling for orientation U: none of (DL), (EX), (LB), (R5),
(XR) is contract-ready unconditionally, because (DL) is open at general `k`.** Fixed-rank discharges
at `k ∈ {0,1}` exist and are correct but a fixed-band result never qualifies.

**The smallest unproved Lean node**, after the two closures I added this stage, is the product layer's
counting step:

```lean
theorem Z_union_of_separated {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] {A B : Finset X} (hd : Disjoint A B)
    (hsep : ∀ a ∈ A, ∀ b ∈ B, ¬ G.Adj a b) (k : ℕ) :
    R27DegreeLemma.Z G (A ∪ B) k
      = ∑ i ∈ Finset.range (k + 1), R27DegreeLemma.Z G A i * R27DegreeLemma.Z G B (k - i)
```

Its mathematical content is discharged: I compiled, sorry-free,
`AdjU.indepFinsets_union_of_separated` — the independent subsets of a separated `A ∪ B` are exactly
the unions of an independent subset of `A` with one of `B`. What remains is Finset bookkeeping (a
`Finset.card_nbij'` to the product set on `J ↦ (J ∩ A, J ∩ B)` with inverse `(J_A, J_B) ↦ J_A ∪ J_B`,
plus a decomposition of that product set by `p.1.card`). I attempted the bookkeeping and did not land
it within this stage; I record the exact failure surface rather than a `sorry`'d draft.

### Byte-identical carry list for Stage 7 (ruling 2, part one)

Every file below is to be carried **byte-identically** into the Stage 7 award project, fragment by
fragment through the registrar (the kernel verifier admits a single source importing only Mathlib).
Digests are full SHA-256, computed by me from the bytes; every one that a return or critique also
asserts agrees with it.

| Path (relative to the run root) | Bytes | Lines | SHA-256 |
|---|---|---|---|
| `sources/r25/c4-forest-descent-order-bound/LeanProject/lakefile.toml` | 237 | 11 | `45d0ca58145784d5f29322ff21a1335e350c38e72afe8d5396d9c9910b94ff49` |
| `sources/r25/c4-forest-descent-order-bound/LeanProject/lake-manifest.json` | 3559 | 117 | `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` |
| `sources/r25/c4-forest-descent-order-bound/LeanProject/lean-toolchain` | 25 | 1 | `2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273` |
| `sources/r25/c4-forest-descent-order-bound/LeanProject/LeanProof.lean` | 22 | 1 | `f4dfdef8320a735eab53d24f4b47d3b60bcb474ffd2c84c77f24ae2fc75fcf31` |
| `sources/r25/c4-forest-descent-order-bound/LeanProject/LeanProof/Main.lean` (G1 entries 1–17, byte-identical) | 17180 | 390 | `736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0` |
| `scratchpad/c1-U1/LeanProject/LeanProof/Main.lean` (G1 prefix + definition layer + five frozen targets) | 27328 | 591 | `8cc381f413e6b5533995a362f4f38f4930d99119e8eece9a5f1cc323a62dea0d` |
| `scratchpad/c1-U1/THEOREM-CONTRACT.draft.yaml` (**draft**; carry only after the two corrections below) | 13390 | 219 | `791eb99f7a94d3bea672b2ed83591a9d020692ed47b58cb42c9149223184670a` |
| `scratchpad/c1-U2/LeanProject/LeanProof/Main.lean` (`R27DegreeLemma` core; **rename before any award face**) | 26961 | 499 | `d068c00480a205cdbb9edef12592246bc0b0cf20575cb9d434d2458bdae164df` |
| `scratchpad/c1-U3/LeanProject/LeanProof/Extension.lean` | 18472 | 397 | `116b4f313eedfe4210173226c2f5ef877a6e1ee07061888f4106e908ba6b08a6` |
| `scratchpad/c1-crit-U1-T/CriticAdvances.lean` (C-U1-T; the capstone chain) | 13033 | 256 | `41dae810663a4ae1c680afac7bacc0824351f94858e89f5da32fdd51c112515a` |
| `scratchpad/c1-crit-U1-F/LeanProject/CritAdvance.lean` (C-U1-F) | 3327 | 70 | `0ba36a8999911419e7655599acf459a6a7f866142cb6318632b05066250940a1` |
| `scratchpad/c1-crit-U1-F/LeanProject/CritAdvance2.lean` (C-U1-F; `k = 0`, `k = 1`) | 2079 | 51 | `1cb6173f39071040bc4a682b2a0c02f885edb0bf01ff0213e5c7aabb9a2156a8` |
| `scratchpad/c1-crit-U2-T/LeanProject/LeanProof/Audit.lean` (C-U2-T) | 3535 | 75 | `19b9a2f8cf95652596cb35402ef9ca8018d55ce44f387b902347686ddf5a25d5` |
| `scratchpad/c1-crit-U2-F/LeanProject/LeanProof/CriticU2F.lean` (C-U2-F; `D0` layer, leaf peeling) | 6142 | 132 | `779d2ddca5d1cdc94bc90e083ddb047d79c3cccf6882b2728827bca682e80b02` |
| `scratchpad/c1-crit-U3-T/LeanProject/LeanProof/Audit.lean` (C-U3-T; §2 landings, ranks 0–1) | 8278 | 187 | `2d28f5adf70f34f464d7b7498939d8ec83816253f3dc4c023e7af6c3e74488dc` |
| `scratchpad/c1-crit-U3-F/replay/LeanProject/LeanProof/Critic.lean` (C-U3-F; composition, non-vacuity, `Empty` carrier) | 6149 | 145 | `15cadccc89bb23c3f835e59b40f6a9d4838db2987206befc81a952208efc954d` |
| `scratchpad/c1-adj-U/LP-BRIDGE/Bridge.lean` (adjudicator; `Z`/`degOn` carrier bridges) | 1573 | 43 | `8f5daebe06eab9995458846a87071d6821cae4a9bc91717d69ce6cadca61ad2d` |
| `scratchpad/c1-adj-U/LP-BRIDGE/Prod.lean` (adjudicator; separated-union characterisation) | 1918 | 41 | `09a92e3cbd06c387e3f575b73e993bbfdc37b96769aa9383c85c5e4bda0f856b` |
| `scratchpad/c1-adj-U/LP-MERGE/Reconcile.lean` (adjudicator; U1 ≡ U3 by `rfl`) | 801 | 21 | `0d3de24cd2972b0cb0dec3c7c4b5264662abf98e55b864b67773689f06ac3f2d` |

Conditions on the carry. (i) The five `sorry`'d targets in U1's file are carried **as statements of
record only**; they are not theorems and no grade attaches. (ii) The draft YAML is carried only after
the `Type u`/`Type v` reconciliation and after either recording per-statement digests or deleting the
two sentences that promise them; until then the anti-drift test of record is the elaborated-type
comparison (`#check`), which is stronger than a byte comparison and immune to the universe-binder
difference. (iii) The critic and adjudicator files are **critic-attributed** and
**adjudicator-attributed** respectively on every face; they are not seat work. (iv) Attribution
travels: Fang–Lu–Nevo–Yao–Zheng 2026 §8 for the mathematics of (DL), (EX) and the polynomial
induction; the literature map (FRESH-LEAD, lane 11) for the conditional deductions; r27 seats and
critics for their derivations.

### Renaming of identifiers that coincide with the external slice (ruling 2, part two)

I computed the intersection of every declaration base name in the carry list with all 192 declaration
base names of the frozen external slice (`sources/external/lean-source/ErdosProblem993/`, eight files).
**The complete coincidence list is exactly three names, all in U2's `Main.lean`:**

| Identifier | External location | Body/statement relation | Disclosed by |
|---|---|---|---|
| `indepFinsets` | `Basic.lean:62` | **body identical** up to the type variable and `noncomputable`/`open scoped Classical in` | C-U2-T finding 7, C-U2-F F-8 (**not** by the seat) |
| `mem_indepFinsets` | `Basic.lean:67` | **name and statement identical** up to the type variable; the proof differs | **nobody — this adjudication is the first record of it** |
| `degOn` | `Basic.lean:152` | name only; the external body is `(nbr G v ∩ S).card`, U2's is `(S.filter (fun w => G.Adj v w)).card` | the seat, and both critics |

Every other file in the carry list — U1, U3, all six critic files, both adjudicator files — has **zero**
coincidences. The external carrier's own vocabulary (`icoeff`, `Zgen`, `indepPoly`, `vpoly`, `Dpoly`,
`Epoly`, `degDefect`, `degDefectAux`, `indepCard`, `numExtensions`, `sum_degOn_le`, `prefix_ratio`)
appears nowhere in this orientation's work.

**Ruling. No Gate-ruling-3 strike.** The three names are quoted to every seat by its own authorized
packet (`SEMANTIC-CONTRACT.md` §3, `C1-ALLOCATION.md` item 5); `S.powerset.filter (independent)` is the
one idiomatic Mathlib rendering; `degOn`'s body differs; and U2's architecture (a computable
coefficient family `ℕ → ℤ` with `Z`/`D`/`E`/`closedNbhdCompl`/`SingleEdgeJoin`) diverges from the
external `Polynomial ℤ` route everywhere it had a choice. I narrow, as both critics did, the
**absoluteness** of the seat's "did not open it at all … no line read, copied, or paraphrased": it is an
uncorroborable self-report, and the artifact now carries three coincidences of which the seat disclosed
one. **Required before any award face carries "authored in-run" (the controller's standing hygiene
requirement, and mine):** rename all three in U2's file to run-local names —
`indepFinsets → r27IndepFinsets`, `mem_indepFinsets → mem_r27IndepFinsets`,
`degOn → r27DegreeIn` (or equivalents) — and re-express the `indepFinsets` body, so that no shipped
line coincides with the unlicensed external text. U2's declarations already sit in namespace
`R27DegreeLemma`, so the coincidence is at the base-name level only; that mitigates it and does not
discharge it. The three adjudicator files and the six critic files need no rename. F2, which owns the
external audit, should certify the divergence list; nothing in this ruling depends on F2's return,
which is outside my portfolio and which I did not read.

---

## Progress and plateau assessment

Cycle 1 moved orientation U from "nothing compiled" to: the full conditional chain compiled in the
contract's frozen texts and landed on the contract's own `[Finite X]`/`Nat.card` signatures; two
unconditional graph-general counting theorems; a definition layer proved well-defined and now proved
**definitionally equal across two independently written seats**; a working `Finset`-relative potential
machinery with the `m = 1` joins; both carrier bridges to the G1 definitions of record; a refuted
shortcut replaced by a mechanism that provably reaches every (tree, root) pair; and a correctly
identified, genuinely small remaining Lean node. Nine seat/critic Lean artifacts and three adjudicator
artifacts replay sorry-free under the pin. The stop gate's decisive event (a) has not occurred —
(DL) and (EX) are not formally verified — and event (b) has not occurred: no in-scope counterexample
exists, and every falsification sweep in this portfolio is a null at its attained horizon. The run is
in stop-gate case (c): CONTINUE.

material_progress: yes

orientation_plateau: no

---

## Headline assessment

The headline is (DL)+(EX) FORMALLY VERIFIED with (LB)/(R5) checked and the rank-5 residue closed out.
No Stage 5 adjudication can produce it, and this portfolio does not: (DL) is open at general `k`, so
(EX) is compiled only as an implication and the four targets stay `conditional`. At this orientation's
evidence grade there is no complete informal proof of (DL) that I have verified — the edge-split join
that would carry one is an informally derived identity with exhaustive small-case confirmation, which
is `proved_informal` at best and is not the same as a verified statement-level proof with a closed
dependency DAG.

headline_resolved: no

status: still_open

chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

---

## Next-route allocation

Three routes for orientation U in Cycle 2, each with what it could close in one cycle.

1. **`C2-U-01 PRODUCT-LAYER-AND-EDGE-SPLIT-JOIN`** — the funded long pole. Formalize, in order:
   `Z_union_of_separated` (the exact statement above; its mathematical content is already compiled as
   `AdjU.indepFinsets_union_of_separated`, so this is Finset bookkeeping); closure of coefficientwise
   nonnegativity under convolution; the splitting of a tree at an edge into two vertex `Finset`s with
   no other edge between them (Mathlib's bridge API, `isAcyclic_iff_forall_adj_isBridge`); then
   C-U2-T's two edge-split identities. *Could close in one cycle:* the product layer and at least the
   `D_T(a)` identity, making the all-roots induction a bounded remaining step. Do **not** spend the
   cycle on leaf existence — it is in Mathlib at `Acyclic.lean:494/508/516` and the route does not need
   it.
2. **`C2-U-02 ALL-ROOTS-INDUCTION-AND-THE-FOREST-STEP`** — given route 1's identities as hypotheses (so
   the two routes can run in parallel), compile the simultaneous induction `∀ tree, ∀ root, D ≥ 0 ∧ E ≥ 0`
   by strong induction on `Finset.card`, then the forest step by the adjudicator-derived reduction
   `D_{A ⊔ B}(a) = D_A(a)·Z_B + Z_A·D0_B ≥ D_A(a)·Z_B + Z_A·D_B(b)` (verified exhaustively above; it
   avoids the paper's component convolution entirely), then compose with
   `CriticU2F.degree_lemma_of_root` and `AdjU.Z_univ_eq_indepCount`/`degOn_univ_eq_degree` to reach
   `forest_degree_lemma` at §2's exact statement **with instance binders**. *Could close in one cycle:*
   (DL), and with it (EX), (LB), (R5), (XR) by application of the already-compiled chain.
3. **`C2-U-03 AWARD-PROJECT-ASSEMBLY-AND-HYGIENE`** — assemble one project from the carry list: adopt a
   single run-local namespace for the definition layer (U1's root-namespace declarations, U3's
   `Erdos993G1.*`, U2's `R27DegreeLemma.*`), carrying the adjudicator's `rfl` agreement lemmas as the
   proof that no drift occurred; execute the three renames of the external-coincidence ruling and
   re-express the `indepFinsets` body; lift the three run-local definitions' **text** plus a
   per-definition digest into the contract (Gate ruling 5's requirement, which no artifact currently
   satisfies); reconcile `Type u`/`Type v` and either add or delete the per-statement digests; keep one
   copy of each duplicated critic result and record which; and perform the mathematical alias check of
   the five `E993-R27-` candidates against the 370 registered statements, which no seat of this route
   discharged. *Could close in one cycle:* U-A, U-B and U-C registered, and a Stage 7-ready project
   blocked on nothing but (DL).

**The exact remaining obligation for orientation U:** a sorry-free Lean proof of

```lean
theorem forest_degree_lemma {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ) :
    (indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k
```

stated with instance binders, on the definition layer of record, under permitted axioms
`propext`, `Classical.choice`, `Quot.sound`, with no `sorry`, `admit`, `native_decide`, `axiom`, and no
`decide` over an enumeration for a universal step. Nothing else in orientation U is open.

---

## Artifact inventory

All adjudicator work is confined to
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-forest-degree-extension-dre-2026-09-24/scratchpad/c1-adj-U/`;
the only file written outside it is this adjudication. Nothing under `sources/`, `control/`,
`cycles/cycle-1/stage3/`, `cycles/cycle-1/stage4/`, or any seat's or critic's scratch was modified.

| Artifact | Bytes | SHA-256 |
|---|---|---|
| `verify_capsule.py` (capsule seal + 24 member digests) | 926 | `55f814a3b2923dcc32fd6148b830fef10937849d79d7b00aa606e8f8ce1cbb66` |
| `seals.py` (Stage 2/3/4 seals + 200 member digests) | 867 | `4221598da05e1b034d88393704b99b2f461f42b80ddd47e2eeaf0bba6655bf96` |
| `instrument.py` (own exact-integer `Z`/`D`/`E`; fixed points; edge-split join; reach) | 14256 | `b9699a1201924d4e62b95a0386473e9d520883a694259cfbbe4ed7781c95dea7` |
| `sepcheck.py` (separated-union identity; forest nonnegativity to order 7) | 2532 | `67375dd293b8510fed7e4afb93910d58ae07055b0811e1efc95c9f3de0158ff1` |
| `carry.py` (carry-list digests) | 2211 | `a010203d164b9048539f3e139e437e4b5091c119b305ca7cbab48415b7226817` |
| `names.py` (declaration-name intersection with the external slice) | 1910 | `4dcf3a19b889229bf2912153edecabfb8463d335f24ddd1789d4d6a0dca09ee8` |
| `LP-U1/` (U1's five tracked files + C-U1-T's and C-U1-F's three advance files) | — | replay: 8657 jobs, five `sorry`s at 567/572/578/582/586 |
| `LP-U2/` (U2's `Main.lean` + C-U2-T's `Audit.lean` + C-U2-F's `CriticU2F.lean`) | — | replay: 8659 jobs, zero `sorry` |
| `LP-U3/` (frozen seed + U3's `Extension.lean` + C-U3-T's and C-U3-F's modules) | — | replay: 8660 jobs, zero `sorry` |
| `LP-BRIDGE/Bridge.lean` (adjudicator: `Z_univ_eq_indepCount`, `degOn_univ_eq_degree`) | 1573 | `8f5daebe06eab9995458846a87071d6821cae4a9bc91717d69ce6cadca61ad2d` |
| `LP-BRIDGE/Prod.lean` (adjudicator: `indepFinsets_union_of_separated`) | 1918 | `09a92e3cbd06c387e3f575b73e993bbfdc37b96769aa9383c85c5e4bda0f856b` |
| `LP-MERGE/Reconcile.lean` (adjudicator: U1 ≡ U3 by `rfl`) | 801 | `0d3de24cd2972b0cb0dec3c7c4b5264662abf98e55b864b67773689f06ac3f2d` |

**Replay recipe (copy-out-first, foreground, stdlib only).** Copy `scratchpad/c1-adj-U/` elsewhere. For
each `LP-*` project, recreate `.lake/packages` as a **manual symlink** to
`/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages` (never copy the
packages, never `lake update`, never `lake clean`), seed `lakefile.toml`, `lake-manifest.json` and
`lean-toolchain` byte-identically from `sources/r25/c4-forest-descent-order-bound/LeanProject/`, then
`lake build` in the foreground and `lake env lean <file>` for each probe. For the numeric half,
`python3 instrument.py` (≈4 min) and `python3 sepcheck.py` (≈3 min); both are deterministic, exact-integer
and free of wall-clock, PID and host fields. `python3 carry.py` and `python3 names.py` regenerate the
two tables above.

**IMPORT LIST.** Python: `hashlib`, `json`, `os`, `re`, `itertools`, `math`, `functools` — standard
library only; no network, no package installs, no floats. Lean: `import Mathlib` through the pinned
shared Mathlib bound by manual symlink, plus `LeanProof.*` modules of this run.

**Disclosures.** (i) I read the frozen external Lean slice's declaration lines
(`sources/external/lean-source/ErdosProblem993/Basic.lean:55–70, :152`, and the declaration headers of
all eight files by a grep confined to that directory) to discharge the name-coincidence ruling the
dispatch assigned me; `sources/` is run-root authority and READ ONLY; nothing was copied into any
project and no external text beyond the three declaration signatures the ruling turns on is reproduced
here. (ii) Every grep for a Lean name was confined to the Mathlib package directory
`/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages/mathlib`, as the
dispatch directs. (iii) I listed the nine granted scratch directories
(`scratchpad/c1-U{1,2,3}/`, `scratchpad/c1-crit-U{1,2,3}-{T,F}/`) and their `LeanProject` subtrees
non-recursively to locate the artifacts to replay; I did not list `scratchpad/` itself, did not run
`find`, `rg`, `ls -R`, or any recursive listing rooted above a granted directory, and read no other
orientation's portfolio, no other adjudication, no prior synthesis, no other experiment root and no
external source. (iv) No network, no package install, no `elan`, no `lake update`, no `lake clean`.
(v) **No background job was started at any point**; every `lake build`, every `lake env lean` and every
Python run was issued in the foreground and returned synchronously, so there is no PID to kill; I
confirmed with a listing filtered to my own uid that no `lake`/`lean`/`python3` process of mine was
running before this write, and I used no pattern kill. (vi) The three `AdjU*` results and the
separated-union reduction are **adjudicator-derived and first stated at a review stage**: they are
STATED, and each needs an isolated second read before registration. (vii) This adjudication was reread
before close.
