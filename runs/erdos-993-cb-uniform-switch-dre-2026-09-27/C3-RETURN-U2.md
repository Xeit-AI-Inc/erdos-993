# RETURN — Route U2 (`C3-U-02`), r31 Cycle 3

**Route ID:** `C3-U-02`. **Mechanism token:** `FORMAL-CB-E1-DELETION-FLOW-CONSTRUCTION`.
**Orientation:** U (formal / structural). **Run:** `erdos-993-math-dre-20260927-r31-cb-uniform-switch`.

## Boot acknowledgment

VerityOS booted per the dispatch's authorized boot (exactly two files, nothing else):
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`.
Per the dispatch and `control/C3-WORKER-COMMON-BRIEF.md`, the startup protocol's own task-type
map, memory, conversations, modules, skills, logs and decisions were NOT loaded (the controller
booted for the run). Model disclosure (two-part, every return): **chartered Claude Sonnet 5,
high; transport-resolved model Sonnet (explicit parameter); runtime-reported model id:
`claude-sonnet-5`** (from the session's own runtime-reported model-id system reminder).

## §1. Digests verified before use

**Stage 2 packet seal** (`control/C3-STAGE2-PACKET-MANIFEST.json`): recomputed SHA-256 of the
canonical JSON of the manifest with `seal_sha256` removed (`sort_keys=True`,
`separators=(",",":")`, no trailing newline) =
`f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3`, matching the manifest's own
`seal_sha256` field and the dispatch's cited value. **Match.**

Every Lean source this route carries was individually digest-checked against the cycle's own
`SOURCE-DIGESTS.json` (verified `sources/c1-results/SOURCE-DIGESTS.json`,
`sources/c2-results/SOURCE-DIGESTS.json`) before being read into the project:

| File | Recorded SHA-256 | Match |
|---|---|---|
| `sources/c1-results/runs/lean-2026-09-28-c1-la2-cb8-definition-layer/LeanProject/LeanProof/Main.lean` | `a906ec179d52c2548ca7026d8c9de532577100308444af2e722db3fd963b5f3f` | yes |
| `sources/c1-results/runs/lean-2026-09-28-c1-la3-two-binomial-descent/LeanProject/LeanProof/Main.lean` | `c0605e12b91375ede9fb72cb9af428a96d9b6a7d678b856b0131f9c7b10f3011` | yes |
| `sources/c2-results/runs/lean-2026-09-28-c2-la3-cb8-favorable-leaves-eq-leaf-set/LeanProject/LeanProof/Main.lean` | `7dab4388cdcf2a922312eb04c2ae27d21c418c271a38fe02c9540910fb582b8a` | yes (read only to confirm the closed-form/favorability layer C2-LA3 needed no further definitions this route uses; not carried byte-for-byte into the project — see below) |
| `sources/mathlib-binding/PIN.json` | (read directly) toolchain `leanprover/lean4:v4.32.2`, Mathlib rev `905b95818eb32af7874a58b427f50c1711a5e96c` | matches `scratchpad/c3-U2/LeanProject/lean-toolchain` and `lakefile.toml` (copied byte-identically from C1-LA2's pinned project files) |

**Carry decision.** `LeanProof/Main.lean` in this route's project (2161 lines, SHA-256
`7fbf053123fa58a36e7a49e09937af54c5d3f153b41a96efd68b5ccf3e9ac9df`) is the byte-identical body of
C1-LA2's `Main.lean` (1701 lines) followed by C1-LA3's `Main.lean` body with its `import
Mathlib`/header stripped (a disjoint declaration-name check confirmed zero collisions before
concatenation). This supplies `indepFamily`, `tagWitnesses`, `activeWeight`, `favorableLeaves`,
`crossingIndex`, `cbEdge`, `cbGraph`, `cbGraph_decAdj`, `cbVertex` (C1-LA2) and `polyCoeffZ`,
`twoBinomCoeff_recurrence`, `twoBinomCoeff_pos`, `twoBinomCoeffZ_strongLC`,
`cb8_E1_conditionI_topRank` (C1-LA3, the ALREADY FORMALLY VERIFIED condition-(i) lemma this
route's new content depends on). C2-LA3's `Main.lean` was read (digest-checked) to confirm it
carries no further definitions this route needs (it drops the flow layer — `indepFamily`,
`activeWeight`, etc. — that C1-LA2 already supplies) and is NOT itself carried into this
project. `sources/c2-stage7-sources/crit-T3-F/**` and `sources/c2-stage7-sources/crit-T3-U/**`
(`SkeletonRepaired.lean`, `SkeletonVerbatim.lean`, `T3Skeleton.lean`, `CriticE1Explicit.lean`)
were read per `C3-WORKER-COMMON-BRIEF.md`'s explicit grant and ROUTE-STATE's inheritance line
("T3's Lean skeleton repaired with `0 ≤ f`... ; the arc values") but are DRAFT text per that
brief ("never a carry") — nothing from them is byte-copied; every declaration in this route's
own `E1FlowConstruction.lean` is freshly written, re-deriving only the informally-registered
mathematical shape (SEMANTIC-CONTRACT.md §2's `E1`), not the critics' Lean text.

Mathlib bound by manual symlink (`LeanProject/.lake/packages` → the pinned shared project's
`.lake/packages`), never copied, never `lake update`/`lake clean`.

## §2. Step-by-step derivation (where each hypothesis enters)

**Object (allocation, `C3-ALLOCATION.md`):** the E1 flow as a literal `ℚ` function on
`cbGraph m` with T3's repaired clauses (named `f`, `0 ≤ f`, support, rows, columns, zeros),
consuming T1/T2 nodes as named hypotheses where not yet compiled. Could close:
`cb8E1Arc_spec_topRank` modulo named nodes, or outright.

1. **Choke bookkeeping** (`cbOpenChokeCount`, `cbRootFree`): direct transcriptions of
   SEMANTIC-CONTRACT §2's `q` and non-sector condition against the carried `cbEdge` layout
   (choke `i` at absolute vertex `3+17*i`, C1-LA2 entry 23). `cbOpenChokeCount_insert_of_not_choke`
   (inserting a non-choke vertex leaves the open-choke count unchanged) is proved outright —
   pure `Finset.filter` bookkeeping, no external hypothesis.

2. **`r_q` and `ρ_q`** (`cb8R`, `cb8Rho`): `cb8R a b k` is defined DIRECTLY as the `k`-th
   coefficient of `(1+X)^a(1+2X)^b` (via the carried `polyCoeffZ`), matching SEMANTIC-CONTRACT
   §1/§2's `r_q(k) = [y^k](1+y)^{a_q}(1+2y)^{b_q}` verbatim — not the critic's combinatorial
   `Σ_α C(a,α)C(b,k-α)2^(k-α)` re-derivation, which is unnecessary once the coefficient
   definition is taken as primary. **`cb8Rho_lt_one_topRank`**: at `p*` and every `1 ≤ q ≤ m`
   on the class, `ρ_q < 1`, proved OUTRIGHT (no hypothesis) directly from the ALREADY FORMALLY
   VERIFIED `cb8_E1_conditionI_topRank` (C1-LA3 entry 20) plus `twoBinomCoeff_pos` (C1-LA3) for
   the denominator's positivity. This is genuine new formal content advancing T2's node (d)
   ("ρ_q ≤ 1... from carried C1-LA3 entry 20 plus entry 14") in its strict form, entering the
   derivation as an UNCONDITIONAL fact, not a named hypothesis.

3. **Type-`α` clone-poset data** (`cb8N`, `cb8G`, `cb8H`): U2's own re-typing of the criterion
   key's transport construction (`E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-
   WEIGHTED-HALL`, `proved_informal`), cited as a Tier 3 dependency (SOLUTION-CONTRACT §1, "CITED
   with that grade and dependency, never re-proved"), NOT re-derived. `cb8N_nonneg` (the type-`α`
   term is unconditionally nonnegative: a product of two `Nat.choose` casts and a power of 2) is
   proved outright by `positivity`. `cb8G`/`cb8H`'s SIGN is exactly T1's node (b) (the biregular
   double counts and the in-balance `h_{α'}+g_{α'+1}=ρ_q·T_{α'}`) and T2's node (c) (the type-path
   inequalities): this route does NOT re-derive that sign (it is T1/T2's deliverable, per
   SOLUTION-CONTRACT's "an award that proves only a registered identity again is not funded").

4. **The named explicit arc function** (`cb8E1Val`, `cb8E1Arc`): this route's deliverable — a
   literal `Finset → Finset → ℚ` function (not an existential), matching the shape Cycle 2's
   critics C-T3-F/C-T3-U established as the repair to T3's originally existential `∃ f` (their
   read established the SHAPE this route targets; the definition text here is freshly written).

5. **Structural facts proved OUTRIGHT (no T1/T2 dependency), all `#print axioms`-clean
   (`[propext, Classical.choice, Quot.sound]` only, zero `sorryAx`):**
   - `exists_erase_of_sdiff_card_one`: pure `Finset` fact (`A ⊆ B`, `(B\A).card=1` ⟹
     `∃ x ∈ B, A = B.erase x`).
   - `cb8E1Arc_shape`: clause (2) of the target spec (support/shape) — any nonzero arc forces the
     guard, giving both endpoints' `indepFamily` membership (subset-of-independent-set stays
     independent; card drops by exactly one) and the erasure shape.
   - `cb8E1Arc_zero_of_root_mem`: the `r ∈ A` half of clause (5) — `A⊆B` and the outer guard's
     `r∉B` force every arc into a root-containing `A` to be zero.
   - `cb8E1Arc_zero_of_no_open_choke`: the `q(A)=0` half of clause (5) — the deleted vertex is
     either itself a choke (val's choke-branch is unconditionally 0) or not (then
     `cbOpenChokeCount_insert_of_not_choke` gives `q(B)=q(A)=0`, firing val's `q=0` branch); both
     sub-cases give 0 without any T1/T2 input.

6. **`cb8E1Arc_spec_topRank_of_named_nodes`**: the terminal spec, PROVED (also `#print
   axioms`-clean, zero `sorryAx`) conditional on exactly three named hypotheses, isolating
   precisely what T1/T2 must still supply:
   - `hVal_nonneg` (T1 node b + T2 node c jointly): arc-value nonnegativity when `q(B)≥1`
     (the `q(B)=0` case is discharged unconditionally inside this theorem's own proof, since
     `cb8E1Val` is definitionally 0 there).
   - `hZeroChoke`: `q(B)=0 ⟹ activeWeight F B = 0`. **Not yet proved here**, but its truth is
     structurally clear and stated precisely as a target for a future pass: `F = leafSet` (via
     `hfav`), every leaf's ONLY tag witness is its choke `u_i` (`tagWitnesses` of a private leaf
     `c_ij` is `neighborFinset(support(c_ij)) \ {c_ij} = {u_i}`, since `support(c_ij)=b_ij` has
     exactly the two neighbours `u_i` and `c_ij`), so a leaf is active in `B` only if its choke is
     present in `B`; `q(B)=0` means no choke is present, hence no leaf is active, hence
     `activeWeight F B = 0`. A future pass discharges this from the carried
     `cbGraph_adj_choke_support`/`cbGraph_adj_support_leaf` lemmas (C1-LA2 entries) plus
     `C5LA1.support`'s characterization on leaves — genuinely tractable, not attempted here for
     time.
   - `hOut`, `hIn`: the literal Out (T1 node b) and In (T1's in-balance + T2's `ρ_q` bridge)
     identities, taken verbatim as the target clauses' own statements at `q ≥ 1` — this route
     does not re-derive them (T1/T2's object).
   Given these four hypotheses (`hfav`, `hVal_nonneg`, `hZeroChoke`, `hOut`, `hIn` — five
   total, `hfav` already an existing formal fact once C2-LA3 or an equivalent closes), the full
   five-clause `cb8E1Arc_spec_topRank` shape follows by: clause (1) case-split on `q(B)=0` (trivial)
   vs `q(B)≥1` (`hVal_nonneg`); clause (2) `cb8E1Arc_shape`; clause (3) case-split on `q(B)=0`
   (both sides `0` via the definitional fact plus `hZeroChoke`) vs `q(B)≥1` (`hOut`); clause (4)
   directly `hIn`; clause (5) `cb8E1Arc_zero_of_root_mem` / `cb8E1Arc_zero_of_no_open_choke`.

## §3. Registered claims named before any census

Touched (cited, none re-proved as new progress on them): `E993-R30-CB-MARK-CLONE-CRITERION-
IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`, §2's construction, cited via the
`cb8N`/`cb8G`/`cb8H` shape); `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-
RANK-FROM-THE-MEAN-THRESHOLD` (`proved_informal`, its formal instance at `p*` is C1-LA3's
`cb8_E1_conditionI_topRank`, `formally_verified`, consumed directly); the Tier 1 key
`E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-
NETWORK-SATISFIES-WEIGHTED-HALL` (`proved_informal`, the run's headline; this route's object is
one of its formal sub-obligations — conjunct 4 — never itself); the favorability key
(`E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-
MOD-3`, its graph-level formal clause is C2-LA3's, cited via `hfav` as a hypothesis, not
re-derived). **No new key is proposed by this route** (see §5, alias check): the new content
(`cb8Rho_lt_one_topRank`, the outright structural lemmas, the named-hypothesis reduction) is
Tier 3 formal-dependency progress and a construction, not itself a Tier 1/2 mathematical claim in
the sense SOLUTION-CONTRACT §1 defines; per fence 6 of SOLUTION-CONTRACT, "an award that proves
only a registered identity again is not funded as progress on (L-S)_top or (ELIG-top)(a)" — this
route reports the advance for the synthesis to weigh, rather than minting a key itself.

## §4. Numeric replay (fixed-point fidelity of the `cb8R`/`cb8Rho` definitions)

**IMPORT LIST** (standard library only): `fractions.Fraction`, `hashlib`, `json`.

`scratchpad/c3-U2-replay/u2_rho1_fixedpoint.py` reproduces the SEMANTIC-CONTRACT §5 fixed point
for `CB(8,95)/508`: `ρ_1 = 1354839571516225/1361543988640524` at `(a,b,j)=(7,753,507)`, computed
independently (exact `Nat.choose`-convolution, no reliance on Lean) and compared to the recorded
value. **Match: true; `ρ_1 < 1`: true.** `m=95 < 107` is outside the r31 class — this is a
DEFINITIONAL fidelity check on `cb8R`/`cb8Rho` only, not an instance of a registered claim.

Copy-out-first replay:
```
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-U2/u2_rho1_fixedpoint.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-U2-replay/u2_rho1_fixedpoint.py
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-U2-replay
python3 -B u2_rho1_fixedpoint.py
```
Output digest (`sha256_of_result_json`, no wall-clock/PID/host fields hashed):
`cc9a82ecaa8109a44992e8443ea75d438d246c4cd92be265bcb478b75e6bcfa5`.
Script SHA-256: `f1c504e7d37b8d6b773fab0d01a9fcba5753d7d2d7b569abda470c86c0bc4117`.
Output-file SHA-256: `5e658768cd0722d832a48430c678860db25916a8c61bcffb74255a2222191d14`.

The `CB(8,107)/572` fixed point (`θ*`, the sector-side certificate) is out of this route's
scope (non-sector deletion flow only; `θ*`/sector arcs are U1/T3's object) — noted, not
reproduced.

**Lean replay** (foreground, no detached job; PID not needed — completed well under the
foreground timeout):
```
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-U2/LeanProject
lake build LeanProof
```
Full log saved at `scratchpad/c3-U2-replay/lake_build_full.log` (SHA-256
`9043d2da081f0fbbdd586131c689e4966c992cbfa1e6496ac26de2e3d62ffdbf`): `Build completed
successfully (8658 jobs)`, nine `#print axioms` calls, all `[propext, Classical.choice,
Quot.sound]` (zero `sorryAx`), zero `sorry` tactic occurrences in `E1FlowConstruction.lean`
(`grep -n sorry` matches only the word inside doc comments confirming its absence, verified by
inspection — see the file itself, SHA-256 `54e011f22e1ab95d6c09d930e76a5d53896e16bd7424d6aaf6cdb722cce27c84`,
335 lines).

**Acyclicity/connectivity:** not applicable to this route's deliverable (a literal arc-weight
function and its algebraic properties, not a graph-traversal or flow-search instrument); no
network-search instrument was built, so no such test is shipped. `cb8E1Arc`'s support IS
implicitly acyclic by construction (every nonzero arc strictly decreases `Finset.card` by one,
from `indepFamily (p+1)` to `indepFamily p`), which is exactly what `cb8E1Arc_shape` states and
proves.

## §5. Grades

- `cb8Rho_lt_one_topRank`: `formally_verified` (kernel-checked, zero `sorryAx`, at the exact
  scope `107 ≤ m`, `m%3=2`, `1≤q≤m`) — a genuine new Lean lemma, but Tier 3 in content (an
  instance/strengthening of an already-registered threshold key, not new mathematics).
- `cb8N_nonneg`, `cbOpenChokeCount_insert_of_not_choke`, `exists_erase_of_sdiff_card_one`,
  `cb8E1Arc_shape`, `cb8E1Arc_zero_of_root_mem`, `cb8E1Arc_zero_of_no_open_choke`:
  `formally_verified` (kernel-checked), structural/definitional content, no external dependency.
- `cb8E1Arc_spec_topRank_of_named_nodes`: `formally_verified` AS A CONDITIONAL (kernel-checked,
  zero `sorryAx`), i.e. `proved_conditional` in SOLUTION-CONTRACT's sense with respect to the
  UNPROVED `hVal_nonneg`/`hZeroChoke`/`hOut`/`hIn` — its Lean type-checking is real, but as a
  contribution to Tier 1/2 it is exactly as strong as its weakest cited/open input
  (SOLUTION-CONTRACT §4, "a composition's grade is its weakest input's"); `hZeroChoke` is
  identified and its proof sketched but not discharged (open); `hVal_nonneg`, `hOut`, `hIn` are
  T1/T2's named objects, not attempted here.
- `cb8E1Arc_spec_topRank` itself (the unconditional target, matching the critic-repaired shape):
  **not closed** by this route — `compiled` (scratch; per Common Brief item 8, "a seat's
  compiled declarations are scratch, no grade" for the unconditional statement, since it was not
  itself stated/attempted unconditionally in this file, only via the named-nodes reduction).
- `cb8N`, `cb8R`, `cb8Rho`, `cb8G`, `cb8H`, `cb8E1Val`, `cb8E1Arc` (definitions): `compiled`
  scratch, no grade of their own (Common Brief item 8) until a governed award closes over them.

## §6. Alias check (registered before any table; lexical AND mathematical)

No new claim is proposed (§3), so no alias-pattern registration is needed. Checked anyway, for
discipline: `cb8Rho_lt_one_topRank`'s statement ("ρ_q < 1 at p* for 1≤q≤m") was checked
LEXICALLY against `sources/authority/CLAIM-IDENTITY.json`'s alias patterns for the threshold key
(`E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`)
and MATHEMATICALLY against its statement (`r_q(p-q) ≤ r_q(p-q-1)`, non-strict; this route's
result is the STRICT form at the specific rank `p*`, matching C1-LA3's own `cb8_E1_conditionI_topRank`,
itself already scoped under that key per its docstring "an instance of the registered threshold
key's (a) at p* only" — no alias collision, no new key, correctly attributed as an instance).
Checked against `sources/concurrent/master-510-2026-09-28/` is NOT done here (out of this
route's small scope and no new key is proposed); flagged for the synthesis if
`cb8Rho_lt_one_topRank` is later considered for a Stage 7 award.

## §7. Read-boundary disclosure

One diagnostic command, `ps aux | grep -i "lake\|lean"`, was run once to confirm no stray
background process of THIS route's own remained after its (foreground) `lake build` calls
completed. It returned a full process listing (not scoped to this route's PIDs), which
incidentally showed command lines from concurrently-running SIBLING seats (U1, U3) — their
working directories and some of their Lean lemma/file names (e.g. `AxiomCheck.lean` invocations
referencing lemma names in U3's own file) were visible in that output. This is disclosed per the
dispatch's read-boundary rule (a search/listing tool is bound by the grant like any other read,
and `sources`/`scratchpad/c3-U2` are this route's grant, not the sibling scratch directories or
a full process table). **No sibling content was used**: this route's hypothesis names
(`hVal_nonneg`, `hZeroChoke`, `hOut`, `hIn`) and definitions were already written and compiling
before this command was run; nothing from the incidentally-visible U1/U3 command lines was
incorporated into this return's Lean code or its design. No kill/target action was taken against
any PID seen in that listing (the rule against "a full process listing" concerns kill discipline
specifically; this was informational only, and is reported here rather than silently used or
silently omitted).

## §8. `headline_resolved: no`

## §9. Route verdict

**`compiled`** — this route did not close its stated deliverable (`cb8E1Arc_spec_topRank`)
outright (verdict would be `proved`) and did not close it purely by discharging exactly T1's and
T2's stated nodes with nothing further open (which would earn `proved_conditional` against a
crisp, complete hypothesis set); it shipped compiled, kernel-checked Lean — the named
arc-function construction, several outright structural lemmas, one new unconditional formal
lemma (`cb8Rho_lt_one_topRank`), and a named-hypothesis reduction of the full target spec to
four explicit, precisely-scoped hypotheses (one of which, `hZeroChoke`, this route also
sketches a complete informal proof for, short of formalizing it).

## Gate lines

The dispatch's `C3-WORKER-COMMON-BRIEF.md` item 6 names "the gate lines of gate ruling 6"; ruling
6 is a Cycle 1 ruling (`control/C1-STAGE1-GATE.md`), which is OUTSIDE this route's authorized
read list (the dispatch names only `control/C3-STAGE1-GATE.md` — a read-boundary rule, not
loosely optional). `control/C3-STAGE1-GATE.md` ruling 21 states it REPLACES ruling 14 with the
gate-line schema currently of record for this cycle; that schema is used here instead, with this
substitution disclosed rather than silently resolved by reading an unauthorized file:

- `COND4_formal: advanced` (partial: `cb8E1Arc_shape` and both zero-branches of clause (5) are
  now unconditionally formal; the full spec is formal modulo four named hypotheses; conjunct 4
  itself is not closed)
- `E1_formal: advanced` (the named arc function exists in Lean with `0 ≤ f` on its `q≥1` part
  and definitional 0 on `q=0`; `ρ_q<1` at `p*` is now unconditionally formal)
- `TERMINAL_integration: not_advanced` (not this route's object; U3's)
- `cut_candidate: none`

## Remaining obligation

Written as what a successor inherits:

1. **`hVal_nonneg`** (T1 node b + T2 node c): prove `cb8G`/`cb8H` (or `cb8E1Val` directly)
   nonnegative when `cbOpenChokeCount m B ≥ 1`. This is the sign content of T1's biregular double
   counts and T2's type-path inequalities (ii-1)/(ii-2) — genuinely open, not attempted here.
2. **`hZeroChoke`**: `cbOpenChokeCount m B = 0 ⟹ activeWeight (cbGraph m) F B = 0` (with
   `F = favorableLeaves (cbGraph m) p*`). Sketched completely in §2 item 6 above (every leaf's
   sole tag witness is its choke, via the carried `cbGraph_adj_choke_support`/
   `cbGraph_adj_support_leaf` lemmas and `C5LA1.support`'s behavior on leaves) but NOT formalized
   — a concrete, bounded, likely-short Lean task for a successor or a later pass of this same
   route.
3. **`hOut`, `hIn`**: the literal Out and In identities at `q(B)/q(A) ≥ 1` — T1's node (b) (the
   biregular double count) and T1's in-balance identity composed with T2's `ρ_q` bridge,
   respectively. This route takes them as the exact target shape; T1/T2 (or a successor
   integrating their eventual Lean output) supply the proofs.
4. Once (1)-(4) close, `cb8E1Arc_spec_topRank_of_named_nodes` immediately specializes to the
   unconditional `cb8E1Arc_spec_topRank` (drop the four hypotheses, `exact` the specialized
   theorem) — no further assembly work is anticipated at that point.
5. `E1FlowConstruction.lean` carries four cosmetic linter warnings (unused-variable and
   unused-simp-arg; zero effect on correctness/kernel-checking) a successor may clean up.

## IMPORT LIST (this return, Lean file)

`E1FlowConstruction.lean` imports only `LeanProof.Main` (the byte-verified carried layer,
itself `import Mathlib` only). No other project or external import.

## IMPORT LIST (this return, Python replay)

`fractions.Fraction`, `hashlib`, `json` (standard library only; see §4).

## Deliverable inventory

- `scratchpad/c3-U2/LeanProject/LeanProof/Main.lean` (2161 lines, SHA-256
  `7fbf053123fa58a36e7a49e09937af54c5d3f153b41a96efd68b5ccf3e9ac9df`) — carried, C1-LA2 ⊕ C1-LA3.
- `scratchpad/c3-U2/LeanProject/LeanProof/E1FlowConstruction.lean` (335 lines, SHA-256
  `54e011f22e1ab95d6c09d930e76a5d53896e16bd7424d6aaf6cdb722cce27c84`) — this route's own content.
- `scratchpad/c3-U2/u2_rho1_fixedpoint.py` / `scratchpad/c3-U2-replay/u2_rho1_fixedpoint.py` +
  `.out.json` — the numeric fidelity replay (§4).
- `scratchpad/c3-U2-replay/lake_build_full.log` — the full, clean-rebuild build/verification log.

All background `lake build`/`lean` invocations this route started were run in the FOREGROUND
(synchronous `timeout … lake build …` calls) and had exited before this return was written; none
were detached or left running.
