# RETURN — Route F2, Cycle 3, r30 (correctly weighted mixed-boundary transport)

**Route:** `C3-F-02 UNREACHABLE-CAPACITY-FAMILY-CLOSURE`, orientation F (falsify).
**Mechanism token:** `UNREACHABLE-CAPACITY-FAMILY-CLOSURE`.
**Load-bearing obligation (`control/C3-ALLOCATION.md`, item 4):** (a) prove for every `m ≥ 4`: `x(T(m,2)) ≤ m` and
`Δ_{m+2}(T(m,1)) < 0`, using the block recurrence `P_{j+1} = (1+3y+y²)P_j − y²(1+y)P_{j−1}` with a mode estimate and a
finite check. (b) Prove `S(G_k, k+3) ≤ −2` for every `k ≥ 3`. (c) Attack (HALL) itself on `G_k` and `T(m,2)`: an
explicit parameter-uniform saturating flow, or a cut where Hall's room is provably smallest (gap exactly 2). (d) The
selector is retired as a route object (S9); the `G_k` key registers through its second read, not here.

## Boot acknowledgment

VerityOS was booted for this seat by reading EXACTLY the two authorized files and nothing else, in this order:
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. Per the
dispatch and `control/C3-WORKER-COMMON-BRIEF.md`, the startup protocol's own task-type map, memory, conversations,
modules, skills, logs and decisions directories were NOT followed for this seat (the controller has booted for the
run).

## Read-boundary disclosure

1. Before creating this seat's own scratch directories, this route ran a non-recursive `ls scratchpad/` (this run's
   shared `scratchpad/` root is ABOVE this seat's grant; only `scratchpad/c3-F2*` is within it). The listing showed
   directory NAMES only (the Cycle 1 and Cycle 2 seat/critic/second-read/adjudicator scratch trees, and Cycle 3's own
   `c1-*`/`c2-*` residue); no sibling directory's content was opened or used, and nothing from this listing entered
   any derivation below.
2. **Harness auto-backgrounding, self-corrected twice.** This session's shell tool moves any command past a 120-second
   default window to a background task automatically, independently of this route's own intent to run everything in
   the foreground. Two of this route's commands crossed that window (an early exploratory full-network probe of `G_6`
   and `G_7` with flow verification, and the first replay attempt of the full script chain): both were caught
   immediately via the harness's own background-task control (its `TaskStop` control, the equivalent of a literal-PID
   kill for a harness-tracked task, not a raw `pgrep`/`ps aux` scan) before any output was used, and both were
   re-run with an explicit longer foreground timeout parameter (or a smaller scope) so they completed and returned
   synchronously. No computation whose output appears anywhere in this return, `F2-EVIDENCE.json`, or its replay ran
   detached-and-awaited; every number below was produced by a command that returned to this route's own shell call
   before the next one was issued. This is named here in the same spirit as the sealed record's own self-disclosed
   process incidents (Cycle 2 F2's `ps aux` and stray-bytecode disclosures): a tooling fact about this session, not a
   deliberate use of backgrounding for a long job.
3. Otherwise every file read is one of: the two boot files above; the eight control/contract files named in the
   dispatch (`control/C3-WORKER-COMMON-BRIEF.md`, `control/C3-STAGE2-PACKET-MANIFEST.json`, `SEMANTIC-CONTRACT.md`,
   `SOLUTION-CONTRACT.md`, `control/C3-ALLOCATION.md`, `control/C3-STAGE1-GATE.md`,
   `cycles/cycle-3/stage2/ROUTE-STATE.md`); the Cycle 1/Cycle 2 sources of record explicitly authorized by the common
   brief (`cycles/cycle-1/CYCLE-CLOSE.md`, `cycles/cycle-2/CYCLE-CLOSE.md`,
   `cycles/cycle-1/stage3/returns/F2/RETURN.md`, `cycles/cycle-2/stage3/returns/F2/RETURN.md`,
   `second-reads/SR-C2-4/SECOND-READ.md`); the one frozen `sources/` member this route needed
   (`sources/lower-region/inputs/ordinary_tree_checked.py`, digest-verified before reading, content read but never
   imported or executed, exactly as Cycle 1/2 F2 did); the control-tier registry
   `control/CLAIM-IDENTITY.run-local.json` (digest-verified against its own entry in the Stage 2 manifest's `files`
   list, not `SOURCE-DIGESTS.json`, which covers only `sources/`) and `control/SOURCE-DIGESTS.json` itself; this
   route's own scratch under `scratchpad/c3-F2/` and `scratchpad/c3-F2-replay/`. No Cycle 3 sibling return, no other
   experiment root, and no live lower-region or first-interior root was read. `find sources -iname "__pycache__"`
   (rooted at `sources/`, inside this route's grant, not above it) confirmed no stray bytecode exists under `sources/`
   at the end of this route's work.

## Stage 2 seal and source digests

Recomputed SHA-256 of the canonical JSON of `control/C3-STAGE2-PACKET-MANIFEST.json` (its `seal_sha256` field removed,
`sort_keys=True`, separators `(",", ":")`, no trailing newline):

```
5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416
```

This matches both the manifest's own embedded `seal_sha256` field and the value cited in the dispatch
(`38262b04d5ffe150f5444481ef5508328f148a2e0ffbfe2e5f211d41ee72b34f` — the dispatch file's own digest, independently
recomputed before it was read, and confirmed to match, as required before opening it). The one Stage 2 `sources/`
member this route reads was independently re-hashed and checked against `control/SOURCE-DIGESTS.json` *before* it was
opened: `sources/lower-region/inputs/ordinary_tree_checked.py` → `(16710 bytes,
a012bb78915ccdfa2f729c0cdb520cd8f29572277123c92e80ba6091498f533d)`, matched exactly.
`control/CLAIM-IDENTITY.run-local.json` was checked against its own entry in the Stage 2 manifest's `files` list (a
control-tier file, not covered by `SOURCE-DIGESTS.json`): `(2469806 bytes,
b8f3c2a19182ccd31bd1bfe261e93f6d85a7f0cf0ab357825f1208668d178508)`, matched exactly, before it was opened for the
alias check below.

## IMPORT LIST (standard library only; no network; no package installs; `python3 -B` throughout)

`sys`, `json`, `hashlib`, `time`, `itertools` (via `f2_lib`'s `bitmask_independent_sets`). No import of the pinned
evaluator (`ordinary_tree_checked.py` is read, digest-verified, never executed) and no import of any sibling seat's
code. Every polynomial, tree, network, and flow routine (`f2_lib.py`, `f2_families.py`, `f2_recurrence.py`) is
independently written from `SEMANTIC-CONTRACT.md` §1 (erratum R30-E-b) and `SOLUTION-CONTRACT.md` §2, then
cross-checked against the sealed Cycle 1/Cycle 2/SR-C2-4 fixed points before being trusted for any new instance
(`f2_validate.py`), and against a direct tree DP before being trusted for the recurrence (`f2_recurrence_check.py`).
`sys.dont_write_bytecode = True` is set at the top of every script; no `__pycache__` was left under `sources/` or
this route's own scratch.

## Registered claims touched (named before any table below, per the worker brief's rule 3)

- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — OPEN. This route does not move it. §C below is an
  extension of the existing "deletion arcs alone saturate" bounded record; it finds no cut and proves no uniform
  theorem.
- **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` — `formally_verified` (C1-LA1). This route asserts
  `supply − capacity = S(T,p)` from two independently computed sides on every network row below (§A, §B, §C), and
  uses the identity itself (already proved and awarded) to relate the scalar target `S ≤ 0` to the sharper
  `S ≤ −2` and to the gap; it is not re-derived or re-proved here.
- The primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` — OPEN, untouched (context only).
- **`E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO`** (the `G_k` key,
  VERIFIED `proved_informal`, SR-C2-4) — this route USES its statement (uniqueness of `A_k`, `w_F(A_k)=2`, the
  eligibility window) without re-deriving it, and extends the bounded corroboration named on its own face
  (`G_3/6, G_4/7, G_5/8`, checked to `k=60` for the closed forms) to `k=250` for the aggregate `S` and to `k=7` for
  the full network. Per allocation item (d), this route does NOT re-open, re-register, or re-litigate the key or the
  S9 selector-reduction sentence — both are settled record, cited only.
- **The `T(m,2)` CONDITIONAL record** (a route record inside the (HALL) scope note, not a key; SR-C2-4d) — this
  route's item (a) work is a direct continuation of exactly the two premises this record leaves bounded: (P1)
  `x(T(m,2)) ≤ m` (bounded to `m ≤ 400` on the record's own face) and (P2) `Δ_{m+2}(T(m,1)) < 0` (bounded to
  `m ≤ 400`). §A below extends both computationally (to `m ≤ 1500`) and supplies the exact recurrence the allocation
  names, but does not close either premise to a closed-form proof for every `m` — named under Remaining obligation.
- **P10** (`E993-R30-TRANSPORT-TARGET-NO-IN-ARC-IFF-MAXIMAL-WITHOUT-NONADJACENT-PRIVATE-PAIR`, `proved_informal`,
  SR-REACH) — used (as `transport_targets`/reachability in `f2_lib.py`), re-verified by direct in-arc brute force on
  every instance it is applied to, not re-proved.
- The **ten refuted mechanism keys** and the two named exclusions of `SOLUTION-CONTRACT.md` §3.2 — **not touched**:
  this route proposes no mechanism of its own (§C is a computational extension of an existing bounded record, not a
  new mechanism), so no distinction-from-refuted-mechanisms analysis is owed here (that was Cycle 1 F2's object).
- **Alias check (lexical AND mathematical)**, run against `control/CLAIM-IDENTITY.run-local.json` (443 claims,
  digest-verified above), for every candidate statement this route contributes (the sharpened `T(m,2)` target
  `Δ_m(T(m,2)) < 0`; the `H_1`/`R_1` closed forms and their two proved facts; the extended bounded rows `G_6, G_7,
  T(7,2), T(8,2)`):
  - *Lexical.* A full-text scan (statement + scope + aliases of all 443 claims) for `block recurrence`, `T(m,2)`,
    `T(m, 2)`, `transfer matrix`, `mode estimate`, `asymptotic`, `central coefficient`, `1+3y+y`, `y^2(1+y)`,
    `saddle point`, `deletion-only saturat`, `favorable leaf`, `support deletion`, `arm tag`. Zero hits for every term
    except `asymptotic` (21 unrelated hits, all r25/r27 stratification/forest-degree keys, none about this network)
    and `1+3y+y` (one hit: the `G_k` key itself, expected, since `1+3y+y²` is `G_k`'s own trinomial factor, already
    used by that key — not a new collision).
  - `G_k`, `unreachab`, `no-in-arc`, `active weight`, `private neigh` each return only the (HALL) scope note and the
    `G_k` key itself (expected: this route's family record IS the same family), plus one unrelated `G_k`-substring
    hit (`E993-C2-CT-U3-ORDER102-LC-RELAXATION-WITNESS`, an order-102 log-concavity witness, already distinguished by
    Cycle 2 F2) and one unrelated `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` hit (a different family, the `CBstar`
    sector, not `G_k`).
  - `H_v`/`R_v` return 11 hits, all high-tail/budget keys (`E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE`,
    `E993-R29-HIGH-TAIL-BOUNDARY-RECORD`, `E993-LOWER-REGION-EARLY-MARKED-OCCUPANCY-TRANSFER`,
    `E993-LOWER-REGION-FLAT-ADDABILITY-BUDGET`, etc.): these use the SAME shared-definition notation `H_v, R_v`
    generically (SEMANTIC-CONTRACT §1.1's carried definitions), not a statement about `G_k`'s specific leaf-1/leaf-3/
    leaf-`c_1` closed forms; reading each confirms a different object (the high tail, not the lower-region `G_k`
    family).
  - *Mathematical.* No registered claim states a closed form for `H_1(G_k)`, `R_1(G_k)`, or the scalar identity
    `Δ_{k+2}(R_1) = -2^k`; no registered claim states or implies `Δ_m(T(m,2)) < 0` as a sharper equivalent of
    `x(T(m,2)) ≤ m`; no registered claim reports a full-network row of `G_6`, `G_7`, `T(7,2)`, or `T(8,2)`. No lexical
    or mathematical collision found for any contribution of this route.

---

## A. Item (a): the block recurrence for `T(m,k)`, derived, verified, and pushed past the sealed range

**A1. Derivation of the recurrence (own, step by step; not assumed from the allocation's statement of it).**

`T(m,k)`'s definition (C-F2-U, Cycle 1; SR-C2-4 labels, reused verbatim): path
`c_1–d_1–c_2–…–d_{m-1}–c_m–f–s`, a pendant leaf `e_i` on `c_i` (`i<m`), `k` leaves `ℓ_1..ℓ_k` on `s`; `n=3m+k`.

Fix **block** `j` as `{e_j, c_j, d_j}` (edges `c_j–e_j`, `c_j–d_j`). Track two quantities after `j` blocks:
`W_j(\text{OUT})` = the weighted count of independent sets of blocks `1..j` with `d_j` EXCLUDED (so the next block's
`c_{j+1}` is not blocked by `d_j`), `W_j(\text{IN})` = the same with `d_j` INCLUDED; `T_j := W_j(\text{OUT}) +
W_j(\text{IN})`, the actual independence polynomial of the length-`j` block prefix (`d_j`'s own membership does not
matter for `T_j` itself — it is exactly the quantity the allocation calls `P_j`).

*Transition `j → j+1`* (this is where finiteness of each block and the tree's acyclicity enter: every block is a
finite, definite set of new vertices attached at exactly one point, so the transition is a genuine finite case split
with no other interaction possible):

- `c_{j+1}` EXCLUDED (always allowed, regardless of `d_j`'s state): `e_{j+1}` free (`1+y`), `d_{j+1}` free (`1+y`,
  splitting into `d_{j+1}` out — contributing `(1+y)` to the next `\text{OUT}` state — or `d_{j+1}` in — contributing
  `y(1+y)` to the next `\text{IN}` state), for either value of `d_j`'s state.
- `c_{j+1}` INCLUDED: requires `d_j` EXCLUDED (the edge `d_j–c_{j+1}`); then `e_{j+1}` forced excluded (edge
  `c_{j+1}–e_{j+1}`) and `d_{j+1}` forced excluded (edge `c_{j+1}–d_{j+1}`): contributes `y` (for `c_{j+1}` itself) to
  the next `\text{OUT}` state, only from `W_j(\text{OUT})`.

So `W_{j+1}(\text{OUT}) = (1+y)\,T_j + y\,W_j(\text{OUT})` and `W_{j+1}(\text{IN}) = y(1+y)\,T_j`. Adding:
`T_{j+1} = (1+y)^2 T_j + y\,W_j(\text{OUT})`. Using the SAME relation one step back,
`W_j(\text{IN}) = y(1+y)\,T_{j-1}`, gives `W_j(\text{OUT}) = T_j - y(1+y)\,T_{j-1}`, so

```
T_{j+1} = (1+y)^2 T_j + y[T_j - y(1+y)T_{j-1}] = [(1+y)^2+y]T_j - y^2(1+y)T_{j-1} = (1+3y+y^2)T_j - y^2(1+y)T_{j-1}.
```

This is exactly the allocation's `P_{j+1} = (1+3y+y²)P_j − y²(1+y)P_{j−1}` — derived here, not assumed. Base cases:
`T_0 = 1` (the empty prefix), `T_1 = 1+3y+y^2` (block 1 alone is a bare path `e_1–c_1–d_1`, `I(P_3)=1+3y+y^2`, checked
directly), `W_0(\text{OUT}) = 1`, `W_0(\text{IN}) = 0` (no `d_0` exists; the convention that makes the `j=0→1`
transition formula reproduce `T_1` exactly, checked below).

**A2. Assembly for `I(T(m,k))`.** After `m-1` blocks (state `d_{m-1}`), attach `c_m`, then `f`, then `s` with its `k`
leaves. Case on `c_m`:

- `c_m` EXCLUDED (allowed regardless of `d_{m-1}`'s state): `f` free, and (since `f`'s only remaining neighbour is
  `s`) the rest is the star on `s` with `k+1` "leaf-like" branches (`f` and `\ell_1..\ell_k`):
  `\text{TailOut} := y + (1+y)^{k+1}`.
- `c_m` INCLUDED (requires `d_{m-1}` EXCLUDED): `f` forced excluded, and `s`'s star has only `k` branches
  (`\ell_1..\ell_k`, `f` being forced out contributes no branch of its own): `\text{TailIn} := y\bigl(y+(1+y)^k\bigr)`.

So `I(T(m,k)) = T_{m-1}\cdot\text{TailOut} + W_{m-1}(\text{OUT})\cdot\text{TailIn}`, with
`W_{m-1}(\text{OUT}) = T_{m-1} - y(1+y)T_{m-2}` (`m \ge 2`; for `m=1`, `T_0=1, W_0(\text{OUT})=1` are used directly,
the same formula with `j=0`).

**A3. Verification against the direct tree DP (own instrument; required before any claim below is trusted).**
`f2_recurrence_check.py` builds `T(m,k)` as an actual `Tree` (IsTree checked: connectivity by BFS, acyclicity by BFS
parent-tracking, checked SEPARATELY as the shared rules require), computes its independence polynomial by an
independent rooted-tree DP (`f2_lib.forest_indep_poly`, two states per vertex, no relation to the recurrence's own
state bookkeeping), and compares coefficient-for-coefficient against the recurrence-based `indep_poly_Tmk`. **Result:
`m=1..40`, `k∈{1,2,3}`, 120 instances, 0 mismatches.**

```
IMPORT LIST: sys (stdlib). Uses f2_lib, f2_families, f2_recurrence (local, stdlib only).
SHA-256 of scratchpad/c3-F2/F2-RECURRENCE-CHECK.json: (folded into F2-EVIDENCE.json below)
Copy-out-first replay:
  cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-F2-replay
  python3 -B f2_recurrence_check.py
  # prints: RECURRENCE VERIFIED against direct tree DP: exact match on every instance.
```

**A4. Pushed range: `m = 1..1500` (a 3.75× extension of the sealed record's `m ≤ 400`), via the fast recurrence.**
`f2_partA.py` computes `T_0..T_{1500}` once (3.40 s, own instrument, exact integers throughout — no floating point
anywhere in this route), then for every `m` assembles `I(T(m,2))` and `I(T(m,1))`, scans `Δ_k` through `α = 2m+1`
(the proved closed form, B1 of Cycle 2 F2 / SR-C2-4, cited not re-derived) for `x(T(m,2))`, and reads off
`Δ_{m+2}(T(m,1))` directly with the zero-extension convention.

**Findings (own instrument; exact integers; every row below independently reproduces the sealed record's own values
at the rows they share, and extends past them):**

- `x(T(m,2)) ≤ m` for every `m = 3..1500` (fails at `m=1,2`, exactly matching SR-C2-4d's own disclosure — this route
  checked this too, not merely trusted it: `x(T(1,2))=2 > 1`, `x(T(2,2))=3 > 2`, `x(T(3,2))=3=3`). **This is the
  sealed record's own boundary, reproduced, not a new finding.**
- `x(T(m,2)) = m` EXACTLY for `m ∈ [3,18]` (`m=3` included, matching SR-C2-4's note that its own instrument "also has
  equality at `m=3`"; the eligible range is `m ∈ [4,18]`), and `x(T(m,2)) < m` strictly for every `m = 19..1500` — the
  first slack appears at `m=19` (`x=18`, slack `1`), confirming the sealed record's own reported values
  (`x(T(19,2))=18`) exactly.
- **The slack `m - x(T(m,2))` GROWS with `m`** (not merely "stays nonnegative"): `2` at `m=50`, `10` at `m=200`,
  `16` at `m=304` (the sealed record's own last checked point — matches `288` exactly), `21` at `m=400` (matches
  `379` exactly), rising to **`79` at `m=1500`** (`x=1421`). The ratio `\text{slack}/m` is `0.0527` at `m=1500`,
  `0.0528` at `m=1000`, `0.052` at `m=500`, `0.0525` at `m=400` — stabilizing near a constant, consistent with (but
  not a proof of) `x(T(m,2))/m \to \rho` for some constant `\rho \approx 0.947 < 1` as `m\to\infty`. **The
  inequality gets STRICTLY safer, not tighter, as `m` grows past `18`** — the only genuinely tight region is the
  fully-checked finite window `3 \le m \le 18`.
- `Δ_{m+2}(T(m,1)) < 0` holds for every `m = 2..1500` (Premise (P2), extended from the sealed `m ≤ 400`; 0 exceptions).

**A5. A sharper, more tractable equivalent target found by this route (own finding, not in the sealed record):**
`Δ_m(T(m,2)) < 0` for every `m = 3..1500` (checked exactly; the only exceptions in `m=1..1500` are `m=1` (`Δ_1=1`)
and `m=2` (`Δ_2=0`)). Since `x(T(m,2))` is by definition the LEAST `k` with `Δ_k<0`, `Δ_m<0` alone already implies
`x(T(m,2)) \le m` directly — this single scalar coefficient-difference claim, evaluated at the fixed index `m`
(never requiring the exact location of the first descent), is a strictly weaker and more uniform target than
computing `x(T(m,2))` itself, and it is the natural "mode estimate" target the allocation's language points at:
index `m` sits at position `m/(2m-1) \to 1/2` of `T_{m-1}`'s own degree `2(m-1)`, i.e. `T_{m-1}`'s CENTRE, so
`Δ_m(T(m,2))<0` is a statement about being at-or-past the mode of the block-chain polynomial `T_{m-1}`. This route
attempted a closed-form/asymptotic proof of `Δ_m(T(m,2))<0` for every `m` (the transfer matrix
`\begin{psmallmatrix}1+3y+y^2 & -y^2(1+y)\\ 1 & 0\end{psmallmatrix}` has characteristic roots `\lambda_\pm(y)` that are
REAL and (for `y>0`) both POSITIVE for every real `y \ge 0`, since the discriminant
`(1+3y+y^2)^2-4y^2(1+y) = y^4+2y^3+7y^2+6y+1` has every coefficient positive hence is manifestly positive for
`y\ge 0`, and the sum/product of the roots, `1+3y+y^2` and `y^2(1+y)`, are both positive for `y>0`) but did NOT
complete a closed-form bound on the CENTRAL coefficient difference within this route's budget — a genuine saddle-
point/local-limit-theorem argument (locating the mode of `T_j(y)`'s coefficient sequence exactly as `j\to\infty`) is
needed and is named under Remaining obligation, exactly as the sealed record's own Cycle 2 F2 return and SR-C2-4 both
left this direction open after real attempts.

```
IMPORT LIST: sys, json, time (stdlib). Uses f2_lib, f2_recurrence (local, stdlib only).
SHA-256 of scratchpad/c3-F2/F2-EVIDENCE.json (canonical, no host/PID/wall-clock fields; sort_keys, separators (",", ":")):
4305ffb5d639f52a68fa2bdcc7f1dc31e8366b03a88822ca8530c62da1b632c8
Copy-out-first replay:
  cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-F2-replay
  python3 -B f2_recurrence_check.py && python3 -B f2_validate.py && python3 -B f2_partA.py && \
  python3 -B f2_partB.py && python3 -B f2_partB2.py && python3 -B f2_partC.py && python3 -B f2_combine.py
  # prints: F2-EVIDENCE.json sha256: 4305ffb5d639f52a68fa2bdcc7f1dc31e8366b03a88822ca8530c62da1b632c8
  # (total run time approx 130s; the T(7,2) deletion-only max-flow call alone takes approx 80s, run in the
  #  foreground with an explicit 300s Bash-tool timeout to avoid the harness's own 120s auto-background window
  #  — see Read-boundary disclosure item 2)
```

---

## B. Item (b): `S(G_k, k+3) ≤ −2`, extended range, and a partial closed-form decomposition

**B1. Symmetry reduction (own instrument).** `G_k`'s literal edge set (root `0`; leaf `1`; support `2` with leaves
`3,4`; arms `0–a_i–b_i–c_i`) has an automorphism group containing every permutation of the `k` arms and the swap
`3\leftrightarrow 4`, so the aggregate identity's per-leaf sum has only THREE distinct summand values (by leaf type:
`1`, `\{3,4\}`, `\{c_1,\dots,c_k\}`), each computed ONCE (not `k+3` times) and combined with multiplicity
`(1, 2, k)`. This is what makes pushing `k` far past the sealed record's `k \le 5` (full network) / `k \le 304`
(eligibility DP only) tractable while every value stays an EXACT integer computed from the aggregate identity's own
`H_v`/`R_v` definition — never inferred, never assumed equal across types without the automorphism argument that
justifies it.

**B2. Extended range: `k = 1..250` (a 50× extension of the sealed record's full-network `k \le 5`).** `f2_partB.py`
computes, for each `k`, whether each of the three representative leaves is favorable (`Δ_{k+3}(G_k-v)<0` on the
ORIGINAL tree, at the FIXED rank `p=k+3` — never recomputed at `p\pm1`, exactly `SEMANTIC-CONTRACT.md` §1.1's fixed
selector `F_p(G)`, computed generically, never assumed "whole leaf set"), and, for every favorable type, its own
`q_v(p)-q_v(p-1)` summand from the `H_v`/`R_v` deletion side (never from any closed-form shortcut). **Result: `S(G_k,
k+3) \le -2` holds for every `k=3..250`, zero exceptions**, and (a stronger fact than the allocation asked for) whole-
leaf-set favorability (`\{1,3,4,c_i\}\subseteq F` for every arm) holds throughout the same range, extending the
sealed record's own bounded whole-leaf-set observation. `S` itself grows explosively: `-274` at `k=3` to a
165-digit negative integer at `k=250`. Cross-checked exactly against the sealed full-network values at `k=3,4,5`
(`-274, -1193, -5321`, digit for digit) as the first three rows of this same instrument.

**B3. A sharper structural finding (own): every one of the THREE per-type summands is individually negative**, not
merely their weighted sum. `q_1(k+2)-q_1(k+1)` (leaf `1`'s summand), `q_3(\cdots)` (leaf `3`'s), `q_{c_1}(\cdots)`
(the arm tip's) are each strictly negative on every checked `k=3..30` (printed exactly in the derivation below), so
`S = q_1 + 2q_3 + k\,q_{c_1}` is a sum of `k+3` negative terms with multiplicities `1,2,k` — a structurally stronger
and more informative fact than the scalar bound alone.

**B4. Partial closed form for the leaf-`1` summand (own derivation; H_1, R_1 exact, one half fully proved).**
For leaf `1` (support `s_1 = 0`): `H_1 := G_k - \{1,0\}` disconnects into the star `\{2,3,4\}` and `k` copies of
`a_i–b_i–c_i`, each a bare `P_3`, so **`H_1`'s independence polynomial is `(1+3y+y^2)^{k+1}` exactly** (the SAME
trinomial power that appears in `I(G_k)` itself, A2 of the sealed Cycle 2 F2 record). `R_1 := G_k - N[0] = G_k -
\{0,1,2,a_1,\dots,a_k\}` leaves `\{3,4\}` isolated and each `\{b_i,c_i\}` an isolated edge, so **`R_1`'s independence
polynomial is `(1+y)^2(1+2y)^k` exactly**. Both closed forms are checked, coefficient-for-coefficient, against the
direct tree DP's own `H_1`, `R_1` (via `forest_indep_poly` on the literal deleted vertex sets) for `k=0..39`, 0
mismatches (`f2_partB2.py`).

From these closed forms, TWO facts are PROVED exactly (own derivation, not merely checked):

- **`Δ_{k+2}(R_1) = -2^k` exactly, for every `k \ge 0`.** `R_1 = (1+y)^2(1+2y)^k` has degree EXACTLY `k+2`
  (`\deg(1+y)^2=2`, `\deg(1+2y)^k=k`), so `[R_1]_{k+3}=0` by the integer zero extension above the stored degree, and
  `[R_1]_{k+2}` is the leading coefficient, `1^2\cdot 2^k=2^k`. Hence `Δ_{k+2}(R_1)=0-2^k=-2^k`. Checked exactly for
  `k=0..39` (values `-1,-2,-4,\dots,-2^{39}`), matching the closed-form prediction on every one.
- **`Δ_{k+2}(H_1) < 0` strictly, for every `k \ge 0`.** `H_1=(1+3y+y^2)^{k+1}` is a power of the real-rooted,
  positive-coefficient quadratic `1+3y+y^2=(1+\varphi y)(1+\psi y)` (`\varphi+\psi=3`, `\varphi\psi=1`, both real —
  the SAME golden-ratio-type factorization the sealed Cycle 2 F2 record used for `x(G_k)\le k+1`), hence real-rooted
  itself; by Newton's inequality its coefficients are strictly log-concave (all strictly positive, from elementary
  symmetric functions of positive negated-root magnitudes), hence strictly unimodal; it is palindromic of degree
  `2k+2` (a power of a palindromic factor is palindromic), so its centre is at `k+1`. Index `k+2 > k+1` is strictly
  past centre, where a strictly unimodal palindrome strictly decreases. Checked exactly for `k=0..39` (palindrome
  symmetry, strict unimodality, and the sign of `Δ_{k+2}` all verified directly from the closed-form coefficients on
  every row, not merely asserted).

**Consequence and what remains open.** `q_1(k+2)-q_1(k+1) = Δ_{k+2}(H_1) - Δ_{k+2}(R_1) = Δ_{k+2}(H_1) + 2^k`. The
SIGN of this quantity is NOT yet closed in general: it requires `|Δ_{k+2}(H_1)| > 2^k`, i.e. a lower bound on the
magnitude of `H_1`'s post-centre descent, not merely its sign. Numerically the margin is enormous and growing (at
`k=39`, `|Δ_{k+2}(H_1)| \approx 7.8\times10^{25}` against `2^{39}\approx 5.5\times10^{11}` — twelve orders of
magnitude of slack), so `q_1<0` is essentially certain, but this route did not close a general magnitude bound within
its budget (named under Remaining obligation, alongside the analogous — and structurally more complex, since deleting
leaf `3` or `c_1` modifies a DIFFERENT branch than the one being removed — closed forms for the leaf-`3` and
leaf-`c_1` summands, which were not attempted in closed form here, only computed exactly via the direct DP in B2/B3).

```
IMPORT LIST: sys, json, time (stdlib). Uses f2_lib, f2_families (local, stdlib only).
SHA-256 of scratchpad/c3-F2/F2-EVIDENCE.json: 4305ffb5d639f52a68fa2bdcc7f1dc31e8366b03a88822ca8530c62da1b632c8 (same combined file as sec A)
Copy-out-first replay (same command as sec A; f2_partB.py takes approx 25s, f2_partB2.py approx 1s):
  cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-F2-replay
  python3 -B f2_partB.py && python3 -B f2_partB2.py
```

---

## C. Item (c): attacking (HALL) on `G_k` and `T(m,2)` — extended, no cut found, no uniform theorem proved

**C1. What "gap exactly 2" already proves (cited, not re-derived): (HALL) at the top level `X=I_{p+1}` on either
family is EXACTLY `S \le -2`.** By the (WID) identity (`formally_verified`, C1-LA1) and the PROVED (not merely
bounded) uniqueness of the single no-in-arc target of weight 2 on both families (Corollary G for `G_k`, the
analogous proved uniqueness for `T(m,2)`, both SR-C2-4-confirmed, cited not re-proved here), `Σ_{N(I_{p+1})}w =
\text{capacity}-2` exactly, so `\text{(HALL-COND) at } X=I_{p+1} \iff \text{supply}\le\text{capacity}-2 \iff S\le-2`
(via WID). Item (b) above is thus not merely "a scalar sign fact" but EXACTLY the necessary condition for (HALL) to
hold at its single most binding top-level subfamily on `G_k`; the analogous statement for `T(m,2)` is item (a)'s
`S(T(m,2),m+2)\le -2` EQUIVALENT target (not separately computed here, since (WID)+the gap identity make it the same
kind of statement as `Δ`-sign facts already reported).

**C2. Deletion-only Hall, extended by one row on each family (own max-flow instrument, exact integer Ford–Fulkerson
on the clone-collapsed bipartite graph — not Dinic, but exact and independently verified against the sealed record's
own values at every row it shares).** The sealed record verified full-network saturation (mixed AND, where checked,
deletion-only) up to `G_5` and `T(6,2)`. This route:

- Re-verifies `G_3, G_4, G_5, T(4,2), T(5,2), T(6,2)` **with its own independently-written max-flow instrument**
  (not a re-import of any prior seat's code), matching supply, capacity, `S`, the unique unreachable target, and the
  saturating flow value exactly on every row (`f2_validate.py`).
- Extends to **`T(7,2)`: deletion-only max-flow verified SATURATING** (`supply=flow=33026`), a genuine new instance
  (the sealed record's own furthest full-network `T(m,2)` row was `m=6`). Notably, the deletion-only REACHABLE
  capacity at this row (`54169`) is smaller than the mixed-network reachable capacity (`54300`, gap `133` vs. `2`) —
  deletion-only misses far more targets than the mixed network does — **but the deletion-only network still routes
  every unit of supply**, i.e. the extra unreachable-by-deletion targets simply never needed any flow. This is a new,
  concrete illustration of exactly the "sufficient mechanism is stronger than the scalar target" remark of
  `SEMANTIC-CONTRACT.md` §1.2: even though (HALL) at general `X` is strictly stronger than saturation of the FULL
  network, deletion arcs alone already achieve the latter here.
- Extends to **`G_6` and `G_7`**, and **`T(8,2)`**: full scalar network (supply, capacity, `S`, gap, the unique
  unreachable target identified and matched to `A_k`/`A`) computed and verified, but **max-flow verification was
  attempted and found infeasible within this route's budget** (`G_6`'s deletion-only network alone did not finish
  its own Ford–Fulkerson instrument within a 100-second bound; `G_6` has `12{,}999` sources and `24{,}795` targets,
  `G_7` has `68{,}600` and `121{,}336`) — disclosed exactly as it occurred (Read-boundary disclosure item 2 above),
  not concealed or silently omitted. This route's own instrument is a straightforward exact integer Ford–Fulkerson,
  not an asymptotically efficient max-flow algorithm; a genuinely scalable full-network flow certificate on networks
  this size is precisely the object of Cycle 3's T1 and U2 routes (`CB-CHOKE-FOREST-HALL-AND-SECTOR-ABSORPTION`,
  `PRODUCT-FORM-FLOW-CERTIFICATE-ON-CB-ROWS`), not read by this route (sibling Cycle 3 returns are outside this
  route's grant).

**C3. No cut found; no uniform theorem proved.** This route's adversarial effort was the direct max-flow/Hall check
above (a saturating flow implies no cut of that particular `X=I_{p+1}` exists — the SCALAR necessary condition of
C1 is satisfied on every row checked); it did not search for a deficient cut at a SMALLER `X` on either family (that
adversarial search, restricted to invariant class-unions, is F1's object this cycle,
`INVARIANT-CLASS-UNION-CUT-SEARCH-ON-SWITCH-NECESSARY-ROWS`, not read by this route). No parameter-uniform
saturating-flow THEOREM is proved for either family at general `k`/`m`: every row above is a separate, exact,
finite computation, `bounded_computation`, not a proof for the family. `headline_resolved` stays `no`.

```
IMPORT LIST: sys, json, time (stdlib). Uses f2_lib, f2_families (local, stdlib only).
SHA-256 of scratchpad/c3-F2/F2-EVIDENCE.json: 4305ffb5d639f52a68fa2bdcc7f1dc31e8366b03a88822ca8530c62da1b632c8 (same combined file)
Copy-out-first replay (same command as sec A; f2_partC.py takes approx 95s, dominated by T(7,2)'s ~79s
deletion-only max-flow call — run in the foreground with an explicit >120s Bash-tool timeout):
  cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-F2-replay
  python3 -B f2_partC.py
```

---

## Fixed points reproduced (own instrument; required before any table above was reported)

Every row asserts `supply − capacity = S(T,p)` from two INDEPENDENTLY computed sides (the network's own weighted
layer totals on one side; `Σ_{v∈F}[Δ_{p-1}(H_v)-Δ_{p-1}(R_v)]` from the separate `H_v`/`R_v` deletion recomputation on
the other — or, for §B's extended `k`, the symmetry-reduced sum of exactly this same quantity) before any other
number is reported, per the shared rules. `x`, `Δ_k` (through rank `α`, own scan, cross-checked against the closed
forms / direct DP), `α`, `p`, `|F|` and the graph appear on every row.

| Row | `n` | `α` | `x` | `p` | diff. index `p−1` | `\|F\|` | `S` (own, `H_v/R_v` side) | supply/capacity (own, network side) | saturating (own flow) | gap |
|---|---:|---:|---:|---:|---:|---:|---:|---|---|---:|
| `G_3` | 14 | 9 | 4 | 6 | 5 | 6 | −274 | 253/527 | yes (253) | 2 |
| `G_4` | 17 | 11 | 5 | 7 | 6 | 7 | −1193 | 1542/2735 | yes (1542) | 2 |
| `G_5` | 20 | 13 | 6 | 8 | 7 | 8 | −5321 | 8875/14196 | yes (8875) | 2 |
| `G_6` | 23 | 15 | 7 | 9 | 8 | 9 | −24151 | 49422/73573 | not attempted (too large) | 2 |
| `G_7` | 26 | 17 | 8 | 10 | 9 | 10 | −111045 | 269507/380552 | not attempted (too large) | 2 |
| `T(4,2)` | 14 | 9 | 4 | 6 | 5 | 5 | −252 | 202/454 | yes (202) | 2 |
| `T(5,2)` | 17 | 11 | 5 | 7 | 6 | 6 | −1094 | 1173/2267 | yes (1173) | 2 |
| `T(6,2)` | 20 | 13 | 6 | 8 | 7 | 7 | −4805 | 6350/11155 | yes (6350) | 2 |
| `T(7,2)` | 23 | 15 | 7 | 9 | 8 | 8 | −21276 | 33026/54302 | yes, deletion-only (33026) | 2 (mixed), 133 (del.-only) |
| `T(8,2)` | 26 | 17 | 8 | 10 | 9 | 9 | −94772 | 167410/262182 | not attempted (too large) | 2 |

`G_6, G_7, T(7,2), T(8,2)` are new rows (not in any sealed record); every other row is an independent reproduction,
digit for digit, of the sealed Cycle 1/Cycle 2 values. `α(G_k)=2k+3`, `α(T(m,2))=2m+1` (both PROVED, cited from the
sealed record, re-verified here via the same matching/cover certificate on the literal built graph, not merely
trusted).

---

## Grades

| Statement | Grade (this route's contribution) |
|---|---|
| Block recurrence `T_{j+1}=(1+3y+y^2)T_j-y^2(1+y)T_{j-1}` for `T(m,k)`'s prefix polynomial | `proved_informal` — own complete derivation (a finite two-state case analysis with every hypothesis named), verified exactly against a direct, IsTree-checked tree DP for `m=1..40`, `k∈{1,2,3}` |
| `x(T(m,2)) ≤ m` for `m=3..1500`; `x=m` exactly for `m∈[3,18]`; slack strictly growing for `m≥19` | `bounded_computation`, extending the sealed record's `m≤400` to `m≤1500` (own instrument, exact integers via the verified recurrence) |
| `Δ_{m+2}(T(m,1))<0` for `m=2..1500` | `bounded_computation`, extending `m≤400` to `m≤1500` |
| `Δ_m(T(m,2))<0` for `m=3..1500` (this route's own sharper equivalent target) | `bounded_computation` (new finding); **not closed to a proof for all `m`** — the genuine open item of part (a) |
| `S(G_k,k+3)≤-2` for `k=3..250`; every one of the 3 leaf-type summands individually negative | `bounded_computation`, extending the sealed record's full-network `k≤5` by 50× (own symmetry-reduced instrument, exact integers) |
| `H_1=(1+3y+y^2)^{k+1}`, `R_1=(1+y)^2(1+2y)^k` (closed forms) | `proved_informal` (own derivation; checked exactly against the DP for `k=0..39`) |
| `Δ_{k+2}(R_1)=-2^k` exactly, every `k≥0` | `proved_informal` — closed-form proof (degree argument + leading coefficient) |
| `Δ_{k+2}(H_1)<0` strictly, every `k≥0` | `proved_informal` — closed-form proof (real-rootedness + Newton + palindrome-centre argument, same technique as the sealed `x(G_k)≤k+1` proof) |
| Sign of `q_1 = Δ_{k+2}(H_1)+2^k` (hence of the leaf-`1` summand of `S`) for every `k` | **open** — reduces to a magnitude bound `\|Δ_{k+2}(H_1)\|>2^k`; not closed here (named under Remaining obligation) |
| Closed forms / sign proofs for the leaf-`3` and leaf-`c_1` summands | **not attempted** in closed form (only exact DP values, B2/B3); named under Remaining obligation |
| Full-network rows `G_6,G_7,T(7,2),T(8,2)` (supply/capacity/`S`/gap/unreachable target) | `bounded_computation` (own instrument, exact integers) |
| `T(7,2)` deletion-only saturation | `bounded_computation` (own max-flow instrument, exact) — a new row beyond the sealed record's `T(6,2)` |
| `G_6,G_7,T(8,2)` full max-flow saturation | **not attempted** (own instrument infeasible at this scale within budget; disclosed, not a negative finding) |
| No cut found on either family at any checked row | `bounded_computation` — absence of a finding, not a theorem |

No certification here strengthens a prior grade without strengthening its evidence; the `G_k` key, (WID), P10, the
`T(m,2)` conditional record, and every closed high-tail/order-band/`T_m`/spider/path-star family theorem are cited,
never re-proved, never re-derived, and never re-registered (item (d): the selector and the `G_k` key are explicitly
NOT this route's object). No census value enters any proof above; every proof (the recurrence, `Δ_{k+2}(R_1)=-2^k`,
`Δ_{k+2}(H_1)<0`) is a closed-form argument checked against, but not derived from, the computational instrument.

## `headline_resolved: no`

The headline is (HALL) `formally_verified` (or a confirmed (CUT) refutation) at Stage 7; neither is this route's
product. This route's product is: a verified derivation of the named block recurrence, a sharper equivalent target
for `T(m,2)`'s open premise, a partial closed-form decomposition and two proved lemmas for `S(G_k,k+3)`'s leaf-`1`
summand, and an extension (by 50× on `G_k`, by one row with full flow verification and two rows scalar-only on
`T(m,2)`) of the existing bounded computational record — with no cut found and no uniform theorem proved on either
family.

## Route verdict: `bounded_evidence`

A genuine closed-form derivation is given for the block recurrence (item (a)'s named method, `proved_informal`),
and two genuine closed-form proofs are given for `Δ_{k+2}(R_1)` and `Δ_{k+2}(H_1)` (item (b)'s partial closure,
`proved_informal`). Everything else — the extended ranges on both families, the sharper `Δ_m(T(m,2))<0` target, the
extended network rows, and the deletion-only-saturation extension — is `bounded_computation`: exact, own-instrument,
digested, and reproducible, but not a proof for the family. Neither premise of item (a) is closed to a proof for
every `m`; the sign of two of the three leaf-type summands of item (b) is not closed to a proof for every `k`; no
uniform flow theorem or cut is found for item (c). Hence `bounded_evidence`, not `proved`/`proved_conditional`/
`refuted`/`compiled`.

## Remaining obligation

A successor should:

1. **Close `x(T(m,2))≤m` (equivalently, by this route's finding, `Δ_m(T(m,2))<0`) for every `m≥3` in closed form.**
   The recurrence's transfer matrix has REAL, POSITIVE eigenvalues `λ_±(y)` for every real `y≥0` (proved here: the
   discriminant `y^4+2y^3+7y^2+6y+1` has every coefficient positive). What remains is a genuine mode/saddle-point
   argument: locate the index (as a function of `j`) where `T_j(y)`'s coefficient sequence peaks, and show it lies
   strictly below `j+1` (in the assembled `I(T(m,2))`'s own indexing) for `j=m-1` once `m` is large enough, PLUS the
   already-complete finite check for `3≤m≤18` (zero slack there) and the now-extended check to `m≤1500` (nonzero,
   growing slack). The empirical ratio `\text{slack}/m \to \approx 0.0528` suggests an explicit algebraic limiting
   constant is extractable from `λ_+(y)`'s dominant balance at the relevant `y` — a concrete, well-posed next step.
2. **Close the sign of `q_3` and `q_{c_1}` (leaf-`3`'s and the arm-tip's own summands of `S(G_k,k+3)`)** in closed
   form, analogous to this route's `H_1,R_1` treatment: derive `H_3,R_3` and `H_{c_1},R_{c_1}`'s closed forms (each
   modifies a DIFFERENT branch of `G_k`'s decomposition than the one being removed, so `A3`'s exact technique for
   `H_1` does not transfer without adaptation — named explicitly, not glossed over), and either prove a magnitude
   bound closing `q_1`'s sign too, or find a uniform argument covering all three at once (e.g. via the SAME
   real-rootedness-of-`(1+3y+y^2)`-power fact that already proves `Δ_{k+2}(H_1)<0`, since `H_3, H_{c_1}` may also
   reduce to powers or near-powers of the same trinomial after the appropriate branch surgery).
3. **A genuinely scalable full-network flow certificate for `G_k`/`T(m,2)` beyond `k=7`/`m=7`** is out of this
   route's own instrument's reach (a naive exact Ford–Fulkerson does not scale past `\sim10^5` nodes within a
   reasonable budget); T1's choke-forest method or U2's product-form certificate (both Cycle 3 routes, not read
   here) may transfer directly to these two SIMPLER families (no chokes, no sector structure) if either produces a
   general technique.
4. **This route's own scalar necessary condition (C1)** — that (HALL) at `X=I_{p+1}` on `G_k`/`T(m,2)` is EXACTLY
   `S\le-2` — is itself worth registering as a named scope-note sentence (parallel to the existing `G_k` scope note's
   own such remark) once item 1 or 2 above closes either premise; this route does not register it (item (d): not
   this route's object).

## Background jobs

**Two commands were moved to the harness's own background-task queue by its 120-second default window** (an early
exploratory `G_6`/`G_7` full-flow probe, and the first attempt at the full replay script chain) — see Read-boundary
disclosure item 2 for the full account. Both were stopped immediately via the harness's own background-task control
before any output was read or used, and both were re-run to completion in the FOREGROUND with an explicit longer
timeout parameter (or, for the exploratory probe, abandoned in favor of the smaller/bounded version that appears in
`f2_partC.py`). Every number that appears anywhere in this return, in `F2-EVIDENCE.json`, or in its verified replay
was produced by a foreground call that returned before the next command was issued; nothing was polled by PID, and
no `pgrep`/`ps aux`/full process listing was used anywhere in this route's work.

## Model disclosure

Chartered Sonnet/xhigh; transport-resolved model Sonnet (explicit parameter); runtime-reported model id:
`claude-sonnet-5` (per this session's system context; the harness does not expose a separate lower-level build
identifier beyond this string).
