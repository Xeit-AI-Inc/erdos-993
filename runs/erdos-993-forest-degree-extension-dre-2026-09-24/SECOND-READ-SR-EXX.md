# Second Read

Isolated Cycle-1 second read `SR-EXX` — r27, run
`erdos-993-math-dre-20260924-r27-forest-degree-extension`.
Protocol `control/C1-SECOND-READ-PROTOCOL.md`; brief `control/C1-SECOND-READ-BRIEF-SR-EXX.md`;
dispatch wrapper `control/dispatch/c1-second-read/DISPATCH-SR-EXX.md`.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot
self-inspect its runtime model/effort — stated on dispatch-record authority.

VerityOS: booted before any substantive work. Loaded `verity.md` and `identity/startup-protocol.md`;
subsystem `experiments/` (this run root only). No other VerityOS subsystem was read, nothing durable was
proposed or promoted, and no sealed member was edited.

---

## Identity and seal audit

**Capsule.** `control/c1-second-read/SR-EXX-PACKET-MANIFEST.json`,
`schema_version: verityos.math-dre.packet-manifest.v1`, `stage: cycle-1-second-read-SR-EXX`,
`run_id: erdos-993-math-dre-20260924-r27-forest-degree-extension`.

**Seal.** Recomputed independently (`scratchpad/c1-sr-SR-EXX/seal_verify.py`) as the SHA-256 of the
compact key-sorted JSON of the manifest minus `seal_sha256`, no trailing newline:

- claimed `d4a5ab21766362900bd79acb3e7ea078bb43aa6ca339bcf55ac6569e801c7281`
- computed `d4a5ab21766362900bd79acb3e7ea078bb43aa6ca339bcf55ac6569e801c7281`
- **MATCH.** Seal reported: `d4a5ab21766362900bd79acb3e7ea078bb43aa6ca339bcf55ac6569e801c7281`.

**Digests.** `file_count` declared 102, listed 102, verified 102. Every member's SHA-256 and byte length
recomputed from disk: **102 match, 0 mismatch, 0 missing**. `ALL_GOOD: true`.

**Read boundary, disclosed.** Read: the two VerityOS boot files; the dispatch wrapper; and these capsule
members only — `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C1-SECOND-READ-PROTOCOL.md`,
`control/C1-SECOND-READ-BRIEF-SR-EXX.md`, `control/c1-second-read/SR-EXX-PACKET-MANIFEST.json`,
`control/c1-second-read/PATH-CHECK-SR-EXX.json`,
`control/C1-STAGE2-PATH-LITERAL-QUOTATION-RECORD.json`,
`cycles/cycle-1/stage4/critics/T3/U/CRITIQUE.md`, `cycles/cycle-1/stage4/critics/T3/F/CRITIQUE.md`,
`cycles/cycle-1/stage4/critics/F3/T/CRITIQUE.md`, `cycles/cycle-1/stage5/adjudicators/T/ADJUDICATION.md`,
`cycles/cycle-1/stage6/SYNTHESIS.md`. Not read: `sources/external/` (not a member; never opened),
`sources/r25/records/C6-ADJUDICATION-T.md` (a member, not needed), any seat/critic/adjudicator scratch
instrument. No Mathlib or Lean source was needed (this read writes no Lean). No `find`; every `grep` was
addressed to a single named member file, never to a directory above the capsule. No network, no installs,
no background jobs, no process kills. Python standard library only; exact integers only; no floating point
anywhere in any instrument. Wrote exactly one file outside my scratch: this one.

---

## Statements read

Three statements, with the synthesis's Table-B wording as CANDIDATE only.

**`EX-1` — (EXX), the exact extension identity.** Candidate (from `C-T3-U`,
`cycles/cycle-1/stage4/critics/T3/U/CRITIQUE.md`, advance A1; confirmed by the T adjudicator, Stage 5 §4):
`(k+1)·i_{k+1} = (n−k)·i_k − D_k + E_k` with `E_k = Σ_{J∈I_k} exc(J)`,
`exc(J) := Σ_{u∈V} max(codeg(u,J) − 1, 0)`, for every finite simple graph. Proposed key
`E993-R27-EXACT-EXTENSION-IDENTITY`.

**`EX-2` — descent maxima `M(k)` and the (XR) occupancy row.** Candidate (from `C-T3-F` F-4/F-3 at census
horizon 19 and `C-T3-U` A2 at horizon 12; sharpened to unconditional at `k ≤ 3` by the T adjudicator, row
16): `M(k) := max{n : ∃ finite forest with Δ_k < 0} = 4, 8, 11, 15, 18` for `k = 1..5`; occupancy
`max{n : x(G) < r} = 0, 4, 8, 11, 15, 18` for `r = 1..6`. No key proposed in the brief.

**`EX-3` — companion `Δ_5 < 0 ⇒ n ≤ 18`, sharp.** Candidate (from `C-F3-T`,
`cycles/cycle-1/stage4/critics/F3/T/CRITIQUE.md`, F-4): sharp, with 9,532 witnessing order-18 classes;
grade census-dependent, `bounded_computation`; fence "must not enter any award statement". Proposed key
`E993-R27-RANK5-CEILING-18-CENSUS`.

---

## Independent re-derivation

**Definitions taken from `SEMANTIC-CONTRACT.md` §1 and nowhere else.** `n := Nat.card X`;
`i_k(G)` the number of independent `k`-subsets (`i_0 = 1`, `i_k = 0` for `k > α`); for independent `J`,
`e(J) := |V ∖ N[J]|`; `D_k(G) := Σ_{J∈I_k} Σ_{v∈J} deg_G(v)`; `Δ_k := i_{k+1} − i_k` in `ℤ` (the `ℤ`-indexed
`Erdos993G1.delta`); `x(G)` the least `k` with `Δ_k < 0`.

**Instruments.** Four, all written for this read under `scratchpad/c1-sr-SR-EXX/`, sharing no code path with
any seat, critic or adjudicator instrument (those were not read and not run):

1. `sr_exx_identity.py` — explicit adjacency-bitmask graphs, exhaustive independent-set enumeration,
   direct evaluation of `e(J)`, `exc(J)`, `D_k`, `E_k`; plus an own free-tree/forest generator (rooted-shape
   enumeration deduplicated by AHU canonical form under centroid rooting).
2. `sr_exx_census.py` — the order-20 forest census by a **centroid decomposition**: rooted-tree classes of
   order ≤ 10 carry the pair `(f, g)` of the independence polynomial split by root membership, truncated to
   degree 6; free trees are enumerated as unicentroidal (multiset of rooted branches of order
   `≤ ⌈n/2⌉ − 1`) or bicentroidal (unordered pair of order-`n/2` rooted trees joined root to root); forests
   are multisets of free trees, split by the fact that at order ≤ 20 at most one component has order ≥ 11.
   Polynomials are packed as base-`2^32` seven-digit integers, so polynomial multiplication is integer
   multiplication masked to seven digits — exact, with an explicit no-carry audit.
3. `sr_exx_validate.py` — cross-validation of (2) against brute force.
4. `sr_exx_witness.py`, `sr_exx_m4.py`, `sr_exx_nat.py`, `sr_exx_summary.py` — explicit extremal witnesses
   verified by direct `itertools.combinations` counting, the `ℕ`-subtraction audit, the per-order strata.

**`EX-1` — proof, from the definitions, for every finite simple graph.** Let `G` be a finite simple graph on
`V`, `|V| = n`, and let `J ⊆ V` be independent with `|J| = k`. Write `codeg(u, J) := |N(u) ∩ J|`.

- `|N[J]| = k + |N(J)|`, because `J` is independent, so `J ∩ N(J) = ∅`. (This is the only place
  independence of `J` is used.)
- `Σ_{v∈J} deg(v) = Σ_{u∈V} codeg(u, J)`: both count the pairs `(v, u)` with `v ∈ J` and `u ∼ v`, using only
  the symmetry of adjacency and the absence of loops (simple graph).
- `|N(J)| = #{u ∈ V : codeg(u, J) ≥ 1}` by the definition of `N(J) = ⋃_{v∈J} N(v)`.
- Subtracting, `Σ_{v∈J} deg(v) − |N(J)| = Σ_{u : codeg ≥ 1} (codeg(u,J) − 1) = Σ_{u∈V} max(codeg(u,J) − 1, 0)
  = exc(J)`, since the terms with `codeg = 0` contribute `0` to both sides.
- `e(J) = n − |N[J]| = n − k − |N(J)| = n − k − Σ_{v∈J} deg(v) + exc(J)`.  **(EXX-local)**

Summing (EXX-local) over `J ∈ I_k(G)` and applying the double count `Σ_{J∈I_k} e(J) = (k+1)·i_{k+1}`
(the registered `formally_verified` `E993-R27-INDEP-EXTENSION-DOUBLE-COUNT`):

`(k+1)·i_{k+1} = (n−k)·i_k − D_k + E_k`  **(EXX)**, and subtracting `(n−3k)·i_k`,
`(k+1)·i_{k+1} − (n−3k)·i_k = (2k·i_k − D_k) + E_k`  **(EXX-slack)**.

**Hypotheses, and where each enters.** Finiteness of `V`: for `n` and the sums to be defined. Simplicity
(no loops, no multi-edges): for `Σ deg = Σ codeg`. Independence of `J`: only for `|N[J]| = k + |N(J)|`.
**Acyclicity is used nowhere**, and is not a hypothesis. No lower bound on `n` and none on `k` is used:
`k = 0` gives `I_0 = {∅}`, `exc(∅) = 0`, `e(∅) = n`, and the identity reads `i_1 = n·1 − 0 + 0`; `n = 0`
with `k = 0` gives `1·i_1 = 0·1 − 0 + 0`, i.e. `0 = 0`; `k > α` gives `i_k = i_{k+1} = D_k = E_k = 0` and
`0 = 0`. The empty graph, the empty forest and `k > α` were all included in the sweeps below, not reasoned
around.

**`EX-1` — `ℕ`-subtraction and cast audit.** The identity **must** be stated in `ℤ` (or subtraction-free);
`ℕ`-truncation is not merely unsafe in principle, it is wrong on actual forests. Both intermediates take
genuinely negative values (`sr_exx_nat.py`, exact integers): `P_6` at `k = 3` has `(n−k)·i_k = 12`,
`D_3 = 18`, so `(n−k)i_k − D_k = −6`, restored by `E_3 = 6` to `(k+1)i_4 = 0`; `P_12` at `k = 5` has
`(n−k)i_k = 392`, `D_5 = 490`, so `(n−k)i_k − D_k = −98`, restored by `E_5 = 140` to `6·i_6 = 42`; and
`n − k − Σ_{v∈J} deg(v)` reaches `−5` already on `P_11` at `k = 6` (with `e(J) = 0`, `exc(J) = 5`). By
contrast `exc(J)` is `ℕ`-safe exactly as written: `max(c − 1, 0)` **is** `ℕ`-truncated `c - 1`, so the
defect needs no `ℤ` cast. `(n − k)` alone is safe for `J ∈ I_k` (then `k ≤ n`) but is not safe as a standalone
`ℕ` expression at `k > n`, where it is multiplied by `i_k = 0`; the `ℤ` statement removes the question.

**`EX-1` — replay (own instrument, exact integers).** `sr_exx_identity.py`:

- **All labeled simple graphs on 0…6 vertices**: 1, 1, 2, 8, 64, 1024, 32768 — **33,868 graphs**,
  **943,524 identity checks** ((STAR), (EXX), (EXX-slack), and the per-set (EXX-local) and lower bound for
  every independent `J`), **0 failures**.
- **All forest isomorphism classes of order ≤ 10**: 1, 1, 2, 3, 6, 10, 20, 37, 76, 153, 329 = **638
  classes** (matching A005195 including the empty forest), **25,520 checks, 0 failures**. My free-tree
  counts 1, 1, 1, 2, 3, 6, 11, 23, 47, 106 match A000055.
- `E_k = 0` for `k ≤ 1` on every graph in both sweeps, as an asserted invariant with 0 violations.
- Fixed points of `SEMANTIC-CONTRACT.md` §4 all reproduced: empty forest `i_0 = 1`, `i_1 = 0`, `Δ_0 = −1`,
  `x = 0`; `K₁` `i = (1,1)`, `Δ_0 = 0`, `Δ_1 = −1`, `x = 1`; `P_n` for `n ≤ 8` (`P_8 = (1,8,21,20,5)`);
  `K_{1,m}` with `i_1 = m+1` and `i_k = C(m,k)` for `k ≥ 2`.
- `C-T3-U`'s worked values reproduced **exactly**: `K_{1,3}` at `k = 2` — `i_2 = 3`, `D_2 = 6`, `E_2 = 3`,
  `(k+1)i_3 = 3 = 6 − 6 + 3`, (EX) slack `9 = 6 + 3`; `P_5` at `k = 2` — `i_2 = 6`, `D_2 = 18`, `E_2 = 3`,
  `3 = 18 − 18 + 3`, slack `9 = 6 + 3`.
- `C-T3-U`'s corroborating counts reproduced on my own instruments: **2,932** labeled forests of order 6,
  **7,824** `(forest, k)` instances with `E_k > 0` among them, **1,100** labeled graphs of order ≤ 5,
  **2,949** forest classes of order ≤ 12, and **40,233** labeled forests of order ≤ 7 (cumulative;
  per-order 1, 1, 2, 7, 38, 291, 2932, 36961 — the figure is a cumulative count and is correct).

**`EX-1` — relation to `E993-R27-EXTENSION-LOWER-BOUND`.** (EXX-local) is the exact form of it:
`exc(J) ≥ 0` gives `e(J) ≥ n − k − Σ_{v∈J} deg(v)` immediately, with **equality iff `exc(J) = 0`**, i.e. iff
no vertex of `V` has two or more neighbours in `J`. Summed, (EXX-slack) exhibits (EX)'s slack as the (DL)
slack `2k·i_k − D_k` plus the co-degree excess `E_k`; so (EX) is strictly weaker than
(double count) + (DL) exactly where `E_k > 0`. The lower bound was checked per-set on all 33,868 graphs and
all 638 forest classes with 0 violations.

**`EX-2` / `EX-3` — the census.** `sr_exx_census.py`, complete and exhaustive to **order 20**, 2.6 s:

- Free-tree class counts, orders 1…20: 1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, 551, 1301, 3159, 7741,
  19320, 48629, 123867, 317955, **823065** — matching A000055 at every order.
- Forest class counts, orders 0…20: 1, 1, 2, 3, 6, 10, 20, 37, 76, 153, 329, 710, 1601, 3658, 8599, 20514,
  49905, 122963, 307199, 775529, **1977878** — matching A005195 at every order. Cumulative **3,269,194**
  including the empty forest, **3,269,193** excluding it; excluding the empty forest the cumulative figures
  are 515,786 to order 18 and 1,291,315 to order 19.
- **Descent maxima**, over the complete census: `M(0) = 0`, `M(1) = 4`, `M(2) = 8`, `M(3) = 11`,
  `M(4) = 15`, `M(5) = 18`.
- **Orders 19 and 20 carry no strict descent at any `k ≤ 5` at all**: the count of order-19 and order-20
  classes with `Δ_5 < 0` is **0**, and `M(k) ≤ 18` for every `k ≤ 5`.
- **Order-18 witnesses**: exactly **9,532** forest classes of order 18 have `Δ_5 < 0`.
- **First-descent strata** (per order, complete): `x = 0` only at `n = 0`; `x = 1` orders 1–4 (7 classes);
  `x = 2` orders 3–8 (48); `x = 3` orders 5–11 (497); `x = 4` orders 7–15 (6,454); `x = 5` orders 9–18
  (**107,443**). At `n = 8` the `x = 2` stratum has exactly **one** class.
- **Occupancy**: `max{n : x(G) < r}` = 0, 4, 8, 11, 15, 18 for `r = 1…6`.
- **Census-wide audit** (`sr_exx_witness.py`): over all 3,269,194 classes and `k = 0…5` —
  **19,615,164 `(forest, k)` instances** — there are **0** violations of (EX)
  `(k+1)i_{k+1} ≥ (n−3k)i_k`, **0** violations of (LB) `Δ_k < 0 ⇒ n ≤ 4k`, and **0** violations of the r25
  formal award `Δ_k < 0 ⇒ n ≤ (k+1)²`.

**Validation of the census instrument** (`sr_exx_validate.py`, a structurally different route):

- *No-carry audit.* The largest packed digit over every forest of order ≤ 20 is **38,760 = C(20,6)**, against
  a digit base of `2^32`. No digit ever approaches the base, so the packed-integer convolution is exact.
- *Brute-force agreement.* For orders 0…10 the census's truncated spectra were compared class-by-class with
  spectra computed by explicit enumeration of all `2^n` vertex subsets over adjacency bitmasks, on forest
  representatives produced by the independent AHU route: **638 classes compared, agreement at every order,
  0 mismatches.**
- *Explicit witnesses, verified by direct `k`-subset enumeration* (no polynomial machinery):
  `M(1) = 4` — `P_4`, `i_1 = 4`, `i_2 = 3`, `Δ_1 = −1`, `n = 4 = 4k`;
  `M(2) = 8` — `P_8`, `i_2 = 21`, `i_3 = 20`, `Δ_2 = −1`, `n = 8 = 4k`;
  `M(3) = 11` — `P_10 ⊔ K₁`, `i_3 = 92`, `i_4 = 91`, `Δ_3 = −1`;
  `M(4) = 15` — `P_15`, `i_4 = 495`, `i_5 = 462`, `Δ_4 = −33`;
  `M(5) = 18` — `P_10 ⊔ P_8`, `i_5 = 2232`, `i_6 = 2083`, `Δ_5 = −149`.
- *Emptiness above each maximum*, from the census: the count of classes with `Δ_k < 0` is 0 at every order
  from `M(k)+1` up to 20, for each `k = 1…5`.

**`EX-2` — what closes each value, exactly.** `Δ_k < 0 ⇒ n ≤ 4k` is (LB), `proved_informal` in this run;
`Δ_k < 0 ⇒ n ≤ (k+1)²` for `k ≥ 1` is the r25 award `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP`,
**formally verified**. A value of `M(k)` is closed when the census reaches the ceiling being used.

| `k` | `M(k)` | (LB) ceiling `4k` | formal ceiling `(k+1)²` | census horizon needed | reached | status |
|---|---|---|---|---|---|---|
| 0 | 0 | 0 | (award starts at `k ≥ 1`) | none — `Δ_0 < 0 ⟺ n < 1 ⟺ n = 0` | — | elementary, unconditional |
| 1 | 4 | 4 | 4 | 4 | yes | **unconditional** (formal ceiling) |
| 2 | 8 | 8 | 9 | 9 | yes | **unconditional** (formal ceiling) |
| 3 | 11 | 12 | 16 | 16 | yes | **unconditional** (formal ceiling) |
| 4 | 15 | 16 | 25 | 25 unconditionally, **16 under (LB)** | 16 only | **(LB)-conditional** |
| 5 | 18 | 20 | 36 | 36 unconditionally, **20 under (LB)** | 20 only | **(LB)-conditional** |

**`EX-2` — the occupancy row is the same object.** `x(G) < r` means some `k < r` has `Δ_k < 0`, so
`max{n : x(G) < r} = max_{k<r} M(k)`, and because the computed row `0, 4, 8, 11, 15, 18` is nondecreasing
this equals `M(r−1)`. The occupancy row and the maxima row are therefore one object re-indexed, not two
results; my instrument computes them separately and they agree. Against (XR)'s `4r − 4 = 0, 4, 8, 12, 16,
20`: **exactly attained at `r = 1, 2, 3`, off by one at `r = 4, 5`, off by two at `r = 6`**. Conditionality
transfers: `r ≤ 4` unconditional, `r = 5, 6` (LB)-conditional. Three cells that `T3` labelled "live" are
**EMPTY** — `(r,n) = (4,12)`, `(5,16)`, `(6,19)` — and I add the fourth: `(r,n) = (6,20)`, which the T
adjudicator recorded as "unverified by anyone", is **EMPTY** as well, on my own enumeration of all
1,977,878 order-20 classes.

**`EX-3` — re-derivation.** `Δ_5(G) < 0` forces `n ≤ 20` by (LB) at `k = 5`. My census of every forest class
of order ≤ 20 shows no class of order 19 or 20 has `Δ_5 < 0`, and exactly 9,532 classes of order 18 do.
Hence `Δ_5(G) < 0 ⇒ n ≤ 18`, sharp. This is precisely the `M(5) = 18` entry of the maxima row, plus the
witness count. Corroborating detail: `Δ_5 < 0` and `x = 5` coincide class-for-class from `n = 16` upward
(33,232 at `n = 16`; 39,126 at `n = 17`; 9,532 at `n = 18`; 0 at `n = 19, 20`), and my `x = 5` stratum
totals **107,443** classes over orders 9–18.

---

## Findings and repairs

**1 (`EX-3`, material — evidence line repaired).** `C-F3-T` grades its own evidence "orders ≤ 19 mine,
orders 20–21 the frozen r25 census", and the T adjudicator, working to order 16 and without sight of
`C-F3-T`, recorded the `(r, n) = (6, 20)` cell as "**unverified by anyone**". Both are right about the
Stage-4/5 state: **no r27 seat enumerated order 20**. This read does. The order-20 census (1,977,878
classes, own instrument, counts matching A005195) is empty of `Δ_5 < 0`, so the statement no longer leans on
the frozen r25 census for its single unenumerated order. **Repair: strike "orders 20–21 the frozen r25
census" from the evidence line and replace it with the in-run exhaustive order-20 enumeration (SR-EXX);
order 21 is not needed, since (LB) at `k = 5` excludes it.** The reconciliation gap itself — two review-stage
records disagreeing about whether order 20 was covered — should be recorded; the synthesis carries both
claims in Table B without reconciling them.

**2 (`EX-2`, material — the brief's own gloss must not be registered).** The brief glosses the unconditional
values as "proved by (LB) + finite census below the (LB) ceiling, hence `proved_informal` +
`bounded_computation`". That is a grade-transfer hazard of exactly the kind `SOLUTION-CONTRACT.md` §3.4 and
§4 exist to stop, and it is wrong twice over. (a) A value closed only under (LB) is **not** unconditional:
(LB) is `proved_informal` in this run, not formally verified. Unconditional means the search ceiling comes
from the *formally verified* r25 award `(k+1)²` — which closes `k = 1, 2, 3` and **not** `k = 4, 5`. This is
the T adjudicator's sharpening, and my census independently confirms it. (b) The grade of **every** `M(k)`
value is `bounded_computation`, because each rests on a complete finite census; "unconditional" describes
the provenance of the ceiling, not the grade. `proved_informal` must not be written on any `M(k)`.
**Repair: adopt the split in the table above and grade the whole row `bounded_computation`.**

**3 (`EX-2`, precision).** The brief says `k = 3`'s value "needs the census at order 12 — confirm".
Confirmed, but only as the **(LB)-conditional** horizon. The **unconditional** horizon for `M(3) = 11` is
order 16 (the formal `(k+1)² = 16` ceiling); my census reaches it, which is why `M(3)` is unconditional at
all. Likewise the brief's "`k = 1, 2` closed by (LB) as 4, 8" is true but understates them: they are closed
by the formally verified ceiling as well. **Repair: state the horizon per ceiling, not per value.**

**4 (`EX-2`/`EX-3`, canonical form).** `EX-3` is not independent of `EX-2`: `Δ_5 < 0 ⇒ n ≤ 18` with 18
attained **is** the `M(5) = 18` entry. Likewise the (XR) occupancy row is the maxima row re-indexed by
`max{n : x < r} = M(r−1)`. **Repair: the canonical form is the maxima row `M(0..5) = 0, 4, 8, 11, 15, 18`.**
The occupancy row is registered as its corollary inside the same key, never as a second key. The rank-5
companion keeps its own key only because it carries content the row does not (the 9,532 witness count and
the comparison with (R5) and with the r25 ceiling 25) and because the synthesis attaches a distinct fence to
it — it must carry, on its face, that its order bound is the row's `k = 5` entry and is not a second
independent result.

**5 (`EX-3`, precision, critic-internal).** `C-F3-T` F-4's step "for `n ≥ 17`, `Δ_5 < 0` forces `x = 5`" is
correct but not sharp: the two coincide from `n ≥ 16`. At `n = 15` they differ by exactly 61 classes, which
is exactly the order-15 `Δ_4 < 0` count. The statement is unaffected.

**6 (`EX-1`, typing, carried onto the face).** (EXX) and (EXX-local) must be stated in `ℤ` or
subtraction-free; on real forests both intermediates go negative (finding text above). `exc(J)` as written
with `max(· , 0)` is already `ℕ`-safe and needs no cast — worth keeping in that exact form for the Lean
statement, as the T adjudicator's "U3 should compile (EXX-local) rather than the inequality" implies.

**7 (bookkeeping).** Two census conventions coexist in the record: `C-T3-F` reports 1,291,316 classes to
order 19 and `C-F3-T` reports 1,291,315 and 3,269,193. My census reproduces both — the difference is the
empty forest, which `SEMANTIC-CONTRACT.md` §1 admits ("it may be disconnected or empty"). Neither is wrong;
the convention should be stated wherever a cumulative count is registered. `C-T3-U`'s "40,233 labeled
forests of order ≤ 7" is likewise correct as a **cumulative** count (the order-7 term alone is 36,961).

**8 (fences, all clauses checked).** §3.1: `EX-2` and `EX-3` are order bounds and maxima about the sign of
`Δ_k`; `EX-1` is an identity. None is a no-recovery statement; no status is transferred to
`E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER or Erdős #993. §3.2: no
`N₀`, no asymptotics, no unimodality claim anywhere in this read. §3.3: (EXX-local) is a per-set identity,
but it is not a pointwise **degree** statement and it uses (DL) nowhere, so it neither breaches nor weakens
the clause; (EXX) and `E_k` are sums over `I_k`. §3.4: `EX-2` and `EX-3` carry their census grade and, where
applicable, (LB) on their faces; no formal grade promotes them. §3.5: no sealed member was edited; every
correction above is a note. §3.6: no external Lean text was read or carried. §3.7: attributions verified
and written into the registration text below — `C-T3-U` for (EXX), `C-T3-F`/`C-T3-U`+T adjudicator for the
maxima, `C-F3-T` for the rank-5 companion; FLNYZ 2026 §8 travels for the (DL)/(EX) programme but **(EXX) is
not an FLNYZ statement** and must not be attributed to them. §3.8:
`E993-R25-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` (REFUTED) is a premise nowhere in any of the three
statements or in my derivations.

**9 (keys are predicates).** `E993-R27-EXACT-EXTENSION-IDENTITY` asserts exactly "an exact identity for the
extension count"; the statement is one, and the key does not assert forest-restriction, sharpness or
formality — it does not assert more than the statement. `E993-R27-RANK5-CEILING-18-CENSUS` asserts "a
census-backed rank-5 ceiling of 18"; the statement satisfies it and the key flags the census dependence,
though **not** the (LB) dependence, which must therefore travel in the grade and attribution lines. The
proposed key for `EX-2`, `E993-R27-FOREST-DESCENT-MAXIMA-CENSUS`, asserts "census-determined forest descent
maxima" — satisfied, with the unconditional/(LB)-conditional split on the face, since the key name itself
claims neither.

---

## Registration text

Register verbatim.

**1.**

- **Key:** `E993-R27-EXACT-EXTENSION-IDENTITY`
- **Statement (canonical form, in `ℤ`):** For every finite simple graph `G` on a finite vertex type `X`,
  with `n := Nat.card X`, and for every natural `k`:
  `(k+1) · i_{k+1}(G) = (n − k) · i_k(G) − D_k(G) + E_k(G)` in `ℤ`,
  where `i_k = Erdos993G1.indepCount`, `D_k(G) = Σ_{J ∈ I_k(G)} Σ_{v ∈ J} deg_G(v)`, and
  `E_k(G) := Σ_{J ∈ I_k(G)} exc(J)` with, for independent `J`, `codeg(u, J) := |N(u) ∩ J|` and
  `exc(J) := Σ_{u ∈ V} max(codeg(u, J) − 1, 0)` (equivalently `exc(J) = Σ_{v∈J} deg_G(v) − |N(J)|`: the
  number of over-counted neighbour incidences). **No acyclicity**; no lower bound on `n` or on `k`.
- **Per-set lemma of record, inside this registration and not a second key:** for every independent `J` with
  `|J| = k`, `e(J) = n − k − Σ_{v∈J} deg_G(v) + exc(J)` in `ℤ` ((EXX-local)). The summed identity follows
  from it and the registered `E993-R27-INDEP-EXTENSION-DOUBLE-COUNT`. (EXX-local) is the form to compile.
- **Corollaries carried on the face, not separate keys:**
  `(k+1)·i_{k+1} − (n − 3k)·i_k = (2k·i_k − D_k) + E_k` ((EXX-slack)), so (EX)'s slack is the (DL) slack
  plus the co-degree excess; `exc(J) ≥ 0` recovers `E993-R27-EXTENSION-LOWER-BOUND`, with equality **iff**
  `exc(J) = 0`, i.e. iff no vertex of `V` has two or more neighbours in `J`; `E_k = 0` identically for
  `k ≤ 1`.
- **Grade:** `proved_informal` (elementary and unconditional). The exhaustive replays are corroboration
  only, never the ground of the statement.
- **Attribution:** `C-T3-U` (r27 Cycle 1, Stage 4 critic on T3, advance A1) for the identity and the defect
  term `exc`; T adjudicator (r27 Cycle 1, Stage 5, §4) verified the derivation and directed that the
  per-set form is the one to compile; the double count it is summed against is
  `E993-R27-INDEP-EXTENSION-DOUBLE-COUNT` (U3, `formally_verified`); the bound it refines is
  `E993-R27-EXTENSION-LOWER-BOUND` (U3, `formally_verified`); the ambient (DL)/(EX) programme is
  Fang–Lu–Nevo–Yao–Zheng 2026 §8 — **(EXX) is not an FLNYZ statement and is not attributed to them**.
  Isolated second read: `SR-EXX` (Claude Opus 5, high), which re-derived the identity from
  `SEMANTIC-CONTRACT.md` §1 and replayed it on all 33,868 labeled simple graphs of order ≤ 6 (943,524
  checks) and all 638 forest isomorphism classes of order ≤ 10 (25,520 checks), zero failures.
- **Fences:** graph-general — acyclicity is not a hypothesis, so this identity is **not** evidence for (DL),
  (EX), (LB), (R5) or (XR) (§3.1); it is an identity between sums over `I_k`, and its per-set step is not a
  pointwise degree statement and uses (DL) nowhere, so §3.3 is untouched; no status transfers to
  `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER or Erdős #993 (§3.1);
  **must be stated in `ℤ` or subtraction-free** — both `n − k − Σ deg` and `(n−k)·i_k − D_k` take genuinely
  negative values on forests (`P_6` at `k = 3`: `12 − 18 = −6`; `P_12` at `k = 5`: `392 − 490 = −98`) —
  while `exc(J)` is `ℕ`-safe as written because `max(·, 0)` is exactly `ℕ`-truncated subtraction (§4).

**2.**

- **Key:** `E993-R27-FOREST-DESCENT-MAXIMA-CENSUS`
- **Statement:** `M(k) := max{ n : some finite forest of order n has Δ_k < 0 }` satisfies
  `M(0) = 0`, `M(1) = 4`, `M(2) = 8`, `M(3) = 11`, `M(4) = 15`, `M(5) = 18`, each attained — witnesses the
  empty forest; `P_4`; `P_8`; `P_10 ⊔ K₁`; `P_15`; `P_10 ⊔ P_8`.
- **Conditionality, on the face:** `M(0)` is elementary (`Δ_0 < 0 ⟺ i_1 < i_0 ⟺ n = 0`).
  **`M(1) = 4`, `M(2) = 8` and `M(3) = 11` are UNCONDITIONAL**: the search is capped by the *formally
  verified* `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` (`Δ_k < 0 ⇒ n ≤ (k+1)²`; ceilings 4, 9, 16) and the
  census is complete to order 20 ≥ 16, so they depend on no unproved input. **`M(4) = 15` and `M(5) = 18`
  are CONDITIONAL on (LB)** (`E993-R27-FOREST-DESCENT-LINEAR-BOUND`, `proved_informal`), whose ceilings 16
  and 20 the census reaches; their unconditional horizons would be 25 and 36 and are **not** attained.
- **Consequences carried on the face:** (LB)'s `4k` (4, 8, 12, 16, 20) is **attained at `k = 1` and `k = 2`**
  (witness `P_8` at `n = 8 = 4k`) and **strictly slack at `k = 3, 4, 5`** (11 < 12, 15 < 16, 18 < 20). The
  linear constant 4 cannot be lowered, but `4k` is not the exact maximum function for `k ≥ 3`. The r25
  award's scope wording "tight at `k = 1` only" is correct for `(k+1)²` and **must not** be carried to `4k`.
- **(XR) occupancy row, a corollary inside this key and not a second registration:** since `x(G) < r` means
  some `k < r` has `Δ_k < 0` and the row is nondecreasing, `max{ n : x(G) < r } = M(r−1)`, giving
  **0, 4, 8, 11, 15, 18 for `r = 1..6`** against (XR)'s `4r − 4 = 0, 4, 8, 12, 16, 20`: **exactly attained at
  `r = 1, 2, 3`, off by one at `r = 4, 5`, off by two at `r = 6`**. The cells `(r, n) = (4, 12)`, `(5, 16)`,
  `(6, 19)` and `(6, 20)` are **EMPTY**. Occupancy at `r ≤ 4` is unconditional; at `r = 5, 6` it is
  (LB)-conditional. The (XR) table column must read "not excluded by (XR)", never "live".
- **Grade:** `bounded_computation` for every entry, unconditional entries included — each rests on a
  complete finite census. "Unconditional" describes the ceiling's provenance, not the grade;
  `proved_informal` must not be written on any `M(k)`.
- **Attribution:** `C-T3-F` (r27 Cycle 1, Stage 4 critic on T3, F-3/F-4) for the five values, the tightness
  profile and the occupancy row at census horizon 19; `C-T3-U` (Stage 4 critic on T3, advance A2) for
  `M(1..3)` and the tightness consequence at horizon 12; **T adjudicator** (Stage 5, row 16) for the
  sharpening to unconditional at `k ≤ 3` and for striking the "live" column header; the r25 scope note of
  `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` for the prior values 4, 8, 11, 15, now reverified in-run
  three times on independent instruments. Isolated second read: `SR-EXX` (Claude Opus 5, high), for the
  independent complete census to **order 20** (free-tree counts matching A000055 and forest counts matching
  A005195 at every order through 20; 3,269,193 nonempty classes), for the explicit witnesses verified by
  direct `k`-subset enumeration, and for the conditionality split exactly as stated above.
- **Fences:** a maxima/order-bound record — not a no-recovery statement; no status transfers to
  `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER or Erdős #993 (§3.1);
  `M(4)`, `M(5)` and the `r = 5, 6` occupancy entries carry (LB) on their face and no formal grade promotes
  them (§3.4); sealed r25 records are not edited — the reverification is a note, not an edit (§3.5); the
  only subtraction is `4r − 4`, safe because `x(G) < r` forces `r ≥ 1` (§4).

**3.**

- **Key:** `E993-R27-RANK5-CEILING-18-CENSUS`
- **Statement:** For every finite forest `G` of order `n`: `Δ_5(G) < 0 ⇒ n ≤ 18`; equivalently
  `n ≥ 19 ⇒ Δ_5(G) ≥ 0`. It is **sharp**: exactly **9,532** forest isomorphism classes of order 18 have
  `Δ_5 < 0` (for instance `P_10 ⊔ P_8`, `i_5 = 2232`, `i_6 = 2083`, `Δ_5 = −149`). This is two orders sharper
  than (R5) (`n ≥ 21 ⇒ Δ_5 ≥ 0`) and seven sharper than the registered informal
  `E993-R25-RANK5-CEILING-SHARPENED-TO-25`.
- **Mandatory annotation on the face:** the order bound here **is** the `M(5) = 18` entry of
  `E993-R27-FOREST-DESCENT-MAXIMA-CENSUS` in a rank-5 presentation, not a second independent result; only
  the witness count and the comparisons above are additional content. The two must never be counted as two
  results.
- **Evidence, exactly:** an exhaustive census of every forest isomorphism class of order ≤ 20 (3,269,193
  nonempty classes; 775,529 at order 19 and 1,977,878 at order 20) contains **no** class of order 19 or 20
  with `Δ_5 < 0`, and exactly 9,532 classes of order 18 with `Δ_5 < 0`; orders ≥ 21 are excluded by (LB) at
  `k = 5`. The r25 frozen census is **not** an input.
- **Grade:** `bounded_computation`, **conditional on (LB)** (`E993-R27-FOREST-DESCENT-LINEAR-BOUND`,
  `proved_informal`); the composition's grade is its weakest input's (§4). Unconditionally it would need the
  census to order 36 (the formal `(k+1)²` ceiling at `k = 5`), which is not attained.
- **Attribution:** `C-F3-T` (r27 Cycle 1, Stage 4 critic on F3, F-4) for the statement, the sharpening and
  the 9,532 count; `C-T3-F` (F-5) for the independent `M(5) = 18` at horizon 19 and for naming order 20 as
  the single unchecked order; T adjudicator (Stage 5) for recording order 20 as then unverified. Isolated
  second read: `SR-EXX` (Claude Opus 5, high), for the **in-run exhaustive enumeration of order 19 and
  order 20** on its own instrument, which discharges the order-20 residual and replaces `C-F3-T`'s reliance
  on the frozen r25 census; order 21 is not needed.
- **Fences:** **must not enter any award statement** — census-dependent, never formal (§3.4); it is an order
  bound, not a no-recovery statement, and transfers status to nothing (§3.1); it does not strengthen and
  does not disturb the rank-5 residue closeout or the `x ≤ 5` K1-addition composition, both of which need
  only `n ≤ 20` (§3.4); sealed r25 records are not edited (§3.5); `n ≤ 18` contains no `ℕ`-subtraction.

---

## Verdicts

verdict[EX-1]: confirmed
verdict[EX-2]: confirmed_with_repairs
verdict[EX-3]: confirmed_with_repairs

No statement is rejected. `EX-1` is confirmed as stated, for every finite simple graph, with the `ℤ`-typing
made explicit on the registration face. `EX-2`'s five values and occupancy row are confirmed exactly; the
repairs are the unconditional/(LB)-conditional split, the grade (`bounded_computation`, never
`proved_informal`), the per-ceiling horizons, and the ruling that the occupancy row is the maxima row
re-indexed. `EX-3` is confirmed and its evidence line is repaired: its order-20 input is now an in-run
exhaustive enumeration rather than the frozen r25 census, and its order bound must be annotated as the
`k = 5` entry of the maxima row.

---

## Artifact inventory

**Deliverable — the only file written outside my scratch:**
`second-reads/SR-EXX/SECOND-READ.md` (this file).

**Scratch — all under `scratchpad/c1-sr-SR-EXX/`; nothing written anywhere else; no sealed member touched.**

| File | SHA-256 | Role |
|---|---|---|
| `seal_verify.py` | `2f5457d8ec1067f111aadb7511d75e143557507ca42bb03bd5961eb87d318f13` | capsule seal + 102 member digests |
| `sr_exx_identity.py` | `fd479f18dd22266b48710710c5a4a359761ee3ebb603a3ea5c017774b0595291` | (EXX)/(EXX-local)/(EXX-slack)/(STAR)/lower-bound sweep; own free-tree + forest generator (AHU); fixed points |
| `exx_report.json` | `2292b861fb0effc5a411b0d6424070b4db6a49dd27cec1f5d5ba50acb1cfb47d` | 33,868 graphs + 638 forest classes, 969,044 checks, 0 failures |
| `sr_exx_census.py` | `794e5f1961fa8740f53ea42d47429b47313be8266b93a01eb3cee064db516464` | centroid-decomposition forest census, packed-integer truncated polynomials |
| `census12.json` | `e43895894bee06a77c2f0a6fa3c3367c532ccc0030db74410ca813bb119a1bd6` | order-12 census (validation tier) |
| `census16.json` | `5c860c373b2c75a59d4dbe29c4f8d87920ed2a7f0d3290b2351a3e417f57b227` | order-16 census (validation tier) |
| `census20.json` | `fe2b7b65e6d133900963f87aca6b1ccdacb70edf3a62de3823ded49e6788da48` | **order-20 census**: counts, `M(k)`, occupancy, strata, order-19/20 emptiness |
| `sr_exx_validate.py` | `c95886b047de297fd1c51b95ab82925d4678d77a4dfe659c2d95430e3d34b5f1` | no-carry audit; brute-force spectra agreement to order 10; witnesses |
| `validate.json` | `0f1f3bc4e466ab9dfe30b0c9da22c1138e6bf33d2b6e9359522295d4be64aa96` | validation report |
| `sr_exx_witness.py` | `a5bc3d7e66c31b5edc555fc44d9569d11af9032ab45ccd14cc288d15c5680d47` | explicit `M(k)` witnesses; census-wide (EX)/(LB)/`(k+1)²` audit |
| `witness.json` | `00f9223f8f75fe6d399b47ac0003910ff109265a4a49a74d779bc46731037453` | 19,615,164 instances, 0 violations |
| `sr_exx_m4.py` | `bd6e11d6c1421c7ca37dd7115b54ddf452d9143c913c9de9446a94f155866527` | the `M(4) = 15` witness `P_15`, verified directly |
| `sr_exx_nat.py` | `b85483ec9a1bbc512841fb3ea49055a896a84000ef117f5dde7468b037419adc` | `ℕ`-subtraction audit (negative intermediates) |
| `sr_exx_summary.py` | `19eb8e83650d017045aa00f20a34136f65bec761514cf7fb61576b417d9fe84b` | per-order first-descent strata, cumulative conventions |
| `summary.json` | `8680670ab706fca124f65c783b64d003ae405f3ba1ee34d2b95d97672924251b` | strata table |
| `m4.json`, `nat.json`, `census*.err`, `exx_err.txt`, `validate.err`, `witness.err`, `__pycache__/` | — | run outputs (all `.err` files empty) and interpreter cache |

**Replay (foreground, Python 3.11 standard library only, exact integers, no background jobs):**

```
cd <run root>/scratchpad/c1-sr-SR-EXX && python3 seal_verify.py           # < 1 s
cd <run root>/scratchpad/c1-sr-SR-EXX && python3 sr_exx_identity.py       # ~2 s
cd <run root>/scratchpad/c1-sr-SR-EXX && python3 sr_exx_census.py 20      # ~3 s
cd <run root>/scratchpad/c1-sr-SR-EXX && python3 sr_exx_validate.py       # ~7 s
cd <run root>/scratchpad/c1-sr-SR-EXX && python3 sr_exx_witness.py        # ~3 s
cd <run root>/scratchpad/c1-sr-SR-EXX && python3 sr_exx_m4.py             # < 1 s
cd <run root>/scratchpad/c1-sr-SR-EXX && python3 sr_exx_nat.py            # < 1 s
cd <run root>/scratchpad/c1-sr-SR-EXX && python3 sr_exx_summary.py        # ~3 s
```

Reread before close: done.
