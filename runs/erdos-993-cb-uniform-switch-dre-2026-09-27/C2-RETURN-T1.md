# Route T1 Return — `C2-T-01 FAVORABILITY-ARM-LEAF-INTEGER-ROUTE`

Cycle 2, r31 (a parameter-uniform switch-using Hall certificate on `CB(8,m)` at the top sector-deficient
rank). Orientation: T (prove). Load-bearing obligation (`control/C2-ALLOCATION.md`, T1): prove
`Δ_{p*}(CB(8,m) − v) < 0` (the arm leaf `v` is favorable at `p*`) for every `m ≥ 107`, `m ≡ 2 (mod 3)`,
**WITHOUT Darroch and WITHOUT Newton**, using the two-binomial coefficient descent tool (G)
(`E993Transport.twoBinom_coeff_strictAnti_of_gap`, C1-LA3, `formally_verified`), with an explicit
treatment of any block where (G)'s gap condition fails, tested first at the fresh rows `m = 110, 113`.

**Model disclosure (two-part):** chartered Claude Sonnet 5, high effort (applied throughout); transport-resolved
model Sonnet (explicit parameter); runtime-reported model id: `claude-sonnet-5`.

IMPORT LIST (generator of record, `scratchpad/c2-T1/t1_main.py`): `sys, json, hashlib, math (comb)` —
standard library only, no third-party packages, no network.

## Boot acknowledgment

VerityOS booted for this seat by reading EXACTLY two files and nothing else:
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`.
No other VerityOS file (memory, conversations, modules, skills, logs, decisions, or the startup protocol's
own task-type map) was read this session — the controller has booted for the run. No read-boundary
disclosure is owed: every other file read this session is under this run's root
(`/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27`), inside the
directories this route's dispatch and the worker common brief grant (`control/`, `sources/`, my own
`scratchpad/c2-T1/` and `scratchpad/c2-T1-replay/`).

## Stage 2 seal, verified

Recomputed SHA-256 of the canonical JSON of `control/C2-STAGE2-PACKET-MANIFEST.json` with its own
`seal_sha256` field removed (`json.dumps(..., sort_keys=True, separators=(",",":"))`, no trailing
newline):

```
ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4
```

This matches the manifest's own recorded `seal_sha256` exactly (computed in-session; see the digest
audit below for the exact re-run). The manifest lists 2799 files; I read a small, named subset of them
(below), verifying each member's own SHA-256 against its digest record before reading it.

## Sources read, each digest verified before reading

| Path | SHA-256 (first 12 hex) | Verified against |
|---|---|---|
| `control/C2-WORKER-COMMON-BRIEF.md` | (read directly; binding text, not separately digest-listed) | dispatch instruction |
| `SEMANTIC-CONTRACT.md` | — | dispatch instruction |
| `SOLUTION-CONTRACT.md` | — | dispatch instruction |
| `control/C2-ALLOCATION.md` | — | dispatch instruction |
| `control/C2-STAGE1-GATE.md` | — | dispatch instruction |
| `cycles/cycle-2/stage2/ROUTE-STATE.md` | — | dispatch instruction |
| `control/CLAIM-IDENTITY.run-local.json` | `34b2bdca1122…` | `control/C2-STAGE2-PACKET-MANIFEST.json` entry, OK |
| `OBLIGATIONS.csv` | `605ac17718782…` | `control/C2-STAGE2-PACKET-MANIFEST.json` entry, OK |
| `sources/c1-results/runs/lean-2026-09-28-c1-la3-two-binomial-descent/INFORMAL-PROOF.md` | `a8bbf4f52a95…` | `sources/c1-results/SOURCE-DIGESTS.json`, OK |
| `sources/c1-results/runs/lean-2026-09-28-c1-la3-two-binomial-descent/THEOREM-CONTRACT.yaml` | `33bc3c74a4f8…` | `sources/c1-results/SOURCE-DIGESTS.json`, OK |
| `sources/c1-results/runs/lean-2026-09-28-c1-la3-two-binomial-descent/LeanProject/LeanProof/Main.lean` (grep only, entry 17) | — | frozen award, read-only |
| `sources/c1-results/second-reads/SR-4/SECOND-READ.md` | `112164b81ea0…` | `sources/c1-results/SOURCE-DIGESTS.json`, OK |
| `sources/c1-results/second-reads/SR-3/SECOND-READ.md` | `4009f4579513…` | `sources/c1-results/SOURCE-DIGESTS.json`, OK |
| `sources/c1-results/cycles/cycle-1/CYCLE-CLOSE.md` | `25c406abb42e…` | `sources/c1-results/SOURCE-DIGESTS.json`, OK |
| `sources/r30/records/cycles__cycle-6__stage3__returns__T1__RETURN.md` | (r30 frozen copy; read-only, cited not re-verified byte-for-byte against a separate digest list — the file is under `sources/r30/records/`, granted whole) | worker common brief grant |
| `sources/concurrent/master-494-2026-09-28/CLAIM-IDENTITY.json` | (alias check only; grep, no recursive listing above the grant) | worker common brief grant |

Digest audit (exact, in-session, `python3 -B`):

```
control/CLAIM-IDENTITY.run-local.json  -> 34b2bdca1122622e335007ec03ea3adb43cc81d40aa7f9456ab2b0fbf247bd5b  OK
OBLIGATIONS.csv                        -> 605ac1771878285d935f04f687cf2b45e04caccb83d7c44193c7094578d8ab7f  OK
c1-results/.../INFORMAL-PROOF.md       -> a8bbf4f52a95…                                                     OK
c1-results/.../THEOREM-CONTRACT.yaml   -> 33bc3c74a4f8…                                                     OK
c1-results/second-reads/SR-4/*.md      -> 112164b81ea0…                                                     OK
c1-results/second-reads/SR-3/*.md      -> 4009f4579513…                                                     OK
c1-results/cycles/cycle-1/CYCLE-CLOSE.md -> 25c406abb42e…                                                   OK
```

## Registered claims touched — named BEFORE any computation is presented as evidence

Per `SEMANTIC-CONTRACT.md` §4 and `sources/authority/CLAIM-IDENTITY.json` (read here via the run-local
registry, which carries these keys unchanged from the master):

1. **`E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`**
   (`proved_informal` modulo Darroch/Newton). Its part (i) is *exactly* T1's load-bearing obligation,
   currently proved there via Newton's inequalities + Darroch's theorem applied to the linear-factor
   blocks `V_j`. This route re-proves part (i) — and only part (i); part (ii), the private leaves, is
   T2's route — by a different mechanism that needs neither classical input. This key's own [r31 C1;
   SR-5] scope note anticipates exactly this: "a Darroch- and Newton-free proof of this key's
   conclusions at `p*` on that class would leave the Hall conjunct of [the composition key] at
   `proved_informal` with no classical dependency" for the arm-leaf part. This route is that discharge,
   for the arm leaf only.
2. **`E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL`**
   (`proved_informal`, the r31 Cycle 1 composition key) — touched only as the consumer of the favorability
   dependency; its own Hall/eligibility content is untouched by this route.
3. **`E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`** — not
   touched (T3's object).
4. **`E993-TREE-REAL-ROOTED`** (REFUTED) — not revived; this route uses no real-rootedness claim about
   `I(T)`, `G` or `G^m` (consistent with `SOLUTION-CONTRACT.md` fence 3: Newton/Darroch, and by extension
   any real-rootedness premise, only on products of linear factors — this route uses **neither** Newton
   nor Darroch at all, on any polynomial).
5. Lean companion lemma (no certificate of its own; cited, never re-proved):
   `E993Transport.twoBinom_coeff_strictAnti_of_gap` (G), C1-LA3, `formally_verified` at its exact scope
   (Main.lean entry 17; statement reproduced in Step 3 below).

## Alias check for a new candidate claim (STATED, not registered — pending critique and an isolated second read)

**Proposed candidate** (a PREDICATE of its statement, `E993-R31-` namespace):

`E993-R31-CB-8-ARM-LEAF-FAVORABLE-AT-RANK-16M-PLUS-4-OVER-3-VIA-TWO-BINOMIAL-DESCENT-DARROCH-AND-NEWTON-FREE`

**Statement:** for every integer `m ≥ 107` with `m ≡ 2 (mod 3)`, `T = CB(8,m)`, `p* = (16m+4)/3`:
`Δ_{p*}(T − v) < 0` (the arm leaf `v` is favorable at `p*`), proved by applying (G) to every term of
`I(T − v) = Σ_{j=0}^{m} C(m,j) V_j + R` (`V_j = x^j(1+x)^{8j+1}(1+2x)^{8(m−j)}`, `R = x(1+2x)^{8m}`), with
**zero exceptional blocks** (every `j ∈ [0,m]` and `R` itself satisfy (G)'s gap hypothesis outright), using
neither Newton's inequalities nor Darroch's theorem anywhere.

**Lexical alias check** (`grep` within `control/CLAIM-IDENTITY.run-local.json` and
`sources/concurrent/master-494-2026-09-28/CLAIM-IDENTITY.json`, both within grant, non-recursive above
the grant): no existing key contains `TWO-BINOM`, `TWOBINOM`, or the substring
`ARM-LEAF-FAVORABLE-AT-RANK-16M-PLUS-4-OVER-3`. The only `ARM-LEAF`-bearing keys found
(`E993-R30-CB-FAMILY-WHOSE-ROOT-FREE-MEMBERS-ALL-CONTAIN-ARM-LEAF-OR-ALL-CONTAIN-ARM-SUPPORT-…` and
siblings) are about Hall-deficiency comparisons between root-free families and their arm-leaf sector
part — a different mathematical object (a deficiency-domination lemma on the transport network, not a
coefficient-descent statement about `I(T−v)`). No lexical collision.

**Mathematical alias check:** the only existing key asserting the same conclusion
(`E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-…`, item 1 above) proves it by a strictly different
mechanism (Newton + Darroch on the mean `μ(V_j)`, valid for every `m ≥ 1` but carrying the two classical
dependencies) and at a strictly larger scope (`d ≥ 6`, not just `d = 8`; every `m ≥ 1`, not just the r31
class). This route's proof removes both classical dependencies at the cost of narrowing to `d = 8` on the
r31 class — a genuinely new proof object (a different predicate: "Darroch-and-Newton-free" is part of the
statement, not merely of the certificate), not a restatement. **No alias**; distinct claim.
`E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE`
is about a different index (`(16m−2)/3`, the `(ELIG-top)(a)` eligibility statement) and a different
polynomial (`I(T)`, not `I(T−v)`) — not this claim under a different name.

## The target, restated with hypothesis provenance

`SEMANTIC-CONTRACT.md` §1–2: `F_p(T) = {leaves w : Δ_p(T−w) < 0}` (the fixed original-tree selector,
never re-selected). `T1`'s obligation is exactly one instance of this predicate: `w = v`, `p = p*(m)`.
**Eligibility** (`x(T)+2 ≤ p*`, `3p* < 2α+1`) and the **active-tag witness**/**literal relation** (D)∪(S)
do **not** enter this route at all — favorability of a single leaf is a statement purely about the
coefficients of `I(T−v)`, on the original carrier, independent of the transport network (this matches
r30's own T1 Step 1 finding on the analogous problem, `sources/r30/records/cycles__cycle-6__stage3__returns__T1__RETURN.md:172-176`).
The **residue class** `m ≡ 2 (mod 3)` enters at exactly one point: the exact ℤ identity `3p* = 16m+4`
(never a floor-division fact once this hypothesis is given), used twice below (Step 4, Step 5). No
**explicit `M_0`** is needed anywhere in this proof — the argument is uniform starting at the class's own
floor `m = 107` (indeed at every `m ≥ 1` with the residue hypothesis; the r31 class restricts only because
that is T1's assigned scope).

## Step-by-step derivation

**Step 1 — the object, `IsTree`, and where the tree hypothesis enters.** `CB(8,m)` is built literally in
`t1_main.py`'s `build_cb(d,m)`: root `r=0`, support `s=1`, arm leaf `v=2` (path `r–s–v`); for each of `m`
chokes, `u_i ~ r`, and 8 branch pairs `(b_{ij}, c_{ij})` with `b_{ij} ~ u_i`, `c_{ij} ~ b_{ij}`. **`IsTree`
is checked, never assumed**, by `is_tree_explicit`: (a) edge count compared to `n−1` (necessary, not
sufficient alone); (b) a DFS from vertex 0 that must reach every vertex (**connectivity**) and must never
revisit an already-seen non-parent vertex (**acyclicity** — a back-edge signals a cycle). Run on the two
fresh test-row trees before anything about them is trusted:

| `m` | `n` | edges | expected (`n−1`) | connected | acyclic | `IsTree` |
|---|---|---|---|---|---|---|
| 110 | 1873 | 1872 | 1872 | true | true | **true** |
| 113 | 1924 | 1923 | 1923 | true | true | **true** |

**Step 2 — the closed form, re-derived.** Splitting on whether the root `r` is chosen (present/absent),
and on each choke independently, gives the independence-polynomial identity of record (cited from
`E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-…`, re-derived here, not assumed): with
`G(x) := (1+2x)^8 + x(1+x)^8` (a choke's spider gadget: `(1+2x)^8` when the hub `u_i` is excluded, one
factor `(1+2x)` per leg; `x(1+x)^8` when `u_i` is included, forcing every leg's support out, one factor
`(1+x)` per now-isolated private leaf),

```
I(T)     = (1+2x) G^m + x(1+x)(1+2x)^{8m}          [r excluded / included]
I(T − v) = (1+x)  G^m + x(1+2x)^{8m}                [arm collapses to a bare pendant s when v is deleted]
```

**Cross-validation (Part A of the generator; independent of Steps 3–7 below).** The closed form is
checked coefficient-for-coefficient against a **fully generic, CB-structure-agnostic** literal-tree
post-order independence-polynomial DP (`forest_independence_polynomial_general`, built from the literal
adjacency list, no knowledge of the block decomposition) after explicit deletion of `v` and an `IsTree`
check on every instance, for every `(d,m) ∈ {1,2,3,8} × {1,2,3,4}` — **16 checks, 0 mismatches**
(`structural_cross_check` in the generator output; digest below).

**Step 3 — the block decomposition, re-derived.** Expanding `G^m` by the binomial theorem,
`G^m = Σ_{j=0}^{m} C(m,j) (1+2x)^{8(m−j)} (x(1+x)^8)^j = Σ_j C(m,j) x^j (1+x)^{8j} (1+2x)^{8(m−j)}`, so

```
I(T − v) = (1+x) G^m + x(1+2x)^{8m} = Σ_{j=0}^{m} C(m,j) V_j  +  R
V_j := x^j (1+x)^{8j+1} (1+2x)^{8(m−j)},     R := x (1+2x)^{8m}
```

exactly matching `SOLUTION-CONTRACT.md`/`DISPATCH-T1`'s stated decomposition. Coefficient extraction:
writing `r(a,b,t) := [X^t] (1+X)^a(1+2X)^b = Σ_{i=0}^{t} C(a,i)C(b,t−i)2^{t−i}` (exact, standard-library
`math.comb`), `[x^k] V_j = r(8j+1, 8(m−j), k−j)` and `[x^k] R = r(0, 8m, k−1)`.

**Step 4 — the tool (G), cited verbatim, and the gap-margin identity for every block.** From C1-LA3's
`INFORMAL-PROOF.md` entry 10 / `Main.lean` entry 17 (`E993Transport.twoBinom_coeff_strictAnti_of_gap`,
`formally_verified`, no certificate of its own, no family or tree claim):

> For `a b t : ℕ` with `1 ≤ t`, `t ≤ a+b`, `3a+4b+2 ≤ 6t`: `r(t+1,a,b) < r(t,a,b)`.

**Application to `V_j`** (`a = 8j+1`, `b = 8(m−j)`, `t = p*−j`, so `t+1 = p*−j+1` gives
`[x^{p*+1}]V_j` against `[x^{p*}]V_j`): the margin is an exact ℤ identity, using `6p* = 2·3p* = 32m+8`
(residue-class hypothesis, Step-0 provenance):

```
margin(j) := 6t − (3a+4b+2)
           = 6(p*−j) − (3(8j+1) + 4·8(m−j) + 2)
           = (32m+8) − 6j − (24j+3+32m−32j+2)
           = (32m+8) − 6j − (−8j+32m+5)
           = 2j + 3        [ℤ-identity; no inequality assumed, only 3p*=16m+4]
```

`margin(j) = 2j+3 ≥ 3 > 0` for **every** `j ≥ 0` — no exceptional block, in contrast to the analogous
parent-descent problem (C1-LA3 entry 12, `cb8_gap_block_descent`, gap `2j−8`, which needs `j ≥ 5`) and to
the E1-threshold problem (entry 11, gap `2q+1`, needing `q ≥ 1`): this route's target rank (`p*` on
`I(T−v)`, not `p*−2` on `I(T)`) shifts the margin by a constant `+11` relative to the parent-descent
identity, which is enough to make it positive at `j=0` already. **`t`-range check:** `t = p*−j ∈ [1, 8m+1]`
for every `j ∈ [0,m]` (at `j=0`: `t=p* ≤ 8m+1` since `3p*=16m+4≤24m+3` for `m≥1`; at `j=m`: `t=(13m+4)/3≥1`
for `m≥1`), so (G)'s domain hypotheses hold throughout, independent of the gap.

**Application to `R`** (`a=0`, `b=8m`, `t=p*−1`):

```
margin_R := 6(p*−1) − (3·0 + 4·8m + 2) = (32m+8) − 6 − 32m − 2 = 0
```

exactly zero — (G)'s hypothesis is `≤`, non-strict, so equality suffices and the **conclusion is still
strict** (`r(t+1) < r(t)`, not `≤`). `t = p*−1 ≥ 1` and `t ≤ a+b = 8m` hold for `m ≥ 107` (in fact for
every `m ≥ 1`).

**Every `ℕ`-subtraction and cast, audited:** `p* = (16m+4)/3` is exact integer division here (not floor
division in the sense of losing information), because `m ≡ 2 (mod 3) ⟹ 16m+4 ≡ 0 (mod 3)` — checked by
the generator's own assertion `num % 3 == 0` before dividing. `m−j` (`j ≤ m`, true value). `p*−j`
(`j ≤ m < p*` for `m ≥ 107`, since `p* ≈ 5.33m`, true value; the generator never assumes this, it computes
`t` directly as an integer and (G)'s own hypothesis `1 ≤ t` re-certifies it is non-negative and positive
at every one of the `m+1` checked values, for every tested `m`). `p*−1` (`p* ≥ 572` at the class minimum,
true value). No subtraction here is truncated incorrectly; every one is checked positive at the point of
use, not merely assumed.

**Step 5 — total sum, two independent instruments.** `Δ_{p*}(T−v) = Σ_{j=0}^{m} C(m,j)[(V_j)_{p*+1} −
(V_j)_{p*}] + [R_{p*+1} − R_{p*}]`. Every bracketed term is **strictly negative** (Step 4, applied to
*every* `j` and to `R`, with zero exceptions), and every weight `C(m,j) ≥ 0` (with `C(m,0)=1>0` always
present), so the sum is a sum of non-positive terms with at least one strictly negative term of positive
weight — **`Δ_{p*}(T−v) < 0`, unconditionally, for every `m` in the class.** This is confirmed
numerically at the two fresh rows by two fully independent computational instruments:

- **Instrument A** (`coeff_I_T_minus_v`): the block-sum formula of Step 3, `Σ_j C(m,j) r(8j+1,8(m−j),k−j)
  + r(0,8m,k−1)`, evaluated directly at `k = p*, p*+1`.
- **Instrument B** (`independence_poly_T_minus_v_direct`): **direct exact polynomial multiplication** of
  `(1+x) G(x)^m + x(1+2x)^{8m}` by repeated convolution, with **no reference whatsoever** to the block
  decomposition of Step 3 (it builds `G` from scratch and multiplies it into itself `m` times).

Both instruments are asserted **before** their agreement is interpreted (per the (WID)-style discipline
of the worker brief, applied here to a coefficient identity rather than a network identity, since this
route never builds the transport network):

| `m` | `p*` | `i_{p*}(T−v)` (A) | `i_{p*}(T−v)` (B) | agree | `i_{p*+1}(T−v)` (A) | `i_{p*+1}(T−v)` (B) | agree | `Δ_{p*}(T−v)` (421/432-digit magnitude) |
|---|---|---|---|---|---|---|---|---|
| 110 | 588 | 2807424039717750845575… (421 digits) | identical | **yes** | 2771532660447409277114… (421 digits) | identical | **yes** | **negative**, 419-digit magnitude |
| 113 | 604 | 876716933448819832158… (432 digits) | identical | **yes** | 865637807162045968772… (432 digits) | identical | **yes** | **negative**, 431-digit magnitude |

(Full exact integers are in the generator's digested JSON output, not reproduced in full here; every
digit is reproducible by the replay command below. Digit counts confirmed directly: `len(str(i))`.)

**Step 6 — the gap-margin identity holds at every tested `m`, not only the two fresh rows.** The generator
additionally checks the exact identity `margin(j) = 2j+3` (and `margin_R = 0`) by direct substitution, for
**every** `j ∈ [0,m]`, at `m ∈ {107, 110, 113, 2000}` — `107` (the class minimum, a control row), `110,
113` (the fresh rows named by the dispatch), and `2000` (a distant uniformity spot-check, well beyond any
range a finite certificate would need) — **2334 total `(m,j)` pairs, 0 ascending blocks found at any of
them**, confirming the identity is exact and `m`-independent (it is a polynomial identity in `j` alone,
once `3p*=16m+4` is substituted, so checking it symbolically at four separated points along a degree-1
polynomial in `j` — the coefficient of `j`, `2`, is what `omega` would derive directly — is a redundant,
not merely a sampled, confirmation of an already-closed-form algebraic fact).

**Step 7 — block-by-block reapplication of (G), independently re-verified by direct coefficient
computation.** For thoroughness beyond the margin identity alone, `apply_G` independently recomputes
`r(a,b,t)` and `r(a,b,t+1)` from scratch (not from the block-sum total) for **every** `j ∈ [0,m]` and for
`R`, at `m = 110` (111 blocks + R) and `m = 113` (114 blocks + R) — **227 direct coefficient-pair checks,
strict descent confirmed at every one, matching (G)'s guaranteed conclusion exactly** (`block_by_block_G_application`
in the generator output).

## `x`, `Δ_k`, difference index — every row

`Δ_k(W) := i_{k+1}(W) − i_k(W)` throughout (never a plateau treated as descent; every comparison below is
strict `<`, never `≤`, except where (G)'s hypothesis itself is non-strict and its conclusion strict, noted
explicitly).

| Row | Object `W` | index `k` compared | `Δ_k(W)` sign | Source |
|---|---|---|---|---|
| `m=110` | `V_j`, every `j∈[0,110]` | `k=p*=588` (against `k+1=589`) | `<0` at every `j` | Step 4/7, margin `2j+3≥3` |
| `m=110` | `R` | `k=588` | `<0` (margin `0`, strict conclusion) | Step 4/7 |
| `m=110` | `T−v` (total) | `k=588` | `<0` | Step 5, two instruments |
| `m=113` | `V_j`, every `j∈[0,113]` | `k=p*=604` | `<0` at every `j` | Step 4/7 |
| `m=113` | `R` | `k=604` | `<0` | Step 4/7 |
| `m=113` | `T−v` (total) | `k=604` | `<0` | Step 5, two instruments |
| `m=107,110,113,2000` | margin identity | `k=p*(m)` (symbolic in `j`) | `margin(j)=2j+3>0` for all `j`; `margin_R=0` | Step 6 |

`x(T)` itself (the crossing index) is **not recomputed by this route** — T1's obligation is about
`Δ_{p*}(T−v)`, not about `x(T)`. The fixed-point values `x=570,586,602` at `m=107,110,113`
(`SEMANTIC-CONTRACT.md` §5 gives `570` at `m=107`; the OBLIGATIONS.csv record SR-5 gives `570,586,602`) are
cited from the frozen record, not independently reproduced here, and no claim in this return depends on
their value.

## Fixed points reproduced, before any table above was reported

| `m` | `n = 17m+3` | `α = 9m+1` | `p* = (16m+4)/3` |
|---|---|---|---|
| 107 (control, class minimum) | 1822 | 964 | **572** |
| 110 (fresh) | 1873 | 991 | **588** |
| 113 (fresh) | 1924 | 1018 | **604** |

All three match `SEMANTIC-CONTRACT.md` §5 / `OBLIGATIONS.csv` exactly (`n=1822,α=964` at `m=107` cited in
the contract; `p*=572,588,604` match the contract and SR-5's record respectively). Computed here from the
closed-form parameters, not by import.

## Generator, digest, replay

```
IMPORT LIST: sys, json, hashlib, math (comb)   — standard library only
Generator:   scratchpad/c2-T1/t1_main.py       (source of record for every claim above)
Output:      scratchpad/c2-T1/t1_main_run.log  (full JSON result)
RESULT_DIGEST_SHA256 (canonical JSON of the full result dict, sort_keys, separators (",",":"),
no wall-clock/PID/host field anywhere in the hashed payload):
    b23dba2f673a03343875b8161586d72e4777305c23145ccf239a4181e328eff5
Copy-out-first replay (never /tmp, never in place):
    cp scratchpad/c2-T1/t1_main.py scratchpad/c2-T1-replay/t1_main.py
    cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-T1-replay
    python3 -B t1_main.py > REPLAY-OUTPUT.log
Replay performed in-session (foreground, ~0.1s wall time — measured, not estimated; no PID
polling needed, no background job at any point in this route):
    identical RESULT_DIGEST_SHA256 reproduced
    (b23dba2f673a03343875b8161586d72e4777305c23145ccf239a4181e328eff5).
python3 -B used throughout. No background job was started at any point in this route; nothing to
kill or poll before finalizing.
```

The generator performs, in order: (Part A) the 16-instance structural cross-check of the closed form
against a fully generic literal-tree DP, with explicit `IsTree` checks on every instance (Step 1–2);
(Part B) `IsTree` fidelity checks on the two actual test-row trees `CB(8,110)`, `CB(8,113)` (Step 1);
(Part C) the exact gap-margin identity check over `2334` `(m,j)` pairs across four `m`-rows (Step 6);
(Part D) 227 direct block-by-block reapplications of (G) at the two fresh rows (Step 7); (Part E) the
two-independent-instrument total-`Δ` check at the two fresh rows (Step 5); (Part F) the fixed-point
reproduction table. Every `assert` in the generator is a claim of this return; the script raises (exit
code ≠ 0, caught during development — see the earlier `deg_cap` bug found and fixed by this route's own
cross-check, corrected before this file was finalized) rather than silently reporting a false claim.

## Newton/Darroch discipline

**Neither Newton's inequalities nor Darroch's theorem is used anywhere in this route** — not on `I(T)`,
not on `I(T−v)`, not on `G`, not on any block `V_j`, not on `R`. This is a strictly stronger discipline
than `SOLUTION-CONTRACT.md` fence 3 requires (which permits their use on real-rooted linear-factor
products); this route's entire mechanism is the exact three-term recurrence + log-concavity argument
underlying (G), which needs neither classical theorem (per C1-LA3's own fence: "No Newton inequality and
no Darroch mode theorem is used anywhere; the pinned Mathlib has neither"). **This route is
Darroch/Newton-free end to end**, with **zero exceptional blocks** requiring a separate pooled
certificate — a stronger outcome than the dispatch's own framing anticipated (which allowed for
"finitely many blocks where (G)'s gap condition fails"); Step 4 shows exactly why none exist for this
particular target (the `+11` constant shift relative to the parent-descent gap identity moves the
threshold below `j=0`).

## Grades

| Claim | Statement | Grade | Weakest input |
|---|---|---|---|
| Structural cross-check (Part A) | Closed form `I(T−v)` matches generic tree DP, 16/16, with `IsTree` on every instance | `bounded_computation` (exact, exhaustive over the stated finite instance set) | — |
| `IsTree` fidelity, `m=110,113` | Connectivity + acyclicity confirmed by explicit DFS | `bounded_computation` (exact) | — |
| Gap-margin identity `margin(j)=2j+3`, `margin_R=0` | Exact ℤ identity, given `3p*=16m+4` | derivation (elementary algebra); independently checked at 2334 `(m,j)` pairs, `bounded_computation` as *evidence*, but the identity itself is a closed-form algebraic fact, not a sampled claim | — |
| Block-by-block descent, `m=110,113` | 227 direct coefficient-pair checks | `bounded_computation` (exact, exhaustive at the two named rows) | — |
| **T1's own object — `Δ_{p*}(CB(8,m)−v) < 0` for every `m≥107`, `m≡2 (mod 3)`, Darroch/Newton-free** | The full universal claim, established by combining the exact margin identity (Step 4/6, valid for every `m` satisfying the residue hypothesis, no sampling) with the cited `formally_verified` tool (G) | **`proved_informal`** — a complete, gap-free elementary argument over the whole infinite class, resting on one classical-free `formally_verified` Lean lemma and exact integer algebra; not itself Lean-checked (no award funded this route), hence not `formally_verified` | (G), `formally_verified`, applied correctly; the elementary algebraic identity is unverified by machine but has no undischarged classical dependency |
| Composition key `E993-R31-CB-8-…-WEIGHTED-HALL` | Unaffected directly (T2's private-leaf part is still open; this route only discharges the arm-leaf half of the favorability hypothesis) | grade unchanged (`proved_informal`) pending T2 | T2's outcome |

## Gate-31 / gate ruling 14 lines

`ELIG_formal: not_advanced` (this route touches no formal Lean eligibility work; that is U1's object).
`HALL_formal: not_advanced` (this route produces no Lean; the formal saturating-flow conjunct is U2's
object).
`FAV_darroch_free: advanced` (the arm-leaf half of favorability at `p*` is now proved without Darroch or
Newton, for the entire r31 class, with zero exceptional blocks — a complete discharge of T1's assigned
half of the remaining classical dependency named in `control/C2-ALLOCATION.md`'s "Where the target
stands").
`cut_candidate: none` (this route does not search for or produce a deficient cut; its object is a
favorability lemma, not a network Hall check).

## `headline_resolved: no`

(HALL) at its full scope is not formally verified by this route, and this route asserts no confirmed
eligible deficient cut. Per `SOLUTION-CONTRACT.md` §5, neither decisive event is reached here.

## Route verdict: `proved`

T1's own load-bearing obligation — `Δ_{p*}(CB(8,m) − v) < 0` for every `m ≥ 107`, `m ≡ 2 (mod 3)`,
without Darroch and without Newton — is **proved**, completely, for the entire infinite class, with no
sampled range, no `M_0`, and no exceptional block requiring a separate pooled certificate. The proof rests
on exactly one external input, the `formally_verified` Lean lemma (G) (a companion tool with no certificate
of its own, applied here, not re-proved), plus elementary, exact-integer algebra (the block decomposition
of `I(T−v)` and the gap-margin identity `margin(j)=2j+3`), independently cross-checked by two
disagreement-free computational instruments at the two fresh test rows and by direct block-level
reapplication of (G) at 227 coefficient pairs. This is `proved` in the sense of T1's own assigned object
only — it is **not** a claim that Tier 1, (HALL), or the run's headline are proved; those remain as stated
in `control/C2-ALLOCATION.md`'s "Where the target stands entering Cycle 2" except for the one narrowing
recorded above (the arm-leaf half of the favorability dependency in the composition key's chain no longer
needs Darroch or Newton).

## Remaining obligation (successor inheritance)

1. **T1's own object is closed.** No further work is needed on arm-leaf favorability at `p*` for the r31
   class; a successor should not re-attempt it. If a Lean award is later funded for the composition key's
   favorability hypothesis, this route's proof (Steps 2–5 above) is the informal specification to carry:
   the block decomposition, the margin identity `margin(j)=2j+3` (and `margin_R=0`), and direct application
   of C1-LA3's already-`formally_verified` `twoBinom_coeff_strictAnti_of_gap` at `a=8j+1,b=8(m−j),t=p*−j`
   for every `j` (and at `a=0,b=8m,t=p*−1` for `R`) — no new Lean lemma is needed beyond what C1-LA3 already
   proved; only the CB-specific instantiation (analogous to C1-LA3's own entries 13–14, `cb8_E1_conditionI_topRank`
   and `cb8_block_descent_topRank`, which are exactly this pattern for different `(a,b,t)`).
2. **Full favorability (`F_{p*}(T)=leafSet(T)`) still needs T2's private-leaf half.** This route says
   nothing about `Δ_{p*}(T − c_{ij})` for private leaves `c_{ij}`; T2's own gap-margin identity may or may
   not similarly turn out exception-free (the private-leaf block decomposition has an extra paired block
   `Π = (1+x)(1+2x)^{8m−1}(1+3x+x^2)` whose quadratic factor is not of two-binomial form, per T2's own
   allocation text — this route's clean zero-exception outcome for the arm leaf should **not** be assumed
   to transfer to T2 without re-derivation).
3. **The composition key's grade** (`E993-R31-CB-8-…-WEIGHTED-HALL`, `proved_informal`) is unaffected by
   this route alone; discharging its remaining classical dependency (favorability) needs T2's outcome too.
   A synthesis combining this route with T2 could correctly state: "the favorability hypothesis of the
   composition key is Darroch/Newton-free **iff** T2 also succeeds"; this route alone only narrows, does
   not close, that dependency.
4. **A Lean award for this route's content** (recommended, not funded here): a CB-8-specific instantiation
   lemma, `cb8_arm_leaf_favorable_topRank`, over C1-LA2's `cbGraph m`, stating
   `(favorableLeaves (cbGraph m) p*).contains armLeaf` or equivalent, built exactly as C1-LA3's entries
   13–14 are built (two calls to `twoBinom_coeff_strictAnti_of_gap` composed with the block-sum identity as
   a `Finset.sum` over `Finset.range (m+1)`), would formally close the "T1 half" of the favorability
   hypothesis feeding U2's composition. This is a natural, small next Lean target (smaller in scope than
   U1's degree-50 certificate, since **no polynomial-positivity certificate is needed here at all** —
   every block already satisfies (G)'s hypothesis outright).

## Process disclosures

No background job was started at any point in this route (every computation completed in well under two
seconds, run in the foreground). No PID polling was needed. No process listing, `find`, `grep -r`, or `ls
-R` was run rooted above this route's grant (`sources/`, `control/`, and this route's own scratch
directories); the only `grep`/`ls` calls made were targeted, non-recursive-above-grant lookups inside
`sources/c1-results/`, `sources/r30/records/`, `sources/r30/second-reads/`, `sources/concurrent/`, and
`control/`, all within the worker common brief's explicit grant, to locate specific named files and to
perform the alias check. One implementation bug was found and fixed during this route's own development
(an under-sized `deg_cap` in the Part A structural cross-check, caught by the cross-check's own assertion
failing on its first run, not by silent wrong output) — corrected before any claim above was finalized;
the corrected script is the sole generator of record, and its replay reproduces the same digest reported
above.

## Model disclosure (repeated per worker common brief)

Chartered Claude Sonnet 5, high effort (applied throughout, as directed); transport-resolved model Sonnet
(explicit parameter, per dispatch); runtime-reported model id: `claude-sonnet-5`.
