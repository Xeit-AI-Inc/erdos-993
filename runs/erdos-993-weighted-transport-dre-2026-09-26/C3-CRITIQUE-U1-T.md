# Critique

Critic `C-U1-T` (Cycle 3, orientation T, prove), assigned to seat `U1`, route `C3-U-01 LEAN-INV-QUOTIENT-NM-AND-LEMMA-U` (orientation U).
Run r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`), Erdős #993. Date 2026-09-26.

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` (in full; the tool display truncated it, so I read the middle in two further ranges) and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I loaded no other VerityOS subsystem. The harness put the project `CLAUDE.md` and the user auto-memory index into context at session start. I did not open either as a source, and nothing below relies on them.

**Model disclosure (two-part):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: `claude-opus-5-5[1m]` (verbatim from this session's environment declaration).

## Identity and seal audit

- **Dispatch.** `control/dispatch/c3-stage4/DISPATCH-C-U1-T.md`: SHA-256 recomputed before reading = `2c4e9e800289030df25d0a2caf4014743e2c0f2ec5e8ed91088ad4272bd3db64`, matching the wrapper.
- **Capsule seal.** `control/c3-critic-capsules/U1-PACKET-MANIFEST.json`: I recomputed the SHA-256 of the canonical JSON without `seal_sha256` (sort_keys, `(",", ":")`, no trailing newline). It is **`fc3cec30441d9951b33de29c7164c9994e87826f14ef6325127c60050d1652fc`**, equal to the embedded seal and the dispatch value. All 14 members match on both SHA-256 and byte count.
- **Stage seals, recomputed canonically:**
  - Stage 2 `control/C3-STAGE2-PACKET-MANIFEST.json` = `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416`: matches the protocol, the common brief and the embedded seal.
  - Stage 3 `control/C3-STAGE3-PACKET-MANIFEST.json` = `64c6c84aabe2392394f680abb3c8862a349f06a4f8043a9960b706f35b294797`: matches the embedded seal. Its row for `cycles/cycle-3/stage3/returns/U1/RETURN.md` (`d206b783…`) matches the file.
  - Stage 4 `control/C3-STAGE4-DISPATCH-MANIFEST.json` = `b57e5de137627d8526c12e5f54a2011683c1ba010f98450a8adace5f4e7ca3c7`: matches the embedded seal.
- **Digests the return lists:**
  - `sources/mathlib-binding/PIN.json` = `af78b3d8…ba0`: matches `SOURCE-DIGESTS.json` and the Stage 2 manifest.
  - Pinned Mathlib rev `905b95818eb32af7874a58b427f50c1711a5e96c`: the seat's `lakefile.toml` and `lake-manifest.json` carry the same string.
  - Seat `Main.lean` = `f3b21020433375b01e1bcdd89d8996dd2198ad2ac438557bda8774b73a57b180`, 2851 lines: matches.
- **Award texts, checked without opening `runs/`.** `runs/` is outside my capsule and is not a Stage 2 member, so I did not read either award file. I checked the carries by hash instead (`scratchpad/c3-crit-U1-T/carry_check.py`).
  - **C1-LA1.** The first 45,610 bytes (1,030 lines) of U1's `Main.lean` hash to `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb`. That is the full digest U1 quotes, and it starts with the allocation's independent prefix `86b59c6c`. So the C1-LA1 carry is **byte-identical**.
  - **C2-LA1.** I rebuilt a file from four pieces, in order:
    1. U1's entries 1–21 plus one blank line;
    2. U1's C2 entries 22–30;
    3. C1-LA1's entry-24 block (`isGraphLeaf_of_mem_favorableLeaves`) with only the marker changed from `ENTRY 24` to `ENTRY 31`;
    4. U1's C2 entries 32–77, followed by `\n\n`.

    The result hashes to exactly `a9cf3b815832b6fa25e43e07e628db4ce01a7a496b084cac0cd3768e877c7fc4`, which carries the allocation's prefix `a9cf3b81`. This proves three things:
    - C2-LA1's entry 31 **is** C1-LA1's entry 24 carried again. The comment header and declaration text are identical; only the registrar marker number differs.
    - U1's C2 block equals the award text with exactly that block removed, so the repair changes no statement.
    - C2-LA1 did **not** re-carry "the whole C1-LA1 base". It carries C1's entries 1–21, plus C1's entry 24 as its entry 31. C1's WID chain (C1 entries 22–23 and 25–36) is absent from it. U1's merged file is therefore the union of the two awards, not a concatenation. U1's wording ("re-carried the whole C1-LA1 base as its own entries 1–21/24/31") is inexact but harmless.
- **Read-boundary disclosures (this critic):**
  1. One `grep -n '^#'` over `control/C3-CRITIC-ATTACK-BRIEFS.md` (a capsule member) to find my section. I then read lines 1–12 (the common preamble) and my section, lines 63–84, only.
  2. Non-recursive `ls` of `scratchpad/c3-U1/`, `…/LeanProject`, `…/LeanProject/LeanProof` and `…/LeanProject/.lake`. These are inside my replay grant.
  3. I read the Mathlib source `Mathlib/Combinatorics/Enumerative/DoubleCounting.lean` (two line ranges plus one single-file `grep`) for the meaning of the `Finset.card_mul_le_card_mul` API. The protocol authorizes this.
  4. One non-recursive `ls` of my own deliverable's parent `cycles/cycle-3/stage4/critics/U1/`. It showed only the sibling directory name `F`, which I did not open.
  5. I did not read `C3-WORKER-COMMON-BRIEF.md`, because the dispatch limits reads to the capsule list. The dispatch restates the binding rules.

  No `find`/`rg`/`ls -R`/glob `cat`; no network; no installs; no `lake update`/`lake clean`; nothing written outside my scratch and this file.
- **Process.** U1's disclosed items are confirmed as disclosed: PIN.json was read before its digest check but the digest is clean, and two `ls` ran on `runs/` and `second-reads/`. Two further points on the replay:
  - U1's replay directory `scratchpad/c3-U1-replay/` and the `AxCheck.lean` it names are outside my grant, so they are unverified by me. The inventoried directory `scratchpad/c3-U1/` ships `AxCheckFinal.lean` instead.
  - My independent rebuild reproduces the same result (below), so this inventory mismatch strikes nothing of substance.

## Independent re-derivation

I built my own instruments. U1's scripts were not my sole evidence; U1 shipped none beyond the Lean text and two build logs.

1. **Rebuild, copy-out-first.** I copied `lakefile.toml`, `lake-manifest.json`, `lean-toolchain`, `LeanProof.lean`, `LeanProof/Main.lean` and `LeanProof/AxCheckFinal.lean` into `scratchpad/c3-crit-U1-T/LeanProject/`, then bound `.lake/packages` by **manual symlink** to the shared project, as U1 did. I `cd`'d into the project and ran `lake build LeanProof` from an empty `.lake/build` (background PID 82777; it exited on its own and was confirmed gone before this write).
   - Result: `Build completed successfully (8657 jobs)`.
   - Zero errors. There are 19 warnings (linters: unused section variables, unused names, deprecated `push_neg`), identical line-for-line to U1's `build_final.txt`.
   - None is a `sorry` warning. A single-file `grep` finds no `sorry`, `admit`, `native_decide`, `axiom` declaration or `decide`.
2. **`#print axioms`.** From my own file `LeanProof/CritAx.lean`, all ten declarations U1 lists print exactly `[propext, Classical.choice, Quot.sound]`. They are the three inherited `activeWeightAggregateIdentity`, `weightedHall_iff_invariant` and `exists_aut_invariant_deficient_of_not_weightedHall`, plus the seven new ones. See `axioms_crit.txt`.
3. **Statement reading against SOLUTION-CONTRACT §2.** `indepFamily`, `activeWeight`, `favorableLeaves`, `transportRel` and `WeightedHall` are the C1-LA1 byte-carry (entries 14–21), verified by hash above.
   - `activeWeight` filters `F ∩ B` by `¬ Disjoint (B.erase v) (tagWitnesses G v)`: active tags only.
   - `transportRel` is literally (D) ∪ (S), with `u ∉ B`, `|N(u) ∩ B| = 2`, and `A = insert u (B \ N(u))`.
   - `favorableLeaves` is fixed at rank `p`.
   - U1 adds no definition that widens or narrows these. `orbitOf` is a filter of the layer by "is the image of `B` under some automorphism". It is empty when `B` is outside the layer, which is harmless.
4. **Lemma U, independent instrument** (`lemmaU_check.py`, standard library, `python3 -B`). The left side is the literal relation: every (D) image and every (S) image of every source `B ∈ I_{p+1}`, computed from `B` itself. The right side is my own phrasing: "not maximal, or some `u ∈ A` has two non-adjacent neighbours `y ≠ z` whose only neighbour in `A` is `u`".
   - Exhaustive over every labelled simple graph on `n ≤ 6` vertices, every rank `p` and every independent `p`-set `A`: 578,153 target checks.
   - Plus 6,000 random graphs on `n = 7, 8`: **827,972 checks in total, 0 mismatches.**
   - Grade: `bounded_computation`. It corroborates that U1's Lean statement means what the brief says. The Lean kernel proof is the proof.
5. **NM degree facts, independent instrument** (`nm_poset_check.py`). On `{none, b, c}^N` for `N ≤ 7` and every `k`:
   - every rank-`k` state has exactly `k` one-deletion successors;
   - every rank-`(k−1)` state has exactly `2(N−k+1)` one-insertion predecessors;
   - `|L_{k−1}|/|L_k| = k/(2(N−k+1))` holds in all 28 cases.

   This reproduces the `CB(8, 92)` sector fixed point by exact arithmetic: with `N = 736` and `|R_j| = 2^j·C(736, j)`, I get `|R_491|/|R_490| = 492/491`, and the degree ratio at `k = 491` is `491/492 = |R_490|/|R_491|`.
6. **Fixed points.** U1's route evaluates no tree, so the `K_{1,12}`, path-star, `CB(8,92)` and `T_m` rows are not reached as instances. The only one the mechanism touches is the `CB(8,92)` sector layer ratio, reproduced in item 5. (WID) and the `supply − capacity = S` assertion enter only through the carried C1-LA1 theorem, whose axioms I re-printed.

## Attacks and findings

**A1 — Lemma U (`exists_transportRel_iff`): holds as stated.**
- The statement has both clauses exactly:
  - "not maximal" is `∃ q ∉ A, IsIndepSet (insert q A)`;
  - the private-pair clause is `∃ u ∈ A, ∃ y z, y ≠ z ∧ ¬G.Adj y z ∧ N(y) ∩ A = {u} ∧ N(z) ∩ A = {u}`. Here `N(y) ∩ A = {u}` encodes both "`y` is a neighbour of `u`" and "`u` is `y`'s only neighbour in `A`".
- It has no `IsTree`, eligibility or `x` hypothesis, as required, and `transportRel` is the frozen relation.
- The proof's (S) construction is sound: `B = insert y (insert z (A.erase u))`, with `u ∉ B` by irreflexivity and `|N(u) ∩ B| = 2` because `A` is independent. I found no hypothesis that encodes the conclusion.
- I cannot check U1's alias claim that this is "SR-C2-4's Lemma U, identical to P10". The second reads are outside my read boundary. The statement's content agrees with the brief's description of P10/Lemma U.

**A2 — The orbit lemmas: hold. U1's gap statement for (INV) is NOT exact.**
- U1 says the capacity-side analogue of `supply_orbitOf` is "harder" because "a single orbit's `covered` set can meet several distinct target orbits". That is not an obstacle:
  - By definition, `cov G F p X = supply G F (covered G p X)`. I checked this by `rfl` in `CritAx.lean`.
  - `covered_orbitUnion` (U1's own lemma) makes `covered G p X` an orbit union whenever `X` is invariant.
  - So the capacity side is the same "orbit-union total = sum of orbit totals" identity at layer `p`, which `supply_orbitOf` already handles for any layer `j`.
- That a source orbit's covered set meets several target orbits is exactly what the quotient's arc relation ("some arc joins the orbits") records. It is not a missing lemma.
- The genuinely missing pieces were the partition property and the disjoint-sum step. I built both (A6).
- Minor: `hXsub` is unused in `orbitOf_subset_of_mem_invariant` and `covered_orbitUnion` (linter warnings at lines 2734 and 2763). The hypotheses are harmless and the statements are not affected.
- `supply_orbitOf` is stated only for `F = favorableLeaves G p`, which is correct: `F_p` is `Aut`-invariant unconditionally.

**A3 — `regular_bipartite_shadow_bound`: holds, but "greater generality" and "new" are overstated.**
- The hypotheses are exact degree **equalities**, over the **whole** types `α` and `β`: `htop : ∀ a, #{b | R a b} = dtop` and `hbot : ∀ b, #{a | R a b} = dbot`.
- It is a special case of Mathlib's existing double-counting lemma `Finset.card_mul_le_card_mul`, which needs only a lower bound on up-degrees and an upper bound on down-degrees, and only on the chosen finsets. I derived U1's statement from it in about ten lines (the `example` in `CritNM.lean`).
- So the lemma is a restatement of pinned-Mathlib content. It is not a generalization of NM's core, and it is certainly not new mathematics.
- Because the equalities range over whole types, applying it to the sector needs `α` and `β` to be rank-level **subtypes**. With them, the exact degree facts still missing from U1's route are:
  - down-degree `= k` for every rank-`k` state;
  - up-degree `= 2(N − k + 1)` for every rank-`(k−1)` state.

  Plus the unstated fact that the relation preserves rank (every `f` with `g = update f i none`, `f i ≠ none`, has `rk f = rk g + 1`).
- With those facts it gives T1's Lemma 1 in degree form, `k·|X| ≤ 2(N−k+1)·|∂X|`, which is the normalized-matching inequality `|X|/|L_k| ≤ |∂X|/|L_{k−1}|` by the layer identity. I proved the degree facts myself (A6). Using the Mathlib lemma directly removes the subtype requirement.

**A4 — Quantifiers, directions, ℕ subtraction.**
- Lemma U's `p` is arbitrary, including `p = 0`. The ℕ `p − 1` in the (S) branch is guarded: U1 derives `1 ≤ p` from `u ∈ A`.
- The double count's direction is correct: top rank has down-degree `k`, so `dtop·|X| ≤ dbot·|∂X|`.
- There is no circularity: nothing assumes `S ≤ 0` or (HALL).

**A5 — Grades held.** U1 grades every new declaration `compiled` and requests no key. I confirm this line holds throughout the return's grade table and prose. The draft-contract lines `grade_if_awarded: formally_verified` are hypothetical and belong to the controller. A few phrases overstate: "fully discharged … no remaining gap", "`proved` … item (iii) alone would merit it", and "genuine, verifiable progress". The only admissible reading of these is: kernel-checked in scratch, no grade (ruling 23; R29-N-12).

**A6 — Critic-derived advances (attributed to C-U1-T, Claude Opus 5.5; scratch, compiled, no grade).**

(i) (INV), the quotient clause, in Lean (`scratchpad/c3-crit-U1-T/LeanProject/LeanProof/CritAdv.lean`, SHA-256 `8de15f02130b44f5fe5d9d906221f24f485d38e91f99a1bb51270cb5f73bb59b`). The file adds the following on the frozen definitions plus C2-LA1's carried apparatus plus U1's `orbitOf`:
- `crit_orbitOf_eq_of_mem`: orbits are equivalence classes.
- `crit_orbits_pairwiseDisjoint`.
- `crit_biUnion_orbits`: an orbit-closed family is the disjoint union of its orbits.
- `crit_supply_eq_sum_orbits`: the class-union identity, for either layer.
- `crit_supply_orbit_eq_card_mul`: each orbit total is `|O|·w(B)` for any member `B`.
- The main theorem:

```lean
theorem crit_weightedHall_iff_orbitQuotientHall (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) :
    WeightedHall G (favorableLeaves G p) p ↔
      ∀ 𝒮 ⊆ (indepFamily G (p + 1)).image (orbitOf G (p + 1)),
        ∑ O ∈ 𝒮, supply G (favorableLeaves G p) O ≤
          ∑ O' ∈ ((indepFamily G p).image (orbitOf G p)).filter
              (fun O' => ∃ O ∈ 𝒮, ∃ B ∈ O, ∃ A ∈ O', transportRel G B A),
            supply G (favorableLeaves G p) O'
```

It compiles with axioms `[propext, Classical.choice, Quot.sound]` and no `sorry` (`critadv_out.txt`).
- It is WeightedHall ⇔ Hall on the `Aut(G)`-orbit quotient: orbit-total supplies and capacities, with an orbit arc iff some arc joins the two orbits. It needs no flows, no representatives beyond the orbits themselves, and no `Fintype (G ≃g G)`. I confirmed U1's claim that this instance does not synthesize at the pin (`CritInst.lean` fails as U1 says).
- Its contrapositive also shows that any quotient deficit `𝒮` yields the explicit invariant original deficient family `𝒮.biUnion id`. That is the Hall-level converse that ruling 25 requires before a quotient deficit may be cited.
- Scope: `Γ = Aut(G)`, `F = F_p(G)`, any finite simple graph.
- Limit: I could not compare it against the **registered text** of `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`, because the registry is outside my capsule. It is the allocation's item (i) in the form the allocation words it. It is a special case, at the Hall level, of the class-union Hall of `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT` (the orbit partition is equitable).

(ii) NM's missing degree facts in Lean (`CritNM.lean`, SHA-256 `19883e92e6a5c4b89442e57cbe2f93560580bee4138bbb5c7c9288f5226ca694`, namespace `E993TransportCrit`), on the abstract three-state poset `Fin N → Option Bool` with `Rdel f g := ∃ i, f i ≠ none ∧ g = update f i none`:
- `down_card`: `#{g | Rdel f g} = rk f`.
- `up_card`: `#{f | Rdel f g} = 2·(N − rk g)`.
- `rk_of_Rdel`: `rk g + 1 = rk f`.
- `shadow_degree_bound`: `|X|·k ≤ |∂X|·2(N+1−k)` for every family `X` of rank-`k` states. It is obtained from Mathlib's `Finset.card_mul_le_card_mul`.

All four compile with the three permitted axioms only (`critnm_out.txt`). This closes U1's "smallest concrete open lemma" (its Remaining obligation 3) and the poset half of its obligation 2.

## Mechanism-equivalence and fence check

None of U1's declarations is a Hall-sufficiency mechanism, so none can alias the ten refuted keys of `SOLUTION-CONTRACT.md` §3.2:
- Lemma U characterizes reachability of targets. It is not a Hall, SDR, tag-closed-cut or Delete/Retag claim.
- The orbit lemmas are bookkeeping for an existing Hall condition.
- The double count is generic.

The same holds for my advances:
- The quotient theorem is an equivalence of Hall conditions. It supplies **no** quotient feasibility, so it does not treat (LIFT) as feasibility.
- The poset bound is NM's normalized-matching content. It is not deletion-only Hall (`E993-R23-LITERAL-DELETE-ONLY-HALL`). At `CB(8,92)` the bound gives `|∂X| ≥ (491/492)|X|`, which is exactly the known deletion shortfall. So it feeds the switch-share accounting and does not replace it.

Other fences:
- No closed region or settled family is re-proved.
- No census value enters a proof.
- No RTree wording is used.
- No live root was read. I opened neither `runs/` nor `second-reads/`.
- `D, C ≥ 0` is not used.
- Registry keys touched, by alias only: (WID), `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY` (carried), (INV), (NM), and `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT` (context).

No new `E993-R30-…` key is warranted:
- U1's items are aliases, or components of (INV) and (NM).
- My quotient theorem is the Lean form of (INV)'s quotient clause at `Γ = Aut(G)`, pending a text diff against the registered statement.
- My poset lemmas are the poset part of (NM).

(HALL) and the primary aggregate keep their master names and are untouched.

## Certification audit

| Literal (return) | Backing | Ruling |
|---|---|---|
| "`#print axioms` … all nine load-bearing declarations (the three inherited plus the six new)" | ten lines printed; seven new declarations | **STRUCK** as a count. Replace with "ten (three inherited, seven new)". The axiom content is backed (my `axioms_crit.txt`). |
| "Build completed successfully (8657 jobs)" | my independent rebuild; U1's `build_final.txt` | backed |
| `Main.lean` SHA-256 `f3b21020…`, 2851 lines | recomputed | backed |
| C1-LA1 `86b59c6c…` byte-identical carry | prefix hash (45,610 bytes) | backed |
| C2-LA1 `a9cf3b81…` carry with the one duplicate removed | reconstruction hash | backed. The description "re-carried the whole C1-LA1 base as its own entries 1–21/24/31" is **narrowed**: C2-LA1 carries C1 entries 1–21 and entry 24 (as 31) only. |
| "no `sorry`, `admit`, `native_decide`, extra `axiom`" | my `grep` plus build log plus axioms | backed |
| "verified" (PIN digest, seals) | recomputed | backed |
| replay in `scratchpad/c3-U1-replay/` with `AxCheck.lean` | outside my grant; not in the inventoried directory | **unverified by me**. It is superseded by my own replay, which reproduces the result. |
| "No `Fintype (G ≃g G)` instance … (checked directly)" | `CritInst.lean` fails to synthesize | backed |
| `regular_bipartite_shadow_bound` "strictly more general than T1's Lemma 1 … cleaner level of generality" | it is an instance of Mathlib's `Finset.card_mul_le_card_mul` | **narrowed**: a restatement of pinned-Mathlib double counting. It is correct, not more general than the Mathlib lemma, and not new. |
| Remaining obligation (i)(c) "capacity-side analogue (harder …)" | `cov = supply ∘ covered` by `rfl`, plus `covered_orbitUnion` | **STRUCK** as a description of difficulty (A2) |
| "item (iii) is fully discharged" | kernel-checked Lemma U | backed as `compiled`, with no grade |
| alias to SR-C2-4 / P10 / SR-11 | not readable by me | recorded as U1's claim, unverified here |

## Verdict

verdict: retained_narrowed
headline_resolved: no

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

All ten declarations U1 lists compile with the three permitted axioms, and I found no statement infidelity. Lemma U is exactly the brief's statement on every finite simple graph. The C1-LA1 carry is byte-identical, and the C2-LA1 carry is byte-identical except for the one justified removal. Both are proved by hash without opening `runs/`. Everything stays at `compiled`, with no grade.

The narrowing covers three points:
- The axiom-table count ("nine … six new" should read ten / seven).
- The generality claim for `regular_bipartite_shadow_bound` (a special case of `Finset.card_mul_le_card_mul`).
- The (INV) gap statement, whose "harder capacity side" does not exist.

Critic-derived (C-U1-T), `compiled` in scratch:
- the full orbit-quotient Hall equivalence for `Aut(G)`;
- the NM poset degree facts with the degree-form shadow bound.

The quotient equivalence, the partition lemma and the class-union identity are elementary, and I believe their mathematics is complete. The informal grade would be `proved_informal`, but that needs an isolated second read, because they are first stated at a review stage. A formal grade needs a governed award.

## Remaining obligation

1. **(INV) quotient clause, formal.** Diff `crit_weightedHall_iff_orbitQuotientHall`, or U1's lemmas plus it, against the registered text of `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`. The critic did not have that text. If the registered statement uses an arbitrary subgroup `Γ ≤ Aut(G)` or explicit representatives, the proof must be re-stated at that scope. The partition and sum lemmas go through unchanged for any subgroup closed under inverse and composition. Then take the governed award through the registrar from C1-LA1 byte-identically, with C2-LA1's entries receipt-bound. That requires removing the duplicate entry 31, exactly as U1 did and as I confirmed. It also needs an isolated second read of the critic-stated equivalence.
2. **(NM) sector application, formal.** On a literal `CB(d,m)` (or `CBstar`) `SimpleGraph`, prove two things, then compose with `shadow_degree_bound`:
   - a bijection between the root-plus-arm sector members of `I_j(T)` (`r, v ∈ B`, no choke) and rank-`(j−2)` states of `Fin (d·m) → Option Bool`;
   - that in-sector deletion arcs of (D) are exactly `Rdel` under this bijection, and every sector member and in-sector target has active weight one.

   The layer identity `k·|L_k| = 2(N−k+1)·|L_{k−1}|` (by `Finset.card_mul_eq_card_mul` with the two degree lemmas) converts the degree form to the normalized form. U1's `regular_bipartite_shadow_bound` is not needed; the Mathlib lemma suffices.
3. **Nothing here bears on (HALL) itself.** The open object is unchanged: the coupled families at the three `CB(8,·)` rows. The quotient equivalence makes a class-union cut search over orbit sets formally sound. It does not make it feasible, since the orbit spaces are about `3·10^37`.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-crit-U1-T/`.

**Scripts** (replay with `python3 -B`, standard library only):

| file | SHA-256 | output |
|---|---|---|
| `carry_check.py` | `8b30fd545213f8dce3e4f59901bb6b9e42037b5815348bce3c3963b5395c10dc` | `carry_check.json` (`d6406359386aebd8aa4f2f88424191b22452333fdf2848cc546f830b8c14c4e0`) |
| `lemmaU_check.py` | `df2a600d49dcced58c7508d7315dcbed73cd3b52a8eeab3c694668f0fc93b315` | `lemmaU_check.json` (`783194c8b8ed149322f2fb78e0b4c8640a78b1083b50fe8f77d163d5f1b4b47b`) |
| `nm_poset_check.py` | `b1a6635d9547bd6207522fe9ea925aad058b3b866418f814fbf2d9d928aabfa4` | `nm_poset_check.json` (`a5651182aaedc957edb457d70a5a8587fd4bd7791265615986cd0d68e26a6ccb`) |

**Lean project** `LeanProject/`: copied from `scratchpad/c3-U1/LeanProject/`, with `.lake/packages` a manual symlink to the shared pinned project. `lake`/`lean` were run only after `cd` into it.

| file | SHA-256 | notes |
|---|---|---|
| `Main.lean` | `f3b21020433375b01e1bcdd89d8996dd2198ad2ac438557bda8774b73a57b180` | U1's, unmodified |
| `AxCheckFinal.lean` | — | U1's |
| `CritAx.lean` | `c6bd7e7cc9c367f327f9facf684350fbae5c8cb29cf205295d9d201b4fc8f8fb` | |
| `CritAdv.lean` | `8de15f02130b44f5fe5d9d906221f24f485d38e91f99a1bb51270cb5f73bb59b` | |
| `CritNM.lean` | `19883e92e6a5c4b89442e57cbe2f93560580bee4138bbb5c7c9288f5226ca694` | |
| `CritInst.lean` | `2d62caa180d11bb8fd74a3c27c250c468c71cb0647eb6b9fed03af82aa40bf11` | expected failure |

**Logs:**

| file | SHA-256 | content |
|---|---|---|
| `build_crit.txt` | `e3750ca27fd26749b252944dab06fd385d9d5b81c9493c993780b0e1eb4602ab` | my build |
| `axioms_crit.txt` | `754ef0996d7d0bf822aa5e8108beb00eb2c68afe47561bd22eada240872373eb` | |
| `critadv_out.txt` | `101be1bd7b251a92583643bb7c1e17c1a1b98e42a14c03c203db6fae7257d9cb` | |
| `critnm_out.txt` | `bed2900730c5cbd758923bd40b80516e4a278b992bafbe3e10e2b4dff9bc4bf5` | |
| `build_final.txt`, `build_full2.txt` | — | copies of U1's logs |

Background jobs: one, the `lake build` with PID 82777. It completed on its own and was confirmed not running (`ps -p 82777`) before this write. No job remains.
