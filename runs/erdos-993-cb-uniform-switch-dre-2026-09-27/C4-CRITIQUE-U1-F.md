# Critique

**Critic:** `C-U1-F`, orientation F (falsify), Cycle 4 Stage 4 of r31. **Seat critiqued:** U1, route `C4-U-01`,
mechanism `E1-UPCOVER-COUNTS-VIA-ADJACENCY-AND-SPEC-DISCHARGE`, orientation U. **Return:**
`cycles/cycle-4/stage3/returns/U1/RETURN.md` (SHA-256 `7699954403899c8ee0a6053d6f8e866d5629e5b87f22e2c5e398c869dd48210e`).

**Boot.** I am operating within VerityOS under the dispatch's RESTRICTED BOOT clause. I read exactly
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the dispatch
`control/dispatch/c4-stage4/DISPATCH-C-U1-F.md`. I opened no other VerityOS subsystem file (memory, conversations, operations,
decisions, logs, skills and modules were not loaded). The host auto-injected the root `CLAUDE.md` and the user auto-memory index
into context. I did not open or act on either, and I disclose them here.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- Dispatch `DISPATCH-C-U1-F.md`: `shasum -a 256` = `2528a1d9645ae5d89c91ef3ea2d8b434ce71a89abba42190e919e251d22368d3`, which matches the value given at invocation.
- **Capsule seal** (`control/c4-critic-capsules/U1-PACKET-MANIFEST.json`, canonical JSON without `seal_sha256`, sort_keys,
  `(",",":")`, no trailing newline): recomputed `eec166f08acbb52f3d628b2bc08322fa4004506e7b3508c350d7f9fe26ca6799`, which matches.
  All 16 listed files match on both SHA-256 and byte count.
- Stage 4 dispatch manifest seal: `040448e1cdf94fa8a669364b4cdcbcc01bbd8f65a02eba056eb0f9856200e023` (matches). Stage 3 packet
  manifest seal: `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e` (matches). Stage 2 packet manifest seal:
  `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387` (matches the protocol's value).
- `control/C4-FROZEN-STATEMENTS.lean` = `0fc723d7…39ede1`. This equals ruling 23, its Stage 2 manifest entry and
  `sources/c4-base/LeanProject/LeanProof/Statements.lean`. All five base `.lean` files and the four project files match their
  Stage 2 digests.
- **Every digest the return lists, recomputed:** build log `build-attempt4.log` `8198e6f1…f98dcd85` ✓; axiom log
  `axioms-u1-final.log` `97185461…fefcc` ✓; `AxiomCheckU1.lean` `835c5413…cdf13` ✓; edited `Statements.lean` `75388bec…a4cd` ✓;
  generator `verify_cb8N_sum_eq_cb8R.py` `a61dbe66…6c2` (both copies) ✓; output `cb8N_sum_eq_cb8R.out.json` `19d6e824…bacc` ✓;
  the inner `sha256_of_canonical_result` `11b0c848…15d7` is reproduced by my replay (below) ✓. The seat's copies of
  `Main/ChokeState/E1FlowConstruction/C3LA1.lean`, `LeanProof.lean`, `lakefile.toml`, `lake-manifest.json` and `lean-toolchain`
  are byte-identical to `sources/c4-base` ✓.
- Identity: the route ID `C4-U-01` and the mechanism token appear verbatim in the return. The orientation U and the owned nodes
  (N1 dual per ruling 30, and N2) match `control/C4-ALLOCATION.md`. The seat model is "chartered sonnet/high; runtime claude-sonnet-5",
  consistent with the allocation.
- **Admission defect for U1** (`FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN`): the only occurrence is on return line 316, "these are
  **not** `formally_verified` and I do not call them that". That is a negation, and the return applies no such label to its own
  scratch. **Adjudicated: no strike needed.** The return never grades its scratch, which is correct under SOLUTION-CONTRACT §4.

## Independent re-derivation

**Instrument 1: Lean rebuild, copy-out-first.** I built `scratchpad/c4-crit-U1-F/LeanProject` as follows. I copied the base from
`sources/c4-base` byte for byte. I copied the controller cache `scratchpad/c4-base/LeanProject/.lake/build` under CF-C4-S3-1; I
used neither `--no-cache` nor the seat's cache. I bound `.lake/packages` by manual symlink to the pinned shared Mathlib. I ran
`cd` into the project before every `lake`/`lean` call. The results:
- The frozen base builds with exit 0, 8661 jobs and **20** `sorry` warnings (`build-base.log`).
- With the seat's `Statements.lean` and `AxiomCheckU1.lean` dropped in, it builds with exit 0, 8661 jobs and **18** `sorry`
  warnings (`build-U1.log`). This matches the return.
- `#print axioms` on the replay is byte-identical to the seat's `axioms-u1-final.log` (same digest `97185461…`).
  `cbOpenChokeCount_le`, `cb8N_eq_e1S_natCast` and `cb8N_sum_eq_cb8R` depend on `[propext, Classical.choice, Quot.sound]`.
  `cb8E1Arc_spec_topRank` still depends on `sorryAx`.
- **The two compiled claims are confirmed by replay.**

**Byte identity (gate ruling 23).** I extracted, by script, the text from each theorem's name to `:= by` for all 20 frozen
theorems in the seat's `Statements.lean`, plus the `cb8GSec` definition. All are byte-identical to
`control/C4-FROZEN-STATEMENTS.lean` (`bytecompare.py`). The only non-body changes are an added
`import LeanProof.C3LA1` and the inserted helper `cb8N_eq_e1S_natCast`.

**Does the added import change what the frozen statements mean?** I dumped, with `set_option pp.all true`, the elaborated types
and `Expr.hash` of the four N1 declarations and both N2 declarations twice: once under the frozen `Statements.lean` (no C3-LA1
import) and once under the seat's copy. The two dumps are **byte-identical** (`typedump-A-frozen.log` = `typedump-B-U1.log`,
both `da6b6d6e…`). The hashes are equal: `cbOpenChokeCount_le` 2076683717, `cb8N_sum_eq_cb8R` 2294426436, `cb8E1Arc_spec_topRank`
3018332831, B1 3011792050, B2 3853772259, B3 1854512823. So the import is a disclosed divergence of the file, not of any
statement.

**Instrument 2: my own exact Python (`crit_u1f_instrument.py`, standard library, Fractions).** I transcribed it from the Lean
definitions (`cbEdge`, `activeWeight`, `tagWitnesses`, `cbOpenChokeCount`, `cb8N`, `cb8R`, `cb8Rho`, `cb8E1G`, `cb8H`,
`cb8E1Val`, `cb8E1Arc`) under Lean conventions (`toNat`, `x/0 = 0`, ℕ truncation). I did not use the seat's script. Output
digest `ccd6a432…`; canonical-result digest `820f7342…`.
- **Part A (`cb8N_sum_eq_cb8R`).** 19,375 small checks (`a, b ∈ [0,24]`, `k ∈ [−3, a+b+3]`), with side B computed as polynomial
  coefficients by repeated multiplication, which never touches the binomial formula. A further 1,770 class-scale checks
  (`a = 8q−1`, `b = 8(m−q)+1`, every `q ∈ [1,m]`, `k ∈ {p*−q−1, p*−q, p*−q+1}` at `m = 107, 158, 161, 164`). **0 failures.**
  The off-by-one mutant (sum over `range a`) is caught 486 times.
- **Part B (clone-level E1 value arithmetic at the rows of ruling 27).** I checked control row 107, fresh rows 158 and 164, and
  structural row 161, with `p*` written textually as `(16*107+4)/3 = 572`, `(16*158+4)/3 = 844`, `(16*161+4)/3 = 860` and
  `(16*164+4)/3 = 876`. For every `q ∈ [1,m]` I tested:
  - nonnegativity of both branch values of `cb8E1Val` for every type `α ∈ [0, a+2]`: **0 negatives**;
  - the row identity for every feasible source type: 21,967 / 47,844 / 49,675 / 51,541 types, **0 failures**;
  - the column identity `(8q−w)·Gval + 2(b−ℓ′)·Tval = ρ_q·w` for every feasible target type: 21,990 / 47,877 / 49,709 / 51,576
    types, **0 failures**.
  Mutants are caught: dropping `w` from the ternary value fails 1,501 rows, and evaluating the column at `j − 1` fails 1,520.
  **Fixed point:** the instrument's `cb8Rho` reproduces SEMANTIC-CONTRACT §5's `ρ_1 = 1354839571516225/1361543988640524` at
  `CB(8,95)/508` exactly (`fixedpoint.out`).
- **Part C (literal CB(8,m) network, tag set `leafSet`).** CB(8,1) is exhaustive: all 33,573 independent sets. CB(8,2) and
  CB(8,3) are random samples of 4,000 and 2,000 sets. I checked the N1 texts: B1's five conjuncts (20,451 / 2,823 / 1,365
  `r`-free sets), B2's three conjuncts, and B3's two conjuncts (121,682 / 29,185 / 21,096 insertions), with **0 failures**. I also
  checked the literal N2 row sums (clause 3), the column sums (clauses 4 and 5), and nonnegativity (clause 1) at rank
  `p = |B| − 1` (rows) and `p = |A|` (columns). Column failures: **0**. Negative values: **0**. Row failures: **8**, all at
  CB(8,1) with sets `{u_1, c_1j}`, rank `p = 1`, `q = 1`, so `j = p − q = 0` (`diag_rowfail.py`). This point lies outside the
  domain `1 ≤ j`. On the class, `j = p* − q ≥ p* − m ≥ 1`, so these points are not counterexamples to the frozen N2, which is
  pinned at `p*`. They show that the class-domain hypothesis `1 ≤ j` is load-bearing (see Attack A3).
- **Replay of the seat's generator, copied out first** (`replay/`): stdout is byte-identical to the seat's
  `cb8N_sum_eq_cb8R.out.json` (`19d6e824…`), and `sha256_of_canonical_result` = `11b0c848…` is reproduced. The seat's side B is
  convolution and its side A is the literal type-sum, which are two genuinely distinct code paths.

**Instrument 3: the open step, attempted in Lean (critic-derived; see Attacks A6).**

## Attacks and findings

**A1. The C3-LA1 import (fidelity).** The seat's `Statements.lean` differs from the frozen file by `import LeanProof.C3LA1`. The
statement bytes are unchanged, and the elaborated types are unchanged: a `pp.all` dump and hashes on both sides, done by me.
**Finding: benign for statement identity. Not struck.** The disclosure is accurate. Any Stage 7 award that transplants these
proofs must carry the same import, or move the bridges into an imported module. Ruling 24(2) already places C3-LA1 in the base.

**A2. Clause (1) reduction: over-dependency, and a missing sign argument.** The return reduces clause (1) to
"numerator nonnegativity" because `x/0 = 0`. It then cites N1's `w ≤ 8q` (B1, conjunct 4) for `α ≤ a`. Two corrections follow.
- The ternary denominator is `((j − α : ℤ) : ℚ)·cb8N`. The factor `j − α` can be negative in ℤ. The return's argument is
  incomplete until it notes that `cb8N a b α j = 0` whenever `α > j` (the guard `(α:ℤ) ≤ k` fails), so the value is then `0`.
- By the same guard (`α ≤ a`), clause (1) **needs no N1 input at all**. If `α > a`, the denominator vanishes. Otherwise,
  C3-LA1's `e1G_nonneg`/`e1H_nonneg` apply, given only `1 ≤ p* − q ≤ 8m+1`, which follows from `cbOpenChokeCount_le`.

I compiled this; see A6. **Finding: the reduction stands narrowed. Its N1 dependency is struck as unnecessary.**

**A3. Clause (3) reduction: two inexact steps.** The return says "`ℓ = j − α` holds *exactly*" and that the row sum equals
`w` "iff `cb8N = cb8E1G + cb8H`", which is "exactly `e1_rows_identity`". Three corrections follow.
- (i) With `α = w − 1` in ℕ, `ℓ = j − α` fails at `w = 0`, where `ℓ = j + 1`. This is harmless only because `cb8E1Val`
  returns `0` when `w = 0`, which the return does not note.
- (ii) **The degenerate row `ℓ = 0` (every non-choke vertex of `B` active, `j = α`) is not covered by `e1_rows_identity`.**
  Lean evaluates the ternary term as `0·(x/0) = 0`. The row closes only because `G_j = S_j` and `H_j = 0`, which is
  **`e1_saturation`**. The return cites that lemma only for clause (4). The case is live on the class: at `m = 107`, sources
  with `ℓ = 0` exist for every `q ≥ 64`.
- (iii) The "iff" also needs `cb8N(α, j) ≠ 0`, which rests on B1's conjuncts 4 and 5, and needs `1 ≤ j`, which Part C
  shows is load-bearing.

**Finding: the sketch is inexact as written. It is narrowed to the corrected version I compiled (A6).**

**A4. Clause (4): the bookkeeping the return declined to certify.** I derived it independently. For a target of type `α = w − 1`
(weight `w ≥ 1`, `ℓ′ = j − w` ternary vertices):
- there are `8q − w = a − α` Boolean up-covers, each of source type `α + 1` and value `G(α+1)/N(α+1)`;
- there are `2(b − ℓ′) = 2(b − (j−1−α))` ternary up-covers, each of source type `α` and value `w·H(α)/((j−α)·N(α))`;
- chokes contribute `0`, and `r` is excluded.

The literal column is therefore **exactly `(α+1)` times C3-LA1's `e1_column_inflow_clone` expression**. The degenerate columns
`α = a` and `ℓ′ = b` are handled by that lemma's `if` guards, because the literal counts vanish there. The `w = 0` column is 0,
since `G(0) = 0`. The return's instinct to distrust its own sketch was right, but no error surfaced. **Finding: confirmed and
compiled (A6).**

**A5. The informal sketch of B1 invokes N6.** Return lines 87–89 use U2's open N6 `cb8_activeWeight_leafSet_eq` for the active
count. The frozen B1 conjunct 2 equates a filter card with `activeWeight` directly and does not need N6. **Finding: an avoidable
cross-node dependency in the prose, flagged so that N1 is not made to rest on N6. Nothing compiled uses it.**

**A6. Critic-derived advance: attempting the step the return leaves open.** I report these results as my own. They are
ungraded scratch and need an isolated second read. File: `scratchpad/c4-crit-U1-F/LeanProject/LeanProof/CritU1F.lean`
(`459e9f67…`), built on the seat's `Statements.lean`. The build exits 0 (`build-crit-final.log`). The audit
`CritU1FAudit.lean` runs `#print axioms`, a transitive search for every declaration whose own body contains `sorryAx`, and an
`Expr` equality check against the frozen declarations.

| Critic declaration | What it is | Axioms | `sorry`-bodied leaves reached |
|---|---|---|---|
| `crit_cb8Rho_eq_e1Rho`, `crit_cb8E1G_eq_e1G`, `crit_cb8H_eq_e1H` | the `cb8Rho/cb8E1G/cb8H` ↔ `e1Rho/e1G/e1H` bridges for `n ≥ 1` (return's obligation 2) | propext, choice, Quot.sound | none |
| `crit_cb8E1Val_nonneg` | every `cb8E1Val` is `≥ 0` for `m+1 ≤ p ≤ 8m+1` | same | none |
| `crit_cb8E1Arc_spec_clause1` | **N2 clause (1), outright** | same | none |
| `crit_row_value`, `crit_column_value` | value-level cores of clauses (3)/(4), including the `ℓ = 0` saturation case and the degenerate columns | same | none |
| `crit_cb_tagWitness_root_or_choke` | every tag witness of a CB leaf is `r` or a choke | same | none |
| `crit_cb8_nonChokeInsert_weight` | **N1 (B3), outright**; body after the name byte-identical to frozen B3, elaborated type `==` the frozen declaration's | same | none |
| `crit_cb8E1Arc_spec_clause3` | N2 clause (3) | + `sorryAx` | `cb8_rFree_deletionClasses` only |
| `crit_cb8E1Arc_spec_clause4` | N2 clause (4) | + `sorryAx` | `cb8_rFree_deletionClasses`, `cb8_rFree_insertionClasses` only |
| `crit_cb8E1Arc_spec_topRank_modN1` | **the whole frozen N2 body**, byte-identical after the name, elaborated type `==` `cb8E1Arc_spec_topRank` | + `sorryAx` | `cb8_rFree_deletionClasses`, `cb8_rFree_insertionClasses` only |

Clause text: each of clauses (1), (3) and (4) restates the frozen `let` prefix and the frozen conjunct verbatim (`bytecompare.py`).
Clauses (2) and (5) reuse the seat's discharges. The consequence: **N2 is complete modulo exactly N1's B1 and B2 frozen
statements**, through C2-LA3's governed `cb8_favorableLeaves_eq_leafSet_topRank`. **B3 needs nothing.** The return's claim
"B3's reduction is exact and short" is thereby confirmed, by me. No `native_decide`, `decide`-by-enumeration, `admit` or
`set_option` appears in any critic proof.

**A7. Other attacks, all negative.**
- ℕ subtraction in clause (4)'s `(16m+4)/3 − q` and `m − q` is safe through `cbOpenChokeCount_le`, as ruling 24(4) says. I
  used it explicitly.
- Circularity: clauses (2)/(5) are unconditional structural facts. No compiled clause assumes an open one.
- The `cb8N_eq_e1S_natCast` case analysis is correct. Outside `cb8N`'s extra guards, a binomial factor on the `e1S` side
  vanishes (checked in the build and in Part A).
- No Newton or Darroch anywhere. No asymptotics.
- The endpoint `m = 107` is covered: Part B includes it, and the Lean proofs use only `107 ≤ m`.

## Mechanism-equivalence and fence check

- **Mechanism.** `E1-UPCOVER-COUNTS-VIA-ADJACENCY-AND-SPEC-DISCHARGE` is the literal lift of C3-LA1's clone transport through
  per-vertex adjacency counts. That is distinct from T1's clone-correspondence route (ruling 30). It revives none of the refuted
  mechanisms of SOLUTION-CONTRACT §3.6: it has no `m`-independent per-choke certificate, no compression lemma, and no
  forest real-rootedness.
- **Fences.** Fence 1: one rank `p*`, `d = 8`, the class `m ≥ 107`, `m ≡ 2 (mod 3)` only. B3 and the value lemmas are
  rank-generic facts on the tree or the clone algebra, not (HALL) claims. Fence 2: the selector is derived; `F = favorableLeaves`
  is replaced by `leafSet` only through the governed C2-LA3 terminal. Fence 3 holds (Darroch/Newton-free). Fence 7: my
  numeric sweeps are discovery and test, never proof; the universal content is carried by the Lean proofs. The `θ*` law is
  absent. No status moves to any aggregate key.
- **Registry keys touched.** `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` stays
  `proved_informal`, with no grade change. `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` and
  `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` stay OPEN, unchanged. No `E993-R31-` candidate is proposed by the
  return or by me. The `crit_*` names are proof internals. The registries are not in my capsule and were not opened, so there
  is no alias check beyond noting that no claim is proposed.

## Certification audit

- The return's "machine-verified sorry-free" for `cbOpenChokeCount_le` and `cb8N_sum_eq_cb8R` (lines 77–78, 145, 206–210):
  **backed** by my rebuild and axioms replay. The label "sorry-free" is exact. No grade is claimed, which is correct.
- "exit 0, 0 errors, 8661/8661 jobs": the seat's log shows "Build completed successfully (8661 jobs)" but no exit-code line.
  **Backed by my replay** (exit 0).
- "18 (not 20) warnings": **backed**.
- "`#print axioms` on `cb8E1Arc_spec_topRank` still reports `sorryAx`": **backed**.
- "1215/1215 … 0 failures", "64/96 mutant": **backed** by replay. The return's JSON excerpt omits two keys of the hashed
  record (`failure_rows`, `mutant_expected_to_fail_every_row`). The digest is over the full record and reproduces, so this is a
  presentation gap, not an unbacked literal.
- "exact" at return line 98 ("the exact partition `q + w + ℓ = |B|`") and line 112: these are statement descriptions of open
  B1/B2, not certifications. They stand as descriptions.
- **Struck or narrowed:**
  - "`ℓ = j − α` (which holds *exactly*)" (line 171): holds for `w ≥ 1` only.
  - "the row sum equals `w` iff `cb8N a b α j = cb8E1G + cb8H` … *exactly* C3-LA1's `e1_rows_identity`" (lines 173–174):
    inexact at `ℓ = 0`, where `e1_saturation` is required, and it needs `cb8N ≠ 0` and `1 ≤ j`.
  - "nonnegativity reduces to numerator nonnegativity" together with "hypotheses are exactly `α ≤ a` (i.e. `w ≤ 8q`, **N1's
    own bound**…)" (lines 162–167): narrowed. The sign of `j − α` is handled by the `cb8N` guard, and no N1 input is needed.
- **Gate lines in the return:** `FROZEN_NODES_CLOSED: none` is correct. N1 needs all four declarations, and N2 needs clauses
  (1), (3) and (4).
- Ruling 29 (difference index written textually): the return reports no row-level numeric claim, so the rule is not
  applicable. My own row claims carry `p*` textually.

## Verdict

The two compiled frozen declarations are confirmed by replay: `sorry`-free, clean axioms, statement bytes and elaborated types
identical to the frozen text. The clause (2)/(5) discharges are confirmed. The bounded companion check reproduces. The informal
reduction of clauses (1), (3) and (4) is directionally right but inexact in three places (A2, A3). I have repaired and compiled
it, and N2 now stands complete modulo N1's B1 and B2 only (critic-derived, ungraded, awaiting an isolated second read). Critic
grade on the mathematics: the E1 spec N2 is `proved_informal` given B1/B2, and compiled as scratch modulo those two frozen
statements.

verdict: retained_narrowed
headline_resolved: no

- `COND4_formal`: no
- `E1_formal`: no
- `TERMINAL_integration`: no
- `cut_candidate`: no
- `FROZEN_NODES_CLOSED`: none

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

The following closes N1 and N2 outright, with no new mathematics beyond B1 and B2:

1. **B1** `cb8_rFree_deletionClasses` and **B2** `cb8_rFree_insertionClasses`, sorry-free on the frozen text. These are the
   only `sorry` leaves under `crit_cb8E1Arc_spec_topRank_modN1`. My literal check (CB(8,1) exhaustive; CB(8,2)/(8,3) sampled)
   found no counterexample to either. That is test evidence, not proof.
2. **Transplant.** Move `crit_cb8_nonChokeInsert_weight`'s proof into the frozen body of `cb8_nonChokeInsert_weight`. Move the
   clause (1)/(3)/(4) proofs into the frozen body of `cb8E1Arc_spec_topRank`. The helper lemmas (bridges, `crit_row_value`,
   `crit_column_value`, `crit_cb8E1Val_nonneg`, `crit_cb_tagWitness_root_or_choke`) go before those declarations in
   `Statements.lean`, with `import LeanProof.C3LA1`, or into an imported module. B1 and B2 already precede N2 in the frozen
   file. Then rebuild on the base, diff the statements against `control/C4-FROZEN-STATEMENTS.lean`, and confirm with
   `#print axioms` that only `propext, Classical.choice, Quot.sound` appear. At that point N1 (all four) and N2 (both) close.
3. An **isolated second read** of the critic-derived declarations in A6 before any Stage 7 panel cites them. Critic scratch
   carries no grade (SOLUTION-CONTRACT §4).

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-U1-F/`
(SHA-256):

- `LeanProject/` is a copy of `sources/c4-base` (byte-identical, verified) with the controller cache copied in and packages
  bound by symlink. `LeanProof/Statements.lean` is the seat's copy (`75388bec…a4cd`) and `LeanProof/AxiomCheckU1.lean` is the
  seat's copy (`835c5413…cdf13`).
- `LeanProject/LeanProof/CritU1F.lean` `459e9f67bbb1f150c7d34ba228f3d8aa751ece2a6e0f3c45b92261db3cdab40e` holds the
  critic-derived proofs (A6).
- `LeanProject/LeanProof/CritU1FAudit.lean` `524515b615cf25fb64bfd5f3b610944c2caac6d1687dda3d9673aeb6d60fa45b` runs the axioms,
  the `sorryAx`-leaf search and the type equality.
- `LeanProject/LeanProof/CritTypeDump.lean` `f8f6b201bc7480e81b047d0033ed0a283a4649d4dc345e7e458eee449999c370` produces the
  `pp.all` type dump and hashes.
- Logs:
  - `build-base.log` `da7bbe06…e21`
  - `build-U1.log` `94f34538…2e`
  - `build-crit-final.log` `462f4d15…dac6`
  - `axioms-U1-replay.log` `97185461…fefcc`
  - `typedump-A-frozen.log` = `typedump-B-U1.log` `da6b6d6e…7e48a`
- `crit_u1f_instrument.py` `8bb81c06…12d2` produces `crit_u1f_instrument.out.json` `ccd6a432…6c2b`. `diag_rowfail.py`
  `58d971bf…487f`; `bytecompare.py` `4ebd806b…4bfd`; `fixedpoint.py` `fbf69788…b45` produces `fixedpoint.out` `8341b0a6…651`.
- `replay/verify_cb8N_sum_eq_cb8R.py` (the seat's, copied out, `a61dbe66…6c2`) produces `replay/stdout.txt` `19d6e824…bacc`.
- **Replay:** `cd …/scratchpad/c4-crit-U1-F/LeanProject && lake build LeanProof.CritU1F LeanProof.CritU1FAudit`, then
  `cd …/scratchpad/c4-crit-U1-F && python3 -B crit_u1f_instrument.py`.

**Process disclosures.**
- **Reads outside the capsule list, all within the protocol's grant:**
  - `control/C4-FROZEN-STATEMENTS.lean` (a Stage 2 member the protocol names as readable).
  - `sources/c4-base/…` (Main.lean read by targeted `grep`/`sed` on single files; C3LA1.lean and E1FlowConstruction.lean read).
  - The seat's inventoried scratch (`scratchpad/c4-U1/`, `scratchpad/c4-U1-replay/`), listed non-recursively only.
  - The controller cache `scratchpad/c4-base/LeanProject/` (single-directory `ls`, one `du -sh` of its `.lake/build`, and a
    `cp -R`, per CF-C4-S3-1 and the attack brief).
- I did not read `control/C4-FROZEN-STATEMENTS.md`, the Stage 3 read-boundary disclosures record, the worker common brief,
  other returns, critiques, adjudications, registries, other experiment roots, or the network.
- I ran no `find`, `rg`, recursive `grep` or `ls -R`, and made no installs. There was no `lake update` or `lake clean`.
- One background job (the Python instrument, literal PID 14803) finished before this write; I confirmed it gone with
  `ps -p 14803`. I never ran a full process listing.
