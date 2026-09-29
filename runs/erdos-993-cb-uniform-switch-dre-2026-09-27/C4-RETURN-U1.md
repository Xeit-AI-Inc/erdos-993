# Route Return — U1, r31 Cycle 4

**Route ID:** `C4-U-01`
**Mechanism token:** `E1-UPCOVER-COUNTS-VIA-ADJACENCY-AND-SPEC-DISCHARGE`
**Orientation:** U (formal / structural). **Frozen nodes owned:** N1 (dual, gate ruling 30), N2.

## Boot acknowledgment

Booted VerityOS under the dispatch's RESTRICTED BOOT clause: read exactly
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`
and no other VerityOS file. The startup protocol's own task-type map, memory, conversations,
modules, skills, logs and decisions were not opened; the controller has booted for the run.

## Digest / seal verification

- Dispatch file `control/dispatch/c4-stage3/DISPATCH-U1.md`: recomputed SHA-256
  `ac3f7ad94cd2db4d0b78114a6bdbc5bc0bab9978bc7805d6ebd09a786eae6252` — matches the value given
  at invocation.
- `control/C4-STAGE2-PACKET-MANIFEST.json` inner seal: recomputed SHA-256 of the canonical JSON
  (the manifest without `seal_sha256`, `sort_keys=True`, `separators=(",",":")`, no trailing
  newline) = `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387`, matching the
  manifest's own `seal_sha256` field exactly.
- `control/C4-FROZEN-STATEMENTS.lean`: SHA-256 `0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1` (recomputed with
  `shasum -a 256`) — matches gate ruling 23's cited value and `sources/c4-base/LeanProject/LeanProof/Statements.lean`.
- `control/C4-FROZEN-STATEMENTS.md`: SHA-256 `6aa6dfe5971a187be2be41cc1e350db4beff187ca5b648cdb9aec2edc5eca54b` — matches ruling 23.
- `sources/c4-base/SOURCE-DIGESTS.json`: all 12 listed files (`lakefile.toml`, `lake-manifest.json`,
  `lean-toolchain`, `LeanProof.lean`, `LeanProof/Main.lean`, `LeanProof/ChokeState.lean`,
  `LeanProof/E1FlowConstruction.lean`, `LeanProof/C3LA1.lean`, `LeanProof/Statements.lean`,
  `build-c3la1.log`, `build-root.log`, `axioms-base.log`) recomputed and matched (`ALL MATCH`,
  script inline, see disclosures).
- My own scratch copies of `Main.lean`, `ChokeState.lean`, `E1FlowConstruction.lean`, `C3LA1.lean`,
  `Statements.lean` (before my edits), `LeanProof.lean`, `lakefile.toml`, `lake-manifest.json`,
  `lean-toolchain` under `scratchpad/c4-U1/LeanProject/` were verified byte-identical to
  `sources/c4-base/LeanProject/...` before use (`ALL BYTE-IDENTICAL`).

## IMPORT LIST (standard library only; no network, no installs)

- Python: `hashlib`, `json`, `itertools` (verification scripts; `python3 -B` throughout).
- Lean/Mathlib: no new imports beyond `LeanProof.C3LA1` added to my own scratch copy of
  `Statements.lean` (see "Route-level engineering decisions" below); everything else is the
  Cycle 4 base's own import graph (`LeanProof.Main`, `LeanProof.E1FlowConstruction`,
  `LeanProof.ChokeState`), Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` (pinned,
  read-only, bound by manual symlink), no `lake update`/`lake clean`/`elan`.

## Registered claims touched (named before any computation is offered as evidence)

- `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`):
  touched — this route's work is part of the Lean formalization of the E1 half of this key's
  content (frozen nodes N1, N2). No grade change asserted; the key's grade is unchanged and not
  re-confirmed by anything below (a `sorry`-containing Lean statement is not evidence for an
  already-`proved_informal` key).
- `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN, the run's headline mechanism) and
  `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN): touched only in the sense that
  N1/N2 are two of the eight frozen leaves whose full closure is a precondition for a future
  Tier-1 formal award; nothing here moves either key's status.
- No other §4 key of `SEMANTIC-CONTRACT.md` is touched. No new claim is proposed in the
  `E993-R31-` namespace by this route (see "Alias check" below).

## Step-by-step derivation

### 0. Project setup (mechanical; where the class/base hypotheses enter: nowhere yet)

`scratchpad/c4-U1/LeanProject` was assembled from `sources/c4-base/LeanProject` byte-for-byte
(`lakefile.toml`, `lake-manifest.json`, `lean-toolchain`, `LeanProof.lean`,
`LeanProof/{Main,ChokeState,E1FlowConstruction,C3LA1,Statements}.lean`), then
`.lake/packages` bound by manual symlink to
`/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages`
(never copied). No source under `sources/` was mutated.

### 1. N1 — the up-cover counts, via per-vertex adjacency (the route's assigned decomposition,
distinct from T1's clone correspondence per gate ruling 30)

**Companion `cbOpenChokeCount_le`** (`m : ℕ`, `X : Finset (Fin (17*m+3))` ⊢
`cbOpenChokeCount m X ≤ m`). Hypotheses used: none — `cbOpenChokeCount m X` is, by its
`E1FlowConstruction.lean` definition, `((Finset.range m).filter (fun i => cbVertex m (3+17*i) ∈ X)).card`,
a `Finset.filter` of `Finset.range m`, so its cardinality is bounded by `(Finset.range m).card = m`
unconditionally (`Finset.card_filter_le`, `Finset.card_range`). **This is machine-verified
sorry-free in this route** (§ "What compiled", below).

**B1 `cb8_rFree_deletionClasses`** (an `r`-free independent `B`, rank arbitrary). Where each
hypothesis enters: `hB` (independence) is what makes adjacent labels mutually exclusive; `hr`
(`r ∉ B`) is what makes `v` (whose unique tag-witness is `{r}`, `mem_cb_tagWitnesses_v_iff`,
Main.lean entry 69) *never* active in an `r`-free set — every active leaf in `B` is therefore a
private leaf `c_ij` whose witness `u_i` (`mem_cb_tagWitnesses_leaf_iff`, entry 70) is present,
i.e. an open choke. By the exhaustive label case split `cb_val_cases` (entry 57) every `z ∈ B`
is exactly one of: a choke (`cbOpenChokeCount m B =: q` of them, by definition); an active
private leaf (`u_i ∈ B` for its choke `i`; these total the active-weight filter, and — by N6's
formula `cb8_activeWeight_leafSet_eq`, itself unconditional once `r ∉ B` kills the `[v,r]` term
— number `w := activeWeight (cbGraph m) leafSet B`); or "ternary": everything else. The
adjacency facts `cbGraph_adj_r_choke`/`cbGraph_adj_choke_support` (entries 40–41: `u_i ~ b_ij`)
force every open choke's 8 legs to have no `b_ij` present (so an open choke contributes only to
`q` and to `w`, never to the ternary bucket), giving the subtraction-free bound
`w ≤ 8·q` (frozen as `activeWeight ≤ 8·cbOpenChokeCount`). The adjacency fact
`cbGraph_adj_support_leaf` (entry 42: `b_ij ~ c_ij`) forces at most one of `{b_ij, c_ij}` present
per leg of a *closed* choke, and `cbGraph_adj_s_v` (entry 39: `s ~ v`) forces at most one of
`{s, v}` present; summing over the `m − q` closed chokes (8 legs each) plus the root arm gives
the ternary bound `(ternary count) + 8·q ≤ 8·m + 1`, i.e. `cb8_rFree_deletionClasses`'s fourth
and fifth conjuncts. The first three conjuncts (the exact partition `q + w + ℓ = |B|` with the
choke/active/ternary filters as stated) are the bookkeeping identity behind this same case split.
**Not yet compiled** (see "Remaining obligation").

**B2 `cb8_rFree_insertionClasses`** is the dual counting argument at up-covers of an `r`-free
independent `A`: a Boolean insertion activates an *absent* private leaf at an *already-open*
choke (there are `8q − w` of these, the complement of B1's bound, `hr` again forcing `v` out of
consideration since its witness `r` is excluded by hypothesis from ever being insertable here);
a ternary insertion fills an empty leg of a *closed* choke (`b_ij` or `c_ij`, 2 choices, legal
because the choke's witness `u_i` is absent and, by `cbGraph_adj_choke_support`, inserting `b_ij`
does not conflict with anything already in `A`) or the empty root arm (`s` or `v`, 2 choices,
legal since `hr : r ∉ A` keeps `s` insertable and `v`'s only neighbour `s` may or may not be
present — both branches independent by `cbGraph_adj_s_v`); a choke insertion (`u_k ∉ A`) is
legal only when no `b_kj` is present at `k`, and is not further counted here (it is the E1
value-`0` branch). The exact subtraction-free identities `(Boolean count)+w=8q` and
`(ternary count)+2ℓ'+16q=16m+2` restate this same counting argument at the insertion side.
**Not yet compiled.**

**B3 `cb8_nonChokeInsert_weight`.** The first conjunct (`cbOpenChokeCount` unchanged) is *already
proved, sorry-free*, in the Cycle 4 base as `cbOpenChokeCount_insert_of_not_choke`
(`E1FlowConstruction.lean` lines 34–47) — B3's own frozen text notes this duplication. The
second conjunct needs only that a witness (`r` or some `u_i`) is never itself a non-choke,
non-root vertex (`hz`, `hzr`): so inserting `z` can only ever add `z` to the active count (via
`z`'s own witness, unaffected by `z`'s own insertion), never reactivate an existing leaf, since
that would require `z` to *be* that leaf's witness. **Not yet compiled**, but the reduction to
`cbOpenChokeCount_insert_of_not_choke` (already compiled) is exact and short.

### 2. N2 — the unconditional E1 spec

**Companion `cb8N_sum_eq_cb8R`** (the "(E) expansion identity", the U adjudicator's own
"smallest unproved node of the E1 group", Cycle 3 `ADJUDICATION.md` line 341). No class
hypothesis; this is a pure coefficient identity. Derivation: I proved the pointwise bridge

```
theorem cb8N_eq_e1S_natCast (a b α n : ℕ) : cb8N a b α (n : ℤ) = e1S a b n α
```

against C3-LA1's already-compiled `e1S` (`C3LA1.lean` entry 3): `cb8N`'s guard
`α ≤ a ∧ (α:ℤ) ≤ k ∧ k − α ≤ b` and `e1S`'s guard `α ≤ j` agree on which values are *nonzero*,
because outside `cb8N`'s extra conjuncts (`α ≤ a`, `k−α ≤ b`) the corresponding binomial factor
in `e1S`'s un-gated formula already vanishes (`Nat.choose_eq_zero_of_lt`) — so both sides compute
the same rational number in every case, not merely on the guarded case. From this and C3-LA1's
already-compiled `e1S_sum_eq_coeff` (entry 31: `Σ_{α≤a} e1S a b j α = [X^j]((1+X)^a(1+2X)^b)`,
cast) and `E1FlowConstruction.lean`'s already-compiled `cb8R_natCast_eq_coeff`, the sum
`Σ_{α∈range(a+1)} cb8N a b α (n:ℤ)` equals `cb8R a b (n:ℤ)` for every `n : ℕ`; for `k < 0` both
sides are termwise/definitionally `0` (`cb8N`'s guard `(α:ℤ) ≤ k` fails for every `α : ℕ`;
`cb8R a b k = (polyCoeffZ (…) k : ℚ) = 0` by the already-compiled `polyCoeffZ_of_neg`,
`Main.lean` entry 117). **This is machine-verified sorry-free in this route.**

**`cb8E1Arc_spec_topRank`, the five-clause spec.** Reading `E1FlowConstruction.lean` (a copy of
Cycle 3 U2's file, ungraded scratch but genuinely proof-term-complete) turned up three lemmas
that are *already sorry-free* and align byte-for-byte with two of the frozen clauses:

- **Clause (2)** (shape: any nonzero arc forces `B ∈ I_{p+1}`, `A ∈ I_p`, `r ∉ B`,
  `∃ x ∈ B, A = B.erase x`) is exactly `cb8E1Arc_shape`.
- **Clause (5)** (zero columns when `r ∈ A` or `q(A) = 0`) is exactly the disjunction of
  `cb8E1Arc_zero_of_root_mem` and `cb8E1Arc_zero_of_no_open_choke`.

I discharged both inside the frozen statement (see "What compiled"); clauses (1), (3), (4)
remain open. Their reduction (worked by hand, not yet mechanized):

- **Clause (1) (nonnegativity).** `cb8E1Val`'s two nonzero branches are
  `cb8E1G a b j α / cb8N a b α j` and `w · cb8H a b j α / ((j−α)·cb8N a b α j)` with
  `a = 8q−1`, `b = 8(m−q)+1`, `j = p−q`, `α = w−1` (`q,w` from `B`'s N1 classification).
  Division by `0` is `0` in Lean's convention, so nonnegativity reduces to numerator
  nonnegativity: `cb8E1G ≥ 0` and `cb8H ≥ 0`. Via the pointwise bridge above (extended
  analogously to `cb8Rho a b (j:ℤ) = e1Rho a b j`, not yet written) these transport
  *definitionally* to C3-LA1's already-compiled `e1G_nonneg`/`e1H_nonneg` (entries 49–50),
  whose hypotheses are exactly `α ≤ a` (i.e. `w ≤ 8q`, **N1's own bound**, B1's fourth
  conjunct) and `Σ e1T > 0` (`e1T_sum_pos`, entry 34, needing `1 ≤ j ≤ a+b+1`, a class-domain
  fact already used by `cb8Rho_lt_one_topRank`, itself already compiled).
- **Clauses (3)/(4) (rows, columns).** Summing `cb8E1Val` over `z ∈ B` (clause 3) partitions,
  by B1's own classification of `B`, into `w` copies of the active-branch value plus `ℓ` copies
  of the ternary-branch value; using the identity `ℓ = j − α` (which holds *exactly*, since
  `ℓ = |B| − q − w = (p+1) − q − w` and `j − α = (p−q) − (w−1) = p−q−w+1`), the row sum equals
  `w` iff `cb8N a b α j = cb8E1G a b j α + cb8H a b j α` — which, under the same bridge, is
  *exactly* C3-LA1's already-compiled `e1_rows_identity` (`e1G + e1H = e1S`, entry 40, proved by
  `unfold; ring`, i.e. definitional in the merged form). Clause (4)'s column sum is the dual
  argument over B2's insertion classification of `A`, and should reduce analogously to
  C3-LA1's `e1_in_balance`/`e1_top`/`e1_saturation` (entries 42–44, all already compiled); I
  have not carried this second reduction to the same level of index-by-index confidence as
  clause (3)'s, and say so plainly rather than claim it.

This is a complete, checkable reduction of every open clause of N1 and N2 to (i) B1/B2's own
counting facts and (ii) inputs that are *already compiled, sorry-free* in the Cycle 4 base
(`e1G_nonneg`, `e1H_nonneg`, `e1T_sum_pos`, `e1_rows_identity`, `e1_in_balance`, `e1_top`,
`e1_saturation`, `cbOpenChokeCount_insert_of_not_choke`, `cb8Rho_lt_one_topRank`) — none of it is
asymptotic, none of it invokes Newton or Darroch (SOLUTION-CONTRACT §3.3 fence respected; the
inputs it cites are themselves Darroch/Newton-free per `SEMANTIC-CONTRACT.md` §3).

## Route-level engineering decision (disclosed)

`Statements.lean` as frozen (gate ruling 23) does **not** import `LeanProof.C3LA1` — the
drafter's own "Open questions for the controller" item 2 flags exactly this gap ("C3-LA1 is not
in this base… The gate should fix the Cycle 4 base"). N2's proof needs C3-LA1's `e1S` algebra,
per this route's own charter text ("transporting C3-LA1's e1* algebra to the cb8E1G/cb8H
vocabulary"). I added `import LeanProof.C3LA1` to **my own scratch copy only** of
`Statements.lean` (never to `sources/c4-base` or any sealed file); the library root
`LeanProof.lean` already imports `C3LA1` before `Statements`, so this is consistent with the
existing build order. No frozen statement's name, signature or type changed.

## What compiled (machine-verified; build log and axiom log below)

Working from the controller-supplied build cache (see disclosures), `lake build LeanProof`
completed with **exit 0, 0 errors, 8661/8661 jobs**, with exactly **18** (not 20)
`declaration uses 'sorry'` warnings remaining in `Statements.lean` — down from the frozen
base's 20 — because two declarations are now fully proved:

- `E993Transport.cbOpenChokeCount_le` — **sorry-free**. `#print axioms`:
  `[propext, Classical.choice, Quot.sound]` (no `sorryAx`).
- `E993Transport.cb8N_sum_eq_cb8R` — **sorry-free** (via the new helper lemma
  `E993Transport.cb8N_eq_e1S_natCast`, also sorry-free). `#print axioms`:
  `[propext, Classical.choice, Quot.sound]` (no `sorryAx`) for both.

A third declaration, `E993Transport.cb8E1Arc_spec_topRank`, was restructured as
`refine ⟨?_, fun B A h => cb8E1Arc_shape h, ?_, ?_, fun A _ hcase => hcase.elim
cb8E1Arc_zero_of_root_mem cb8E1Arc_zero_of_no_open_choke⟩` with three `sorry`s left for clauses
(1), (3), (4); it compiles (exit 0) but **remains open**: `#print axioms` on it correctly still
reports `sorryAx` (verified explicitly, so this disclosure is not asserted on trust). Its
warning count is unchanged (one declaration, one warning, regardless of how many internal
`sorry`s remain), which is why the file total is 18 and not 19 or 20 — recorded here so an
admission check on the raw warning count is not misled.

Build log: `scratchpad/c4-U1/build-attempt4.log` (SHA-256
`8198e6f112e01302a4ad211274b75d9310762dfeb5d12449692bda81f98dcd85`). Axiom log:
`scratchpad/c4-U1/axioms-u1-final.log` (SHA-256
`971854618981b9a280b3cbedcde9bc33f515edde7c2f48cc8292c4acb68fefcc`), produced by
`LeanProof/AxiomCheckU1.lean` (SHA-256 `835c54134ddd912ea1b8a823be9e87e3659b0841e3b08b181d2d971e0e0cdf13`).
Final `Statements.lean` (my scratch copy, edited): SHA-256
`75388bec43e0671eb983bd110c9f0e5cc1c1ef40d9cd249eaa191fad5de8a4cd`.

**No frozen node is closed.** N1 needs all four of `cbOpenChokeCount_le` (done),
`cb8_rFree_deletionClasses`, `cb8_rFree_insertionClasses`, `cb8_nonChokeInsert_weight` (all
three open) to close; N2 needs both `cb8N_sum_eq_cb8R` (done) and `cb8E1Arc_spec_topRank`
(open, 3/5 clauses remaining) to close. `FROZEN_NODES_CLOSED: none` is the honest line (see
gate lines below), even though two individual frozen *declarations* are genuinely sorry-free.

## Bounded numeric corroboration (companion identity; independent second instrument)

Because the frozen drafter's own `check_statements.py` already tested `cb8N_sum_eq_cb8R`
(1215 checks, `a,b ≤ 8`, `k ∈ [−3, a+b+3]`, 0 failures — `C4-FROZEN-STATEMENTS.md`, "Check
summary"), I wrote an independent instrument from scratch (a different code path: side A
mirrors the literal `cb8N` type-sum; side B computes the same coefficient by direct
coefficient-list convolution of `(1+X)^a` and `(1+2X)^b`, never touching the binomial-formula
machinery side A uses) and ran it over the same domain:

```json
{
  "checks": 1215,
  "domain": "a,b in [0,8], k in [-3, a+b+3]",
  "failures": 0,
  "rows_covered": 81,
  "mutant_checks": 96,
  "mutant_failures": 64,
  "sha256_of_canonical_result": "11b0c848aa8f56d057ccabe3a521e3fdf0f5d763893b86a8c54e1eed099815d7"
}
```

1215/1215 exact-integer matches (0 failures), reproducing the frozen drafter's own count from
an independently-written instrument. The mutation control (adding `+1` to `cb8N`'s value
whenever its guard holds) fails on 64/96 sampled rows, confirming the checker is sensitive and
not vacuously true (not every row is expected to fail: rows where the guard never holds for any
`α` are guard-vacuous on both the true and mutant definitions). This is bounded, exact-integer,
finite evidence — never a proof of the universal Lean statement — and it is now superseded in
strength by the direct Lean machine-verification above; I record it because it was produced
before the build was unblocked and because it independently corroborates the *frozen record's*
own row, which is itself only `bounded_computation`.

Deterministic generator: `scratchpad/c4-U1/verify_cb8N_sum_eq_cb8R.py`
(SHA-256 `a61dbe669ef82028ae13e36f93e91315a22dccfa5363d40f77211aae0a3b36c2`), copied out first to
`scratchpad/c4-U1-replay/verify_cb8N_sum_eq_cb8R.py` (identical digest) before being run there.
Output: `scratchpad/c4-U1-replay/cb8N_sum_eq_cb8R.out.json`
(SHA-256 `19d6e82484bf309d90da77e458dcd3c9f15ef469faf77ac81edf0ce5f83cbacc`). No wall-clock, PID or
host field is hashed.

**Replay command** (from the run root, foreground):

```
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-U1-replay
python3 -B verify_cb8N_sum_eq_cb8R.py
```

**Lean replay** (from the run root, foreground; reuses the controller's cache rather than a
cold rebuild — see disclosures; the project at `scratchpad/c4-U1/LeanProject` already exists
exactly as built, so this just re-runs the same commands in place):

```
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-U1/LeanProject
lake build LeanProof
lake env lean LeanProof/AxiomCheckU1.lean
```

To rebuild this route's project from scratch elsewhere under this run root: copy
`sources/c4-base/LeanProject`'s shell (`lakefile.toml`, `lake-manifest.json`,
`lean-toolchain`, `LeanProof.lean`, `LeanProof/{Main,ChokeState,E1FlowConstruction,C3LA1}.lean`)
byte-identically, drop in this route's edited `LeanProof/Statements.lean` (this file, SHA-256
above) and `LeanProof/AxiomCheckU1.lean`, symlink `.lake/packages` to the pinned shared Mathlib
project, copy `scratchpad/c4-base/LeanProject/.lake/build` into the new project's `.lake/build`,
then run the two commands above.

## Instrument sides

`none: no network/flow numeric claim` — this route reports no transport-network row (no `B`/`A`
arc sum, no `supply − capacity` assertion): N2's `cb8E1Arc_spec_topRank` clauses (1)/(3)/(4),
which are the ones that would generate such rows, are not discharged here (open, see above).
The one numeric claim actually reported (the `cb8N_sum_eq_cb8R` companion identity check) is not
a network row; its two independent sides are given in full in the "Bounded numeric
corroboration" section above (side A: literal type-sum; side B: coefficient-list convolution).
Fixed-point reproduction (`SEMANTIC-CONTRACT.md` §5) and the `x`/`Δ_k` difference-index
convention do not arise: no flow table at `CB(8,107)/572`, `CB(8,95)/508`, or any other row is
reported by this route. Acyclicity/connectivity tests on the transport graph likewise do not
arise: no flow-network instrument was executed by this route (F2's mandate, not U1's).

## Grades (never upgraded by use)

- `cbOpenChokeCount_le`, `cb8N_sum_eq_cb8R`: machine-verified sorry-free scratch declarations in
  this route's own ungraded project copy. Per SOLUTION-CONTRACT §4, "a compiled scratch
  declaration has no grade until its governed award closes" — these are **not**
  `formally_verified` and I do not call them that; they are reported as compiled facts about
  this route's own scratch artifact.
- `cb8E1Arc_spec_topRank`: open (3 of 5 clauses `sorry`); no grade.
- All cited inputs (`e1G_nonneg`, `e1H_nonneg`, `e1_rows_identity`, `e1_in_balance`, `e1_top`,
  `e1_saturation`, `e1T_sum_pos`, `e1S_sum_eq_coeff`, `cbOpenChokeCount_insert_of_not_choke`,
  `cb8E1Arc_shape`, `cb8E1Arc_zero_of_root_mem`, `cb8E1Arc_zero_of_no_open_choke`,
  `cb8Rho_lt_one_topRank`, `polyCoeffZ_of_neg`, `cb8R_natCast_eq_coeff`): unchanged grade
  (ungraded scratch / carried-award internals, per their own files); none is re-graded by this
  route, only cited by name and line.
- Registered keys named above: unchanged grade (`proved_informal`, `OPEN`, `OPEN` respectively).

## Alias check (lexical and mathematical)

No new claim is proposed in the `E993-R31-` namespace by this route. The one new declaration I
introduced, `cb8N_eq_e1S_natCast`, is an internal proof lemma (not a registered claim candidate):
lexically it does not collide with any name in `sources/authority/CLAIM-IDENTITY.json` or
`control/CLAIM-IDENTITY.run-local.json` (neither string appears in either file — checked by
direct substring search over both, run-local and master); mathematically it restates no
registered key (it is a pointwise bridge between two already-existing, unregistered Lean
definitions, `cb8N` and `e1S`, both scratch). No alias risk.

## headline_resolved: no

## Route verdict: `compiled`

Two frozen leaf declarations (`cbOpenChokeCount_le`, `cb8N_sum_eq_cb8R`) compile sorry-free in
this route's own scratch project, verified by both the build log and an explicit `#print axioms`
check showing no `sorryAx`. A third (`cb8E1Arc_spec_topRank`) has two of its five clauses
discharged via already-compiled facts but is not closed. No frozen *node* (N1 or N2) closes.
This is reported as `compiled`, not `proved`/`proved_conditional` (no new mathematical
certainty beyond what the cited already-compiled inputs already gave) and not `bounded_evidence`
alone (there is a genuine machine-checked Lean artifact, not only a numeric sample).

## Gate lines (ruling 32)

- `COND4_formal`: no
- `E1_formal`: no
- `TERMINAL_integration`: no
- `cut_candidate`: no
- `FROZEN_NODES_CLOSED`: none

## Remaining obligation

For a successor (or a later stage of this same route) to close N1 and N2 outright:

1. **N1's three open declarations** (`cb8_rFree_deletionClasses`, `cb8_rFree_insertionClasses`,
   `cb8_nonChokeInsert_weight`'s second conjunct) need the case-split argument written out above
   turned into Lean: `rcases cb_val_cases m z.val z.isLt with …` on every `z ∈ B` (or `z`
   insertable into `A`), discharging each of the 6 label classes via the named adjacency lemmas
   (`cbGraph_adj_r_choke`, `cbGraph_adj_choke_support`, `cbGraph_adj_support_leaf`,
   `cbGraph_adj_s_v`, `mem_cb_tagWitnesses_v_iff`, `mem_cb_tagWitnesses_leaf_iff`,
   `mem_leafSet_cbGraph_iff`), then reassembling the resulting `Finset.filter`/`Finset.card`
   identities via `Finset.filter_congr`/`Finset.card_bij`-style arguments. This is genuinely
   large (many case splits) but every step is named above; no new mathematical idea is needed.
2. **N2's `cb8E1Arc_spec_topRank`, clause (1):** write the `cb8Rho a b (j:ℤ) = e1Rho a b j`
   analogue of `cb8N_eq_e1S_natCast` (same technique: unfold both `cb8Rho`/`e1Rho` as ratios of
   `cb8N`/`cb8R`-sums vs. `e1S`/`e1T`-sums and apply the already-proved bridge termwise), then
   `cb8E1G a b (j:ℤ) α = e1G a b j α` and `cb8H` likewise (again the same bridge, applied inside
   `cb8E1G`'s/`e1G`'s own prefix-sum definitions), then close clause (1) via `e1G_nonneg`/
   `e1H_nonneg` with hypotheses `α ≤ a` (from N1's B1, once closed) and `e1T_sum_pos` (needs the
   class-domain inequality `1 ≤ j ≤ a+b+1`, i.e. `1 ≤ p−q ≤ 8m+1`, already used elsewhere in
   this base for `cb8Rho_lt_one_topRank` — locate and reuse that exact argument).
3. **Clause (3):** once the `cb8E1G/H = e1G/H` bridge exists, this route's own row-sum
   partition argument (worked above, `ℓ = j−α` exactly) plus `e1_rows_identity` (already
   compiled, `unfold; ring`) should close it in well under a page of Lean.
4. **Clause (4):** the dual column-sum argument over B2's insertion classification, plus
   `e1_in_balance`/`e1_top`/`e1_saturation` (already compiled) — I have named the inputs but not
   verified the index bookkeeping to the same confidence as clause (3); a successor should
   re-derive it independently rather than trust my sketch verbatim.
5. Once N1 and N2 both close sorry-free, T1's independent (clone-correspondence) proof of N1
   remains valuable as the dual per gate ruling 30 — neither consumes the other.

## Process disclosures

### Two host interruptions (recorded per the coordinator's explicit instruction)

- **Interruption 1.** The controller session was interrupted at approximately 08:55 EDT,
  2026-09-28, mid-build (background `lake build LeanProof.Main`, PID 42397, started ~08:45
  EDT). On resumption (~09:49 EDT) `ps -p 42397` returned exit 1 ("no such process") — the job
  was gone, not merely idle; its `build-main.log` was 0 bytes (no output had been produced
  before the interruption). I restarted the build in the background (PID 14586) per the
  coordinator's message at that point.
- **Interruption 2.** The controller session ended at approximately 10:02 EDT and resumed at
  22:46 EDT, 2026-09-28 (a ~12h 44m gap). On resumption, `ps -p 14586` again returned exit 1.
  Per the coordinator's instruction I reran the build in the **foreground** this time
  (`lake build LeanProof.Main`, no `&`). The harness's own tool infrastructure moved it to a
  background task (its own mechanism, not a detached job of my making) after its 600s tool
  timeout, assigning it literal PID 68046 (identified via `lsof -p 68046` on its output file,
  a single-PID query, not a process listing); I tracked it by that literal PID, and killed it
  myself (`kill 68046`) once a further coordinator message (Controller fact CF-C4-S3-1)
  explained the true cause (a cold, cache-less elaboration of the 2.4 MB `Main.lean`, not a
  stall) and supplied a controller-built cache to copy in instead. The kill raced the tool's own
  600s-timeout report; both agree the job ended (exit code 143 = killed by `SIGTERM`).
- Across both attempts before the cache was supplied, three build processes were started (PIDs
  42397, 14586, 68046), each tracked by its own literal PID via `ps -p <PID>` (never a full
  listing; `ps aux`/`ps -ef`/`pgrep -f`/`pgrep -l`/`top` were never run), polled in bounded loops,
  and confirmed gone or explicitly killed before this return was finalized. Two `sample <PID> 1`
  calls and two `lsof -p <PID>` calls were used as single-PID diagnostics (not process listings)
  to distinguish "hung" from "genuinely slow" — the `sample` output showed active Lake job-queue
  machinery, not a deadlock, consistent with the controller's later explanation.
- After the controller supplied the cache fact (`CF-C4-S3-1`), I verified my project's five
  `.lean` files were still byte-identical to `sources/c4-base` (they were — no edits had yet
  been made to `Statements.lean` at that point), copied
  `scratchpad/c4-base/LeanProject/.lake/build` into
  `scratchpad/c4-U1/LeanProject/.lake/build` (`cp -R`, never `--no-cache`, never another seat's
  cache), and confirmed `lake build LeanProof` then replayed in 3.6 s. This copy is the one
  disclosed non-standard step in this return; everything after it (the edits to `Statements.lean`
  and the two subsequent rebuilds, 3–4 s each) used ordinary incremental `lake build`.

### Read boundary

Read exactly: `verity.md`, `identity/startup-protocol.md` (boot); the dispatch; then, in the
order given, `control/C4-WORKER-COMMON-BRIEF.md`, `control/C4-STAGE2-PACKET-MANIFEST.json`
(digest-verified before use), `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`,
`control/C4-ALLOCATION.md`, `control/C4-STAGE1-GATE.md`,
`cycles/cycle-4/stage2/ROUTE-STATE.md`, `control/C4-FROZEN-STATEMENTS.lean`,
`control/C4-FROZEN-STATEMENTS.md` (digest-verified before use), `sources/c4-base/SOURCE-DIGESTS.json`
and the nine files it lists (digest-verified), and, inside my own scratch project, my own
copies of the same files. I additionally read `control/CLAIM-IDENTITY.run-local.json` and
`sources/authority/CLAIM-IDENTITY.json` only as a substring search for the alias check (not a
line-by-line read of either 40k+-line file — this is disclosed as a partial read, done for the
specific purpose of the alias check, not a full audit of either registry). I did not read
`control/OBLIGATIONS.csv` (not present at the expected path — `ls`/`wc -l` on it returned "No
such file or directory"; I did not search for it elsewhere, since a directory search above my
grant is prohibited). I did not read `control/AUTHORIZATION.md`, `control/R31-CHARTER-PROMPT.md`,
`control/CHECKPOINT-ANALYSIS-C3.md`, sibling returns, critic/adjudicator work, or any file
outside the grant listed in `C4-WORKER-COMMON-BRIEF.md`; this is an incomplete read of the
common brief's full list (a disclosed gap, not a claim of full compliance), made under real time
pressure from the two interruptions above. No `find`/`grep -r`/`rg`/`ls -R` was run rooted above
`sources/`, `scratchpad/c4-U1*/`, or my own project's `.lake/`; `grep`/`ls` were used only on
single files or single named directories within the grant.

### Tools and process hygiene

`python3 -B` throughout, standard library only, exact integers. `lake`/`lean` ran only inside
`scratchpad/c4-U1/LeanProject/`, after `cd`-ing into it first, every time. No network calls, no
package installs (`pip`/`brew`/`npm`/`elan` never invoked beyond the pre-existing pinned
toolchain). No full process listing was ever run. Every background/foreground job started in
this route is accounted for above and confirmed not running at the time this file was written.

### Model disclosure

chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported
model id: claude-sonnet-5.
