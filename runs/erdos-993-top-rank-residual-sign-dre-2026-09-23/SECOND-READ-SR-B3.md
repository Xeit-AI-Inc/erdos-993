# Second Read

Isolated second reader `SR-B3`, r26 Cycle 1, Tier 2. Statement id `B3-1`.

chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect
its runtime model/effort — stated on dispatch-record authority.

---

## Identity and seal audit

**Capsule** `control/c1-second-read/SR-B3-PACKET-MANIFEST.json`, `run_id`
`erdos-993-math-dre-20260923-r26-top-rank-residual-sign`, `stage` `cycle-1-second-read-SR-B3`,
`schema_version` `verityos.math-dre.packet-manifest.v1`.

**Inner seal recomputed** — SHA-256 of the compact key-sorted JSON of the manifest minus
`seal_sha256`, no trailing newline:

```
claimed     ea1c49adc2c39e3733554b00f491ceeb423e488afa1fd0ea1e8f531c29737418
recomputed  ea1c49adc2c39e3733554b00f491ceeb423e488afa1fd0ea1e8f531c29737418   MATCH
```

**Members** — `file_count` 21, actual 21; every member verified on both `bytes` and `sha256`:
**21/21 MATCH, 0 mismatches, 0 missing.** Re-verified unchanged after all work below (the check that
no frozen file was touched).

**Boot.** `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, as the protocol permits. Operating within
VerityOS; subsystem loaded: `experiments/` (this run's control files only).

**Isolation honoured.** Read: the 21 capsule members and the two boot files, nothing else. No other
return, critique, adjudication, scratch or experiment root; no `find`/`grep`/`rg` rooted above the
capsule members; no network, no installs, no background jobs (every job foreground); Python standard
library only (`hashlib`, `json`, `os`, `sys`, `fractions`), exact integers throughout. No Mathlib
source was needed: the Tier 2 record is a census-and-provenance record, not a Lean statement. No
frozen r24 file was opened for writing. One deliverable written; scratch confined to
`scratchpad/c1-sr-SR-B3/`.

---

## Statements read

`B3-1` — the correction record `E993-R26-C6-B3-FAMILY-I-REALIZATION-CORRECTION`, as ruled by the F
adjudicator (`cycles/cycle-1/stage5/adjudicators/F/ADJUDICATION.md` §F2, Decisions 8–16) and carried by
the synthesis (`cycles/cycle-1/stage6/SYNTHESIS.md` `### Tier 2`, and `## Registrations` row R-2), in
its seven components (i)–(vii) of the brief.

The statement is **materially changed at Stage 5** on five points relative to F2's draft (universality
of the refutation via the family-(I) theorem; the two order-9 classes; the widening of the provenance
gap to inventory item 5; the error class recorded as an inference with its origin in `C-T1-U`; three
struck certification literals), so `SOLUTION-CONTRACT.md` §4 requires this read before registration.

**Fence discipline observed.** The r24 "1,420 realized" sentence is never quoted here as fact; it is
quoted only as *what the r24 record says*. No status is transferred across any fence of
`SOLUTION-CONTRACT.md` §3 — in particular nothing here touches
`E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, `E993-BETA-AGG`, the transport, the common-leaf
condition, TREE, FOREST, TRANSFER or Erdős #993. `SOLUTION-CONTRACT.md` §3.5 is satisfied: this is a
correction RECORD; no sealed r24 file is edited.

---

## Independent re-derivation

### The instrument

`scratchpad/c1-sr-SR-B3/srb3_instrument.py`, written from `SEMANTIC-CONTRACT.md` §§1–5 alone. It is a
sixth instrument and is independent of every prior one in its **generator**: free trees are built by
augmentation from order 1 with AHU canonical-form dedup (centre-rooted; sorted pair of both roots when
the centre has two vertices), where F2, both F critics, the F adjudicator and the controller's
`replay1420.py` all use `networkx.nonisomorphic_trees`. Generated tree counts for orders 7–16 are
11, 23, 47, 106, 235, 551, 1301, 3159, 7741, 19320 — the generator's own correctness check.

Independence polynomials by rooted forest DP; `x(G)` as the least `k` with `Δ_k < 0` (first STRICT
descent, `SEMANTIC-CONTRACT.md` §5); `(★)` tested as `α(G − v) = α − 1` for every leaf; the shell
`I_{α−1}(G)` by exhaustive size-pruned enumeration; the aggregate `S(G, α−1)` computed literally from
`H_v`/`R_v` and never through the family route.

### Where each hypothesis enters, checked

`hyp-tree` at generation and re-checked per tree (`|E| = n−1` **and** connected). `hyp-alpha` (`α ≥ 2`)
is applied **before** `α − 1` is ever formed. `hyp-eligible` (`x + 2 ≤ α−1`) next; `(★)` last. Only
trees passing all four are counted.

*`x` convention, checked against the reference implementation.* The frozen
`first_strict_descent` (`sources/r24/r23-evaluator/ordinary_tree.py`) scans ranks `0 … α−1` and returns
`None` when no strict descent occurs there; mine scans `0 … α` and returns `α` in that case. The two
agree on every tree whose first strict descent is below `α`. Where they differ — `Δ_k ≥ 0` for all
`k < α`, which includes the `K_1`/`K_2` cases of R-13 — the tree is excluded either way: `None` is
ineligible by construction, and `x = α` gives `x + 2 = α + 2 > α − 1`, failing `hyp-eligible`. **The
eligible residual class is therefore identical under both conventions**, and no count below depends on
the choice. The family classifier guards the family-(III) shell index with
`a ≥ 1`, so the `a − 1` shell is declared empty at `a = 0` exactly as `SEMANTIC-CONTRACT.md` §5
requires.

### `ℕ`-subtraction audit

| Subtraction | Guard | Verdict |
|---|---|---|
| `α − 1` (top rank, shell index) | `hyp-eligible` with `x ≥ 0` forces `α − 1 ≥ 2` | no truncation |
| `p − 1` in `Δ_{p−1}` | `p = α−1 ≥ 2` | no truncation |
| `ℓ − 1` (family-(I) weight) | `ℓ ≥ 2` for a tree with `α ≥ 2` | no truncation; `ℓ−1 ≥ 1` |
| `a − 1` (family-(III) shell) | family declared empty at `a = 0` | guarded in code |
| `ℓ − 1 − 2\|A_C\|` (the r24 weight formula that "flips") | **must be read in `ℤ`** | see Finding 8 |
| `(ℓ−1)/2` (the `P_a`/`P_b` threshold) | computed with `fractions.Fraction` | see Finding 9 |
| `ℓ − 4`, `ℓ − 2\|A_C\|` (families II, III) | `ℤ` quantities by §4 | no truncation |

### The four predicates, replayed on orders 7–16 (all ten orders, not only 7–12)

`P_a`: `|C_1| > (ℓ−1)/2`. `P_b`: the induced graph on `C_1` has an independent set of size
`> (ℓ−1)/2`. `P_c`: some realized `B ∈ I_{α−1}(G)` classified family (I) has `A_C ≠ ∅`. `P_d`: some
realized family-(I) `B` has `w(B) < 0`. Counts are of TREES up to isomorphism; the shell column counts
labelled members.

| order | trees | eligible residual | `P_a` | `P_b` | `P_c` | `P_d` | shell members | unclassified |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 7 | 11 | 4 | 0 | 0 | 0 | 0 | 23 | 0 |
| 8 | 23 | 5 | 0 | 0 | 0 | 0 | 33 | 0 |
| 9 | 47 | 17 | 2 | **2** | 0 | 0 | 138 | 0 |
| 10 | 106 | 39 | 11 | 11 | 0 | 0 | 396 | 0 |
| 11 | 235 | 80 | 20 | 19 | 0 | 0 | 940 | 0 |
| 12 | 551 | 167 | 42 | 41 | 0 | 0 | 2151 | 0 |
| 13 | 1301 | 365 | 85 | 83 | 0 | 0 | 5354 | 0 |
| 14 | 3159 | 792 | 170 | 164 | 0 | 0 | 12542 | 0 |
| 15 | 7741 | 1775 | 363 | 351 | 0 | 0 | 31284 | 0 |
| 16 | 19320 | 4003 | 793 | 749 | 0 | 0 | 76047 | 0 |
| **7–16** | | **7247** | **1486** | **1420** | **0** | **0** | **128908** | **0** |

Every cell agrees with F2's table, with the F adjudicator's own orders 7–14 row
(`0,0,2,11,20,42,85,170` and `0,0,2,11,19,41,83,164`) and with the controller's pre-run
`replay1420.json`. `P_b = 1,420` over orders 7–16, **first at order 9**; `P_a = 1,486`, overcounting by
exactly `1486 − 1420 = 66`. `P_c = P_d = 0` at every order with no exception. The three-family
partition is exhaustive: **0 unclassified** of 128,908 shell members. Sub-range 7–12 gives **312**
eligible residual trees, matching `SEMANTIC-CONTRACT.md` §5 and r24 inventory item 4; 7–15 gives 3,244.

### Component (i): family (I) has `A_C = ∅` and weight exactly `ℓ − 1`, re-derived from the definitions

*Forced-neighbour lemma.* Let `J ⊆ D` be a maximum independent subset of `D` and suppose
`s ∈ C_1` has `N(s) ∩ J = ∅`. Let `v` be the unique leaf adjacent to `s`. Then
`S := (L ∖ {v}) ∪ J ∪ {s}` is independent: `L` is independent (`α ≥ 2`, so no leaf is adjacent to a
leaf); no leaf is adjacent to any interior vertex (a leaf's only neighbour is its support); `J` is
independent; `s`'s neighbours are `v` (removed), vertices of `D` (none in `J` by assumption) and
possibly other supports (none in `S`). Its size is `(ℓ−1) + a + 1 = ℓ + a = α`. So `S` is a maximum
independent set omitting the leaf `v`, contradicting `(★)`. Hence every maximum independent `J ⊆ D`
meets `N(s)` for every `s ∈ C_1`.

*Family (I).* `|A_D| = a` makes `A_D` a maximum independent subset of `D`. If `s ∈ A_C` then
`λ(s) = 1` by the family definition, so `s ∈ C_1`, so `A_D ∩ N(s) ≠ ∅` — and `B ⊇ A_D ∪ {s}` would
contain an edge, contradicting independence. Therefore **`A_C = ∅`**. Then `Q(A_C) = 0`, the family's
`h = 1` gives `|B ∩ L| = ℓ − 1`, and `w(B) = |B ∩ L| − Σ_{s∈B} λ(s) = (ℓ−1) − 0 = **ℓ − 1 ≥ 1**`, using
`ℓ ≥ 2`. Sizes agree: `a + 0 + (ℓ−1) = α − 1`. Conversely `(L ∖ {v}) ∪ J` is a family-(I) member for
every leaf `v` and every maximum independent `J ⊆ D`, and the pair `(v, J)` is recovered from `B`, so
**`|Fam I| = ℓ·M`** exactly.

*Confirmed computationally.* Over orders 7–16: **69,261 family-(I) members, 0 with `A_C ≠ ∅`, 0 with
`w ≠ ℓ−1`.** Over orders 7–14 (1,469 trees) I additionally verified `|Fam I| = ℓM`, family (II) a
singleton `A_C` with `w = ℓ−4`, family (III) with `w = ℓ − 2|A_C|`, 0 unclassified, `S ≤ 0` throughout,
and **(RI)** itself — `S(G, α−1) = ℓM − Σ_{shell} w(B)` — with the literal `H_v`/`R_v` aggregate
computed independently of the family route: **0 mismatches**.

*Hypothesis load.* The theorem does **not** consume `hyp-eligible`. I tested the 18 residual trees of
orders 3–14 that satisfy `hyp-tree`, `α ≥ 2` and `(★)` but **fail** `hyp-eligible`: family (I) still
has `A_C = ∅`, `w = ℓ−1` and `|Fam I| = ℓM` on all 18, with 0 violations. This independently supports
R-5's "**not** `hyp-eligible`" and the `INFORMAL-PROOF.md` hypothesis map.

### Component (ii)–(iii): the order-9 witnesses, printed in full

Exactly **two** order-9 `P_b` isomorphism classes, as the record states. Both have `ℓ = 4`, `a = 2`,
`M = 1`, `α = 6`, `x = 3` (eligibility tight: `x + 2 = 5 = α − 1`), and **two mutually non-adjacent
multiplicity-1 supports** — matching the r24 prose "two independent multiplicity-1 supports" exactly.

**Class 1** (F2's). Edges `0-1, 0-2, 0-3, 0-4, 1-5, 2-6, 5-7, 6-8`.
`i = (1,9,28,38,24,8,1)`; `L = {3,4,7,8}`, `C = {0,5,6}` with `λ(0)=2, λ(5)=λ(6)=1`, `C_1 = {5,6}`
(non-adjacent), `D = {1,2}`. Unique maximum independent set `{1,2,3,4,7,8}`. Shell size **8**:

| `B` | family | `A_D` | `A_C` | `h` | `w` |
|---|---|---|---|---:|---:|
| `{1,2,3,4,7}` | I | `{1,2}` | `∅` | 1 | 3 |
| `{1,2,3,4,8}` | I | `{1,2}` | `∅` | 1 | 3 |
| `{1,2,3,7,8}` | I | `{1,2}` | `∅` | 1 | 3 |
| `{1,2,4,7,8}` | I | `{1,2}` | `∅` | 1 | 3 |
| `{1,3,4,6,7}` | III | `{1}` | `{6}` | 0 | 2 |
| `{1,3,4,7,8}` | III | `{1}` | `∅` | 0 | 4 |
| `{2,3,4,5,8}` | III | `{2}` | `{5}` | 0 | 2 |
| `{2,3,4,7,8}` | III | `{2}` | `∅` | 0 | 4 |

Family (II) empty. `ℓM − Σw = 4 − 24 = −20`; literal `S(G, α−1) = −20` with 4 favorable leaves. Match.

**Class 2** (`C-F2-U`'s). Edges `0-1, 0-2, 0-3, 1-4, 2-5, 4-6, 4-7, 5-8` — my generator's labelling
coincides exactly with the edge list `C-F2-U` ships, and the independence sequence agrees digit for
digit.
`i = (1,9,28,37,22,7,1)`; `L = {3,6,7,8}`, `C = {0,4,5}` with `λ(4)=2, λ(0)=λ(5)=1`, `C_1 = {0,5}`
(non-adjacent), `D = {1,2}`. Unique maximum independent set `{1,2,3,6,7,8}`. Shell size **7**: four
family-(I) members `{1,2,3,6,7}, {1,2,3,6,8}, {1,2,3,7,8}, {1,2,6,7,8}` each `A_C = ∅`, `h = 1`,
`w = 3`; three family-(III) members `{1,3,5,6,7}` (`A_C = {5}`, `w = 2`), `{1,3,6,7,8}` and
`{2,3,6,7,8}` (`A_C = ∅`, `w = 4`). `ℓM − Σw = 4 − 22 = −18`; literal `S = −18`, 4 favorable. Match.

**Neither class has a family-(I) member with non-empty `A_C`**, on the exact trees the r24 record's
first occurrence points at.

**The controller's pre-run witness.** `control/controller-prerun/replay1420.json` records edges
`0-1, 0-5, 0-8, 1-2, 2-3, 2-4, 5-6, 6-7`. Its AHU free-tree canonical form is `(((()()))((()))())`,
**identical to my Class 2** and different from my Class 1 (`(((()))((()))()())`). The F adjudicator's
Decision 10 is therefore confirmed on an independent canonical form: the controller printed
`C-F2-U`'s class, not F2's. The two replays never disagreed.

### Component (iv): provenance

I read `sources/r24/adjudicator-scratch/scan.py` and `adj_engine.py` in full.

- `scan.py` is an orders-4..17 census producing per-order dicts keyed exactly
  `order, trees, residual, flat, nonflat, violations, closed_form_mismatches`, written with
  `json.dump(rows, open(out,"w"), indent=1)`. `scan_4_17.json` has exactly those keys in exactly that
  order with that indentation: **it is `scan.py`'s output**, confirmed.
- `adj_engine.py` provides `indep_poly` (branch-and-bound with memoization), `delta`, `alpha_of`,
  `x_of`, `literal_S`, `residual_and_flat` and `t_family`.
- **Neither implements any family classification, any shell enumeration of `I_{α−1}(G)`, any
  `A_D`/`A_C`/`A_S` object, any of the four predicates, or any count resembling 1,420.** Confirmed.
- The T adjudication's own `## Artifact inventory` names exactly these three files as the seat's
  entire authored scratch and then lists computations 1–8 as performed by the seat. **Item 5** ("Three-family
  expansion implemented independently and checked against the literal `S` on all 312 residual trees of
  orders 7–12: 0 mismatches") and **item 6** ("Family-(I) sign-flip realization, orders 7–16: 1,420
  residual trees, first at order 9") are backed by none of the three. The widening of the gap to item 5
  is correct. Item 5's *content* is independently true — my own instrument reproduces the three-family
  expansion against the literal `S` on all 312 trees of orders 7–12 with 0 mismatches and 0
  unclassified members — so **only its provenance is missing**.

### Component (v): origin

`sources/r24/records/C6-CRITIQUE-C-T1-U.md` lines 287–289: "family (I)'s weight `ℓ−1−2|A_S|` changes
sign once `|A_S| > (ℓ−1)/2`, and this is realized — the census contains residual trees with `ℓ=8` and
six supports of multiplicity 1 at order 16"; and lines 449–451 in the terminal-debt restatement. This
is a bare `|C_1| = 6` count against `(ℓ−1)/2 = 3.5` — a `P_a`-shaped structural count, with **no shell
membership whatever**. The record's account of the origin is exact.

`sources/r24/records/C6-ADJUDICATION-T.md` lines 180–182 then broadens it: "I find the regime is
realized far more broadly — 1,420 eligible residual trees of orders 7–16 realize it, the first at order
9 (`ℓ = 4`, two independent multiplicity-1 supports)", repeated at line 752 (E7) and 1016 (TD-6), and
`sources/r24/records/C6-TERMINAL-SYNTHESIS.md` line 615 carries it into B3. All quotations in the
record are verbatim-accurate against the frozen originals.

*Targeted check of the antecedent's own witness shape.* Over all 19,320 trees of order 16 there are
**exactly 2** eligible residual isomorphism classes with `ℓ = 8` and `|C_1| = 6` — one a clean spider,
one with a length-3 pendant arm — **both `P_b`-true** (`α` of the induced graph on `C_1` is 6 in both)
and **both `P_c`-false and `P_d`-false**. The critic's cited shape exists and is `P_a`/`P_b`-true; it is
not realized. Which of the two the r24 critique meant is unclosable inside the grant and immaterial, as
the record says.

### Component (vi)–(vii): error class and TD-6

The defect is in the object computed, not in the prose: `P_b` and `P_c` are different mathematical
predicates that never coincide on this class (1,420 trees against none), so "predicate substitution on
the evidence" is the right class and the rejection of the label "prose" is correct. That the lost
instrument evaluated `P_b` is an **inference**, and the provenance gap is exactly why it cannot be
closed — the record's own framing, which I endorse. See Findings 2 and 3 for the two repairs to
component (vii).

---

## Findings and repairs

Substance: all seven components of the record are correct and independently re-derived above. Five
repairs to the **record text** follow; two are material.

**1. (MATERIAL — grade) Strike "formally verified" from the family-(I) theorem's carrier in this
record.** The brief's component (i) calls the forced-neighbour lemma "now a component of the formally
verified award C1-LA1". Nothing in my capsule supports `formally_verified`. The only Stage 7 member is
`runs/lean-2026-09-24-c1-la1-top-rank-residual-sign/INFORMAL-PROOF.md`, which self-describes as "the
statement-level informal proof that the shipped Lean development realises" and as "the informal audit's
**input**". The capsule carries no Lean source, no `lake` log, no `#print axioms` output, no
informal-audit verdict and no fidelity review. `SOLUTION-CONTRACT.md` §4 reserves `formally_verified`
for "governed workflow, all receipts", and the Stage 6 synthesis itself grades the structural core
`proved_informal` (R-5, six independent in-run derivations). **The Tier 2 registration must carry
`proved_informal` for the structural core and must not assert formal verification on its face.** If
Stage 7 closes C1-LA1 with receipts, the controller may add a pointer — but as a separate registration,
not as a grade inside this record. (I note without adopting it: `INFORMAL-PROOF.md` §L-3 derives
`w = ℓ−1` and `|famI| = ℓM` by the same argument I gave above, so the mathematics is not in doubt; only
the *grade* is.)

**2. (MATERIAL — correctness) TD-6's prescription has two disjuncts; only the first is void.** The
frozen original (`C6-ADJUDICATION-T.md` lines 1016–1019, and verbatim earlier at `C6-CRITIQUE-C-T1-U.md`
lines 451–453) reads: "Any proof must bound the multiplicity-1 support count against `ℓ` inside the
class, **or** pair family-(I) terms against `ℓM` and family (III) rather than sign them individually."
The record's "*Operative consequence*" quotes and voids only the first disjunct, which is right, but the
sentence "**TD-6's research prescription … is VOID**" reads as voiding TD-6's prescription entire. The
second disjunct is **not** void — it is exactly the route the run's own finish takes
(`INFORMAL-PROOF.md` `node-sign-bound`: `W = W_I + W_II + W_III ≥ ℓ(ℓ−1)M + (ℓ−4)N₂`, signed against
`ℓM` through (RI); family (I) is summed to the exact `ℓ(ℓ−1)M`, never signed term-wise). Voiding it
unqualified would discard the correct route along with the empty one — the precise failure mode this
record exists to prevent. **Repair: void the first disjunct by name, and record the second disjunct as
live and as the route actually taken.** R-9's own wording ("its prescription to bound `|C_1|` against
`ℓ` declared VOID") is already correct and should govern the phrasing of the Tier 2 bullet.

**3. (precision) The surviving instruments reach `λ` and `k_2`, and stop there.** "…implement no family
classification, no `A_D`/`A_C`/`A_S`/`C_1` object…" is literally true of `C_1`, but both `scan.py` and
`adj_engine.py` *do* build the leaf-multiplicity map `qs` (= `λ`) and `k_2 = |C_2|`, used solely for the
flat closed-form check. Saying so strengthens the finding rather than weakening it: the lost instrument
is not merely partly unshipped — the shipped ones get as far as `λ` and `k_2` and contain no shell
object at all.

**4. (precision) The controller's `P_c`/`P_d` are equivalent, not identical, and the equivalence should
be stated.** `replay1420.py` tests `U(J) ≠ ∅` for some maximum independent `J ⊆ D` (resp.
`α(T[U(J)]) > (ℓ−1)/2`) — a forced-neighbour failure — where F2's `P_c`/`P_d` are shell-membership
predicates. They agree because a family-(I) member with `A_C ≠ ∅` exists iff some maximum `J ⊆ D` has
`U(J) ≠ ∅`: `h = 1` leaves exactly `ℓ − |A_C| − 1 ≥ 0` leaves free, so any nonempty independent
`A_C ⊆ U(J)` extends to a shell member, and conversely. I proved this equivalence and verified it
numerically. Recording it converts a coincidence of numbers into a second, structurally different
derivation, which is the stronger form of the corroboration.

**5. (precision) "First at order 9" is an invariant; "the first witness" is not.** `replay1420.py`
records `first` as the first tree in `networkx.nonisomorphic_trees` order and reports the *same* tree
for `P_a` and `P_b`. The record's "the two replays never disagreed; they printed two members of a
two-element set" is correct and should carry the reason: witness identity is generator-order dependent,
so only the **order** (9) and the **class count** (exactly two) are instrument-independent. Both are
reproduced here on a generator that is not `nonisomorphic_trees`.

**Verified correct, no repair needed** (recorded so the controller does not re-litigate): the
universality of the refutation rides on the family-(I) theorem (`proved_informal`), not on the census,
and the record keeps the two carriers separate — correct under fence 3. The `(ℓ−1)/2` threshold is a
rational and must not be integer-divided; I checked that floor division would in fact agree on every
eligible residual tree of orders 7–13 (677 trees, 0 disagreements, because for even `ℓ` both forms
reduce to `|A| ≥ ℓ/2`), so no instrument in the portfolio is at risk from it. The family-(I) weight
formula `ℓ−1−2|A_C|` must be read in `ℤ`: truncated in `ℕ` it is identically `0` on the flipping range
and the r24 claim becomes unstatable. `SOLUTION-CONTRACT.md` §3.5 is satisfied; the key
`E993-R26-C6-B3-FAMILY-I-REALIZATION-CORRECTION` is a **predicate** — it asserts the existence of a
correction record about the r24 C6 B3 family-(I) realization claim, which the statement satisfies, and
it asserts nothing about the truth of that claim or about any grade. It under-describes the record (which
also covers items 5 and 6 and TD-6) but does not over-assert, which is the direction the rule permits.

---

## Registration text

To be registered **verbatim** by the controller, with repairs 1–5 applied.

> **Key** `E993-R26-C6-B3-FAMILY-I-REALIZATION-CORRECTION`
>
> **Statement (correction record; `SOLUTION-CONTRACT.md` §3.5 — a record, never an edit of sealed
> history; no r24 file is modified).**
>
> 1. *What the r24 record says.* The r24 C6 record (T adjudication Ruling 2 narrative, E7, TD-6 and
>    inventory item 6; terminal synthesis B3; antecedent critic `C-T1-U`) states that family-(I) weights
>    `ℓ−1−2|A_S|` flip negative once `|A_S| > (ℓ−1)/2`, "a regime realized by 1,420 eligible residual
>    trees of orders 7–16, first at order 9".
> 2. *The realization statement is* **REFUTED**. Completely within its own stated range, by exhaustive
>    replay on six independent instruments (`P_c = P_d = 0` on all **7,247** eligible residual trees of
>    orders 7–16, **128,908** shell members, **0** unclassified); and **universally**, by the theorem
>    that under `(★)` every family-(I) member has `A_C = ∅` and weight exactly `ℓ − 1 ≥ 1`, whence
>    `|Fam I| = ℓ·M`. The realization is structurally impossible at every order, not merely unobserved.
>    `REFUTED` does not regress.
> 3. *What reproduces 1,420.* `P_b` — the induced graph on the multiplicity-1 supports `C_1` has an
>    independent set of size `> (ℓ−1)/2` — gives exactly **1,420** over orders 7–16, first at order 9.
>    `P_a` (`|C_1| > (ℓ−1)/2`) gives **1,486**, overcounting by **66** because some `C_1` supports are
>    mutually tree-adjacent. `P_b` is a structural precondition on the tree, never a statement of shell
>    membership.
> 4. *The order-9 first occurrence.* Exactly **two** `P_b` isomorphism classes, both `ℓ = 4`, `a = 2`,
>    `M = 1`, `α = 6`, `x = 3`, with two mutually non-adjacent multiplicity-1 supports. Class 1
>    (`i = (1,9,28,38,24,8,1)`, shell 8, `S = −20`) was printed by F2; Class 2
>    (`i = (1,9,28,37,22,7,1)`, shell 7, `S = −18`) by `C-F2-U`, and the controller's pre-run witness is
>    isomorphic to Class 2 (canonical forms recomputed by the second read). Neither class has a
>    family-(I) member with non-empty `A_C`. The two replays never disagreed; they printed two members of
>    a two-element set. **The order (9) and the class count (two) are instrument-independent; the
>    identity of "the first witness" is generator-order dependent and carries no weight.**
> 5. *Provenance: gap, covering inventory items 5 and 6.* `adj_engine.py` and `scan.py` implement no
>    family classification, no shell enumeration of `I_{α−1}(G)`, no `A_D`/`A_C`/`A_S` object, no `C_1`
>    and none of the four predicates; they build only the leaf-multiplicity map `λ` and `k_2 = |C_2|`,
>    for the flat closed-form check. `scan_4_17.json` is `scan.py`'s output (key set, key order and
>    `indent=1` all match). The T adjudication names exactly these three files as the seat's entire
>    authored scratch, so the gap covers both item 6 (the 1,420 figure) and item 5 (the three-family
>    expansion said to be implemented and checked on 312 trees). **Item 5's content is independently
>    true** (F2, `C-F2-T`, `C-F2-U`, adjudicator F, and the second read on all 312 trees of orders 7–12,
>    0 mismatches, 0 unclassified); only its provenance is missing.
> 6. *Error class:* **predicate substitution on the evidence**, recorded as an **inference** about an
>    instrument that does not survive, never as a certified account of the adjudicator's act. The
>    substitution originates in `C-T1-U`'s antecedent sentence — a `P_a`-shaped `|C_1| = 6` count on an
>    order-16 shape, offered as evidence of realization with no shell membership — which the r24
>    adjudicator broadened and supplied a number for. The correction attaches to both sentences. The
>    label "prose" is rejected: `P_b` and `P_c` are different mathematical predicates that provably never
>    coincide on this class. (Exactly two order-16 eligible residual classes have `ℓ = 8` and
>    `|C_1| = 6`; both are `P_b`-true and both are `P_c`/`P_d`-false. Which the critique meant is
>    unclosable inside the grant and immaterial.)
> 7. *Operative consequence.* **TD-6's first prescriptive disjunct — "bound the multiplicity-1 support
>    count against `ℓ` inside the class" — is VOID**: by family-(I) emptiness, `A_C = ∅` on every realized
>    family-(I) member however large `C_1` is, so no bound on `|C_1|` is needed anywhere. **TD-6's second
>    disjunct — "pair family-(I) terms against `ℓM` and family (III) rather than sign them individually"
>    — is NOT void; it is the live route and the one the run's own finish takes.** TD-6 is narrowed, not
>    struck: the sign-flip phenomenon is real and belongs to **family (III)**, whose weight `ℓ − 2|A_C|`
>    is the only one that varies.
>
> **Grades.** Realization claim: **`REFUTED`**, universal, carried by the structural theorem.
> `P_b = 1,420`, `P_a = 1,486`, first at order 9, exactly two order-9 classes, 7,247 trees / 128,908
> shell members / 0 unclassified, orders 7–16: **`bounded_computation`** (exact census at the stated
> orders; universal of nothing — `SOLUTION-CONTRACT.md` §3.3). Structural core (forced neighbour;
> family (I) `A_C = ∅`, `w = ℓ−1`, `|Fam I| = ℓ·M`): **`proved_informal`** — **not**
> `formally_verified`; no Lean receipt is in evidence at this registration. Hypotheses consumed by the
> structural core: `hyp-tree`, `hyp-alpha`, `(★)`; **not** `hyp-eligible` (verified on the 18 ineligible
> residual trees of orders 3–14). Provenance and error-class components: **record**, the latter an
> inference so labelled.
>
> **Attribution on its face.** The three-family expansion is r24 critic `C-T1-U` (B3)
> (`SOLUTION-CONTRACT.md` fence 7). The statement of the forced-neighbour lemma is the research
> packet's (fence 7); every proof of it is in-run. Route **F2** produced the replay and the draft
> record; the refutation was widened and re-ruled on five points by **adjudicator F** (Decisions 8–16);
> adopted in full by the **Stage 6 synthesis** (Tier 2, R-2); second-read by **`SR-B3`**, which applied
> five repairs. Instruments: F2, `C-F2-T`, `C-F2-U`, adjudicator F, the controller's withheld pre-run
> replay (a controller record, one more replay, never authority — and testing an *equivalent*, not
> identical, pair of `P_c`/`P_d` predicates, the equivalence proved at second read), and `SR-B3`'s own
> instrument on an independent free-tree generator.
>
> **Fences.** No status transfer to `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, `E993-BETA-AGG`, the
> transport, the common-leaf condition, TREE, FOREST, TRANSFER or Erdős #993 (fence 1). The census is
> bounded evidence of nothing universal (fence 3); the universality of the refutation rides on the
> structural theorem alone. This is a correction RECORD; no sealed r24 file is edited (fence 5). The
> r24 "1,420 realized" sentence is never quoted as fact.

**Carried with it:** R-9 (TD-6 narrowed to family (III); the `|C_1|`-bound disjunct VOID, the pairing
disjunct live), in the amended form of repair 2.

---

## Verdicts

verdict[B3-1]: confirmed_with_repairs

---

## Artifact inventory

**Deliverable — the only file written outside scratch:** `second-reads/SR-B3/SECOND-READ.md` (this
file), run-root-relative.

**Scratch, entirely under `scratchpad/c1-sr-SR-B3/`.** No `/tmp`, no `mktemp`, no `TMPDIR`, no session
scratchpad. Nothing under `control/`, `sources/`, `cycles/`, `runs/` or any seat's, critic's or
adjudicator's directory was created or modified.

| File | Role | Import list |
|---|---|---|
| `verify_seal.py` | capsule inner-seal recomputation and all 21 member `bytes` + `sha256` checks | `json`, `hashlib`, `os` |
| `srb3_instrument.py` | free-tree generator (augmentation + AHU canonical dedup), independence polynomials, `x`, `(★)`, shell enumeration, three-family classifier, four predicates, literal aggregate | `sys`, `fractions.Fraction` |
| `checks2.py` | witness canonical forms and controller-witness isomorphism; `\|Fam I\| = ℓM`, family-(II)/(III) weights, (RI), `S ≤ 0`, 0 unclassified on orders 7–14; order-16 `ℓ = 8`, `\|C_1\| = 6` search | `sys`, `srb3_instrument` |
| `checks3.py` | family-(I) theorem on the 18 ineligible residual trees (hypothesis load); exact-vs-floor threshold comparison | `sys`, `fractions.Fraction`, `srb3_instrument` |

**Computations performed** (all deterministic, exact integer arithmetic, single-threaded, foreground,
no network, no installs, standard library only):

1. Capsule seal recomputation and 21/21 member digest verification; re-verified unchanged at close.
2. Free trees, orders 1–16: 11/23/47/106/235/551/1301/3159/7741/19320 at orders 7–16.
3. Four-predicate replay, orders 7–16: 7,247 eligible residual trees; `P_a = 1486`, `P_b = 1420`,
   `P_c = P_d = 0`; 128,908 shell members, 0 unclassified; 69,261 family-(I) members, 0 violations of
   `A_C = ∅` or `w = ℓ−1`. 10.8 s.
4. Structural identities and (RI), orders 7–14, 1,469 trees: 0 violations of `|Fam I| = ℓM`, family-(II)
   singleton `w = ℓ−4`, family-(III) `w = ℓ−2|A_C|`, `S = ℓM − Σw`, `S ≤ 0`, 0 unclassified. 9.2 s.
5. Order-9 `P_b` classes: exactly 2, printed in full with edges, `i`, `α`, `x`, `L`, `C`, `λ`, `C_1`,
   `D`, `a`, `M`, every maximum independent set, every shell member with family/`A_D`/`A_C`/`h`/`w`, and
   the literal `S`. Controller pre-run witness canonical form matched to Class 2.
6. Order-16 targeted search, all 19,320 trees: exactly 2 eligible residual classes with `ℓ = 8`,
   `|C_1| = 6`; both `P_b`-true, both `P_c`/`P_d`-false.
7. Hypothesis-load discrimination: 18 residual trees of orders 3–14 failing `hyp-eligible`; family-(I)
   theorem holds on all 18.
8. Threshold arithmetic: exact `Fraction` vs floor division on 677 eligible residual trees of orders
   7–13, 0 disagreements.

**Read.** Capsule members only, plus the two VerityOS boot files. Read in full, line by line:
`SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C1-SECOND-READ-PROTOCOL.md`,
`control/C1-SECOND-READ-BRIEF-SR-B3.md`, `control/c1-second-read/SR-B3-PACKET-MANIFEST.json`,
`control/controller-prerun/replay1420.py` and `.json`, `sources/r24/adjudicator-scratch/scan.py` and
`adj_engine.py`. Read in the sections the brief and the manifest direct: F2's `RETURN.md` (predicate
definitions, per-order table, order-9 witness, order-16 search), both F2 critiques
(`C-F2-T`: the range-bounded sharpening, the item-5 widening, the 303-tree cross-check, the
`indent=1` byte-identity finding; `C-F2-U`: the second order-9 witness and its edge list, the item-5
widening, the struck citation literals), the F adjudication §F2 Decisions 8–16, the Stage 6 synthesis
`### Tier 2` and `## Registrations`, `INFORMAL-PROOF.md` (statement, hypothesis map, L-1/L5″/L-3, the
family-(I) count, `node-sign-bound`, the axiom paragraph), and the three frozen r24 records at the
passages carrying the 1,420 claim, inventory items 5 and 6, the artifact inventory, TD-6, E7, B3 and
`C-T1-U`'s antecedent sentences. `sources/r24/adjudicator-scratch/scan_4_17.json` inspected for key set,
key order and indentation. `control/SOURCE-DIGESTS.json`, `control/C1-STAGE6-PACKET-MANIFEST.json` and
`sources/r24/r23-evaluator/ordinary_tree.py` verified by digest as capsule members; the evaluator's
`first_strict_descent` convention was re-implemented from `SEMANTIC-CONTRACT.md` §5 rather than
imported.

**Not read.** Any other return, critique or adjudication; any other second read; any experiment root
outside this run; any Lean source, build log or receipt; any network resource.

**Close check.** All 21 capsule digests and the inner seal re-verified after the work above: **MATCH**.
This file reread before close.
