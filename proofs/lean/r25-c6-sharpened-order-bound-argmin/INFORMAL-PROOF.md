# Informal proof — award C6-LA6 (T2's node N8, RE-FROZEN contract)

Run `erdos-993-math-dre-20260920-r25-uniform-residual-no-recovery`, Cycle 6
(the charter's last cycle), Stage 7, dispatch `C6-LA6` — "Dispatch 6
(contingent; ranked last)" of the Cycle 6 synthesis (`cycles/cycle-6/stage6/
SYNTHESIS.md`, `## Lean awards`). **Registry effect: no new registration —
a scope update of `E993-R25-FOREST-ORDER-BOUND-SHARPENED`** (the argmin step
named open inside that claim's scope text is now kernel-checked).

## 0. Provenance and re-freeze (condition (1) of the synthesis's binding
conditions; contract "RE-FROZEN")

The Cycle 6 T adjudication (`cycles/cycle-6/stage5/adjudicators/T/
ADJUDICATION.md`, "## Lean readiness") ruled that seat T2's own frozen
contract (`RETURN.md` §4.1, `contract_id
c6-t2-forest-descent-order-bound-sharpened-v1`, declaration name
`Erdos993G1.ForestOrderBound.forest_descent_order_bound_sharpened`) **must
NOT be dispatched as written**: its `expected_statement` is the *graph*
theorem `G.IsAcyclic → Erdos993G1.delta G k < 0 → Nat.card X ≤ k^2+k+3`
(node N12 of the return's own DAG), which **no shipped fragment proves** —
a token sweep of the seat's compiled `Main.lean` (critic C-T2-F) finds no
`SimpleGraph`, `IsAcyclic`, `indepCount` or `Erdos993G1` occurrence anywhere
in it. This award's contract is accordingly **re-frozen on the integer
statement actually proved**: `ErdosR25T2.candidateD_argmin`, explicitly
**not** the forest order bound. No graph token appears anywhere in this
run's `Main.lean` (verified: `grep -n "SimpleGraph\|IsAcyclic\|indepCount\|
Erdos993G1"` on the compiled source returns no match).

**Condition (2) of the same binding conditions**: the seat's own `RETURN.md`
§5 (the closed-form corollary `N*(k) = k²+k+3`) is **not carried or cited**
here. §5 states its two boundary-order inequalities inverted (both critics
kernel-refuted this: `Hb 9 2 8 1 < zchoose 9 2` and `zchoose 10 2 <
Hb 10 2 9 1`, the opposite direction from §5's prose), and the synthesis's
own binding condition (2) says explicitly not to carry that pointer into a
Stage 7 dispatch. Nothing in this proof or its evidence depends on §5.

## 1. Definitions, exactly as the compiled sources state them

All four definitions below are re-registered, verbatim in mathematical
content, from the compiled sources named in the Stage 7 award capsule
(`control/c6-stage7-capsules/C6-LA6-PACKET-MANIFEST.json`, seal
`91a31efbfb3f793581e09173b924d6fa9283c5db2d0c67184f5f89560de2d882`), under
this run's own namespace `ErdosR25T2` (the capsule's read boundary requires
copying text out and re-proving, never binding inside the read-only source
directories).

```lean
def zchoose (a b : ℤ) : ℤ :=
  if 0 ≤ a then (if 0 ≤ b then ((a.toNat).choose (b.toNat) : ℤ) else 0) else 0

def Hbound (n k e ce : ℤ) : ℤ :=
  zchoose n (k + 1) - e * zchoose (n - 2) (k - 1) + (e - ce) * zchoose (n - 3) (k - 2)
    + (ce - 1) * zchoose (n - 4) (k - 3)

def W (n k e : ℤ) : ℤ := Hbound n k e (min e (n - e))
```

- `zchoose a b` is the zero-extended integer binomial coefficient: `0`
  whenever `a < 0` or `b < 0`, and (via `Nat.choose`) `0` whenever
  `b > a ≥ 0` as well. This is seat T2's `zchoose`
  (`scratchpad/c6-T2/LeanDraft/LeanProof/Main.lean`), re-registered
  identically.
- `Hbound n k e ce` is `H(n,k,e,c_e)` (T3 `RETURN.md` §3, Cycle 5
  `SYNTHESIS.md` line 1322), zero-extended and lifted to all of `ℤ`. This
  run's `Hbound` is the seat's `Hbound` and is the identical zero-extended
  definition as critic C-T2-F's `Hb` (`scratchpad/c6-crit-T2-F/
  CriticT2F.lean`); independently confirmed pointwise-identical by critic
  C-T2-U. This file uses the seat's name `Hbound` throughout — including in
  the terminal declaration — per the award statement's own parenthetical:
  "`W(n,k,e)` is the seat's zero-extended integer binomial expression
  `H(n,k,e,min(e,n−e))` exactly as `Main.lean` defines it."
- `W n k e` is `W(n,k,e) := H(n,k,e, min(e,n−e))`, the worst-case-`c_e`
  reduction (T3 `RETURN.md` §4 "Consequence"). This is `proved_informal`
  upstream (both T3 Cycle 5 critics re-derived it independently) and is
  taken as given; it is not re-derived by this award, whose object is the
  one node built on top of it (N8: the argmin over `e`).

**Hypotheses and where they enter.** `n ≥ 4` is the single numeric
hypothesis on every non-trivial lemma below; it enters exactly where the
Pascal recurrence `zchoose a b = zchoose (a-1) (b-1) + zchoose (a-1) b`
(valid for every `b : ℤ` once `1 ≤ a`) is instantiated at `a = n-2` (needs
`n ≥ 3`) and twice more at `a = n-3` (needs `n ≥ 4`); the binding instance
is the second one, so `n ≥ 4` is exactly the hypothesis needed and no more.
`1 ≤ e` and `e ≤ n-1` bound the domain of `W`'s argmin claim; the compiled
`W_antitone` step does not in fact use either bound (both are
underscore-prefixed in the seat's own file, a strengthening documented
below), while `W_min_at_spanning_tree`'s induction uses `e ≤ n-1` to reach
the base case and carries `1 ≤ e` forward unused past the first step (both
retained here exactly as the seat states them, since weakening a compiled,
kernel-checked hypothesis set is not this award's business).

## 2. The proof, node by node

All eight supporting lemmas below are re-derived and re-proved in this run
(not merely copied); each was re-built to a successful `lake build` before
the next was added. Declaration kind: `def` for the three definitions above,
`lemma` for every supporting fact below, and `theorem` for exactly one
terminal declaration (§3) — this run's compiled `Main.lean` uses `lemma`,
not `theorem`, for `W_antitone`, `W_min_at_spanning_tree` and
`ce_at_spanning_tree`, where the seat's and critic's own source files use
`theorem`. **This is a cosmetic keyword change only** — Lean 4's `theorem`
and `lemma` keywords produce the identical kind of kernel declaration, and
no statement, hypothesis, or proof term differs by one character — made so
that `candidateD_argmin` is this file's single `theorem`-kind entry, which
the governed registrar (`prepare_lean_formalization.py register`) requires:
it enforces a strict `definition* lemma* theorem?` ordering on registered
entries and rejects any entry after the first `theorem`-kind entry. This
constraint was discovered by trial during formalization (see
`FORMALIZER-REPORT.md` "## Repairs" for the two corrected registration
passes) and is recorded here for the fidelity reviewer's benefit.

1. **`zchoose_nonneg (a b : ℤ) : 0 ≤ zchoose a b`.** Immediate case split
   on `zchoose`'s definition; the `Nat.choose` branch is a cast of a
   natural number, the other two branches are `0 ≤ 0`.
2. **`zchoose_pascal {a : ℤ} (ha : 1 ≤ a) (b : ℤ) : zchoose a b =
   zchoose (a-1) (b-1) + zchoose (a-1) b`.** The integer Pascal recurrence,
   proved by unfolding both sides and reducing to `Nat.choose_succ_succ`
   (the `0 ≤ b` case) or `Nat.choose_zero_right` (the `b = 0` case), with
   `omega` closing every remaining boundary case from `ha : 1 ≤ a`.
3–5. **`pascal_step1/2/3`.** Three instances of `zchoose_pascal` at
   `a = n-2` and `a = n-3` (twice, at `b = k-2` and `b = k-1`), each needing
   only `4 ≤ n` (which gives `1 ≤ n-2` and `1 ≤ n-3`), re-indexed by `ring`.
6. **`W_antitone (n k e : ℤ) (hn : 4 ≤ n) (_he1 : 1 ≤ e) (_he2 : e+1 ≤ n-1)
   : W n k (e+1) ≤ W n k e`.** The argmin step. Substituting
   `pascal_step1/2/3` into `W(n,k,e+1) - W(n,k,e)` (unfolding `W` and
   `Hbound`) collapses the difference, with no case split on `e` versus
   `n/2` and none on `k`, to
   `W(n,k,e+1) − W(n,k,e) = −(1+δ(e))·zchoose(n−4,k−2) − zchoose(n−4,k−1)`
   where `δ(e) := min(e+1,n−e−1) − min(e,n−e)`. Since `δ(e) ≥ −1` always
   (an `omega`-provable fact about `min` of shifted integer arguments) and
   both `zchoose` factors are `≥ 0` (`zchoose_nonneg`), both terms of the
   difference are `≤ 0`. The Lean proof discharges this with one
   `omega`-proved nonnegativity product (`hprod`) and a single `nlinarith`
   call over the three Pascal identities — no regime case split appears in
   the proof term at all. The two range hypotheses `_he1 : 1 ≤ e`,
   `_he2 : e+1 ≤ n-1` are **unused** (underscore-prefixed exactly as in the
   seat's own file): the step lemma is true for every integer `e`, a
   strengthening over what its type advertises, not a gap (critic C-T2-F's
   finding F5, independently confirmed by critic C-T2-U's
   `Wf_antitone_unrestricted`, which is not carried into this file since
   `W_antitone`'s own proof already establishes the unrestricted fact — the
   hypotheses are simply not consumed).
7. **`W_min_at_spanning_tree (n k : ℤ) (hn : 4 ≤ n) (e : ℤ) (he1 : 1 ≤ e)
   (he2 : e ≤ n-1) : W n k (n-1) ≤ W n k e`.** The minimum of `W(n,k,·)`
   over `1 ≤ e ≤ n-1` is attained at `e = n-1`. Proved by finite downward
   induction on `m` where `e + m = n-1` (`m : ℕ`), chaining `W_antitone`
   `m` times; the base case `m = 0` is `e = n-1` and closes by `rfl`-style
   rewriting. This is a genuine induction of length `≤ n-2` from an
   arbitrary starting `e`, not a bounded scan and not a search — it is a
   no-horizon theorem in both `n` (beyond `n ≥ 4`) and `k` (every integer).
8. **`ce_at_spanning_tree (n : ℤ) (hn : 2 ≤ n) : min (n-1) (n-(n-1)) = 1`.**
   Critic C-T2-F's bridge, closed by `omega`: at the argmin `e = n-1`,
   `c_e = min(n-1, n-(n-1)) = 1`. This is the "`c_e = 1`" half of Candidate
   D's step, which the seat's own `W_min_at_spanning_tree` states only up
   to the definitional unfolding of `W` (its statement is in terms of `W`,
   not `Hbound` with `c_e` made explicit) — the seat's docstring asserts
   `min(n-1,n-(n-1))=1` in prose but that rewrite is not in the file (critic
   C-T2-F's finding F4).

## 3. The terminal statement

```lean
theorem candidateD_argmin (n k e : ℤ) (hn : 4 ≤ n) (he1 : 1 ≤ e) (he2 : e ≤ n - 1) :
    Hbound n k (n - 1) 1 ≤ Hbound n k e (min e (n - e))
```

**Declaration name:** `ErdosR25T2.candidateD_argmin`. **In words**:
Candidate D's missing step, in Candidate D's own words — `e = n-1, c_e = 1`
minimises `H(n,k,e,min(e,n-e))` — for every `n ≥ 4`, every integer `k`,
every `e ∈ [1, n-1]`. The proof: `W_min_at_spanning_tree` gives
`W n k (n-1) ≤ W n k e`; unfolding `W` on the left and rewriting with
`ce_at_spanning_tree` turns `W n k (n-1)` into `Hbound n k (n-1) 1`
(replacing the definitional `min (n-1) (n-(n-1))` with the literal `1`),
which is exactly the terminal statement.

**Why the statement is in terms of `Hbound`, not `W`, on the left.** The
award statement's own transcription (brief §2) displays
`W n k (n-1) ≤ W n k e`; the compiled source governs where it differs in
arrangement (brief §2, "the compiled statement governs"), and critic
C-T2-F's compiled `candidateD_argmin` states the left side unfolded
(`Hbound n k (n-1) 1`, with `c_e` made the literal `1`) rather than left as
`W n k (n-1)`. This run's terminal declaration reproduces that exact
compiled arrangement — it is what makes the statement read in "Candidate
D's own words" (`e = n-1, c_e = 1`) rather than as a corollary one
unfolding away from them.

## 4. Attribution (condition (i))

**Seat T2** (`cycles/cycle-6/stage3/returns/T2/RETURN.md`, route `T-C6-02`):
`zchoose`, `Hbound`, `W`, `pascal_step1/2/3`, `W_antitone`,
`W_min_at_spanning_tree` — the argmin step itself (node N8), proved
unconditionally in `k`, no horizon in `n` beyond `n ≥ 4`.

**The `c_e = 1` bridge is critic-attributed to C-T2-F**
(`cycles/cycle-6/stage4/critics/T2/F/CRITIQUE.md`, finding F4;
`scratchpad/c6-crit-T2-F/CriticT2F.lean`): `ce_at_spanning_tree` and the
terminal `candidateD_argmin` itself, which states the step "in Candidate
D's own words" where the seat's own theorem stops one rewrite short of it.

This attribution appears on the award's face in `FORMALIZER-REPORT.md`
(condition (i)).

## 5. Scope exclusions (condition (ii))

- **No new `E993-R25-…` registration.** N8 is the discharge of a
  sub-obligation named *inside* the already-registered
  `E993-R25-FOREST-ORDER-BOUND-SHARPENED` (whose scope text names this
  exact argmin as its own open step), not a claim of its own shape. The
  seat, both Cycle 6 critics, the T adjudicator and the Cycle 6 synthesis
  all decline to propose a new registration; this award effects a **scope
  update** of that existing claim ("the argmin step is now kernel-checked"),
  never a grade change.
- **Not the forest order bound.** This award's terminal declaration proves
  no fact about graphs, forests, acyclicity, or independent-set counts. It
  is not, and must not be read as, a step toward `formally_verified` status
  for `E993-R25-FOREST-ORDER-BOUND-SHARPENED` itself (node N12 — the full
  `SimpleGraph`/`IsAcyclic` assembly — remains entirely unformalized; its
  binding node is N3, the maximum-weight auxiliary spanning tree over the
  line graph, for which Mathlib offers no API, per both the T adjudication
  and the Cycle 6 synthesis).
- **The seat's own §4.1 frozen contract is not dispatched** (§0 above).
- **The seat's own §5 is neither carried nor cited** (§0 above).
- **No transfer** to Tier 1, Tier 2, Tier 3, NR1, FOREST, TREE, TRANSFER,
  or Erdős #993. An order bound is not a no-recovery statement. `d`, `ν`,
  `τ`, and `x(F) < r` occur nowhere in this award's object — the statement
  is purely about zero-extended integer binomial coefficients.
- **Critic C-T2-F's Hunter (N1) fragment is not carried** (per the brief's
  read boundary — it is listed in the capsule only so this award knows not
  to import it). **Critic C-T2-U's Hunter fragment
  (`scratchpad/c6-crit-T2-U/LeanAttempt/LeanProof/Hunter.lean`) is likewise
  not part of this award** — it is a different node (N1) with its own
  unformalized tree-ordering bridge, and neither Cycle 6 critique nor the T
  adjudication treats it as ready.

## 6. Repairs named by the adjudicator/synthesis (condition (iii))

- **The re-freeze itself** (binding condition (1)): done, §0 above.
- **The three dead `diff_*` lemmas** (`diff_cover_exact`, `diff_odd_exact`,
  `diff_matching_le` in the seat's compiled `Main.lean`) are **dropped**,
  not kept as unused lemmas. Critic C-T2-U proved by direct experiment
  (deleting them from a copy and rebuilding) that they are unreachable from
  `W_antitone`'s actual proof, which discharges its `1 + δ ≥ 0` step by a
  single `omega`-proved product and one `nlinarith` call with no regime
  case split at all; the three lemmas document an alternative
  (regime-by-regime) route the compiled proof does not take. Since this
  award re-derives every fragment from scratch rather than transcribing the
  seat's file byte-for-byte, the cleanest-to-verify choice is to omit them
  entirely — there is nothing in `W_antitone`, `W_min_at_spanning_tree`, or
  `candidateD_argmin` that calls them, and the compiled `#print axioms`
  receipts for every declaration in this run are identical in structure to
  the seat's and critics' own (§7).
- **Bind ONE terminal declaration.** Done: `candidateD_argmin` is the sole
  `theorem`-kind entry; every other declaration is a `def` or `lemma` (§2).

## 7. Axioms

`#print axioms` was run on every one of the 12 registered declarations
(`EVIDENCE/axiom-check-lines.txt`, `EVIDENCE/axiom-check-raw-output.txt`,
from a fresh copy-out project so the canonical registered `Main.lean` is
never hand-edited — see `FORMALIZER-REPORT.md` for the exact procedure).
Every declaration depends on axioms drawn **within the three standard
axioms** `propext`, `Classical.choice`, `Quot.sound` (the three definitions
depend on none at all); no declaration anywhere in this run depends on any
other axiom, and no `sorry`/`admit`/`native_decide` occurs in the compiled
source.

## 8. Evidence (condition (iv))

`EVIDENCE/argmin_evidence_check.py` (standard library only — `math`, `json`,
`hashlib`, `sys`; report `EVIDENCE/argmin_evidence_report.json`, schema
`argmin_evidence_check.v1`, no wall-clock/PID/host field):

- **Check A** (the required top-level check): `W(n,k,n-1) ≤ W(n,k,e)` for
  every `4 ≤ n ≤ 60`, every integer `k ∈ [-2, n+2]`, every `1 ≤ e ≤ n-1`:
  **80,807 exact-integer instances, 0 failures.**
- **Check B** (the `n ≥ 4` fence's tightness): the award statement's own
  justification names an exact witness — "the closed form fails at
  `n = 3, k = 1, e = 1`" — where "the closed form" is the Pascal-derived
  identity `W(n,k,e+1) - W(n,k,e) = -(1+δ(e))·C(n-4,k-2) - C(n-4,k-1)` that
  `pascal_step2`/`pascal_step3` need `n ≥ 4` to derive. Check B verifies
  this exact identity **fails** at `n = 3, k = 1, e = 1` (confirmed), scans
  `n = 3` against `k ∈ [-10,10]` and finds **exactly one mismatch** (at
  `k = 1`, matching "`k = 1` and below"), and confirms the same identity
  **holds throughout `n = 4..60`** on Check A's own `(k, e)` grid (0
  mismatches), so the fence is shown to be both load-bearing at `n = 3` and
  sufficient at `n ≥ 4`. **This checks the identity underlying the proof
  method, not the top-level inequality of Check A** — an independent
  direct scan of the top-level inequality itself at `n = 3` (widened `k`
  range) found no counterexample in this run, consistent with the award
  statement's own wording, which names the closed form (not the
  conclusion) as what fails below `n = 4`; this run does not claim the
  top-level conclusion is false at `n = 3`, only that its proof method's
  load-bearing identity is.

Both checks are corroborating bounded evidence; they are not a substitute
for the kernel-checked Lean proof of record (§2–3, `RECEIPTS/
kernel-verification.json`).
