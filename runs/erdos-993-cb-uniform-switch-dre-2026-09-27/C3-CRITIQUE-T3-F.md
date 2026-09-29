# Critique

Critic `C-T3-F` (orientation F, falsify) of seat T3's return, route `C3-T-03`, mechanism `SECTOR-LITERAL-ARC-ACCOUNTING-FORMAL-READY`
(orientation T), r31 Cycle 3 Stage 4.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I loaded no other VerityOS subsystem, wrote no conversation log, and
touched no memory, decision, log or operations file.

**Read-boundary disclosures.** (1) The host injected the project `CLAUDE.md`, the user auto-memory index and the user's e-mail
into my context before my first tool call. I did not open or use any of them. (2) The return was more than 32 KB, so the harness
saved the tool output to its own cache file (`~/.claude/projects/…/tool-results/b3wu17d1n.txt`), and I read the return through
that byte copy. (3) Beyond the capsule's 14 files, I read only material authorized by the dispatch and the common brief:
`control/C3-WORKER-COMMON-BRIEF.md` (a Stage 2 member, which the critic common brief names), and frozen `sources/` files. Those
were the C1-LA1 and C1-LA2 `Snippets/` and C1-LA2 `LeanProject/` (`Main.lean`, `lakefile.toml`, manifest, toolchain),
`sources/mathlib-binding/PIN.json`, `sources/c{1,2}-results/SOURCE-DIGESTS.json`, and the Cycle 2 close registry snapshot
`sources/c2-results/control/snapshots/CLAIM-IDENTITY.run-local.c2-close.json`, read only to check the status of one key.
(4) I ran non-recursive `ls` only on `sources/c1-results/runs/`, one `Snippets/` directory, and the shared Mathlib project
directory and its `.lake/packages`. I ran one `git rev-parse HEAD` inside the Mathlib package to check the pin. I ran no `find`,
recursive `grep`/`rg`, `ls -R` or glob `cat` rooted above my grant. I read no sibling return, critique, adjudication, other
experiment root or network resource. (5) I started no background job and killed nothing.

## Identity and seal audit

- Dispatch `control/dispatch/c3-stage4/DISPATCH-C-T3-F.md`: SHA-256 recomputed `255a0292…c7966`. It **matches** the value I was given.
- **Capsule seal** `control/c3-critic-capsules/T3-PACKET-MANIFEST.json`: I recomputed the canonical JSON without `seal_sha256`
  (sort_keys, `(",", ":")`, no trailing newline) and got `a88ded8444475e0b7da3bbe1ee376e42e285fe175b191208bd0fe08be3a878fb`. It
  **matches**. All 14 listed files match in both bytes and SHA-256.
- Stage 4 dispatch manifest seal: `cc9683b593e4bf84ab6164b5fe9abdd759e31c50937f74ab502258b3ec6c0c05`, recomputed, **matches**.
  Stage 3 packet seal: `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d`, recomputed, **matches**. Its T3 entry
  (`RETURN.md`, 33340 bytes, `5f610f62…a33fe`) equals the capsule entry. Stage 2 seal:
  `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3`, recomputed, **matches**.
- Digests the return lists:
  - Every C1-LA1 and C1-LA2 `Snippets/` file recorded in `sources/c1-results/SOURCE-DIGESTS.json`: I checked 111 files and found
    0 mismatches. This covers all 40 of T3's cited fragments.
  - `SR-C2-3/SECOND-READ.md` (`11aa25fb…`) and the Cycle 2 `SYNTHESIS.md` (`260c8195…`): both match.
  - Generator `2f996ad1…09e63` and output `90646e87…74b4964`: both match. My copy-out-first replay reproduced `OUT.json` byte for
    byte.
  - `digest-check.log` `9991a3ba…`: matches.
  - Literal defect: the return says "42 individual file checks (2 … 40 …)" and then "every one of these 41 checks". The count is
    inconsistent (cosmetic).
- Registry claim touched: `E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107`.
  In the Cycle 2 close snapshot it has status `VERIFIED` and evidence grade `proved_informal`, as the return states. The return
  proposes no `E993-R31-` key, and this critique proposes none.
- Label fidelity: T3's `chokeState` indices are `b_ij = 3+17i+1+2j` and `c_ij = 3+17i+2+2j`. These agree with the frozen C1-LA2
  `cbEdge` (entry 23). T3's entry citations also check out: 24 `cbGraph`, 38–40, 42, 75, 15–16, 20–21 of C1-LA2, and 1 and 9 of
  C1-LA1.

## Independent re-derivation

I used my own instrument, `scratchpad/c3-crit-T3-F/own/crit_t3f.py` (standard library only; seeded, so deterministic). It shares
no code with T3's generator. I built the graph from the `cbEdge` labels. I did not transcribe the template tables:
`cb8Bpb`/`cb8Bpc`/`cb8CGamma` are parsed directly from the C1-LA1 Lean fragments (36 and 36 cells). As a by-product, T3's
hand-typed tables have 0 mismatches against the parsed ones.

**Fidelity first** (rows `m = 107` and the fresh rows 125, 128, 140 of gate ruling 17):

- `x` is the first strict descent of `i_k(T)`, computed by a generic tree DP on the literal graph and scanned through `α`.
- `F` is derived at the index of gate ruling 16, `i_{p+1}(T−w) < i_p(T−w)`, for `v` and three `c`-representatives
  (`c_{0,0}`, `c_{m−1,7}`, `c_{⌊m/2⌋,3}`). The three agree. I use symmetry to extend the verdict to the other `c` leaves, and I
  disclose that.
- (WID) is asserted from independent sides:
  - `S` comes from the literal `C5LA1.aggregate`, using the `H_v`/`R_v` deletion polynomials from the tree DP.
  - `supply − capacity` comes from hand-derived closed forms with the contract's `G = (1+2x)^8 + x(1+x)^8`:
    `Σ_{B∈I_k} w = [x^{k−2}](1+2x)^{8m} + 8m·[x^{k−2}](1+x)^7(1+2x)G^{m−1}`.

| m | n | α | p* | x | eligible | F_{p*} = leafSet | (WID) S = supply − capacity | sign of S |
|---|---|---|---|---|---|---|---|---|
| 107 | 1822 | 964 | 572 | 570 | yes | yes | equal | ≤ 0 |
| 125 | 2128 | 1126 | 668 | 666 | yes | yes | equal | ≤ 0 |
| 128 | 2179 | 1153 | 684 | 682 | yes | yes | equal | ≤ 0 |
| 140 | 2383 | 1261 | 748 | 746 | yes | yes | equal | ≤ 0 |

This reproduces the fixed point `CB(8,107)/572` (`n = 1822`, `α = 964`, `x = 570`, `θ = 96/766193`) before anything else is
reported. The exact `S` values are in `own/OUT.json`. These rows are `bounded_computation`, and I use them as a sanity check,
not as proof.

**Sector arc accounting on the literal network** (25 sources, 12 in-sector targets and 12 switch-image targets per row, at all four
rows). Source profiles are random but are forced to include `(1,0)`, several `β = 1` chokes, `(1,γ)` for every `γ`, `β ≥ 2`, and
`(8,0)`/`(0,8)`. Relation images and preimages are enumerated by brute force over every vertex, using the literal `transportRel`
test (`|N(u) ∩ B| = 2`, `A = insert u (B \ N(u))`). `activeWeight` is computed literally with `W_t = N(s_t) \ {t}`. My own
`g_sec` is a function of the pair `(B, A)`: it reads the set differences `B \ A` and `A \ B`, and the choke state is recomputed
from the literal `B`.

- **Out side.** Every source is independent, has size `p*+1` and weight 1. It has exactly `K + 3 + #{β_i = 1}` images, all
  distinct and independent, all of size `p*`, and none is a switch at a non-`s`, non-choke vertex. Leg deletions have weight 1.
  The `r`-deletion, `v`-deletion and `s`-switch images have weight 0. The `u_i`-switch images have weight `γ_i`. And
  `Σ_A g_sec(B,A) = Σ_i cb8Out(m, chokeState_i)` holds exactly in 100 of 100 sources. As a by-product (not T3's claim), the
  minimum `Out` seen is exactly `1` at `m = 107`, and `> 1` at 125, 128 and 140.
- **In side** (T3 did not state or check this node; see finding A4). Every in-sector target has exactly these literal preimages:
  `2·#(empty legs)` sector deletions and `C(z,2)` non-sector switches at `r`, where `z = #{chokes with no b-leg}`, and nothing
  else. That rules out switch centres `v`, `b_ij` and `c_ij`. The exact identity `Σ_B g_sec(B,A) = Σ_i cb8In(m, chokeState_i(A))`
  holds in 48 of 48 targets, and the maximum is `< 1` (for example `766125/766193` at `m = 107`). Every switch-image target
  (γ = 0..8) has literal weight `γ`, exactly `8 − γ` sector preimages, and sector inflow exactly `(8 − γ)·σ(γ)`, in 48 of 48 cases.
- **Exhaustive small case.** At `CB(8,1)` and `CB(8,2)`, every sector source of size 4 (112 and 480 sources) was checked, with
  0 failures in classification, distinctness and the Out bridge.
- **T3's check-C value.** With my independent tables, T3's single profile gives `1532715/1532386`, which reproduces T3's value.

## Attacks and findings

**A1 (certification): the Out-bridge check is not two-sided.** Check C's "side 1" and "side 2" call the same in-script `cb8Pb`,
`cb8Pc` and `cb8Sigma`. Side 1 also takes each choke's state from the constructed `layout` dict, not from the literal set `B`,
and it classifies arcs by their generator `q`, not by the pair `(B, A)`. So side 1 is side 2's summands regrouped, and equality
holds by construction. This is one instrument checked twice. The claim that it was verified on two independent sides is
**struck**. The value itself is confirmed by my independent instrument, which is what backs it now.

**A2 (coverage).** Checks A and C used ONE source profile. It has one `β = 1` choke `(1,7)`, and every other choke has `β = 0`.
So `pb` is exercised at a single state, and `(1,0)`, several `β = 1` chokes and `β ≥ 2` are never exercised. Check B ran only at
`m = 2, 3`, on targets that are not at rank `p*`. The fresh rows of gate ruling 17 were not touched. My instrument closes this
gap (see above), still at `bounded_computation`.

**A3 (fidelity): T3 never computes a weight.** T3's script contains no `activeWeight`. It does not derive `F` and does not assert
(WID). The weights the In bridge relies on are stated only in prose: sector source = 1, `r`/`v`-deletion and `s`-switch images
= 0, `u_i`-switch image = `γ`. Citing `F = leafSet` from C2-LA3 is legitimate. The unchecked weights are the fidelity gap. I
checked them literally, and they hold at all four rows.

**A4 (DAG not closed): the In-side sum node is missing.** The route object asks for "the In bridge". T3's `in_bridge_zero_classes`
only lists which arc classes carry zero flow. There is no node stating
`Σ_{B ∈ I_{p*+1}} g_sec(B,A) = Σ_i cb8In m ⟨chokeState m A i, _⟩` for in-sector `A`. That node is the literal counterpart of
C1-LA1's `In`, and it is the only way `In ≤ 1` reaches `IsSaturatingFlow`'s column condition. It is true (my 48 of 48 checks),
but it is absent from the DAG. The switch-image inflow `(8−γ)σ(γ)` is likewise only implicit.

**A5 (DAG not closed): normalization is missing, and `g_sec_def` is not Lean.**
- `IsSaturatingFlow` requires the row sum to equal `activeWeight`, which is exactly `1`. C1-LA1 gives only `Out ≥ 1`. The flow
  is therefore `g_sec / Out(B)`, with `Out(B) := Σ_i cb8Out`. The DAG has no node for this. After normalization the In and switch
  sides become inequalities.
- `g_sec_def` is pseudocode (`if leg-deletion at (i, kind=b) then …`), not a Lean term.
- `cb8Out` takes `State8` (a subtype), so `cb8Out m (chokeState m B i)` is ill-typed as written. It needs
  `⟨chokeState m B i, h⟩`, and `h` needs a lemma that uses independence. The return's "for free" is **struck**.
- The domain of `Σ_A` is never stated. It must be `indepFamily (cbGraph m) p*`, which needs `|B| = p* + 1`.

"Closed at statement granularity" is therefore **narrowed** to "classification and preimage nodes stated; the flow definition,
its normalization and the In-sum node still to be stated".

**A6 (wrong reason): the `u = r` arcs do land on sector targets.** `in_bridge_zero_classes` says the non-sector `u = r` two-for-one
arcs "never touch a sector target … a category mismatch". That is false. These arcs insert `r` and land exactly on in-sector
targets, which is what T3's own node `in_sector_switch_r_preimage` counts as `C(z,2)`. They carry zero flow for a different
reason: `g_sec` is sourced only at sector sets, and the E1 flow is deletion-only (SEMANTIC-CONTRACT §2). The conclusion is right,
but the stated reason is wrong and must be replaced before formalization.

**A7 (incomplete case analysis).** The prose for `in_sector_switch_r_preimage` considers only the switch centre `u = r`. It does not
treat `u = v` or `u = c_ij` (degree 1, so impossible) or `u = b_ij` (the preimage would contain both `u_i` and `r`, so it is not
independent). Check B compared only the `r`-count and never asserted that no other switch preimages exist. My instrument asserts
the complete preimage set at all four rows.

**A8 (the "no other switch" clause is not two lines).** The return says the clause is "the two-line `omega` argument …
`mem_neighborFinset_choke_iff`/`mem_neighborFinset_root_iff` already carry the needed neighbourhood facts". That is **struck**.
The clause needs `N(v)`, `N(b_ij)` and `N(c_ij)`, and no carried lemma supplies any of them. It also needs `IsIndepSet B` to
exclude `u_i ∈ B`. My Lean proof (below) takes about 50 lines: a five-way `cb_val_cases` split, then unfolding `cbEdge` and
`omega` in each branch. `v ∈ B` is NOT needed.

**A9 (non-evidence).** Check D, "DAG acyclic/connected", re-checks the return's own transcription of its prose DAG. It is
non-falsifiable. It is not `bounded_computation` of anything mathematical, and its grade entry is **struck**. There is also a
minor inconsistency: the script draws `switch_preimage_8_gamma ← out_arc_classify`, while the text DAG hangs it under
`choke_state`.

**A10 (route verdict).** "Route verdict: `compiled`" cannot stand: the return itself says "no Lean was built". The typed verdict
supported is `bounded_evidence`, together with a proposal of statement shapes. The mathematics restates Lemma DF (SR-C2-3,
`proved_informal`), and T3's arguments are correct up to A6 and A7.

**Attacks that found nothing:**
- Target distinctness across `(i, j, kind)` within a source holds. The Out-bridge regrouping is exact for EVERY sector source,
  since it is a definitional regrouping once the classification holds, and the classification is now kernel-checked.
- `8 − γ` holds, including `γ = 0` (8 preimages, zero flow because `cb8CGamma 0 = 0`) and `γ = 8` (0 preimages).
- There is no ℕ-subtraction in T3's definitions (`cb8In`'s `8 − β − γ` is in ℚ). No Darroch/Newton is used.
- No residue or asymptotic step is used, so there is no `M_0` to audit.
- No cut. No template failure.

**Critic-derived advance (C-T3-F; compiled scratch, no grade).** File `scratchpad/c3-crit-T3-F/LeanProject/LeanProof/CriticT3F.lean`
(sha256 `0db39495…d0a90`) imports the C1-LA2 `Main.lean`, carried byte-identically (`a906ec17…`, matching the frozen digest).
It was built in a copy-out-first project with `.lake/packages` symlinked manually to the pinned shared Mathlib (`905b9581…`,
equal to `PIN.json`), with no `lake update` and no `lake clean`. It compiles with no errors and contains no
`sorry`/`admit`/`native_decide`. `#print axioms` reports only `propext`, `Classical.choice` and `Quot.sound`. It contains:

- `sector_no_choke`: for independent `B ∋ r`, no member of `B` has a choke label.
- `sector_switch_center`: **the "no other switch" clause.** For independent `B ∋ r`, any `u ∉ B` with
  `((cbGraph m).neighborFinset u ∩ B).card = 2` has `u.val = 1 ∨ ∃ i < m, u.val = 3 + 17*i`.
- `choke_switch_iff`: for `B ∋ r` and `i < m`, `|N(u_i) ∩ B| = 2 ↔` exactly one support of choke `i` is in `B`.
- `sector_transportRel_classify`: T3's `out_arc_classify` in literal `transportRel` form. For independent `B ∋ r`, every image is a
  deletion, the switch at `s`, or the switch at a choke `u_i` carrying exactly one support of `B`.

No hypothesis encodes a conclusion. The mathematics is complete. The formal grade would come only through a governed award.

## Mechanism-equivalence and fence check

- The route adds no mechanism. It re-expresses the Lemma DF / SR-C2-3 sector-arc table (r30 certificate method; r31 Cycle 2
  record) and revives no refuted mechanism: not (G′) (ruling 20), not the `m`-independent per-choke certificate, not forest
  real-rootedness, and not the all-families compression.
- One rank per tree and the class only: the statements hold for every `m` at the structural level. The class enters only
  through C1-LA1's feasibility, which is cited.
- No status transfer to any aggregate: (HALL) at full scope, the primary aggregate, TREE, FOREST, TRANSFER and Erdős #993 stay
  OPEN. `E993-TREE-REAL-ROOTED` stays REFUTED.
- The `θ*` law is never used as a hypothesis. My (WID) rows and sector samples are census values, not proof.
- Attribution: the sector allocation and template are r30's and C1-LA1's. The literal-arc DAG is T3's, restating SR-C2-3. The
  Lean classification lemmas and the In-sum checks are this critic's.

## Certification audit

| Literal in the return | Backed? | Action |
|---|---|---|
| Stage 2 seal, dispatch digest, 40 + 2 source digests, generator/output digests, byte-identical replay | yes (recomputed) | stands; the "42"/"41" count is inconsistent |
| "Verified on two independent sides … both compute 1532715/1532386" | value yes; independence no | "two independent sides" struck (A1); value backed by my instrument |
| "exactly 0 bad leg vertices", "575 images, all distinct" (m = 107) | yes, exhaustive over `V \ B` for ONE source | stands at `bounded_computation`, one profile |
| check B: 16 γ-rows, `m = 2, 3` | yes (replayed) | stands; small `m`, not at rank `p*` |
| "two-line `omega`", "carried lemmas already supply the neighbourhood facts" | no | struck (A8) |
| "`chokeState` gives the `State8` bound for free" | no | struck (A5) |
| "u = r arcs never touch a sector target" | false | struck and replaced (A6) |
| DAG acyclicity `bounded_computation` | non-evidence | struck (A9) |
| "Route verdict: compiled" | no Lean built | struck; `bounded_evidence` (A10) |
| "U-B's informal DAG closed at statement granularity" | partly | narrowed (A4, A5) |
| grades "inherits `proved_informal` from Lemma DF", no new key | yes | stands |

## Verdict

verdict: retained_narrowed
headline_resolved: no
COND4_formal: not_advanced
E1_formal: not_advanced
TERMINAL_integration: not_advanced
cut_candidate: none

**What stands:**
- The literal-arc classification, target distinctness, the `8 − γ` count and the in-sector preimage structure are correct
  mathematics, and they restate Lemma DF (`proved_informal`, inherited). I confirmed them on the literal network at
  `m = 107, 125, 128, 140` (`bounded_computation`).
- The Out-bridge identity holds for every sector source, as a regrouping.

**What is narrowed:**
- The DAG is not closed. The flow's Lean definition, its normalization by `Out(B)`, and the In-sum node are missing (A4, A5).
- One stated reason is wrong (A6), and one case analysis is incomplete (A7).
- The route verdict falls to `bounded_evidence`.

**What is struck:** the certification literals listed in the audit above.

The critic-derived Lean nodes are compiled scratch with no grade. They advance the conjunct-4 DAG as input only, so
`COND4_formal` stays `not_advanced` on this line.

## Remaining obligation

What a successor (U1/U3 or a Cycle 4 seat) inherits, exactly:

1. **Carry the classification.** Carry `sector_no_choke`, `sector_switch_center`, `choke_switch_iff` and
   `sector_transportRel_classify` (C-T3-F scratch, sha256 `0db39495…`) into the award project, over the C1-LA2 layer.
2. **Define the flow in Lean.** Define `g_sec m B A : ℚ` as a genuine Lean function of the pair:
   - `B` sector and `B \ A = {q}` with `q` a leg of choke `i`: `cb8Pb`/`cb8Pc` at `⟨chokeState m B i, h⟩`;
   - `A \ B = {u_i}` with `A = insert u_i (B \ N(u_i))` and `β_i = 1`: `cb8Sigma m γ_i`;
   - otherwise `0`.
   Prove `chokeState_le` (independence gives `β + γ ≤ 8`). Define the flow as `g := g_sec / Out(B)`, with
   `Out(B) = Σ_i cb8Out m ⟨chokeState m B i, _⟩ ≥ 1` from C1-LA1.
3. **Out side.** Prove the Out bridge as a `Finset.sum` over `indepFamily (cbGraph m) p*`, using the classification and the
   injectivity of the image map. After normalization the row sum is exactly `1 = activeWeight (cbGraph m) (leafSet) B`. This
   needs the weight lemma: sector `B` has weight 1.
4. **In side.**
   - In-sector targets: prove `Σ_B g_sec(B,A) = Σ_i cb8In m ⟨chokeState m A i, _⟩`, hence `≤ 1` by C1-LA1. This requires the
     complete preimage classification, including switch centres `v`, `b_ij` and `c_ij` (none arise) and `r` (non-sector sources,
     zero flow).
   - Switch images: prove inflow `≤ (8−γ)·σ(γ)` and weight `= γ`.
   - Prove zero sector inflow on every other target class: `r`/`v`-deletion and `s`-switch images (weight 0), `(1,0)` switch
     images, and targets with two or more chokes.
5. **Compose.** Combine with the E1 flow (deletion-only, load `ρ_1 γ` on switch images) using C1-LA1's Switch and Residual. Then
   apply the rational-to-integral step to reach conjunct 4.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-T3-F/`.

| Artifact | SHA-256 |
|---|---|
| `own/crit_t3f.py` (critic instrument; imports: fractions, random, itertools, json, re, sys, hashlib) | `6125927b285fdf6e09fea9c27482c8f302b5c1159d09e7069b88bcd555020154` |
| `own/OUT.json` (`all_pass: true`) | `e2f2538f81cbb2f845c8ebab58629f791a6b9578a7c9a6a39d1f4ef88c38e3e8` |
| `LeanProject/LeanProof/CriticT3F.lean` (critic Lean, scratch) | `0db39495572bac5c092b3d80187db270ed54d46f0203d4f505742dc2de0d0a90` |
| `LeanProject/LeanProof/Main.lean` (C1-LA2 carry, byte-identical) | `a906ec179d52c2548ca7026d8c9de532577100308444af2e722db3fd963b5f3f` |
| `lean-check.log` (`#print axioms` output) | `c501a4643732d5bb3039aa009a62c1842e0e8ba1844b3ecaaae909721928ff81` |
| `replay/sector_out_bridge.py` (T3 generator, copied) | `2f996ad1851debdfda54fc1721646e1a16572f36110ed41b286e919e5fa09e63` |
| `replay/REPLAY-OUT.json` (identical to T3's `OUT.json`) | `90646e87cf8fec24d293ab461c2090735fb0d3cff552553be1298f07b74b4964` |

Replay commands:
- Instrument: `cd <scratch>/own && python3 -B crit_t3f.py > OUT.json`
- Lean: `cd <scratch>/LeanProject && lake build LeanProof && lake env lean LeanProof/CriticT3F.lean`

No background job was started, and none is running.
