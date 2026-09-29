# Critique

Critic `C-T3-U`, r31 Cycle 3 Stage 4. This critique covers the return of seat T3: route `C3-T-03`, mechanism token
`SECTOR-LITERAL-ARC-ACCOUNTING-FORMAL-READY`, orientation T. The critic's orientation is U (formal / structural).

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I made no other VerityOS read outside this run root. I wrote no
conversation log, because the controller owns logging for this run.

**Read-boundary disclosures.**
(1) I ran a process check (`ps aux | grep lean|lake`) to confirm that I had no Lean job left running. It also printed the command
lines of Lean builds and one shell command belonging to other critics' seats (scratch paths under `c3-crit-F1-T`, `c3-crit-U3-T`
and `c3-crit-U3-F`). I read no file of theirs and used nothing from those lines. Later process checks were limited to my own path
with `pgrep -f c3-crit-T3-U`.
(2) I listed the shared Mathlib project directory under `/Users/ashtonsperry/.local/share/verityos/lean/`, an allowed root, only to
bind `.lake/packages` by symlink.
(3) I read `sources/authority/CLAIM-IDENTITY.json` and `sources/mathlib-binding/PIN.json`. Both are under `sources/`, which is
authorized.
(4) I did not read `scratchpad/c3-T3-replay/`, which the return names. It is outside my grant; I replayed into my own scratch instead.

No `find`, `grep -r`, `rg` or recursive listing was rooted above a granted directory. There was no network access and no package
install.

## Identity and seal audit

- **Dispatch** `control/dispatch/c3-stage4/DISPATCH-C-T3-U.md`: SHA-256 `62faa158e7d12fd2a6dd477cb24b322f60dbf0f0e44b6c6229133334654b1d78`,
  which matches the value supplied at launch.
- **Capsule** `control/c3-critic-capsules/T3-PACKET-MANIFEST.json`: I recomputed the inner seal (canonical JSON without
  `seal_sha256`, `sort_keys`, separators `(",", ":")`, no trailing newline) as
  **`a88ded8444475e0b7da3bbe1ee376e42e285fe175b191208bd0fe08be3a878fb`**, which matches. All 14 members match on both SHA-256 and
  byte count.
- **Stage 2 seal** `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3`: matches. **Stage 3 seal**
  `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d`: matches. **Stage 4 dispatch seal**
  `cc9683b593e4bf84ab6164b5fe9abdd759e31c50937f74ab502258b3ec6c0c05`: matches.
- **Digests listed in the return.** All three match:
  - `sector_out_bridge.py`: `2f996ad1…9e63`
  - `OUT.json`: `90646e87…4b74964`
  - `digest-check.log`: `9991a3ba…a234`
- **The return's source-digest literals.** `digest-check.log` records `TOTAL CHECKED: 42 MISMATCH/MISSING: 0`. That is 2 files from
  c2 plus 40 from c1, which agrees with the return's "42 individual file checks". The return's later phrase "every one of these
  **41** checks" is a slip. It is corrected to 42.
- **The carried definitions I used.** I checked 13 C1-LA2 fragments (entries 19, 23–26, 33–37, 40, 75, 76) and 9 C1-LA1 fragments
  (entries 2–10) against `sources/c1-results/SOURCE-DIGESTS.json`. All match.
- **Registry.** The key the return cites (`E993-R31-CB-8-SECTOR-CERTIFICATE-…-FROM-107`, "VERIFIED") is not in the frozen authority
  registry `sources/authority/CLAIM-IDENTITY.json`, which has 491 entries and predates r31 keys. The return read it from
  `control/CLAIM-IDENTITY.run-local.json`, which is not in my capsule. I therefore cannot confirm the key's status from inside my
  boundary. This is recorded as unverified here, not as a defect.
- **Route ID and token.** Both are verbatim on the return's face. The return proposes no `E993-R31-` key. The critic proposes none
  either: an alias scan of the frozen registry for `NO-OTHER-SWITCH`, `SWITCH-VERTEX`, `SECTOR-SWITCH`, `LABEL-UNIQUE`, `IN-BRIDGE`
  and `OUT-BRIDGE` found no hits.

## Independent re-derivation

**My instrument.** `scratchpad/c3-crit-T3-U/critic_bridges.py` uses the standard library only and exact `Fraction` arithmetic. I
wrote it from the carried definitions, not from T3's script:

- **Graph.** Generated disjunct by disjunct from C1-LA2 entry 23 `cbEdge`, using the Lean labels (0 = `r`, 1 = `s`, 2 = `v`,
  `u_i` = 3+17i, `b_ij` = `u_i`+1+2j, `c_ij` = `u_i`+2+2j).
- **Relation.** `transportRel` taken literally from entry 19: deletions over every `q ∈ B`, and switches over every vertex `u ∉ B`,
  with no candidate pre-filter. Preimages are enumerated over all vertices: every `q ∉ A`, every `u ∈ A` and every 2-subset of
  `N(u)`.
- **`g_sec`.** Defined by set difference, not by an `(i, j, kind)` index:
  - If `A ⊂ B` with `B∖A = {q}`: `q = b_ij` gives `pb(state_i(B))`, `q = c_ij` gives `pc(state_i(B))`, anything else gives 0.
  - If `A∖B = {u}` in switch shape: `u = u_i` with `state_i(B).β = 1` gives `σ(state_i(B).γ)`, anything else gives 0.
  - `state_i` is always computed from the literal set.
- **Table fidelity.** `fidelity_tables.py` parses the Lean fragment text and confirms that the instrument's tables equal it
  (`Bpb` 36 cells, `Bpc` 36 cells, `CGamma`), after checking the digests.

**Results.** `CRITIC-OUT.json`, `all_pass: true`.

1. **Out bridge.**
   - *Statement:* `Σ_A g_sec(B,A) = Σ_i cb8Out(m, state_i(B))`, with the images pairwise distinct, independent, of size `p`, and
     numbering `K+3+#{β_i=1}`, and every switch vertex equal to `s` or a choke with `β_i = 1`.
   - *Class rows:* all 9 rows of gate ruling 17 (controls 107, 110, 113, 116, 119, 122; fresh rows 125, 128, 140). Each row used 5
     sector sources with legs at random positions, including profiles biased toward the states `(1,0)`, `(1,γ)` for γ=0..7,
     `(8,0)`, `(0,8)` and mixed. All 45 sources pass, and every sampled `Out ≥ 1`.
   - *Small cases, exhaustive:* **all 6,561 sector sources of `CB(8,1)` at every leg total**, and **all 2,025 ordered state pairs
     at `m = 2`**. Zero failures.
2. **In bridge.** This identity is absent from T3's DAG; I state it here as the critic's.
   - *Statement:* for an in-sector target `A` (with `r, v ∈ A`), the sum over **all** literal preimages
     `Σ_B g_sec(B,A) = Σ_i cb8In(m, state_i(A))`. Every preimage carrying a nonzero `g_sec` is a sector source.
   - *Checked on:* 3 targets per class row (27 in total), with every sampled `In ≤ 1`. It is also exhaustive over all 6,561 `m = 1`
     targets and all 2,025 `m = 2` state pairs. Zero failures.
   - *Instrument slip:* my first run showed 1,358 + 261 small-`m` failures. These came from a bug in my own instrument: it summed only
     positive `g_sec` values, while the template cells are negative off the class (for example, `pb(1,(1,2)) = −13/574` at `m = 1`).
     After I fixed it to sum every value, zero failures remain. This is recorded, not hidden.
3. **Switch-image inflow.** A switch image with state `(0,γ)` at `u_i` has exactly `8−γ` sector preimages, and its inflow is exactly
   `(8−γ)·σ(γ)`, for γ ∈ {0,1,4,7} at all 9 rows. At γ = 0 the inflow is 0, which is consistent with `cb8CGamma 0 = 0`.
4. **T3's number, reproduced independently.** Through my instrument, T3's check-C profile at `m = 107` (choke 0 in state `(1,7)`,
   70 chokes in `(0,8)`, one in `(0,3)`) gives **575 images** and **`Out = 1532715/1532386`**. That equals the return's value
   (`t3_profile_crosscheck.out`).
5. **Replay.** I ran T3's generator copy-out-first in `scratchpad/c3-crit-T3-U/replay/`. `REPLAY-OUT.json` is **byte-identical** to
   the shipped `OUT.json` (both `90646e87…4b74964`), and stderr was empty.

**Written re-derivation.**
- **Out bridge.** Every leg deletion at choke `i` carries `pb` or `pc` evaluated at the source's own state `(β_i, γ_i)`. There are
  `β_i` and `γ_i` of them. The only positive switch arc is at `u_i` with `β_i = 1`, carrying `σ(γ_i)`. Regrouping by choke gives
  exactly `cb8Out` (entry 9, including its `1 ≤ γ` guard, which agrees with `σ(0) = 0`). The identity is purely combinatorial: it
  does not depend on `|B|` or on `m ≥ 107`, as the `m = 1` and `m = 2` exhaustion shows.
- **In bridge.** The preimages of an in-sector `A` are of two kinds:
  - `A ∪ {b_ij}` and `A ∪ {c_ij}` over the `8−β_i−γ_i` empty legs. Their states at choke `i` are `(β_i+1, γ_i)` and `(β_i, γ_i+1)`,
    and their weights are `pb` and `pc` at those states. Summing gives `cb8In(β_i, γ_i)` (entry 10), including its `β+γ = 8 ↦ 0`
    branch.
  - The `u = r` switch preimages. These contain two chokes and no `r`, so they are non-sector and carry `g_sec = 0`.
  - No other `u ∈ A` admits a preimage: `N(v)`, `N(c_ij)` are singletons, and a `b_ij`-switch preimage would contain both `u_i`
    and `r`.

  I judge both identities mathematically complete: the Out bridge is `proved_informal`, inheriting from Lemma DF. The In-sum form is
  a critic-STATED `proved_informal` statement and needs an isolated second read before it enters any record.

## Attacks and findings

1. **The "no other switch exists" clause: attempted in Lean and closed (critic-derived advance).**
   - *Build:* `scratchpad/c3-crit-T3-U/LeanProject/CriticAdvance.lean` compiles with `lake env lean` against the pinned toolchain
     (v4.32.2, Mathlib `905b9581…`, `.lake/packages` bound by manual symlink). It is sorry-free: there is no `sorry`, `admit` or
     `native_decide` token. `#print axioms` reports `[propext, Classical.choice, Quot.sound]`, or a subset, for every new
     declaration. The 13 carried C1-LA2 fragments are included byte-identically, checked by substring.
   - *New declarations,* all in `E993Transport`:
     - `no_choke_of_root_mem`
     - `leg_partner`
     - `leg_neighborFinset_inter_card_le_one`
     - `sector_switch_vertex_classify`: if `B` is independent, `r, v ∈ B`, `u ∉ B` and `|N(u) ∩ B| = 2`, then `u.val = 1` or
       `u.val = 3+17i` for some `i < m`
     - `choke_neighborFinset_inter_card`: `|N(u_i) ∩ B| = 1 + #{j<8 : b_ij ∈ B}` when `r ∈ B`
     - `sector_switch_classify_full`: `u = s`, or `u = u_i` with exactly one `b`-leg
     - the generic `erase_label_unique`, `erase_ne_switch` and `switch_label_unique`
   - **Finding (strike):** the return says the clause is "the two-line `omega` argument … (`mem_neighborFinset_choke_iff` /
     `mem_neighborFinset_root_iff` already carry the needed neighbourhood facts)". That is inaccurate:
     - The carried lemmas describe `N(u_i)` and `N(r)`, not `N(b_ij)` or `N(c_ij)`.
     - `cbGraph_adj_choke_support` and `cbGraph_adj_support_leaf` give adjacency in one direction only. They do not give the
       characterization that every neighbour is one of the listed vertices.
     - The clause needs a new partner lemma: a 10-case unfolding of `cbEdge`, plus the fact that no choke lies in `B`.

     It is short (about 60 lines) but it is not "two lines over carried lemmas".
2. **Target distinctness is a generic graph fact, and the DAG edge `target_distinct → g_sec_def` is unnecessary.** For any `G`,
   the arc label of a `transportRel` pair is determined by the pair itself. The deleted `q` is unique, a deletion image is never a
   switch image, and the inserted `u` is unique (the three generic lemmas above, compiled). So `g_sec` can be defined by set
   difference as a total function of `(B, A)` with no case-injectivity argument. Injectivity is still needed to reindex
   `Σ_{A ∈ indepFamily p}` as a sum over `(i, j, kind)` (via `Finset.sum_image`), and it follows from those same three lemmas. The
   return's CB-specific case split (the five membership signatures) is correct, but more than is needed.
3. **The DAG is not "closed at statement granularity" (narrowing).**
   - (a) `g_sec_def` is pseudocode (`if leg-deletion at (i, kind=b) then …`), not a Lean term. `out_bridge_sum` is a mathematical
     display.
   - (b) `Σ_i cb8Out m (chokeState m B i)` does not typecheck as written: `cb8Out` takes `State8`, which needs the `β+γ ≤ 8` proof
     packaged in.
   - (c) Several nodes that conjunct 4 requires are missing:
     - *Images lie in `indepFamily p`:* independence, plus the cardinality of a switch image. This is required by clause 1 of
       `IsSaturatingFlow` and by the Out sum's index set.
     - *Leg-count node:* `Σ_i(β_i+γ_i) = |B| − 2`. It is needed to discharge C1-LA1's hypothesis `∑ i, … = (16m+1)/3`, and
       `(16m+1)/3 − 1` on the In side.
     - *Scaling node:* `f = g_sec / Out(B)` with `Out(B) ≥ 1`, because `IsSaturatingFlow` demands row sum = `activeWeight`
       exactly. The scaled In side stays `≤` unscaled only through C1-LA1's nonnegativity conjunct.
     - *The literal In-sum identity with `cb8In`:* `in_bridge_zero_classes` only classifies the zero classes.
     - *The switch-image inflow identity `(8−γ)σ(γ)`:* the return proves only the preimage count.

     Items (b) and (c) are re-derived and verified above.
4. **Check C's "two independent sides" is struck.** Side 1 reads each choke's state from the generating `layout` dict, not from the
   literal `B`. Both sides call the same `cb8Pb`, `cb8Pc` and `cb8Sigma` functions. So the check confirms only that the image
   enumeration has `β_i` b-deletions and `γ_i` c-deletions per choke. The value `1532715/1532386` stands, because my
   literal-state instrument reproduces it, but the independence claim does not.
5. **Check A's scope.** The image enumeration restricts switch candidates to `s` and the chokes, and complements that with a
   negative test over every leg vertex not in `B`. Together that covers every vertex (`r, v ∈ B`). The check is sound for its one
   `B`, but it is one profile at one row. My instrument enumerates every `u ∉ B` without a pre-filter and covers 45 sources plus
   the exhaustive small-`m` cases.
6. **Fresh rows (gate ruling 17).** The return tested only `m = 107` among the class rows. Its Remaining obligation item 4 names
   `m = 110, 113` (the charter's rows), not ruling 17's `125, 128, 140`. That reference is stale. The critic covered all 9 rows.
   The identities are combinatorial, so this is sanity evidence, not proof.
7. **Nothing found against the mathematics.**
   - The classification of images (`K` leg deletions, deletion of `r`, deletion of `v`, the `s`-switch, `u_i`-switches iff
     `β_i = 1`) is correct.
   - The preimage counts `8−γ` and `C(z,2)` are correct.
   - The zero-flow classes are correct: the `(1,0)` switch carries `σ(0) = 0`, the `s`-switch carries 0, and the `u = r` arcs are
     non-sector.
   - Every hypothesis enters where the return says it does. No ℕ-subtraction is introduced, although the leg-count node of 3(c)
     will meet `(16m+1)/3 − 1`, which is safe since `K ≥ 571`.
   - No Darroch/Newton step is used, no cut is produced, and no template failure occurs.

## Mechanism-equivalence and fence check

- **Fidelity (duty 2).**
  - Active-tag weight: sector sources and in-sector targets have weight 1 (only `v` is active, witnessed by `r`), and switch images
    at `u_i` have weight `γ`. Both follow directly from `activeWeight`/`tagWitnesses` (entries 15–16) with `F = leafSet`.
  - The relation is the literal `transportRel` (entry 19), used verbatim in my instrument.
  - `F_{p*}`, `x` and (WID) are not objects of this route. T3 computes no selector and no `x` row, and ruling 18's (WID) assertion
    does not arise. Nothing downstream is struck on fidelity grounds.
- **Mechanism.** The return is Lemma DF's registered sector argument (SR-C2-3) re-expressed in the C1-LA1/C1-LA2 vocabulary. It
  revives no refuted mechanism: not ruling 20's (G′), not the `m`-independent per-choke certificate, not the all-families
  compression, and not forest real-rootedness.
- **Fences (`SOLUTION-CONTRACT.md` §3).**
  - One rank and the class only: respected. The critic's identities are stated at every `m`, but they are graph-combinatorial
    facts, not Hall claims off the class.
  - No status transfers. (HALL) at full scope, the primary aggregate, TREE, FOREST, TRANSFER and #993 stay OPEN.
  - Census data is not used as proof: all sampled checks are labelled sanity only.
  - The `θ*` law is not used.
  - No sealed root was edited.

## Certification audit

| Literal on the return | Evidence | Ruling |
|---|---|---|
| "Out bridge … proved in scratch", equal at `1532715/1532386` | written regrouping argument; one profile; critic reproduction | **stands** as `proved_informal` (inherited); the number is reproduced |
| "Verified on two independent sides" (check C) | shared functions; state read from the profile | **struck**; replaced by the critic's literal-state check |
| "two-line `omega` … carried neighbourhood lemmas already carry the needed facts" | the carried lemmas cover only `N(u_i)` and `N(r)` | **struck**; the clause is now proved in critic scratch Lean |
| "U-B's informal DAG closed at statement granularity" / "Lean-ready" | `g_sec_def` is pseudocode; nodes missing (finding 3) | **narrowed** to "an informal DAG; Lean-syntax shapes for 2 of 12 nodes (`isSectorMember`, `chokeState`)" |
| "every one of these 41 checks" | the log says 42 | **corrected** to 42 |
| replay "byte-for-byte match" | critic replay byte-identical | **stands** |
| `all_pass: true`; check B counts at `m = 2, 3` | replayed | **stands** (bounded sanity) |
| route verdict `compiled` | no Lean was built | **misleading**: the deliverable is an informal DAG, a proof paragraph and bounded checks |
| gate lines all `not_advanced`; `cut_candidate: none` | consistent | **stand** |

## Verdict

verdict: retained_narrowed
headline_resolved: no
COND4_formal: not_advanced
E1_formal: not_advanced
TERMINAL_integration: not_advanced
cut_candidate: none

**What is retained.** The mathematics is correct. The Out bridge is retained at `proved_informal`, inherited from Lemma DF's scope
note. Its general regrouping argument is complete, and the critic's independent instrument confirms it: 45 literal sources at 9
class rows, plus exhaustive checks at `m = 1` (all 6,561 sources) and `m = 2` (all 2,025 state pairs). The image classification,
the `8−γ` and `C(z,2)` preimage counts, and the zero-flow classes are retained.

**What is narrowed.**
- The DAG is informal, not Lean-ready at statement granularity.
- Check C is a counting check, not two independent sides.
- The "two-line" claim for the no-other-switch clause is struck.

**Critic-derived advances,** attributed to `C-T3-U`. They carry no grade: compiled scratch has no grade until a governed award
closes.
- The no-other-switch clause and the full switch classification of `out_arc_classify`, compiled sorry-free in Lean.
- Generic uniqueness of arc labels, which makes target distinctness automatic and lets `g_sec` be defined by set difference.
- The In-sum identity `Σ_B g_sec(B,A) = Σ_i cb8In(state_i(A))`, stated, argued and checked. It is critic-STATED and needs an
  isolated second read.

The `COND4_formal` line stays `not_advanced`, because scratch Lean from a critic is not a formal advance of the gate line.

## Remaining obligation

For U1 or its Cycle 4 successor, in dependency order, carried byte-identically (ruling 19):

1. **Take the critic's lemmas as the switch clause.** Use `sector_switch_classify_full` and the three generic label lemmas as
   `out_arc_classify`'s switch clause. Then compile the deletion clause and the fact that images lie in `indepFamily p` (switch
   image card `= |B| − 1`).
2. **Define `g_sec` in Lean by set difference.** Then prove `Σ_{A ∈ indepFamily p} g_sec B A = Σ_i cb8Out m ⟨chokeState m B i, h⟩`
   using `Finset.sum_image`. The injectivity it needs comes from the label lemmas.
3. **The leg-count lemma.** Prove `Σ_i (β_i+γ_i) = |B| − 2` for sector sources and in-sector targets. This feeds C1-LA1's Out and
   In hypotheses.
4. **The In-sum identity** with `cb8In`, and the switch-image inflow `(8−γ)·σ(γ)`.
5. **Scaling.** Scale by `1/Out(B)`, using `Out ≥ 1` from C1-LA1 conjunct 2 and nonnegativity from conjunct 1. Then compose with
   E1 and the rational-to-integral step to reach conjunct 4.

Nothing here discharges conjunct 4 or the E1 flow. The critic's In-sum statement needs an isolated second read before
registration.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-T3-U/`.

**Instrument and outputs**

| File | SHA-256 |
|---|---|
| `critic_bridges.py` | `27b3e751a72e26dca5a0b8c5a9e1b21546852817ca7087ae5e1fadd7996f07e9` |
| `CRITIC-OUT.json` | `f11493e7d26ff516d5a4fe14ad7ef3bc5d63f461c1a427380043fb34fd774291` |
| `CRITIC-ERR.log` (progress lines only) | `625a960313331502d12e89410deefa072cd506659d3cb5eb86bd681ff71ae8ce` |
| `fidelity_tables.py` | `ec44fad381d6d100403399bf0ebbe76307e11780e3809e746a905b387fc9093d` |
| `fidelity_tables.out` | `1b0b3e5f6db9100fc524df9f84d690320f655ba199be3393c66c63c93fbae5e0` |
| `t3_profile_crosscheck.py` | `371862a68de7d1c3b35423e29a474d5898b78d42a0d26dba020383598376ee5a` |
| `t3_profile_crosscheck.out` | `9ed7c3329c2b907b65ce442910a095dd3a2b7e214d5754d00cf158a7bf0856f3` |

**T3 replay** (copied out from `scratchpad/c3-T3/`, run with `python3 -B`)

| File | SHA-256 |
|---|---|
| `replay/sector_out_bridge.py` | `2f996ad1…9e63` |
| `replay/REPLAY-OUT.json` | `90646e87cf8fec24d293ab461c2090735fb0d3cff552553be1298f07b74b4964`, identical to `replay/OUT.json` |
| `replay/REPLAY-ERR.log` | empty |
| `replay/digest-check.log` | `9991a3ba…a234` |

**Lean project**

| File | SHA-256 |
|---|---|
| `LeanProject/CriticAdvance.lean` (18,104 bytes) | `1f3f365df60727f8229e121ae191b14530477518d65e26ac15441a05f48cf6e0` |
| `LeanProject/critic-section.lean` | `c0d1794fdc3698ce23cdd0cc82b3f261e800f7514b0f9c8162fa2e6aafb31e75` |
| `LeanProject/build.log` (axioms output; no errors or warnings) | `b4ea99a17f1eb5c4f91e9ca39a362283d8e04d7a360a94f40b72f8c51634de9d` |
| `LeanProject/CARRY-MANIFEST.txt` (13 carried fragment digests, each matched against `sources/c1-results/SOURCE-DIGESTS.json`) | `6da2bd96a37fe679cd6a01ff4d8ab74e07c854767f22fb1c94c28a6029e722be` |

- `LeanProject/Carried/` holds the 13 fragments, copied byte-identically.
- `lakefile.toml`, `lake-manifest.json` and `lean-toolchain` were copied from C1-LA2.
- `.lake/packages` is a symlink to the shared `mathlib-v4.32.2-project`. No `lake update` or `lake clean` was run.

**Jobs.** Every command ran in the foreground, and I started no background job. `pgrep -f c3-crit-T3-U` shows no remaining process,
so I killed nothing.
