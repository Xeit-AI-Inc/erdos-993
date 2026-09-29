# Critique

**Critic:** `C-T1-F`, the F-orientation (falsify) cross-critic of seat `T1`. The seat's route is `C4-T-01`, mechanism token
`E1-UPCOVER-COUNTS-VIA-CLONE-CORRESPONDENCE`, orientation T (prove), and it owns frozen node N1 (all four declarations).
r31 Cycle 4, Stage 4. Date 2026-09-29.

**Model disclosure (two parts):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot acknowledgment.** I am operating within VerityOS under the restricted boot. I read exactly
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the dispatch
`control/dispatch/c4-stage4/DISPATCH-C-T1-F.md`. Its SHA-256, recomputed with `shasum -a 256`, is
`c3c13a2a49e6dc21e5b87cd34711c25acbeab22234139b30e21bdcb8a6ea72f1` and matches the dispatch. I read no other VerityOS file
outside the run root. I wrote no conversation log because the dispatch allows exactly one deliverable file.

**Read-boundary disclosures.**
1. I read the Python instrument and result table the return inventories, `scratchpad/c4-T1-replay/n1_verify.py` and
   `n1_verify_results.json`. Their directory is a sibling of the granted `scratchpad/c4-T1/`, not inside it. I read both by exact
   path, with no listing, and replayed them copy-out-first into my own scratch.
2. The attack brief (controller fact CF-C4-S3-1) authorizes the controller-built base cache
   `scratchpad/c4-base/LeanProject/.lake/build`. I copied it into my project and made one one-level `ls` of
   `scratchpad/c4-base/LeanProject/.lake/` to find it.
3. I made one-level `ls -la` listings of `scratchpad/c4-T1/`, its `LeanProject/`, `LeanProject/LeanProof/` and `.lake/`. These are
   inside the grant.
4. I ran `grep` only inside `sources/c4-base/`, `control/` capsule members, the return, and the Mathlib package directory (for API
   names). I read Stage 2 members `control/C4-WORKER-COMMON-BRIEF.md` and `control/C4-FROZEN-STATEMENTS.{lean,md}`, as the
   protocol permits.
5. I read no sibling return, critique, adjudication, other experiment root or network resource.

## Identity and seal audit

- **Capsule** `control/c4-critic-capsules/T1-PACKET-MANIFEST.json`. The inner seal, recomputed as SHA-256 of compact key-sorted
  JSON without `seal_sha256`, is `d028a27b88871caedd2f11194da7ee85242580689968676423d42d10262ff6e4`. It matches. All 16 listed
  members match their SHA-256 and byte counts.
- **Stage 2 packet seal:** `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387`. Recomputed; matches.
- **Stage 3 packet seal:** `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e`. Recomputed; matches.
- **Stage 4 dispatch manifest seal:** `040448e1cdf94fa8a669364b4cdcbcc01bbd8f65a02eba056eb0f9856200e023`. Recomputed; matches.
- **Return:** `cycles/cycle-4/stage3/returns/T1/RETURN.md`, 26,537 bytes,
  SHA-256 `12b0a8187632bddc3b0bd6519301a170a57fc6966cdb478c7cc5712a4b2e108f`. Matches the capsule and the admission record.
- **The return's digest literals.** It contains nine 64-hex literals. I recomputed all nine and each matches:
  - Stage 2 seal.
  - Frozen `.lean` `0fc723d7…`.
  - Frozen `.md` `6aa6dfe5…`.
  - `Main.lean` `385af1bf…`.
  - T1's edited `Statements.lean` `9904581d…`.
  - `build-t1-final.log` `33c6c8ac…`.
  - `axioms-t1-final.log` `68197ff8…`.
  - `n1_verify.py` `fe41c70c…`.
  - The result-table literal `7f1945aa…`.

  The last one needs a caveat. `7f1945aa…` is the digest the script prints over the canonical row array. It is **not** the SHA-256
  of the file `n1_verify_results.json`, which is `e9f556a77015e82af70b8008c734aff527f887b219c60e48ab15b796f99c9bef`. My
  replay reproduces both values byte for byte. The return's phrase "result table SHA-256 … (`n1_verify_results.json` …)" is
  ambiguous and should name what was hashed. The literal itself is backed.
- **`sources/c4-base/SOURCE-DIGESTS.json`:** all 12 files match, as the return claims. T1's four base Lean files and its
  `LeanProof.lean` (`61099148…`) are byte-identical to `sources/c4-base`.
- **Registry keys touched:** none. N1 is internal frozen text (gate ruling 23), not a registered key. The return names the
  criterion and favorability keys only as context and uses neither. I confirm N1 needs neither. The return proposes no
  `E993-R31-` key, and this critique proposes none, so no alias check is needed.
- **Admission defect for T1 (`FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN`).** The only occurrence is at line 304: "these three
  declarations are NOT `formally_verified`". That is a negation, not a label on the seat's own scratch, so there is nothing to
  strike. **Defect dismissed.** The `BAD_HEADLINE_FLAG` exception is format only; the value is `no`. Confirmed.

## Independent re-derivation

**The mathematics, re-derived.** For `r`-free independent `B` on `cbGraph m` with `m ≥ 1`:
- The leaves are `v` and the `c_ij` (entry 60).
- `W_v = {r}` (entry 69) and `W_{c_ij} = {u_i}` (entry 70).
- A leaf `z ∈ B` is active iff `z = c_ij` with `u_i ∈ B`. Proof: `v`'s only witness `r` is absent. For `c_ij`, `u_i ≠ c_ij`, so
  `u_i ∈ B.erase c_ij` iff `u_i ∈ B`.
- **(B1)** partitions `B` into chokes, active leaves and the rest, with two injections:
  - active leaves `c_ij` ↦ `(i, j)` with `u_i ∈ B` gives `w ≤ 8q`;
  - rest ↦ arm slot or `(i, j)` with `u_i ∉ B` gives `ℓ ≤ 8(m−q)+1`. This is injective because `s ~ v` and `b_ij ~ c_ij`.
- **(B2)** Boolean insertions are exactly the `c_ij ∉ A` with `u_i ∈ A`. Together with the active set they biject onto
  `{(i, j) : u_i ∈ A}`, which has `8q` elements.
- **(B2) ternary count.** Let `U` be the free zone: `{s, v} ∪ {b_ij, c_ij : u_i ∉ A}`, so `|U| = 2 + 16(m−q)`. Let `φ` be the pair
  partner (`s ↔ v`, `b_ij ↔ c_ij`). Then `U` is the disjoint union of the ternary insertions, the ℓ-set `E`, and `φ(E)`, and
  `|φ(E)| = |E|`. That gives the ternary count as `16m + 2 − 2ℓ − 16q`.
- **(B3)** holds on its full frozen domain, with no independence or `r`-free hypothesis. Every leaf witness is `r` or a choke, so
  inserting a non-choke `z ≠ r` flips no other leaf's activity.

**Instrument 1: my own Python, built from the contracts and the Lean definitions.** File `py/crit_n1.py`, standard library only.
- It does not reuse the seat's script.
- `leafSet` is derived as the degree-1 vertices, `support` as the unique neighbour, and `W_v = N(support v) ∖ {v}`.
- `activeWeight` is the literal entry-16 definition (`B.erase v`, witness **present**).
- Filters follow the frozen texts clause by clause, including B2's conjunct-1 `indepFamily` membership (card and independence).

Results:
- **m = 1, exhaustive over all 2^20 subsets.** Filtered by the graph's own independence test and `r`-freeness, this gives
  **20,451** sets. That matches the seat's structural count and the drafter's M2 figure (`C4-FROZEN-STATEMENTS.md` line 855). On
  every one of them, B1 and B2 have 0 failures.
- **B3 at m = 1, exhaustive on its FROZEN domain.** Every subset `A` (independent or not, `r` allowed) and every `z ∉ A` with
  `z ≠ r` and `z` not a choke: **9,437,184 pairs, 0 failures**.
- **Sampled rows.** m = 2 (400 draws), 3 (300), 5 (200), and 107, 110, 158, 161, 164 (25 each). The sampler is graph-generic
  greedy, not the structural generator. B3 is run on arbitrary perturbed supersets. 0 failures.
- **Output.** `py/crit_n1.out`, payload SHA-256 `e9c10ccc549832324122a9a0dc2d5160bb9ab22a8c6c6bf716d179bc3e8fc47a`, runtime 8.8 s.
- **Mutation controls** (`py/crit_mutants.py`, m = 1, 20,451 sets). Every mutant is caught:

  | Mutant | Failures |
  |---|---|
  | M1 `w ≤ 8q − 1` | 19,686 |
  | M2 Boolean + 1 | 20,451 |
  | M3 `16m+3` | 20,451 |
  | M4 B3 without the indicator | 765 |
  | M5 witness-ABSENT activity (the seat's first-generator bug) | 19,171 |

  Payload SHA-256 `68cc4dc48b33d231d85cc6d2b8f617b7de1d4232ef86143461b455d0b45dce03`.

**Instrument 2: the Lean kernel (critic-derived advance; see below).** All four frozen N1 declarations compile sorry-free.

**Replays (copy-out-first, into `scratchpad/c4-crit-T1-F/`).**
- **Python.** `n1_verify.py` reproduces **61,263 rows**, the printed digest `7f1945aa…` and the file digest `e9f556a7…`
  exactly.
- **Lean.** I built T1's project on the controller base cache (never the seat's cache). `lake build LeanProof` exits 0 with
  "Build completed successfully (8661 jobs)" and 19 `sorry` warnings.
- **Axioms.** `#print axioms` on T1's three declarations gives `[propext, Classical.choice, Quot.sound]`. My log
  `axioms-replay-T1.log` is **byte-identical** to the seat's (`68197ff8…`).
- **Frozen text.** `diff` of T1's `Statements.lean` against `control/C4-FROZEN-STATEMENTS.lean` shows only three changes: the
  `cbOpenChokeCount_le` body, the two inserted helpers, and a `classical` line added before B3's `sorry`. The frozen statement
  text is unchanged.

**Instrument sides / difference index.** None. N1 is rank-free and graph-generic. No `(WID)`/`(HALL)` aggregate and no `Δ_p` row
quantity occurs, in the return or here. The fidelity items that bear on N1 are these: the active-tag weight is read literally
(witness present, `B.erase v`); the tag set is `C5LA1.leafSet`, as the frozen text states (bridged to `favorableLeaves` at `p*`
by C2-LA3, which is cited, not re-derived); and `F` is derived, not assumed, in my instrument (degree-1 vertices). The seat hard
codes `leaf_set(m)`; this is recorded below. Numeric rows at 107 and 158 are identity checks with no rank index. Gate ruling 29's
REJECT does not apply: the seat wrote "no `Δ_p` difference index applies" and gave the reason.

## Attacks and findings

1. **Main finding (critic-derived advance): N1 is closed in critic scratch, all four frozen declarations, sorry-free.**
   - The file is `scratchpad/c4-crit-T1-F/LeanProject/LeanProof/Statements.lean`, SHA-256
     `ddfbc61d2a0b5e022a72966dd1678e9b576fe6a7705e30f56249b9f27e688a98`. It is the frozen file with bodies filled and helper
     declarations inserted.
   - `diff` against `control/C4-FROZEN-STATEMENTS.lean` removes exactly four lines, each `  sorry`, and adds only lines.
   - A programmatic extraction confirms that each of the four statement texts (docstring and `open Classical in` through `:= by`)
     is **byte-identical** to the frozen text (gate ruling 23).
   - `lake build LeanProof` on the controller base cache exits 0 with "Build completed successfully (8661 jobs)" and 16 `sorry`
     warnings (20 − 4). Log: `build-crit-N1.log`, SHA-256 `685866ee5643fbb34f7a6f74cf7d13914fee690ec4b14536f5359de449521b91`.
   - `#print axioms` gives exactly `[propext, Classical.choice, Quot.sound]` for `cbOpenChokeCount_le`,
     `cb8_rFree_deletionClasses`, `cb8_rFree_insertionClasses` and `cb8_nonChokeInsert_weight`. The control line
     `cb8E1Arc_spec_topRank` (N2, still `sorry`) prints `sorryAx`, which shows the printer is live. Log: `axioms-crit-N1.log`,
     SHA-256 `147754f1b3424fc8cbc3ac40d1143d49b91f6152c770e19435a9bc9bd63e9cdd`.
   - No `native_decide`, `decide`, `set_option`, `admit` or enumeration stands in for a universal step. The reserved name occurs 0
     times.
   - **Proof sources:**
     - `cbOpenChokeCount_le` is T1's body.
     - B3 uses T1's two compiled helpers, assembled by this critic.
     - B1 and B2 are this critic's work, through the helpers `critLeaf_not_choke`, `critActive_iff`, `critEllClass`,
       `critAdj_cases`, `critIndep_insert`, `critFree`/`critPartnerVal` with `critPartner_{spec,free,invol,adj}`,
       `critFree_nbr`, `critFree_not_choke`, `critFree_not_active` and `critE_free`. All of these are ungraded scratch.
     - B2's conjunct 3 uses a free-zone partner involution: the ternary insertions, `E` and `φ(E)` partition `U`. This is not the
       seat's clone-correspondence text, and U1's decomposition was not read.

2. **The seat's B3 blocker diagnosis is factually wrong (record correction).** The return attributes the failure to "the frozen
   statement's `if` … elaborated under this file's `open Classical in` at the declaration site". But the frozen B3
   (`cb8_nonChokeInsert_weight`) carries **no** `open Classical in`. The only `open Classical in` lines in the frozen file are
   at lines 29 (B1), 51 (B2), 117 (`cb8GSec`) and 216.
   - My assembly compiles with no instance trouble. It uses `Finset.inter_insert_of_mem`/`inter_insert_of_notMem`,
     `Finset.filter_insert`, `by_cases hd`, `simp only [hd, hzL, …]`, `Finset.card_insert_of_notMem` and
     `Finset.filter_congr` with T1's helper 2 and the witness fact from helper 1.
   - The attack brief's suggested `split_ifs` also elaborates, but its case order and hypothesis polarity are easy to mis-assign.
     My first attempt failed on that, not on decidability.
   - The seat also inserted a bare `classical` before B3's `sorry` (diff line 132), which is irrelevant.
   - **Strike** the causal explanation, "decidable-instance mismatch … not obviously defeq-transparent-to-`omega`", as unbacked:
     no compiler log of it ships in scratch.
   - The helpers do say what B3 needs, as the brief asks. Helper 1 says every witness of a leaf has label `0` or a choke label.
     Helper 2 says activity is invariant when `z` is not a witness. Together they suffice.

3. **The 61,263-row check is one instrument, not two, except for B1's `(q, w, ℓ)` cross-check.**
   - **Shared transcription.** Side A and Side B share the script's own edge transcription and label arithmetic. `F = leaf_set(m)`
     is **hard-coded**, not derived. `support_of_leaf` is label arithmetic.
   - **Where the two sides are real.** B1 compares construction-derived `(w, ℓ)` with the graph-generic `activeWeight` on the same
     transcription. That is a genuine cross-check of the regime lemma against the literal definition; it did catch the seat's
     witness-absent bug.
   - **B2 and B3 are one-sided.** Each is a single graph enumeration compared with the formula.
   - **Vacuous rows.** 4 rows (`cbOpenChokeCount_le` at m = 1, 2, 107, 158) write `"q_le_m": True` as a literal. A generator that
     writes the answer in does not derive it. Strike those rows as evidence. Derived rows: 61,259.
   - **Exhaustive at m = 1 for B1 and B2 only.** The 20,451 sets are all `r`-free independent sets of CB(8,1), a fact my
     independent 2^20 enumeration confirms.
   - **B3 at m = 1 is sampled.** It has 19,937 rows: sets with no admissible non-choke insertion are skipped, and each row uses
     ONE random `z`, restricted to independent `r`-free `A` with `insert z A` independent. B3's frozen domain is strictly larger.
   - **Class rows.** 40 draws from the structural generator at 107 and 158. It covers sets of the model's own shape only, and says
     nothing about 110, 161 or 164.
   - **Narrowing.** The return's "Two independent sides per row" becomes "one instrument with an internal B1 cross-check; B1/B2
     exhaustive at m = 1; everything else sampled". My instrument and the Lean proofs supersede it as evidence.

4. **Informal derivation.** The return's B1/B2 derivation is correct, and my Lean proofs confirm it. Two points it states loosely:
   - The ℓ-injection's injectivity needs independence (`s ~ v`, `b_ij ~ c_ij`). The return mentions this in the regime paragraph
     but not at the injection.
   - Its B2 ternary count is stated per-slot without the partner argument that makes it an equality.

   Its "complete, precise informal proof" is acceptable in substance. It is now moot: the statements compile.

5. **Hypotheses and ℕ-subtraction.**
   - `hm : 0 < m` enters through entry 60, since at `m = 0` the root is a leaf.
   - `hr` enters in B1 and B2 by making `v` inactive and excluding `r` from the ℓ-set.
   - `hB`/`hA` enter in the injections and the insertability characterization.
   - B3 needs neither independence nor `hr`. I checked this on its full domain at m = 1 and it is proved without them.
   - The frozen texts are subtraction-free. My proofs use `ℕ` subtraction only inside decode maps `((z.val − 3)/17, …)` on
     vertices with `z.val > 2`. These are guarded by the value facts in every `omega` step and never appear in a statement.
   - The `(m − q)` count is obtained additively (`card_filter_add_card_filter_not`), not by truncated subtraction.

6. **Process.**
   - The seat's two interruptions, its shell PIDs 42935 and 14918 (confirmed dead by `ps -p`), and the harness task `bjmrno5am`
     stopped through the harness tool rather than a literal-PID kill are all disclosed. The last is a disclosed deviation from
     "kill by literal PID only", with no mathematical consequence. I cannot verify it without a full process listing, which I did
     not run.
   - The final scratch, logs and RETURN.md agree. The build log names 8661 jobs, which my replay reproduces. The zero-byte
     `build-sanity.log` is disclosed.

## Mechanism-equivalence and fence check

- **Mechanism.** The seat's mechanism is the clone correspondence: an `r`-free independent set is read as a per-choke choice.
  It is the route's allocated token. It is not a refuted mechanism: it has no `clone_fiber_card`-style truncated count, since
  the frozen texts are subtraction-free. My proofs use a label-arithmetic activity characterization and a partner involution.
  Neither revives any mechanism on SOLUTION-CONTRACT §3.6's list.
- **Fence 1.** N1 is rank-free and graph-generic ("Any rank"). Nothing here asserts anything at `p*`, about (HALL), or outside
  CB(8, m). Class-row numerics (107, 110, 158, 161, 164) are identity checks, not class claims.
- **Fence 3.** No Darroch or Newton is used anywhere.
- **Fence 7.** Neither the seat's 61,263 rows nor my sweeps are proof. The universal statements now rest on the kernel, pending a
  governed award.
- **Fence 4 and the carries.** No template-versus-network reduction is involved. The carried definitions used are entries 6, 15,
  16 and 23–26 and `cbOpenChokeCount`, all byte-identical to the base.
- **Ruling 30.** My proof is attributed to this critic. It neither consumes nor claims U1's decomposition, which I did not read.

## Certification audit

- **"compiled" (`cbOpenChokeCount_le` and the two helpers):** BACKED. The build log and axioms log exist, the digests match, and
  the replay is byte-identical.
- **"0 errors, Build completed successfully (8661 jobs)":** BACKED by the log and my replay.
- **"axioms `[propext, Classical.choice, Quot.sound]` … matches gate ruling 25":** BACKED.
- **"byte-for-byte statement":** BACKED for `cbOpenChokeCount_le` (diff).
- **"61,263 rows, 0 failures":** BACKED as a replayable count, NARROWED as described in finding 3. The 4 literal rows are struck;
  "two independent sides" becomes one instrument; B3 was never exhaustive.
- **"exhaustive at m = 1":** BACKED for B1 and B2 (20,451 is the complete set). NOT backed for B3.
- **"decidable-instance mismatch … `open Classical in` at the declaration site":** STRUCK. The premise is false; see finding 2.
- **"3 of 4 declarations remain `sorry`" / `FROZEN_NODES_CLOSED: none`:** CORRECT for the return as shipped.
- **"route verdict `compiled`":** BACKED.
- **Critic's own literals.** Every digest in this critique was copied from `shasum -a 256` or `hashlib` output of files in my
  scratch. "sorry-free" and "compiled" here refer to critic scratch, which is ungraded (SOLUTION-CONTRACT §4). I apply no
  `formally_verified` label.

## Verdict

verdict: retained_narrowed

headline_resolved: no

- `COND4_formal`: no. Conjunct 4 remains open: N2–N8 are still `sorry` on the base.
- `E1_formal`: no. N2 (`cb8N_sum_eq_cb8R`, `cb8E1Arc_spec_topRank`) is not compiled. Its N1 input is now compiled in critic scratch.
- `TERMINAL_integration`: no.
- `cut_candidate`: none. No counterexample to any N1 text was found by my exhaustive m = 1 checks (B1/B2 on all 20,451 sets; B3 on
  all 9,437,184 frozen-domain pairs), by the sampled class rows, or by the kernel.
- `FROZEN_NODES_CLOSED: N1`

The N1 closure on that line is critic-derived, in `scratchpad/c4-crit-T1-F/`. The assigned return itself closes none; it
compiled 1 of 4 N1 declarations.

**Why retained_narrowed.** The seat's compiled content, its derivation and its `compiled` verdict stand. Three things are
narrowed or struck: the instrument's "two independent sides" and "exhaustive" language, the 4 literal rows, and the B3 blocker
diagnosis. The mathematics of all four N1 statements is complete: I compiled them sorry-free on the frozen text. By the
contract, that is compiled scratch with no grade until a governed award closes. The headline, a formally verified Tier 1 or a
confirmed cut, is untouched.

## Remaining obligation

- **N1 (successor or Stage 7).** Nothing mathematical remains. A governed award must re-author the four declarations and the
  helper lemmas under attribution:
  - `cbOpenChokeCount_le`: T1.
  - B3's two helpers: T1.
  - B3's assembly, B1 and B2 with their helpers: critic C-T1-F.

  The award must take them from the critic scratch file (`ddfbc61d…`), with an isolated second read and receipt-bound carries of
  entries 6, 15, 16, 23–26, 33–42, 57, 60, 69, 70. The B2 conjunct-3 proof depends on the definitions `critFree` and
  `critPartnerVal`. A panel may prefer to inline them, or U1's dual decomposition (ruling 30) may supply an alternative.
- **N2 is the next node on the E1 critical path.** `cb8N_sum_eq_cb8R`, then `cb8E1Arc_spec_topRank`, which can now cite N1 as
  compiled statements, including the companion `cbOpenChokeCount_le` for its `m − q` and `p* − q` subtractions. N3–N8 are
  unaffected by this critique.
- **Judgement of the return's own `## Remaining obligation`.** Items 2–4 are exact. Item 1 is feasible as a plan but carries the
  false diagnosis struck above.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-T1-F/`.
There are no background jobs; every build and script ran in the foreground.

**Critic N1 closure**
- `LeanProject/LeanProof/Statements.lean` — `ddfbc61d2a0b5e022a72966dd1678e9b576fe6a7705e30f56249b9f27e688a98`.
- `LeanProject/LeanProof/AxCheckCritT1F.lean` — `9fb60bb9c91e7d8c03be00846e621cab00a29f4b64eb2d44041314e841010bf6`.
- `build-crit-N1.log` — `685866ee5643fbb34f7a6f74cf7d13914fee690ec4b14536f5359de449521b91`.
- `axioms-crit-N1.log` — `147754f1b3424fc8cbc3ac40d1143d49b91f6152c770e19435a9bc9bd63e9cdd`.

**Replay of the seat's work**
- `build-replay-T1.log` — `976619b4cf63a339e11d471d7c8f7d97ac5600be02bb46bc91f962b879b6e0df`.
- `axioms-replay-T1.log` — `68197ff8ff758bcb875e5c7ac1e847ab74dbd3143293d12a83e03356b1bd4f62`, identical to the seat's.
- `replay/n1_verify.py` (copy of the seat's, `fe41c70c…`) and `replay/n1_verify_results.json` —
  `e9f556a77015e82af70b8008c734aff527f887b219c60e48ab15b796f99c9bef`.

**Critic Python instrument and mutation controls**
- `py/crit_n1.py` — `ec73763141ba0aa8f735eaba38c2ca5463c76881179780387d7512ac81bedf59`.
- `py/crit_n1.out` — `8572bb881d7b1850ef635c55832d8ed671da23bbd142ed7633aabaf887bd8bf9`.
- `py/crit_mutants.py` — `b4ceb7f2b6010b4354f30c547b7e88dbe20c5953629c312f6db256f35ea5f6df`.
- `py/crit_mutants.out` — `d9f0c66990bdde0a9564d7d9cfa9730ceaeb76d8668bc5cf76e8c36d3a754ea6`.

Replay command: `cd <run root>/scratchpad/c4-crit-T1-F/py && python3 -B crit_n1.py && python3 -B crit_mutants.py`.

**Drafts (not built by `lake build LeanProof`)**
- `drafts/CritN1.lean` — `f77c99766a357a689fe095dd962de7efc8044d49663f7af2183e002e2d5b6843`.
- `drafts/CritB2.lean` — `2999824c05487a99634548783871f29de1d97fbef98c1846d3788297defda609`.
- `drafts/CritB3.lean` — `0e9bac5cea5ea574b9b9cfb523c47e0f55e0b572f78203a3e6044e5de19a04df`.

A stale `CritN1.olean` from the draft stage remains in this project's `.lake/build`. It is not imported by `LeanProof.lean`.

**Project setup**
- `LeanProject/` holds copies of T1's base files, which are byte-identical to `sources/c4-base`.
- `.lake/build` was copied from the controller base cache (CF-C4-S3-1).
- `.lake/packages` is a manual symlink to the pinned shared Mathlib (`905b9581…`, Lean v4.32.2). I never ran `lake update` or
  `lake clean`.
