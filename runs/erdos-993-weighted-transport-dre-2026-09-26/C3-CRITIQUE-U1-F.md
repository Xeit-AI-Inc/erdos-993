# Critique

Critic `C-U1-F` (orientation F, falsify), Cycle 3 Stage 4 of r30 (Erdős #993, weighted mixed-boundary transport), assigned
to seat `U1`, route `C3-U-01 LEAN-INV-QUOTIENT-NM-AND-LEMMA-U` (orientation U).

**Boot.** Operating within VerityOS. Booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. No other VerityOS subsystem was loaded. The harness put the
project `CLAUDE.md` and the user auto-memory index into context at session start; I did not open either as a source, and
nothing below relies on them.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

| object | expected | recomputed | result |
|---|---|---|---|
| dispatch `control/dispatch/c3-stage4/DISPATCH-C-U1-F.md` (file SHA-256) | `28325c30…3fb39b` | `28325c30be2a9ca91b49f3945667f7532a28acbd45b7e17221055548a63fb39b` | match, verified before the file was read |
| capsule `control/c3-critic-capsules/U1-PACKET-MANIFEST.json`, inner seal (canonical JSON without `seal_sha256`: sort_keys, `(",", ":")`, no trailing newline) | `fc3cec30…52fc` | `fc3cec30441d9951b33de29c7164c9994e87826f14ef6325127c60050d1652fc` | match |
| 14 capsule members (bytes and SHA-256 each) | manifest | recomputed | 14/14 match |
| Stage 4 dispatch manifest seal | `b57e5de1…` (embedded) | `b57e5de137627d8526c12e5f54a2011683c1ba010f98450a8adace5f4e7ca3c7` | match |
| Stage 3 packet manifest seal | `64c6c84a…` (embedded) | `64c6c84aabe2392394f680abb3c8862a349f06a4f8043a9960b706f35b294797` | match; lists `returns/U1/RETURN.md` at `d206b783…41ce`, same as the capsule |
| Stage 2 packet manifest seal | `5df4c603…2416` (protocol) | `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416` | match; `stage = cycle-3-stage2`, `file_count 1051` |
| U1 `Main.lean` (return: `f3b21020…`, 2851 lines) | return | `f3b21020433375b01e1bcdd89d8996dd2198ad2ac438557bda8774b73a57b180`, 2851 lines | match |
| C1-LA1 `Main.lean` (`86b59c6c…`) | allocation | `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb` | match |
| C2-LA1 `Main.lean` (`a9cf3b81…`) | allocation | `a9cf3b815832b6fa25e43e07e628db4ce01a7a496b084cac0cd3768e877c7fc4` | match |
| `sources/mathlib-binding/PIN.json` | `SOURCE-DIGESTS.json`: 469 B, `af78b3d8…` | same | match; pins `905b9581…`, which is also the revision in the seat's `lakefile.toml` and `lake-manifest.json` |
| seat scaffold `lakefile.toml`, `lake-manifest.json`, `lean-toolchain`, `LeanProof.lean` vs C1-LA1's project | — | 4/4 byte-identical | match |

The Stage 3 read-boundary record (a capsule member) lists U1's disclosures: `PIN.json` was read before its digest check (I
confirm the digest is clean), plus two non-recursive `ls`. U1 wrote its replay copy to `scratchpad/c3-U1-replay/`, which is
the in-root replay target that `C3-WORKER-COMMON-BRIEF.md` item 109 requires, so that is not a deviation.

**My own read-boundary disclosures.**
1. I read the two governed award files `runs/lean-2026-09-26-c1-la1-…/LeanProject/LeanProof/Main.lean` and
   `runs/lean-2026-09-26-c2-la1-…/LeanProject/LeanProof/Main.lean` by exact path. Both are named sources of record in
   the capsule's common brief, and the attack brief requires byte-comparing against them. Neither is listed in the capsule
   manifest, so I record the reads here. I also read C1-LA1's four scaffold files by exact path for the byte-compare.
2. One single-file `grep` of `control/C3-WORKER-COMMON-BRIEF.md` (a Stage 2 member that the common brief says critics may
   read), to check the scratch and replay path rule.
3. One single-file `grep` of the pinned Mathlib `Mathlib/Combinatorics/Enumerative/DoubleCounting.lean`, to read an API
   statement. The protocol allows reading Mathlib for API meaning.
4. Non-recursive `ls` of `scratchpad/c3-U1/`, its `LeanProject/`, `LeanProject/LeanProof/` and `LeanProject/.lake/`
   (all granted). I also ran `ls` on my own scratch directory and on `cycles/cycle-3/stage4/critics/U1`, only to check
   whether they existed; both were absent at the time.
5. **Stray write.** A compound shell command copied my two critic Lean files `CriticQuot.lean` and `CriticNM.lean` into
   `/tmp/`. This was an accident and breaks the scratch-only rule. I deleted both copies at once and confirmed they were
   gone. Nothing was read back from them or used.
6. Protocol path discrepancy. The protocol says to byte-compare against
   `sources/first-interior/c3-primary-v2/LeanProject/LeanProof/Main.lean`. `SOURCE-DIGESTS.json` has no such path. It
   lists `sources/first-interior/c2-primary-v2/…`, which is the file the semantic contract cites. I compared against its
   `Snippets/`: 14 carried fragments (0001–0006, 0008–0013, 0018, 0042) are each digest-verified against
   `SOURCE-DIGESTS.json` and each occurs byte-for-byte in U1's `Main.lean`.

I did not use `find`, `rg` or `ls -R`, did not read any other return, critique or adjudication, used no network and
installed no packages. No background job was started.

## Independent re-derivation

**Instrument 1 (Lean rebuild).** I copied U1's inventoried project out to `scratchpad/c3-crit-U1-F/LeanProject`, symlinked
`.lake/packages` to the shared `mathlib-v4.32.2-project` packages by hand, ran `cd` into the project, then `lake build
LeanProof`. The result was `Build completed successfully (8657 jobs)` (`build_critic.txt`). The `Main.olean` was freshly
built in my tree. I then ran `#print axioms` on U1's ten declarations and on my own nine (`critic_axioms.txt`). Every one
reports exactly `[propext, Classical.choice, Quot.sound]`. A token scan of `Main.lean` finds no `sorry`, `admit`,
`native_decide`, `axiom` or `decide`. The only `set_option` hits are inside comments.

**Carry fidelity (`carry_check.py`, `carry_check2.py`, my own scripts).**
- U1's `Main.lean` begins with C1-LA1's `Main.lean`, byte-identical over the whole file.
- The rest of the file up to `-- VERITYOS ENTRY 77 END` equals C2-LA1's span from entry 22 to entry 77, with the entry-31
  block removed and one inter-entry blank line dropped. That blank line (between the entry-30 END marker and the entry-32
  BEGIN marker) is the only byte difference. Every carried entry block is byte-identical.
- C2-LA1's entry 31 is `E993Transport.isGraphLeaf_of_mem_favorableLeaves`. Its marker digest (`8977fb83…`) and its body are
  byte-identical to C1-LA1's entry 24. Removing the duplicate changes no statement.
- C2-LA1 entries 1–21 are C1-LA1 entries 1–21 byte-for-byte. C2-LA1 does not re-carry C1-LA1 entries 22–36 except 24,
  which is its entry 31. U1's parenthetical "re-carried the whole C1-LA1 base as its own entries 1–21/24/31" is garbled
  but harmless.

**Definition fidelity.** I read `indepFamily`, `tagWitnesses`, `activeWeight`, `favorableLeaves`, `transportRel`,
`IsSaturatingFlow` and `WeightedHall` in the file against `SOLUTION-CONTRACT.md` §2. They agree character-for-character in
substance:
- `activeWeight` counts `v ∈ F ∩ B` with `¬Disjoint (B.erase v) W_v`, which is the active test and nothing wider.
- `transportRel` is exactly (D) ∪ (S), where (S) requires `u ∉ B` and `|N(u) ∩ B| = 2`.
- `favorableLeaves` is fixed at the original rank `p`.

U1's route introduces no new weight or relation definition.

**Instrument 2 (Python, `critic_instr.py`, `python3 -B`, standard library only, built from SEMANTIC-CONTRACT §1).**
- Fixed points. The tree test passes. `x` is computed through rank `α`. `F_p` is derived from `Δ_p(T − v)`. `S` is
  computed from `q_v` through separate `H_v`/`R_v` counts, independently of the supply and capacity sums.
  - `K_{1,12}/8`: `n 13, α 12, x 6`, eligible, `|F| = 12`, supply 1980, capacity 3960, `S = −1980`, WID holds, 1980 arcs.
  - Path-star `(2,3,4)/7`: `n 15, α 11, x 5`, eligible, `|F| = 10`, supply 1483, capacity 2701, `S = −1218`, WID holds,
    2025 arcs.

  Both agree with the common brief's fixed points.
- Lemma U semantics. For every target `A ∈ I_p`, I compared "some source joins `A` under the literal (D) ∪ (S)" with U1's
  right-hand side ("not maximal" or "some `u ∈ A` has a non-adjacent pair `y ≠ z` with `N(y) ∩ A = N(z) ∩ A = {u}`").
  - On every labelled graph of order ≤ 6, at every rank, this is 578,153 (graph, rank, target) triples with **0
    mismatches**. 100,570 of those targets have no in-arc, so both branches are exercised.
  - On the two fixed-point trees: 0 mismatches.

  This confirms that the Lean statement expresses Lemma U as the attack brief words it. It is a check on statement
  meaning; it adds nothing to the kernel proof. Grade: `bounded_computation`.

**Statements read against the brief.**
- `exists_transportRel_iff`:
  - The hypothesis is only `A ∈ indepFamily G p`. There is no `IsTree` and no eligibility hypothesis, and it holds for
    every finite simple graph and every rank.
  - The non-adjacency clause `¬ G.Adj y z` is present.
  - The "only neighbour in `A`" clause `G.neighborFinset y ∩ A = {u}` is present, and it implies `y ~ u` and `y ∉ A`.
  - The clause `y ≠ z` is present.
  - The relation is the frozen `transportRel`.
- `regular_bipartite_shadow_bound` has hypotheses of **exact** degree on **all** of `α` and `β`:
  `htop : ∀ a, |{b | R a b}| = dtop` and `hbot : ∀ b, |{a | R a b}| = dbot`. See the attack section for what that means.
- The orbit lemmas are read in the attack section.

## Attacks and findings

**A1 — The (INV) gap statement is not exact. The "capacity-side analogue" does not exist as a separate obligation (struck).**
U1 says that closing (INV)'s quotient clause needs "a new, not-yet-attempted capacity-side analogue (harder: a single
orbit's `covered` set can meet several distinct target orbits)". That is false as an obligation.
- `cov G F p X` is by definition `∑ A ∈ covered G p X, activeWeight G F A`, so `cov G F p X = supply G F (covered G p X)`
  holds by `rfl` (my `cov_eq_supply_covered`).
- U1's own `supply_orbitOf` is stated for an arbitrary rank `j`, so it applies to target orbits at `j = p` exactly as it
  applies to source orbits.
- The covered set of an invariant family is invariant (`covered_orbitUnion`), so it is a union of target orbits.
- That a source orbit meets several target orbits is no obstacle. Each target orbit contributes `|O′|·w`.

U1's items (b), a representative `Finset`, and (c), a capacity analogue, are both unnecessary. Only the partition and sum
bookkeeping was missing.

**A2 — Critic-derived advance: the quotient clause of (INV), for `Γ = Aut(G)` and the fixed selector, is now compiled.**
In `LeanProof/CriticQuot.lean` (182 lines; it imports U1's `Main.lean` and adds nothing to it) I define:
- `orbits G j := (indepFamily G j).image (orbitOf G j)`, which needs no representatives;
- `orbitArc G O O′ := ∃ B ∈ O, ∃ A ∈ O′, transportRel G B A`;
- `QuotientHall G F p`, which says: every `𝒳 ⊆ orbits G (p+1)` satisfies
  `∑_{O∈𝒳} supply O ≤ ∑_{O′ ∈ orbits G p, ∃ O ∈ 𝒳, orbitArc O O′} supply O′`.

I then prove the following, all with axioms exactly the permitted three:

```text
theorem weightedHall_iff_quotientHall (G) (p) :
    WeightedHall G (favorableLeaves G p) p ↔ QuotientHall G (favorableLeaves G p) p
```

The supporting lemmas are:
- the orbit relation is an equivalence and orbits partition the layer (`orbitOf_eq_of_mem`, via `γ.trans` and `γ.symm`;
  `orbits_disjoint`);
- the class-union deficit identity (`supply_biUnion`, `cov_biUnion`, `covered_biUnion`: the covered set of a union of
  source orbits is exactly the union of the target orbits joined to them);
- the per-orbit product form at every rank (`supply_orbit_eq_card_mul`: `supply O = |O| · w_F(B)` for any `B ∈ O`).

The proof composes C2-LA1's `weightedHall_iff_invariant` with U1's `invariant_iff_orbitOf_subset`,
`orbitOf_subset_of_mem_invariant`, `covered_orbitUnion` and `supply_orbitOf`. So U1's building blocks are genuinely
load-bearing, and they are sufficient.

Scope and grade:
- The grade is `compiled` (scratch). It is attributed to C-U1-F, building on U1 and C2-LA1.
- The scope is the full group `Aut(G)`, the selector `F = favorableLeaves G p`, every finite simple graph and every rank.
- I could not read the registered (INV) text (the registry is outside my capsule). If that key quantifies over arbitrary
  subgroups `Γ ≤ Aut(G)`, or over arbitrary invariant tag sets, this theorem covers only the `Aut(G)` / `F_p` instance.
  A Stage 7 contract must check that before any award.
- Nothing here supplies quotient feasibility. It is a reduction, not a Hall proof.

**A3 — `regular_bipartite_shadow_bound` is a special case of Mathlib's double count, and it does not by itself give the NM ratio (narrowed).**
- Mathlib `Finset.card_mul_le_card_mul` already proves `|s|·m ≤ |t|·n` from a lower bound on down-degree over `s` and an
  upper bound on up-degree over `t`. In `CriticNM.lean` I re-derive U1's inequality from it under **weaker** hypotheses:
  `dtop ≤` down-degree only on `X`, and up-degree into `X` `≤ dbot` only on the shadow (`critic_shadow_bound_weak`). U1's
  lemma follows from that (`critic_recovers_U1`).
- U1 describes its lemma as "at greater generality". That is true relative to T1's group-action Lemma 1, but the lemma is
  strictly less general than an existing Mathlib lemma. The return's "new compiled material" should read "a Mathlib double
  count restated".
- T1's normalized-matching (ratio) form `|X|·|L_{k−1}| ≤ |∂X|·|L_k|` needs two further facts that U1's lemma does not
  state: the global equality `dtop·|α| = dbot·|β|` (Mathlib `Finset.card_mul_eq_card_mul`) and `0 < dbot`. I compiled that
  ratio form as `critic_normalized_matching`.

The exact facts still missing for NM are:
1. the sector-to-poset encoding (the root-plus-arm sector of `CB(d,m)` as `{∅,b,c}^N`, with weight constant at one on it);
2. the correspondence between the transport deletion shadow in the sector and the poset's covering relation;
3. `d_k = k` down and `d_{k−1} = 2(N−k+1)` up, both exact, on that poset.

The brief asked whether the hypotheses are exact degrees or bounds. U1's are exact equalities on the whole of both sides,
which is stronger than the proof uses: `htop` is used only on `X`, and `hbot` only as `≤`.

**A4 — Lemma U: no falsification found.** The statement is exact (see the re-derivation). The kernel proof is independent of
trees, eligibility and `Aut`. My 578,153-triple semantic check agrees with it. There is no hypothesis that encodes the
conclusion. The `p = 0` edge case is harmless because `A = ∅` falls under the first disjunct whenever `V` is nonempty.

**A5 — Orbit lemmas: hypothesis audit.**
- `orbitOf` is a filter of the layer, so `orbitOf G j B = ∅` when `B ∉ I_j`. `mem_orbitOf_self` correctly carries
  `hB : B ∈ indepFamily G j`.
- `hXsub` is unused in `orbitOf_subset_of_mem_invariant` and in `covered_orbitUnion` (the linter flags lines 2734 and
  2763). This is harmless and encodes nothing.
- `covered_orbitUnion` states that the covered set is invariant under every automorphism. Combined with
  `invariant_iff_orbitOf_subset` at rank `p` (applicable because `covered ⊆ indepFamily G p` by construction), it gives
  "a union of target orbits". That is what the class-union Hall converse needs, and my `covered_biUnion` uses it that way.
- `supply_orbitOf` depends on the unconditional `Aut`-invariance of `F_p` (`favorableLeaves_map_aut`). It is correct only
  for Aut-invariant tag sets, and it is stated only for `favorableLeaves`, so there is no over-reach.

**A6 — No circularity, no ℕ-subtraction hazard, no quantifier narrowing.** `WeightedHall` quantifies over every
`X ⊆ I_{p+1}`. The reduction to invariant families is C2-LA1's companion, which is kernel-checked. No step assumes `S ≤ 0`
or uses the budget.

## Mechanism-equivalence and fence check

- **Refuted keys (§3.2).** None of U1's three pieces, and none of my additions, is a Hall-sufficiency mechanism.
  - Lemma U characterizes when a target has an in-arc. It is not per-leaf down-map injectivity, not own-support unit
    capacity, and not the literal Delete/Retag relations. It is about (D) ∪ (S) with no weight at all.
  - The orbit material is bookkeeping for an iff reduction. It is not the fixed-γ Hall key, because it quantifies over all
    of `Aut(G)` and over all invariant families.
  - The double count is generic.

  There is no revival.
- **(LIFT) boundary.** Neither U1 nor I treat (LIFT) as supplying quotient feasibility. My `weightedHall_iff_quotientHall`
  proves both directions of the Hall-form reduction for `Aut(G)` and asserts no feasibility.
- **Closed regions.** Neither the high tail, the order bands nor any family theorem is touched. No census value appears in
  a proof, there is no RTree wording, and no live root was read.
- **Re-proof as contribution.** Formalizing the `proved_informal` keys (INV) and (NM), and Lemma U (which U1, citing
  SR-C2-4, calls a restatement of P10), is the allocated U1 obligation, a Lean text for Stage 7. It is not a re-proof
  offered as a new result. I could not verify U1's quotations of SR-C2-4 and SR-11, because the second reads are outside
  my grant. They carry no weight here.
- **Claim identity.** Keys touched:
  - (WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (carried);
  - `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY` (C2-LA1, carried);
  - (INV) `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` (`proved_informal`; quotient clause now has compiled
    scratch Lean, critic-authored);
  - (NM) `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` (`proved_informal`; still no sector Lean);
  - (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN, untouched).

  U1 proposes no new key, and neither do I. U1's draft working titles `E993-R30-TRANSPORT-INARC-CHARACTERIZATION`,
  `…-AUT-ORBIT-QUOTIENT-BUILDING-BLOCKS` and `…-REGULAR-BIPARTITE-SHADOW-BOUND` are not keys. If the controller ever
  registers the first, it must be alias-checked against P10 and Lemma U. The third aliases Mathlib's
  `Finset.card_mul_le_card_mul` mathematically and should not become a run key. U1's alias check was by inspection only,
  without opening the registry. That is acceptable because nothing is registered.

## Certification audit

| literal in the return | evidence | ruling |
|---|---|---|
| `Build completed successfully (8657 jobs)` | my rebuild: same | backed |
| `Main.lean` SHA `f3b21020…`, 2851 lines | recomputed | backed |
| `#print axioms` lines, all `[propext, Classical.choice, Quot.sound]` | my run: same for all ten | backed |
| "all **nine** load-bearing declarations (the three inherited plus the **six** new)", "All **nine** are the permitted axioms only" | the return's own table and `AxCheckFinal.lean` list **ten** (3 inherited + 7 new) | **struck**: read "ten" / "seven" |
| "no `sorry`, `admit`, `axiom`, `native_decide`, `decide` over an enumeration" | my token scan | backed |
| "every other line is an unmodified byte-carry" (C2-LA1 entries 22–77 minus 31) | `carry_check2.py`: every entry block is byte-identical; one inter-entry blank line dropped | **narrowed**: "every carried entry block is byte-identical; one blank separator line was also removed" |
| "C2-LA1's own entry 31 … duplicates C1-LA1's entry 24 verbatim" | body and marker digest identical | backed |
| scaffold "byte-for-byte from" C1-LA1; PIN digest; Mathlib revision | recomputed | backed |
| "`stage: ` (Cycle 3 Stage 2)" | the manifest has `stage = "cycle-3-stage2"` | rendering slip, not load-bearing |
| replay commands `lake env lean LeanProof/AxCheck.lean` in `scratchpad/c3-U1-replay/`, "independently of the working copy" | the inventoried scratch holds `AxCheckFinal.lean`, not `AxCheck.lean`; the replay directory is outside my grant | **unbacked by shipped inventory**, superseded by my independent rebuild |
| "`infer_instance` fails" for `Fintype (G ≃g G)` | my probe `CriticFintype.lean`: `failed to synthesize Fintype (G ≃g G)` | backed |
| "capacity-side analogue … harder …" (Remaining obligation 1(c)) | A1 | **struck** |
| `regular_bipartite_shadow_bound` "strictly more general … T1's Lemma 1 follows from it once biregularity is established" | A3: Mathlib special case; the ratio form also needs the global equality and `dbot > 0` | **narrowed** |
| "item (iii) is fully discharged" | kernel-checked; my semantic check agrees | backed as `compiled`, and nothing higher |
| grades: everything `compiled`, no key requested | held throughout; no "proved" or `formally_verified` asserted except in clearly marked draft-contract `grade_if_awarded` fields and for carried governed awards | backed |
| quotations of SR-C2-4 / SR-11 / SR-7 / Cycle 1 T1 | outside my grant | not verified by this critic; not load-bearing |

## Verdict

verdict: retained_narrowed
headline_resolved: no

U1's mathematics is correct and its Lean compiles as stated. I rebuilt it independently, and all ten declarations use only
the three permitted axioms. The carry is faithful at the level of entry blocks. Lemma U is exact. The route held its grade
at `compiled` everywhere.

Narrowings:
- the "nine / six" literals become "ten / seven";
- the byte-carry literal is narrowed to entry blocks;
- `regular_bipartite_shadow_bound` is a Mathlib double count and not new generality; NM's ratio form needs the global count
  and `0 < dbot` as well;
- the (INV) gap statement is struck, because no capacity-side analogue is needed.

The step U1 left open is attempted and compiled by this critic: `weightedHall_iff_quotientHall`, the quotient clause of
(INV) for `Aut(G)` and `F_p`. I would grade that mathematics as complete at statement level (`proved_informal` in prose,
kernel-checked in scratch). It becomes a certification only through a governed Stage 7 award whose contract has been
checked against the registered (INV) text. (HALL) is untouched.

## Remaining obligation

1. **(INV) quotient clause.**
   - Diff the registered (INV) statement against `QuotientHall`. Check three things: whether `Γ` is the full `Aut(G)` or an
     arbitrary subgroup; whether the tag set is `F_p` or any invariant set of degree-one tags; and that the orbit weights
     are orbit totals with an orbit arc iff some member pair is joined. Then either widen `CriticQuot.lean` (the same proof
     likely adapts to a subgroup `Γ` with the weights and relation invariant; not attempted here) or register the proved scope as the award's exact scope.
   - Then a governed Stage 7 award seeded byte-identically from C1-LA1 and C2-LA1, carrying U1's orbit lemmas and my
     quotient file through the registrar, with an isolated second read.
2. **(NM).** Formalize three things:
   - the root-plus-arm sector of `CB(d,m)` as `{∅,b,c}^N` (functions `Fin N → Option Bool`), with its embedding into
     `indepFamily` of the tree and active weight constant at one on it;
   - the identification of the transport deletion shadow inside the sector with the poset covering relation;
   - the exact degrees `d_k = k` and `d_{k−1} = 2(N−k+1)`.

   Then instantiate `critic_normalized_matching`, or Mathlib's `Finset.card_mul_le_card_mul` directly. The degree
   computations are the smallest self-contained piece.
3. **Lemma U.** No gap. A governed award is optional, at the controller's discretion. Its alias against P10 must be recorded.
4. **(HALL)** remains OPEN. Nothing here bears on the coupled `CB(8,·)` families.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-crit-U1-F/` (SHA-256, bytes).

| file | sha256 | bytes | role |
|---|---|---|---|
| `LeanProject/LeanProof/CriticQuot.lean` | `63814f602f063b74bc185ab965d9b57e5d3fdb51854541b56f7bf231a6257935` | 8429 | critic-authored (INV) quotient clause (A2) |
| `LeanProject/LeanProof/CriticNM.lean` | `82afd1a241146db41512b36d66a688b3c2a4739c5ca4dfb121b8882f6c70bf18` | 3867 | critic-authored Mathlib double count and NM ratio form (A3) |
| `LeanProject/LeanProof/CriticAx.lean` | `7c7f97b8ccf95fda1293a59c384dcd04f380b072a957491eaf63c1c97ec65aa9` | 1211 | `#print axioms` driver |
| `LeanProject/LeanProof/CriticFintype.lean` | `f6ddda35a2028a76942c5cf8037cf7a97e39420027aad66b68658e9564ce2898` | 141 | probe that is expected to fail (no `Fintype (G ≃g G)`) |
| `critic_axioms.txt` | `a7011ce3c3d41094d76839181902e05f96a1d892593a2f9456abe6d3fdfff3e1` | 3306 | axioms output (19 declarations) and printed definitions |
| `build_critic.txt` | `5243817f01785779b9eb5a1d466211305b95f5f998ccce5f0e5a84acffd11ec8` | 6680 | `lake build LeanProof` log (8657 jobs) |
| `critic_instr.py` | `209343a30063ed9d711287746c993cba0c5ee2ecc57e3a137f51e09b11a2b66c` | 4964 | independent Python instrument |
| `critic_instr_out.txt` | `00d98fb6913da8f67404f38225b7c17a1a736f6ee4f228d29a997fc18b90e3b7` | 465 | its output |
| `carry_check.py`, `carry_check2.py` | `73a66f4c0c9c5c905949a7693d4c595929eef92edabead532b8bb144a1f43c92`, `eebf52e121813629c3846ec9bc53be48a5ee28b13c0d4c89d219849bb930bd2b` | 2604, 1019 | byte-carry audit |
| `LeanProject/LeanProof/Main.lean` (copy-out of U1) | `f3b21020433375b01e1bcdd89d8996dd2198ad2ac438557bda8774b73a57b180` | 131881 | replay input |
| `LeanProject/LeanProof/AxCheckFinal.lean` (copy-out of U1) | `43c146f5489d154211e0cc2d4982401d4ca53f459b9f521dc43c8b489f038b99` | 684 | U1's axiom driver |
| `C1LA1-Main.lean`, `C2LA1-Main.lean` (copy-out of the awards) | `86b59c6c…e0cb`, `a9cf3b81…7fc4` | 45610, 82413 | byte-compare inputs |
| `build_final.txt`, `build_full2.txt` (copy-out of U1 logs) | `ae6767b5…711e`, `60218bfa…f701` | 6679, 6680 | U1 build logs |

The project scaffold was copied from `scratchpad/c3-U1/LeanProject/` and is byte-identical to C1-LA1's. `.lake/packages` is
a manual symlink to the shared Mathlib packages. The `.olean` files for the critic modules were built into this project's
own `.lake/build`. No background job was started and none is running.
