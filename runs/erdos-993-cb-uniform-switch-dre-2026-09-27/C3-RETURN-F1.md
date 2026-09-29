# RETURN — Route F1, Cycle 3, r31 (CB(8,m) uniform switch-using Hall certificate)

**Route ID:** `C3-F-01`
**Mechanism token:** `FORMAL-STATEMENT-FIDELITY-ADVERSARY`
**Orientation:** F (falsify)
**Seat:** F1

## Boot acknowledgment

VerityOS booted per the dispatch's restricted boot: read **exactly** `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file outside the run root's own control
documents (per `DISPATCH-F1.md` line 5 / `C3-WORKER-COMMON-BRIEF.md` lines 5–9, which supersede the startup protocol's own
task-type map for this seat). Operating within VerityOS; only the r31 run-root control documents named below were loaded beyond
the two boot files.

## IMPORT LIST (standard library only, every script `python3 -B`)

`json`, `hashlib`, `sys`, `re`, `os`. No third-party packages, no network.

## Stage 2 seal verification

Recomputed SHA-256 over the canonical JSON of `control/C3-STAGE2-PACKET-MANIFEST.json` with `seal_sha256` removed
(`sort_keys=True`, `separators=(",", ":")`, no trailing newline), via
`scratchpad/c3-F1/verify_seal.py` (copy at `scratchpad/c3-F1-replay/verify_seal.py`, SHA-256
`28b004c104568e80412dbe40f271839fd0da37836bf99b300fe4f14b2297789b`):

```
claimed : f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3
computed: f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3
MATCH
```

**Cited seal value: `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3`** — matches the value given in
`DISPATCH-F1.md`. Replay: `cd <run root>/scratchpad/c3-F1-replay && python3 -B verify_seal.py` (output digested below).

## Files read (in dispatch order) and registered claims touched

`C3-WORKER-COMMON-BRIEF.md` → `C3-STAGE2-PACKET-MANIFEST.json` (seal above) → `SEMANTIC-CONTRACT.md` →
`SOLUTION-CONTRACT.md` → `C3-ALLOCATION.md` → `C3-STAGE1-GATE.md` → `cycles/cycle-3/stage2/ROUTE-STATE.md` →
`AUTHORIZATION.md` → `control/R31-CHARTER-PROMPT.md` → `OBLIGATIONS.csv` (all named by the common brief's own read list,
binding in full) → the six Cycle 1/2 frozen Lean awards under `sources/c1-results/runs/` and `sources/c2-results/runs/`
(digest-verified below) → `sources/c1-results/SOURCE-DIGESTS.json`, `sources/c2-results/SOURCE-DIGESTS.json`.

**Registered claims named before any computation was used as evidence** (per `SEMANTIC-CONTRACT.md` §4 /
`sources/authority/CLAIM-IDENTITY.json`, cross-read via `OBLIGATIONS.csv`'s run-local rows): `R31-C1-LA1`
(`E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-...`), `R31-C1-LA2` (CB layer + terminal reduction to conjuncts 2,4),
`R31-C1-LA3` (`E993-R31-CB-8-M-AT-LEAST-107-...-BLOCK-PRODUCT-...-COEFFICIENTS-STRICTLY-DESCEND-...`), `R31-C2-LA1`
(eligibility key, `formally_verified`), `R31-C2-LA2` (closed-form leaf-deletion descent), `R31-C2-LA3` (graph-level
favorability = leafSet). Tier 1 key: `proved_informal`, not decisive (per `C3-STAGE1-GATE.md` current-state check). No new
claim is proposed by this route (see **Alias check** below).

## What this route audited (attack, step by step)

My allocated object (`C3-ALLOCATION.md`, F1 row): fidelity of every frozen or proposed Lean statement against
`SEMANTIC-CONTRACT.md`/`SOLUTION-CONTRACT.md` — the index of record at `p*`, the contract's `G`, the ℕ-subtractions, the
presence of `107 ≤ m`, absence of conclusion-smuggling hypotheses, and literal link targets
(`C5LA1.indepSetCount`/`C4LA1.vertexDeletionIndepSetCount` of `cbGraph m`). **Scope constraint (disclosed, not a violation):**
this cycle's T1–T3/U1–U3 statements are produced concurrently by sibling seats this same cycle; the brief and dispatch both
forbid reading sibling returns, so this audit covers (a) the six Stage-7-closed Cycle 1/2 awards, byte-verified against
`sources/c*-results/SOURCE-DIGESTS.json`, and (b) the `SOLUTION-CONTRACT.md` §2 draft target shape. It does **not** cover
Cycle 3's own T/U proposed statements, which do not yet exist in a form I am permitted to read; that is named under
**Remaining obligation**.

### Step 1 — digest-verify every Lean source before reading its content

`scratchpad/c3-F1/verify_source_digests2.py` (replay copy SHA-256 `216f7f0cea34f397f89620115104b981e495420394291779c21ae13a5b3d295a`)
computed the SHA-256 of each of the six `Main.lean` files read and compared against `sources/c1-results/SOURCE-DIGESTS.json`
(462 indexed files) and `sources/c2-results/SOURCE-DIGESTS.json` (1559 indexed files). All six **MATCH**:

| Award | File | SHA-256 (computed = claimed) |
|---|---|---|
| C1-LA1 | `c1-results/.../lean-2026-09-28-c1-la1-cb8-sector-template-feasible/LeanProject/LeanProof/Main.lean` | `f0578ed7ce7f51f695d410cdbd1265d7071d40f40832635ed12d3dade6c9b78e` |
| C1-LA2 | `c1-results/.../lean-2026-09-28-c1-la2-cb8-definition-layer/LeanProject/LeanProof/Main.lean` | `a906ec179d52c2548ca7026d8c9de532577100308444af2e722db3fd963b5f3f` |
| C1-LA3 | `c1-results/.../lean-2026-09-28-c1-la3-two-binomial-descent/LeanProject/LeanProof/Main.lean` | `c0605e12b91375ede9fb72cb9af428a96d9b6a7d678b856b0131f9c7b10f3011` |
| C2-LA1 | `c2-results/.../lean-2026-09-28-c2-la1-cb8-parent-descent-and-eligibility-on-the-tree/LeanProject/LeanProof/Main.lean` | `986b525702a5a0d03f205da6ffbe6faf675ef4841473a498b33ef27e70190c9d` |
| C2-LA2 | `c2-results/.../lean-2026-09-28-c2-la2-cb8-leaf-deletion-closed-forms-descent/LeanProject/LeanProof/Main.lean` | `e75c66b2eee237d04354da33ab9fb941c5fb77be98cf8db42720a681361bfaae` |
| C2-LA3 | `c2-results/.../lean-2026-09-28-c2-la3-cb8-favorable-leaves-eq-leaf-set/LeanProject/LeanProof/Main.lean` | `7dab4388cdcf2a922312eb04c2ae27d21c418c271a38fe02c9540910fb582b8a` |

Replay: `cd <run root>/scratchpad/c3-F1-replay && python3 -B verify_source_digests2.py`.

### Step 2 — extract every top-level `theorem`/`lemma`/`def`/`abbrev` and diff the six terminal statements against contract text

`extract_statements.py` / `extract_decl.py` (replay copies, SHA-256 `b9351c2e...9a0` / `6a3015f7...1dd`) enumerate every
declaration and print a named declaration's full text. Terminal statements extracted and checked clause-by-clause against
`SEMANTIC-CONTRACT.md` §1–2 and `SOLUTION-CONTRACT.md` §2:

- **C1-LA1** `cb8_topRank_sectorTemplate_feasible (m) (hm : 107 ≤ m) (hm3 : m % 3 = 2)`: Out/In/Switch/Residual over
  `cb8Pb, cb8Pc, cb8Sigma, cb8Out, cb8In, cb8Theta, cb8R1`, with sums taken over `K := (16*m+1)/3` (= `p*−1`, confirmed:
  `p*−1 = (16m+4)/3 − 1 = (16m+1)/3` exactly since `16m+4 ≡ 0 (mod 3)` on the class). Switch line matches
  `(8−γ)σ(γ) ≤ θγ` for `1 ≤ γ ≤ 7` literally; Residual line `cb8Theta m ≤ 1 − cb8R1 m K / cb8R1 m (K−1)` matches
  `θ ≤ 1 − ρ_1` with `ρ_1 = r_1(p*−1)/r_1(p*−2)` literally (`K = p*−1`, `K−1 = p*−2`). **Hypothesis entry point:** `hm`
  enters only through the arithmetic identities used by `omega`/exact-rational bounds inside the closed proof (not visible
  at the statement's face beyond `107 ≤ m`); `hm3` enters through the exactness of `(16*m+1)/3`.
- **C1-LA2** `cb8_topRank_of_descent_and_flow (m) (hm : 107 ≤ m) (hres : m % 3 = 2) (hE : ...) (hH : ...)`: conclusion is
  **byte-identical** (mod whitespace) to `SOLUTION-CONTRACT.md` §2's draft target
  `cb8_topRank_eligible_and_weightedHall`. `hE` = conjunct 2 verbatim, `hH` = conjunct 4 verbatim — both enter **only** as
  hypotheses (declared so by `R31-C1-LA2`'s registration: "Never cite as Tier 1, (HALL), eligibility, favorability or
  descent"); this is a legitimate, disclosed conditional reduction, not conclusion-smuggling, because conjuncts 2 and 4
  are not derived, only restated. Conjuncts 1 (`IsTree`) and 3 (low window) are genuinely derived from `hm`/`hres` alone.
- **C1-LA3** `cb8_block_descent_topRank (m j) (hm : 107 ≤ m) (hmod : m % 3 = 2) (hj : 5 ≤ j) (hjm : j ≤ m)`: coefficient
  descent of `(1+X)^(8j) (1+2X)^(8(m−j)+1)` at index `(16m+4)/3 − 2 − j` vs `+1`. Matches the registered key's index
  `(16m−2)/3 − j` algebraically (`(16m+4)/3 − 2 = (16m−2)/3` exactly on the class); `hj, hjm` bound the ℕ-subtractions
  `m − j` and `(16m+4)/3 − 2 − j` away from truncation (checked: for `j ≤ m`, `m ≥ 107`, `p*−2−j ≥ 4.3m − 2 > 0`).
- **C2-LA1** `cb8_topRank_parentDescent_and_conjuncts_1_2_3 (m) (hm : 107 ≤ m) (hmod : m % 3 = 2)`: conjunct 1
  (`IsTree`), the literal parent descent `C5LA1.indepSetCount (cbGraph m) ∅ (p*−1) < C5LA1.indepSetCount (cbGraph m) ∅
  (p*−2)` — **literal link target**, `C5LA1.indepSetCount` of `cbGraph m`, exactly as the mandate requires — conjunct 2
  (`C5LA1.crossingIndex (cbGraph m) + 2 ≤ p*`) and conjunct 3 (low window). No hidden hypothesis; only `hm`, `hmod`.
  Descent direction confirmed as `i_{p*−1} < i_{p*−2}` ⇒ descent condition holds at `k = p*−2` ⇒ `x ≤ p*−2`, matching
  `SEMANTIC-CONTRACT.md` §2's stated implication exactly.
- **C2-LA2** `cb8_leafDeletion_closedForms_descent_topRank (m) (hm : 107 ≤ m) (hmod : m % 3 = 2)`: the two closed forms
  match `SEMANTIC-CONTRACT.md` §2's `I(CB−v) = (1+x)G^m + x(1+2x)^{8m}` and
  `I(CB−c) = (1+2x)G_c G^{m−1} + x(1+x)^2(1+2x)^{8m−1}` **term for term**, including `G = (1+2X)^8+X(1+X)^8` and
  `G_c = (1+2X)^7(1+X)+X(1+X)^7` exactly as defined in `SEMANTIC-CONTRACT.md` §2 (no swapped `(1+X)`/`(1+2X)` roles — the
  specific retyping risk named in my mandate). ℕ-subtractions present: `m − 1` (in `G^(m−1)`) and `8*m − 1` (in the
  private-leaf remainder power); both are safe for `m ≥ 107`.
- **C2-LA3** `cb8_favorableLeaves_eq_leafSet_topRank (m) (hm : 107 ≤ m) (hmod : m % 3 = 2)`:
  `favorableLeaves (cbGraph m) p* = C5LA1.leafSet (cbGraph m)`. Only `hm`, `hmod`; no favorability assumed as hypothesis.
  Its two supporting lemmas (`cb8_armLeaf_isFavorableAt_topRank`, `cb8_privateLeaf_isFavorableAt_topRank`) invoke
  `C4LA1.IsFavorableAt (cbGraph m) w p*`, unfolding to `C4LA1.vertexDeletionForwardDifference (cbGraph m) w p* < 0`, i.e.
  `i_{p*+1}(T−w) − i_{p*}(T−w) < 0`, evaluated **at rank `p*` with the forward (`p+1` minus `p`) convention** — this is
  exactly gate ruling 16's corrected direction, not the off-by-one trap it names ("evidence at `i_p − i_{p−1}` is
  favorability at `p−1`"); no route in this file makes that error.

### Step 3 — carry-byte-identity check across all six files (gate ruling 19)

`carry_check.py` (replay copy SHA-256 `47c97c5ff65a9186d3ad1ab61ca322da738709eb38a9bc29ed8305216fd62969`) parses every
`-- VERITYOS ENTRY N BEGIN <kind> <name> <hash>` / `-- VERITYOS ENTRY N END` fragment marker (the project's own carry-
provenance stamps) across all six files, and for every declaration name shared by 2+ files, checks the fragment body is
byte-identical and the claimed content hash agrees. Result (full output in
`scratchpad/c3-F1-replay/carry_check.out.txt`, SHA-256 `323e5ae0137bea47a075cf032ad4d5a8561e21779f28bb3c225da543422252b3`):

- **606** distinct named entries across the six files; **129** names shared by 2+ files; **126 exact byte-identical carries**.
- **3 flagged differences**, all resolved as the gate-ruling-19-sanctioned single-keyword edit `theorem` → `lemma` (an
  origin terminal carried as a dependency into a consuming file), with statement text otherwise byte-identical:
  - `cb8_block_descent_topRank`: `theorem` in C1-LA3 (origin terminal) → `lemma` in C2-LA1 (consumed dependency).
  - `cb8_topRank_of_descent_and_flow`: `theorem` in C1-LA2 (origin terminal) → `lemma` in C2-LA1.
  - `cb8_leafDeletion_closedForms_descent_topRank`: `theorem` in C2-LA2 (origin terminal) → `lemma` in C2-LA3.
  In every case the hypothesis list, every clause, every ℕ-subtraction, and the proof term are character-for-character
  identical apart from the keyword; this is the exact mechanism `C3-WORKER-COMMON-BRIEF.md` item 8 and gate ruling 19
  describe, not a fidelity break. (I did not separately locate a standalone "R31-N-15 reversibility check" record for
  each instance — noted as an open, minor provenance-completeness item, not a statement-fidelity finding, under
  **Remaining obligation**.)
- `AdjU.*` and `CriticU1T.*`/`critU3T_*`-prefixed lemmas used by C2-LA1's terminal (e.g. `AdjU.cb8_crossingIndex_add_two_le`,
  `AdjU.cb8I_coeff_cast`) are **nested namespaces fully defined inside the same single-source file** (`import Mathlib`
  only, confirmed at each file's head) — attributed by in-file comment to the Cycle 2 U-adjudicator and critics, not an
  external or undischarged dependency.
- `(cbGraph m).indepNum = 9*m+1` (`cbGraph_indepNum_eq`, `hm : 0 < m`) and `cb_lowWindow` (`3*p* < 2*indepNum+1`, closed
  by `omega` after the rewrite, `hm : 0 < m`) were read directly: both match `α(CB(8,m)) = m(d+1)+1 = 9m+1` and
  `3p* = 16m+4 < 18m+3 = 2α+1` for every `m ≥ 1`, exactly as `SEMANTIC-CONTRACT.md` §2 states (weaker hypothesis than
  `107 ≤ m`, correctly not over-restricted).

No ℕ-subtraction truncation, no swapped-factor retyping of `G`/`G_c`, no off-rank favorability evaluation, and no
conclusion-smuggling hypothesis were found in any of the six audited terminals or their immediate supporting lemmas.

## Grades

This route produces a **fidelity audit**, not a new mathematical claim; it carries no proof grade of its own.
The six audited awards retain their existing registered grades unchanged: `R31-C1-LA1`, `R31-C1-LA2`, `R31-C1-LA3`,
`R31-C2-LA1`, `R31-C2-LA2`, `R31-C2-LA3` — all `formally_verified` at their exact registered scopes (per `OBLIGATIONS.csv`
rows read above). This route neither upgrades nor downgrades any of them.

## Alias check (lexical AND mathematical)

No new claim in the `E993-R31-` namespace is proposed by this route — the deliverable is an audit record of existing
carried statements, not a new theorem, template, or generator result. Alias check: **N/A by non-registration** (nothing to
check against `sources/authority/CLAIM-IDENTITY.json` / the run-local registry).

## headline_resolved: no

## Route verdict: `bounded_evidence`

Bounded to the six Stage-7-closed Cycle 1/2 awards plus the `SOLUTION-CONTRACT.md` §2 draft shape (the only material this
seat is permitted to read this cycle): zero statement-fidelity violations found against every checklist item in
`C3-ALLOCATION.md`'s F1 object (index of record, contract's `G`, the named ℕ-subtractions, `107 ≤ m` presence, no
conclusion-smuggling, literal `C5LA1.indepSetCount`/`C4LA1.vertexDeletionIndepSetCount` link targets). This is a clean,
reproducible confirmatory audit of prior work, not a proof, refutation, or new compiled artifact — hence `bounded_evidence`
rather than `proved`/`refuted`/`compiled`.

## Gate lines (ruling 21)

`COND4_formal: not_advanced` (no new Lean written by this seat)
`E1_formal: not_advanced`
`TERMINAL_integration: not_advanced`
`cut_candidate: none`

## ℕ-subtractions and casts enumerated

`(16*m+4)/3 − 1`, `(16*m+4)/3 − 2`, `(16*m+4)/3 − 2 − j`, `(16*m+4)/3 − 2 − j + 1`, `m − j`, `m − 1`, `8*m − 1`, and the
sector-template's `K := (16*m+1)/3` with `K − 1`. Casts: `Nat.castRingHom ℤ`, `Polynomial.map`/`Polynomial.coeff_map`,
`eq_natCast`, `exact_mod_cast` (bridging `ℕ[X]` coefficient facts to the `ℤ[X]` closed forms). All checked safe for
`m ≥ 107`, `j ≤ m` as constrained by each lemma's own hypotheses (see Step 2 above); none apply Newton or Darroch (this
route used neither; C2-LA1's degree-50 `S_5` certificate is independently noted, per its own ledger record `SR-C2-4-R1`, as
Darroch/Newton-free and kernel-checked in-proof).

## Not applicable to this route's deliverable (with reason)

- **`x` and `Δ_k` numeric rows, acyclicity/connectivity tests in code:** this route performed no literal-network
  instantiation of `CB(8,m)` and computed no independence-polynomial numeric table; its evidence is exclusively textual/
  digest-based fidelity of existing Lean source against contract text, per the `FORMAL-STATEMENT-FIDELITY-ADVERSARY`
  mechanism token. F2 (`AT-RANK-COMPOSED-FLOW-ADVERSARY`) and F3 own the literal-network numeric instruments.
- **Background/foreground job discipline:** every script above ran synchronously to completion in the foreground; no
  background job was started, so none requires killing before this return is final.

## Model disclosure

chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported model id: claude-sonnet-5.

## Read-boundary disclosure

1. In the same tool-call batch used to read `DISPATCH-F1.md`, I also read `/Users/ashtonsperry/VerityOS/skills/optimization-loop/skill.md`
   (dispatched via the general VerityOS startup-protocol task-type map, before the dispatch file's own restricted-boot
   clause — which supersedes that map for this seat — was visible in context). This file was not used for any
   substantive decision in this return; the audit above follows `DISPATCH-F1.md`/`C3-WORKER-COMMON-BRIEF.md` exclusively.
2. Two non-recursive `ls -la` listings were run to check file sizes before reading: one on `<run root>/control/` (to find
   files under the 256 KB direct-read limit) and one on `<run root>/` itself (to confirm `AUTHORIZATION.md`/
   `OBLIGATIONS.csv` locations named by the common brief). Both are one-level, non-recursive, and rooted at or below the
   run root; disclosed out of caution per "a search that does occur is a read-boundary disclosure."
3. One non-recursive `ls` on `cycles/cycle-3/stage3/returns/` (to create my own `F1/` output directory) surfaced sibling
   seat directory **names** only (`F3`, `T1`, `T3`, `U1`) — no sibling file was opened or read. Disclosed out of caution;
   `cycles/` is named above this seat's grant.
4. All `find` invocations in this session were rooted inside `sources/...` (explicitly within-grant per
   `C3-WORKER-COMMON-BRIEF.md`/`DISPATCH-F1.md`), used only to locate `Main.lean`/`VERIFICATION-REPORT.md` paths inside
   the six award directories named by the common brief; not disclosed as boundary items on that basis, but listed here
   for completeness.

## Remaining obligation (successor inheritance)

1. **Cycle 3's own proposed statements (T1–T3, U1–U3) are not yet audited by this checklist.** This route could only
   audit frozen Cycle 1/2 material and the contract's draft target shape, because sibling returns are off-limits mid-
   cycle. A Stage 4 critic or Stage 7 fidelity reviewer should re-run this same checklist —
   `scratchpad/c3-F1-replay/carry_check.py` and the clause-by-clause comparison in Step 2 above — against the actual
   Cycle 3 T/U Lean statements once they exist, with particular attention to: (a) whether any new conjunct-4 (saturating
   flow) statement encodes favorability or `ΣIn < 1` as a hypothesis rather than deriving it; (b) whether any new
   `g_sec`/sector-arc definition literally matches `SEMANTIC-CONTRACT.md` §2's choke-state and switch-image language: (c)
   whether new carries from C1-LA1/C1-LA3/C2-LA1..3 follow the same `theorem→lemma`-only edit pattern confirmed clean
   here.
2. **The "R31-N-15 reversibility check" record for each of the three theorem→lemma carries was not independently located**
   by this route (out of this seat's read scope — likely in `DEPENDENCIES.yaml`/`FORMALIZER-REPORT.md` of C2-LA1 and
   C2-LA3, or in `control/CONTROLLER-NOTES.json`, none of which were in this seat's authorized read list). A successor
   with access to those files should confirm the record exists for all three instances found here.
3. **This audit is a text/statement check, not a proof-term check:** it confirms the *statements* say what the contract
   requires and that carries are byte-identical (modulo the sanctioned keyword edit); it does not re-verify that the
   underlying `by`-tactic proofs are gap-free beyond what the existing `formally_verified` grade already asserts (kernel-
   checked at Stage 7 close). No re-compilation was attempted (out of scope for `FORMAL-STATEMENT-FIDELITY-ADVERSARY`;
   `lake`/`lean` invocation is reserved for Lean-building seats per the common brief).
