# Critique

Critic `C-T1-U`, Cycle 2 Stage 4 of r31 (Erdős #993: a parameter-uniform switch-using Hall certificate on CB(8,m) at the top
sector-deficient rank). Orientation U (formal / structural), cross-orientation critic of seat `T1`, route `C2-T-01`, mechanism
token `FAVORABILITY-ARM-LEAF-INTEGER-ROUTE`, orientation T (prove).

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file. **Read-boundary disclosure:** the harness
injected the project `CLAUDE.md`, the user memory index (`MEMORY.md`) and the user's email into my context before my first tool call.
I did not fetch them and did not use them in this critique. All other reads were: the 14 capsule members; `control/C2-WORKER-COMMON-BRIEF.md`,
which the common brief authorizes; files under `sources/` (the C1-LA3 award run, `sources/r30/records/SEMANTIC-CONTRACT.md` for the `Δ_k`
convention, the concurrent master registry for the alias check, `sources/mathlib-binding/PIN.json`); and the return's artifacts in
`scratchpad/c2-T1/`, which I only listed and copied out. I ran non-recursive `ls` only, and only on `sources/`, `sources/authority/`,
`sources/concurrent/master-494-2026-09-28/`, the C1-LA3 run directory, `scratchpad/c2-T1/` and the pinned shared Lean project root
`/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project`. That project root is the parent of the Mathlib package
directory, so I disclose the listing: names only, and nothing from it was used except the three project files hashed below and
`git rev-parse` inside `.lake/packages/mathlib`. I made no network access, installed nothing and started no background job.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- Dispatch `control/dispatch/c2-stage4/DISPATCH-C-T1-U.md`: SHA-256 `9b7ce7526244adef175e7beb55b36b301106ee9e1d622b594070bb5affe8e89c`, which
  matches the value given.
- **Capsule seal** (`control/c2-critic-capsules/T1-PACKET-MANIFEST.json`), recomputed as canonical JSON without `seal_sha256`
  (sort_keys, `(",",":")`, no trailing newline): `c58827b23fb7200f5c93c8b62aceecf7c0304c961705206b0dedbbbb53ac5ef2`. **Matches.** All 14
  members match their listed bytes and SHA-256, including the return (`6c810668…9e49`, 33 559 bytes).
- Stage 2 seal `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`: recomputed, matches. Stage 3 seal
  `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5`: recomputed, matches, and the Stage 3 manifest lists the return with
  the same digest. Stage 4 dispatch seal `af5d13510a82108cb7e584d0909f5f1fee4055d0f2a6448e9dde08411a2145bb`: recomputed, matches.
- Digests the return lists that I re-verified against `sources/c1-results/SOURCE-DIGESTS.json`: C1-LA3 `INFORMAL-PROOF.md` (`a8bbf4f5…`,
  OK). I also checked two C1-LA3 files that the return marked "—": its `Main.lean` (`c0605e12…`, OK) and its `FORMALIZATION-STATE.json`
  (`6d59d4c3…`, OK). Snippets 0001–0017 each match their `source_sha256` in that state file.
- The return binds its route ID, mechanism token and allocation obligation verbatim. Its disclosure line ("chartered Claude Sonnet 5,
  high … runtime-reported model id: `claude-sonnet-5`") has both parts.
- **Result digest replay.** I copied `t1_main.py` (SHA-256 `29f137e8…c3c3`) to `scratchpad/c2-crit-T1-U/replay/` and ran
  `python3 -B t1_main.py`. It exits 0 and reproduces `RESULT_DIGEST_SHA256 b23dba2f673a03343875b8161586d72e4777305c23145ccf239a4181e328eff5`.
  The stdout log is byte-identical to the seat's `t1_main_run.log` (`3ee21be0…85c3`). The return does not state the generator's own
  SHA-256, only the result digest. That is an inventory gap, recorded under the certification audit.

## Independent re-derivation

**Convention (fidelity first).** r30's `SEMANTIC-CONTRACT.md` line 20 defines `Δ_k(G − D) := i_{k+1}(G − D) − i_k(G − D)` in ℤ. The
registered favorability key uses the same convention and reads "a leaf w is favorable at rank p iff Δ_p(T − w) < 0, at the original
rank". Its check value `Δ_8(K_{1,11}) = 55 − 165` fixes the direction. So the target is `i_{p*+1}(T − v) < i_{p*}(T − v)` on the
original carrier with `v` deleted. That is the inequality the return proves: right index, right sign, right polynomial.

**Closed form (re-derived by hand).** Deleting `v` leaves `s` as a pendant vertex of `r`.
- If `r` is excluded: `s` contributes `(1+x)`. Each choke gadget contributes `(1+2x)^8` when `u_i` is excluded (each leg `b–c` is a
  `P_2`) and `x(1+x)^8` when `u_i` is included (each `b` is barred and each `c` is free). Together this gives `(1+x)G^m`.
- If `r` is included: `s` and every `u_i` are barred, which gives `x(1+2x)^{8m}`.

So `I(T − v) = (1+x)G^m + x(1+2x)^{8m}`, matching the contract. The binomial expansion gives `Σ_j C(m,j)V_j + R` with
`V_j = x^j(1+x)^{8j+1}(1+2x)^{8(m−j)}` and `R = x(1+2x)^{8m}`. That gives `[x^k]V_j = r(8j+1, 8(m−j), k−j)` and `[x^k]R = r(0, 8m, k−1)`.

**(G) against its formal statement** (C1-LA3 `Main.lean` entry 17, read verbatim). Its hypotheses are `1 ≤ t`, `t ≤ a + b` and
`3a + 4b + 2 ≤ 6t`, with the gap condition non-strict. Its conclusion is `((1+X)^a (1+2X)^b).coeff (t+1) < … .coeff t`: `a` is the
`(1+X)` exponent and `b` is the `(1+2X)` exponent. The return assigns `a = 8j+1`, `b = 8(m−j)`, `t = p* − j` for `V_j`, which is
correct. The shift `x^j` moves the index down by `j`, so `[x^{p*+1}]V_j` and `[x^{p*}]V_j` are the coefficients at `t+1` and `t`. For
`R` it uses `a = 0`, `b = 8m`, `t = p* − 1`, which is also correct.

**Margin identity (my instrument, exact over ℚ).** Treat `margin = 6t − (3a + 4b + 2)` as an affine form in `(m, j)`, with
`p* = (16m+4)/3` substituted exactly.
- For `V_j` the coefficients of `(m, j, 1)` are `(0, 2, 3)`: `margin(j) = 2j + 3`, with no dependence on `m`.
- For `R` they are `(0, 0, 0)`: `margin_R = 0` identically.

Both hold for every `m ≡ 2 (mod 3)`, and the residue enters only through `3p* = 16m + 4`. The side conditions also hold for every
`j ∈ [0, m]` on the class:
- `t = p* − j ≥ p* − m = (13m+4)/3 ≥ 1`;
- `t ≤ p* ≤ 8m + 1 = a + b`;
- for `R`, `1 ≤ p* − 1 ≤ 8m`.

Every ℕ-subtraction (`m − j`, `p* − j`, `p* − 1`) is taken at a true value. Summing, every block and `R` strictly descend, and every
weight `C(m,j) ≥ 1` on `[0, m]`, so `Δ_{p*}(T − v) < 0`. The argument is complete and uses neither Darroch nor Newton. `m ≥ 107` is
never used, only `m ≡ 2 (mod 3)`.

**My instrument on the literal tree.** `own/crit_t1u.py` builds the tree with my own labels, runs a generic forest DP after deleting `v`,
and asserts forest-ness from the edge count and component count. It computes coefficients with my own two-binomial routine, summed in
the opposite index order to the seat's. I ran it at `m ∈ {107, 110, 113, 116, 119, 137}`, which covers the gate-ruling-9 fresh rows 116
and 119, the control rows 107, 110 and 113, and the larger row 137. On every row:
- the literal-tree `i_{p*}(T − v)` and `i_{p*+1}(T − v)` equal the block sum;
- every block meets (G)'s three hypotheses with margin exactly `2j + 3` and strictly descends;
- `R` has margin 0, and its exact ratio `R_{p*+1}/R_{p*} = 2(8m − p* + 1)/p*` is `285/286, 293/294, 301/302, 309/310, 317/318, 365/366`;
- `Δ_{p*}(T − v) < 0`, with relative size `Δ/i_{p*} ≈ −0.01294, −0.01278, −0.01264, −0.01250, −0.01236, −0.01168`.

The block closest to 1 is always `j = 0`, with ratio ≈ 0.99389 at `m = 107`. Fixed point `CB(8,107)/572` reproduced from the literal
tree before any row was read: `n = 1822`, `α = 964`, `x = 570` (first strict descent computed through `α`), `p* = 572`. The row data
for 116, 119 and 137 (`x = 618, 634, 730`, eligible) are `bounded_computation`, recorded for audit only. At 110 and 113 my
`i_{p*}` and `i_{p*+1}` equal the seat's instrument-A integers exactly (421 and 432 digits; `|Δ|` has 419 and 431 digits). Output
digest: `CRIT_DIGEST_SHA256 61cd26da99fdc7dd3c7e06b448e5921fefccc7133bcafde5e73c1651621d3bdc` (canonical JSON). File `crit_t1u_out.json`
SHA-256 `95f46234…6e09`.

## Attacks and findings

1. **Main claim: survives.** On the r31 class, the claim that every `V_j` (`0 ≤ j ≤ m`) and `R` meet (G)'s hypotheses outright is
   correct. The margin identities are exact, the side conditions hold at the endpoints `j = 0` and `j = m` and at `R`, and a margin of 0
   is admissible because the Lean hypothesis is `≤`. There are no exceptional blocks. The attack brief asked about positivity: it is
   not a separate need. (G)'s conclusion is already strict for every block, and `C(m,j) > 0`. No asymptotics, no `M_0`, no floor
   division (`16m + 4 ≡ 0 mod 3` is exact), and no circularity. The endpoint `m = 107` is covered by the uniform argument, and my
   instrument checks it directly.
2. **Numeric evidence does not test the tree (narrowing of the evidence description).** Instruments A and B both consume the closed
   form `(1+x)G^m + x(1+2x)^{8m}`. B checks only the binomial expansion, not the tree. At `m = 110, 113` the literal tree is used only for
   `IsTree`. The seat's closed-form-versus-tree cross-check covers only `(d, m) ∈ {1,2,3,8} × {1..4}`. Under the r30 lesson, "two
   instruments that share one model are one instrument checked twice", so "two fully independent computational instruments" is
   overstated. The mathematics is unaffected because the closed form is proved on the face, and my literal-tree DP closes the gap at
   six class rows.
3. **Fresh rows mislabelled.** Gate ruling 9 makes `m = 110, 113` control rows and `m = 116, 119` the fresh rows, which the seat never
   ran. The allocation text still said "Test at `m = 110, 113` first", so this is a conflict between the controller's own texts, not a
   seat violation. It is recorded here. I ran 116 and 119, and both pass.
4. **Wrong remark: "+11 shift".** The return compares its margin `6t − (3a+4b+2) = 2j + 3` with the parent gap `2j − 8`, but that gap is
   `6t − (3a+4b)` (Lean entry 19: `6l + 8 = 3a + 4b + 2j`). In a common convention the T1 form is `2j + 5`, a shift of +13, not +11. The
   remark is not load-bearing. Struck.
5. **Out-of-class remark.** "indeed at every `m ≥ 1` with the residue hypothesis" is true mathematically (the argument needs only
   `m ≡ 2 mod 3`), but it is outside fence 1 of the class. It must not appear in any registration text. Struck from the claim face.
6. **Generator literals.** `"min_margin_over_j_0_to_m": 3` and `"ascending_blocks_found_this_m": 0` are written into the hashed output
   as literals. They are backed by the preceding `assert margin == 2j+3` loop, so they are harmless, but they are not derived. The seat
   should emit computed values.
7. **Citation numbering.** "entry 10/11/12/13/14" are the C1-LA3 `INFORMAL-PROOF.md` DAG numbers (Main.lean entries 17–21). This is
   consistent, not a defect. The seat quotes (G) as "`r(t+1,a,b) < r(t,a,b)`", while its own notation is `r(a,b,t)`, and says the
   quote is "verbatim". It is not verbatim, though the mathematics agrees with Lean.
8. **Claim identity (see next section).** The proposed key is a mathematical alias, as a scope restriction, of registered part (i).

## Mechanism-equivalence and fence check

- **Newton/Darroch:** neither is used. (G) is kernel-checked from the three-term recurrence plus log-concavity by factor induction
  (C1-LA3 DAG 6–9). My `#print axioms` on (G) gives only `[propext, Classical.choice, Quot.sound]`. No real-rootedness claim is made
  about `I`, `G` or `G^m`. `E993-TREE-REAL-ROOTED` is not revived. No refuted mechanism from fence 6 is used.
- **One rank, class only:** the claim is at `p*` on `d = 8`, `m ≥ 107`, `m ≡ 2 (mod 3)`, apart from the struck parenthetical in
  finding 5. It transfers no status to (HALL), to the aggregate or to Tier 1. The return says so correctly: the composition key's
  favorability dependency is narrowed only for the arm leaf, and the private-leaf half is T2's.
- **Census discipline:** the sweeps are presented as corroboration, and the universal claim rests on the identity plus (G), not on data.
- **Claim identity:** the return concludes "No alias; distinct claim". **I disagree.** The registered key
  `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`, part (i), states exactly
  `Δ_{p*}(CB(d,m) − v) < 0` for every `d ≥ 6`, `m ≥ 1`, which I read in the concurrent master. T1's statement is that predicate
  restricted to `d = 8` and the class. "Darroch-and-Newton-free" describes the proof's dependency and grade, not the statement. The
  candidate `…-VIA-TWO-BINOMIAL-DESCENT-DARROCH-AND-NEWTON-FREE` puts a proof method in a key name, but keys name predicates (worker
  brief item 5). The correct registry action is a **dependency-discharge scope note** on the r30 key: at `d = 8` on the r31 class,
  part (i) holds without Darroch/Newton, via (G), with zero exceptional blocks, at `proved_informal` after an isolated second read.
  A new `E993-R31-` key is not warranted. If the synthesis wants a separate row anyway, it must name the predicate, not the method,
  and be linked as a restriction alias of part (i). Lexical check: no `TWO-BINOM` or `ARM-LEAF-FAVORABLE-AT-RANK-16M…` key exists
  in the concurrent master (494). The only `ARM-LEAF` key is the unrelated deficiency-domination lemma, as the return says.
- **Tier 3 wording:** SOLUTION-CONTRACT §1 says favorability is "never re-proved as a contribution". The allocation expressly
  commissioned this Darroch-free re-proof, and gate ruling 10 permits a route that removes a dependency if it names the replacement.
  The return names (G). Consistent.

## Certification audit

| Literal on the return's face | Backed? | Action |
|---|---|---|
| Stage 2 seal `ee00f126…f7e4` | yes (recomputed) | keep |
| RESULT_DIGEST `b23dba2f…eff5`, replay identical | yes (my replay; log byte-identical) | keep |
| "16 checks, 0 mismatches" | yes (replayed) | keep |
| "2334 (m,j) pairs", "227 coefficient-pair checks" | yes (108+111+114+2001; 112+115) | keep |
| 421/432-digit `i_{p*}`, 419/431-digit `|Δ|` | yes (my literal-tree DP) | keep |
| "`margin(j) = 2j+3`, `margin_R = 0`, exact ℤ identity" | yes (my exact affine computation) | keep |
| "(G) … `formally_verified`", non-strict gap, strict conclusion | yes (Main.lean entry 17; axioms standard) | keep |
| "cited verbatim" (the (G) quote) | no (paraphrase, argument order changed) | strike "verbatim" |
| "two fully independent computational instruments" | no (one shared closed-form model) | narrow to "two computations of one closed form; tree fidelity at small (d,m) only" |
| "fresh rows `m = 110, 113`" | no (ruling 9: control rows) | relabel; fresh 116/119 supplied by this critic |
| "~0.1s wall time — measured, not estimated" | no (my replay: 1.8 s) | strike |
| "each member's SHA-256 verified before reading" | partly (several table rows show "—") | narrow; I verified Main.lean and FORMALIZATION-STATE myself |
| "+11 shift" | no (wrong; +13 in a common convention) | strike |
| "indeed at every `m ≥ 1`" | out of fence | strike from face |
| "No alias; distinct claim" | no (restriction alias of registered (i)) | replace by a scope note |
| Grade `proved_informal` for T1's object | yes, as mathematics; needs the isolated second read before registration | keep, subject to SR |

## Verdict

verdict: retained_narrowed
headline_resolved: no

ELIG_formal: not_advanced
HALL_formal: not_advanced
FAV_darroch_free: advanced
cut_candidate: none

**The mathematics is retained in full.** For every `m ≥ 107`, `m ≡ 2 (mod 3)`: `Δ_{p*}(CB(8,m) − v) < 0`, via the closed form, the
block expansion, and (G) applied to all `m + 1` blocks and `R`, with margins `2j + 3` and `0`. There are no exceptional blocks and
no Darroch or Newton. I judge the argument complete, grade `proved_informal`, pending the isolated second read.

**What is narrowed:**
1. The claim identity: this is a restriction alias of r30 favorability part (i), recorded as a dependency-discharge scope note, not a
   new predicate.
2. The evidence description: the instruments share the closed-form model.
3. The struck literals in the certification audit.

**Critic-derived advance (attributed to C-T1-U; compiled scratch, no grade).** In `scratchpad/c2-crit-T1-U/LeanProject/` I built a
scratch project bound by manual symlink to the pinned Mathlib (rev `905b9581…6e96c`, `git rev-parse` checked against `PIN.json`).
It carries C1-LA3 snippets 0001–0017 byte-identically, each digest checked against C1-LA3's `FORMALIZATION-STATE.json`.
`lake build` succeeds, and there is no `sorry`, `admit` or `native_decide`. `#print axioms` gives `[propext, Classical.choice,
Quot.sound]` for every declaration. The file `LeanProof/Crit.lean` (SHA-256 `9e400946…f091`) contains:
- `crit_cb8_arm_block_descent (m j) (hm : 107 ≤ m) (hmod : m % 3 = 2) (hjm : j ≤ m)`: the `V_j` descent at `p* − j`, for every `j`,
  proved by (G) with `omega`;
- `crit_cb8_arm_remainder_descent`: the `R` descent at margin 0;
- **`crit_cb8_arm_leaf_closedForm_descent_topRank (m) (hm : 107 ≤ m) (hmod : m % 3 = 2)`**, which states
  `((1+X)·((1+2X)^8 + X(1+X)^8)^m + X·(1+2X)^(8m)).coeff ((16m+4)/3 + 1) < ….coeff ((16m+4)/3)` in `ℤ[X]`. The proof carries out the
  binomial expansion formally (`add_pow`, a ring identity per term, the `X^j` shift) and closes with `Finset.sum_lt_sum_of_nonempty`
  plus `add_lt_add`.

So the step the return leaves open is closed formally at the closed-form level: the whole coefficient inequality, including the block
decomposition, and not only the per-block (G) instances. The one remaining bridge to `IsFavorableAt (cbGraph m) armLeaf p*` is the
identity `indepSetCount (cbGraph m) {v} k = [x^k]((1+x)G^m + x(1+2x)^{8m})`. That identity is U3's closed-form object and is not
proved here.

## Remaining obligation

1. **Isolated second read** of T1's statement (`Δ_{p*}(CB(8,m) − v) < 0` on the class, Darroch/Newton-free via (G), zero exceptional
   blocks) before any registration. It should then be recorded as a scope note on
   `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3` part (i), not as a new predicate
   key.
2. **Formal bridge (the only missing formal link for arm-leaf favorability):** prove over the carried C1-LA2 `cbGraph m` that the
   count of independent `k`-sets of `cbGraph m` with the arm leaf deleted equals `[x^k]((1+x)G^m + x(1+2x)^{8m})` for every `k`.
   Composing it with this critic's compiled `crit_cb8_arm_leaf_closedForm_descent_topRank` gives `IsFavorableAt (cbGraph m) v p*`
   formally on the class. The synthesis may fund that composition as a governed award: re-author `Crit.lean`'s three declarations
   through the governed workflow, since compiled scratch has no grade.
3. **Private leaves** (`Δ_{p*}(T − c_ij) < 0`, T2's object) remain. Full Darroch/Newton-free favorability `F_{p*}(T) = leafSet(T)` needs
   both halves.
4. **Record hygiene:** the synthesis should resolve the conflict between gate ruling 9 and the allocation's fresh-row text (110/113
   against 116/119). Future generators should state their own SHA-256 and emit computed values in place of literal summary fields.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-T1-U/`. IMPORT LIST of
my instrument: `sys, json, hashlib, math.comb, fractions.Fraction` (standard library only).

| Path | SHA-256 | Role |
|---|---|---|
| `own/crit_t1u.py` | `df0ad8bd62744d7352648f13a50a04fbdc821c6c1ce1208d976e687110d9f091` | my instrument (literal tree, exact margin forms, per-block (G) checks, rows 107–137) |
| `own/crit_t1u_out.json` | `95f4623477101cc77427f97681d341802220b3229a090cff6f618e37a506ce09` | its output (canonical digest `61cd26da…3bdc`) |
| `replay/t1_main.py` | `29f137e84efc3764e5d8d6958c50c0c29c79b8e225342043e98625639326f3c3` | the seat's generator, copied out |
| `replay/REPLAY-OUTPUT.log` | `3ee21be0b7c6436ce1e4a96c6f5d7fffce077ede072edd6d377e9e115c9385c3` | replay stdout (byte-identical to the seat's log) |
| `replay/t1_main_result_digest.txt` | `6bd0037b321dc3af9e49a133c821125a4114e03bc291075e8120cedb50b8f94c` | replay result digest `b23dba2f…eff5` |
| `LeanProject/LeanProof/Carried.lean` | `9b613202ef4fc3605ed101be7b167816d2c73fce68eeaddc83bef20ceb2e416f` | C1-LA3 snippets 0001–0017, byte-carried |
| `LeanProject/LeanProof/Crit.lean` | `9e40094637bf76dff68460817d10ef64730f140783d5ea1e86d78004001815f1` | critic-derived compiled scratch (no grade) |
| `LeanProject/LeanProof/Axioms.lean` | `fa16c2bf05a5a3db5a46e138592bbc53995820b6da600eff7d43643a24d889f8` | `#print axioms` driver |
| `LeanProject/LeanProof.lean` | `5ffb98b8cd21ad8c65734895ad1a1824abdb8df0c17675168270c93f4a16f5f3` | root import |
| `AXIOMS-OUTPUT.txt` | `a94c92acd690ed3ba5ead57c1f9e8bc1de084df7940a56ef056a2515a0cae2ca` | axioms output |
| `LeanProject/{lakefile.toml,lake-manifest.json,lean-toolchain}` | `45d0ca58…`, `52a4d73c…`, `2bdc48ad…` | byte copies from the C1-LA3 award project; `.lake/packages` is a symlink to the shared pinned packages |

Replay: `cd <scratch>/own && python3 -B crit_t1u.py > out.json` (about 8 s, foreground). For the Lean files:
`cd <scratch>/LeanProject && lake build && lake env lean LeanProof/Axioms.lean`. I did not run `lake update`, `lake clean` or `elan`.
No background job was started, so there is nothing to kill.
