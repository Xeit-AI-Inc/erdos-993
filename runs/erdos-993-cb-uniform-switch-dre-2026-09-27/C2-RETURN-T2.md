# Route Return — T2

Route ID: `C2-T-02`. Mechanism token: `FAVORABILITY-PRIVATE-LEAF-INTEGER-ROUTE`. Orientation: T (prove). Seat: T2, Cycle 2,
run `erdos-993-math-dre-20260927-r31-cb-uniform-switch` (r31).

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and no other VerityOS file as the authorized boot pair (per
`DISPATCH-T2.md` and `control/C2-WORKER-COMMON-BRIEF.md`, which both direct a seat away from the startup protocol's own
task-type map, memory, conversations, modules, skills, logs and decisions).

## Read-boundary disclosure

Before reading the dispatch file, the controlling harness's project-level `CLAUDE.md` (VerityOS's own root bootstrap for
CoWork/Claude) was already present in context and directed a boot sequence that additionally names
`skills/optimization-loop/skill.md` for "controlled optimization or benchmark-driven improvement" tasks. I read
`/Users/ashtonsperry/VerityOS/skills/optimization-loop/skill.md` in the same tool batch as reading the dispatch file itself,
i.e. before the dispatch's explicit instruction ("boot VerityOS by reading EXACTLY these two files and nothing else... any
other VerityOS read is a `## Read-boundary disclosure` item") was in view. This is a read-boundary violation: that file is
not one of the two authorized boot reads, and it is not under this run's grant. No content from it was used in the
mathematics below; it is recorded here for transparency, as required, and no further reads outside the grant occurred after
this point. `verity.md` and `identity/startup-protocol.md` themselves were read once, as required, and nothing from their
own task-type map was separately actioned.

**Model disclosure (two parts).** chartered Claude Sonnet 5, high (effort applied by the platform); transport-resolved model
sonnet (explicit parameter); runtime-reported model id: `claude-sonnet-5`.

## Digest and seal verification

- Dispatch `DISPATCH-T2.md`: recomputed SHA-256 `fbe3dae01696e828ee3276805381db26f30223d00f68ed86882e77d41f67f4b9`, matches
  the value given in the task instructions.
- `control/C2-STAGE2-PACKET-MANIFEST.json` inner seal: declared `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`;
  recomputed by SHA-256 over the canonical JSON of the manifest with `seal_sha256` removed (`sort_keys=True`,
  `separators=(",",":")`, no trailing newline): **match**.
- `sources/concurrent/master-494-2026-09-28/CLAIM-IDENTITY.json`: recomputed SHA-256 `d917fd1d152f0cb87c5702ebd5ef5b7fbea175026a1831489d51276c5bc80c08`, matches `sources/concurrent/SOURCE-DIGESTS.json`.
- `sources/c1-results/runs/lean-2026-09-28-c1-la3-two-binomial-descent/LeanProject/LeanProof/Main.lean`: recomputed SHA-256
  `c0605e12b91375ede9fb72cb9af428a96d9b6a7d678b856b0131f9c7b10f3011`, matches `sources/c1-results/SOURCE-DIGESTS.json`.
- `.../INFORMAL-PROOF.md`: recomputed SHA-256 `a8bbf4f52a9599bf7a99d3ef8febd893a94e74e250b9fe6738f0dc6e188c1166`, matches.
- C1-LA3 `VERIFICATION-REPORT.json`: `kernel-verification.verdict = "verified"`, `status = "formally_verified"`.

## Registered claims touched (named before any computation is presented as evidence)

- `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3` — the informal
  favorability key (`proved_informal` modulo Darroch/Newton on real-rooted blocks). This route's obligation is to re-derive
  its part (ii) (private-leaf favorability, specialized to `d=8`, the r31 class) **without** Darroch or Newton.
- `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` and
  `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` — cited only for context
  (T3's object, not touched here).
- `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-BLOCK-PRODUCT-1-PLUS-X-TO-8J-TIMES-1-PLUS-2X-TO-8M-MINUS-8J-PLUS-1-COEFFICIENTS-STRICTLY-DESCEND-AT-INDEX-16M-MINUS-2-OVER-3-MINUS-J-FOR-5-LE-J-LE-M`
  (award C1-LA3, `formally_verified`) — the parent-tree instance of tool (G); this route's object (`T-c`, private-leaf
  deletion) is a **different** polynomial family and a different index range, so this is a companion, not a re-proof.
- Award C1-LA2 (`formally_verified`, infrastructure) — cited only for the `cbGraph` layer; not touched here (this route is
  coefficient-level, no network, no Lean).
- No registered key claims private-leaf favorability via a two-binomial (Darroch/Newton-free) argument. Full alias check
  below.

## IMPORT LIST

All scripts import stdlib only: `math`, `hashlib`, `json`, `sys`, `collections.deque` (in `tree_dp.py`). No network, no
package installs, no non-stdlib imports anywhere in this route's artifacts.

## The obligation

`C2-ALLOCATION.md`'s T2 load-bearing obligation: for `T = CB(8,m)`, `m ≥ 107`, `m ≡ 2 (mod 3)`, `p* = (16m+4)/3`, and every
private leaf `c = c_ij`: `Δ_{p*}(T − c) < 0`, i.e. `[x^{p*}]I(T−c) < [x^{p*-1}]I(T−c)`, **without using Newton's inequality or
Darroch's mode theorem anywhere** — replacing every such use by tool (G) (`E993Transport.twoBinom_coeff_strictAnti_of_gap`,
C1-LA3, `formally_verified`, entry hash `b39cd78768d02c83194f21b48717af69a8354afb36719755c5979769c3d6589c`) plus explicit
finite treatment where (G)'s hypothesis fails, then transfer to every private leaf by symmetry.

**Class check (verified below, `main_verify.py`, `check_row`).** `8m mod 3`: since `m ≡ 2 (mod 3)`, `8m ≡ 2·2 ≡ 1 (mod 3)`,
so `dm = 8m ≢ 2 (mod 3)` and the favorability key's hypothesis for part (ii) holds — confirmed by the assertion
`(d*m) % 3 == 1` on every row.

## Step-by-step derivation

### 1. Closed form and block decomposition (where the hypothesis "d=8, this family" enters)

Inherited from `SEMANTIC-CONTRACT.md` §2 (r30's closed forms, re-derived and DP-validated below, not re-proved from
scratch): with `G = (1+2x)^d + x(1+x)^d`, `G_c = (1+2x)^{d-1}(1+x) + x(1+x)^{d-1}`,

```
I(T-c) = (1+2x) G_c G^{m-1} + x(1+x)^2 (1+2x)^{dm-1}.
```

Expanding `G^{m-1} = Σ_{j=0}^{m-1} C(m-1,j) x^j (1+x)^{dj} (1+2x)^{d(m-1-j)}` and multiplying through (`d=8` from here on):

```
I(T-c) = Σ_{j=0}^{m-1} C(m-1,j) [ E0_j + E1_j ]  +  leftover
E0_j = x^j (1+x)^{8j+1} (1+2x)^{8(m-j)}          (weight C(m-1,j))
E1_j = x^{j+1} (1+x)^{8j+7} (1+2x)^{8(m-1-j)+1}  (weight C(m-1,j))
leftover = x (1+x)^2 (1+2x)^{8m-1}                (weight 1, standalone)
```

This is the general-`d` decomposition of the r30 T1-F critique (`sources/r30/records/cycles__cycle-6__stage4__critics__T1__F__CRITIQUE.md:245-247`), specialized to `d=8` and re-derived by hand; the closed forms and the block sum are DP-validated
below (`tree_dp.py`, 72/0 mismatches, `d ∈ [1,8]`, `m ∈ [1,3]`, against a literal-tree independence-polynomial DP with its
own acyclicity/connectivity test).

Each `E0_j`, `E1_j` is `x^{shift}` times a **two-binomial product** `P_{a,b} = (1+x)^a(1+2x)^b`, exactly the object tool (G)
governs. `Δ_k(E0_j) := [x^k]E0_j - [x^{k-1}]E0_j = r_{a,b}(k-j) - r_{a,b}(k-j-1)` where `r_{a,b}(t) = [x^t]P_{a,b}`; the
difference index `k` and the underlying two-binomial index `t = k-j` (resp. `k-j-1`) are tracked explicitly at every
application below.

### 2. `E1_j` for every `j ∈ [0,m-1]`: tool (G) applies directly, no exception (this is where the hypothesis "shift by `x^{j+1}`, `a=8j+7`, `b=8(m-1-j)+1`" enters)

We need `r_{a,b}(t+1) < r_{a,b}(t)` at `a = 8j+7`, `b = 8(m-1-j)+1`, `t = p^*-j-2` (so that `[x^{p^*}]E1_j < [x^{p^*-1}]E1_j`).
Tool (G)'s hypothesis is `3a+4b+2 ≤ 6t`. Substituting and using `6p^* = 32m+8` exactly (since `3p^*=16m+4`):

```
3a+4b+2 = 3(8j+7)+4(8(m-1-j)+1)+2 = 24j+21 + (32m-32j-28) + 2 = 32m - 8j - 5
6t       = 6(p^*-j-2) = 6p^* - 6j - 12 = (32m+8) - 6j - 12 = 32m - 6j - 4
gap := (3a+4b+2) - 6t = (32m-8j-5) - (32m-6j-4) = -2j - 1
```

`gap = -2j-1 ≤ 0` for every natural number `j` — **the hypothesis holds for every `j ∈ [0,m-1]`**, with margin `6t-(3a+4b+2)
= 2j+1 ≥ 1`, growing with `j`. Checked directly, not just by this one line of algebra: `main_verify.py`'s `E1_gap_failures`
is the empty list at every one of 52 tested rows, checked exhaustively over every `j∈[0,m-1]` in each row (not a sample) —
see the run log. The hypothesis range check `1 ≤ t ≤ a+b` also holds throughout (`t=p^*-j-2 ≥ 1` since `p^* ≥ 572`;
`t ≤ a+b = 8m` since `j ≤ m-1`).

### 3. `E0_j` for `j ∈ [2,m-1]`: tool (G) applies directly (this is where "`a=8j+1`, `b=8(m-j)`, `t=p^*-j-1`" enters)

`Δ_k(E0_j)` at `k=p^*` needs `r_{a,b}(t+1)<r_{a,b}(t)` at `a=8j+1`, `b=8(m-j)`, `t=p^*-j-1`:

```
3a+4b+2 = 3(8j+1)+4(8(m-j))+2 = -8j+32m+5
6t       = 6(p^*-j-1) = 32m-6j+2
gap      = (3a+4b+2)-6t = -2j+3
```

`gap ≤ 0 ⟺ j ≥ 3/2 ⟺ j ≥ 2`. **Holds for every `j ∈ [2,m-1]`**, verified exhaustively over `j` at every tested row
(`E0_j_ge2_gap_failures` empty throughout).

### 4. `E0_0`, `E0_1`: tool (G)'s hypothesis fails by a fixed deficit — this is where the family's "exceptional low blocks" enter

At `j=0`: `gap = 3` (deficit 3; tool (G) does not apply). At `j=1`: `gap=1` (deficit 1). Verified exactly (not just by the
formula) at every tested row: `E0_0_gap_deficit == 3`, `E0_1_gap_deficit == 1` on every row.

### 5. Resolving `j=1` (E0_1) — a new, Darroch/Newton-free elementary tool, `(G')`, derived from the SAME recurrence and log-concavity C1-LA3 already proved

Write the two-binomial three-term recurrence (R) from C1-LA3 (`twoBinomCoeff_recurrence`, entry hash `d60b214129419ccdf8cd12a466c639c1f83da6cce1f52f3b1d61366905f7b891`):
`(k+1) r(k+1) = (a+2b-3k) r(k) + 2(a+b-k+1) r(k-1)`. This is an *exact* algebraic identity (no inequality), so for any `k`:

```
r(k+1) < r(k)  ⟺  (4k+1-a-2b) r(k)  >  2(a+b-k+1) r(k-1)          (★, pure algebra, no hypothesis)
```

**Deficit-1 case.** When `6k = 3a+4b+1` exactly (the `j=1` deficit), `4k+1-a-2b = 2(a+b-k+1)` exactly (both sides reduce to
the same linear form under the substitution `6k=3a+4b+1`), so (★) collapses to the exact equivalence

```
r(k+1) < r(k)   ⟺   r(k-1) < r(k)                                  (deficit-1 equivalence)
```

— i.e. descent at `k→k+1` holds **iff** the sequence was ascending into `k` one step earlier. Applied at `a=9,b=8m-8`
(E0_1's pair), `k=p^*-2`: the needed fact `r(p^*-1)<r(p^*-2)` is equivalent to `r(p^*-3)<r(p^*-2)`.

**New tool (G'), ascent, derived here (not in any frozen source; same method as tool (G)'s own proof, mirrored).** For
`a,b,k ∈ ℕ` with `1≤k≤a+b`, `6k ≤ 3a+4b`: `r(k) < r(k+1)`.
*Proof.* Suppose (for contradiction) `r(k+1) ≤ r(k)`. Log-concavity (`twoBinomCoeff_logConcave`, already elementary — proved
by factor induction, no Newton/Darroch, C1-LA3 item 9) gives `r(k-1) r(k+1) ≤ r(k)^2`. Combined with `r(k+1) ≤ r(k)`:
`r(k-1) ≥ r(k)^2/r(k+1) ≥ r(k)` (dividing by `r(k+1)≤r(k)`, both positive). Substitute `r(k-1) ≥ r(k)` into recurrence (R) at
index `k`: `(k+1) r(k+1) = (a+2b-3k) r(k) + 2(a+b-k+1) r(k-1) ≥ (a+2b-3k+2a+2b-2k+2) r(k) = (3a+4b-5k+2) r(k)`. Combined with
`r(k+1) ≤ r(k)`: `(k+1) r(k) ≥ (k+1) r(k+1) ≥ (3a+4b-5k+2) r(k)`, so (dividing by `r(k)>0`) `k+1 ≥ 3a+4b-5k+2`, i.e.
`6k ≥ 3a+4b+1`, contradicting `6k ≤ 3a+4b`. ∎ (This is exactly C1-LA3's own `descent_of_recurrence_logconcave` proof, run in
reverse; it needs no new import beyond what C1-LA3 already discharges — recurrence (R) and log-concavity, both elementary.)

Apply (G') at `a=9,b=8m-8`, `k'=p^*-3`: hypothesis `6k' ≤ 3a+4b` becomes `6(p^*-3) ≤ 32m-5`, i.e. `32m-10 ≤ 32m-5`, **always
true** (margin 5). (G') at `k'=p^*-3` directly gives `r(k') < r(k'+1)`, i.e. `r(p^*-3) < r(p^*-2)` — exactly the fact the
deficit-1 equivalence needs. Chaining:
`r(p^*-3)<r(p^*-2)` [(G') at `p^*-3`] `⟹ r(p^*-1)<r(p^*-2)` [deficit-1 equivalence] — **`E0_1` strictly descends at `p^*`,
for every `m` in the class**, Darroch/Newton-free. Verified exactly (both the identity (★) as an exact integer equation and
the final descent) at every tested row (`E0_1_needed_descent_r(p*-1)<r(p*-2)` = True throughout; `main_verify.py` lines
154-179).

### 6. `E0_0` (paired with `leftover`) — an exact reduction identity, and the one piece not closed for every `m`

Following the r30 critique's pairing (`(1+x)(1+2x)^{8m}+x(1+x)^2(1+2x)^{8m-1} = (1+x)(1+2x)^{8m-1}(1+3x+x^2)`, a direct
polynomial identity, algebraically re-derived at the top of §6 and consistent with `tree_dp.py`'s literal-DP validation of
the full closed forms it is extracted from), set `q = r_{1,8m-1}` (i.e. `a=1,b=8m-1`)
and `A=q(p^*),B=q(p^*-1),C=q(p^*-2),D=q(p^*-3)`. The paired block's coefficient at `k` is `q(k)+3q(k-1)+q(k-2)`, so, writing
`Θ` for the paired block's own discrete derivative at `p^*` (reserving `T` for the tree `CB(8,m)` throughout, per the run's
standing notation): `Θ := Δ_{p^*}(\text{paired block}) = A+2B-2C-D`.

Two exact identities from recurrence (R) (both pure algebra, verified as exact integer equalities on every tested row,
`identity_i_residual == 0`, `identity_ii_residual == 0`):

```
(i)  p*·A + 2B - p*·C = 0        [(R) at k=p*-1: a+2b-3(p*-1) = -2 and a+b-(p*-1)+1 = (8m+2)/3 = p*/2, both exact, so
                                   p*·A = (-2)·B + 2·(p*/2)·C = -2B + p*C]
(ii) (p*-1)·B - C - (p*+2)·D = 0  [(R) at k=p*-2: a+2b-3(p*-2) = 1 and a+b-(p*-2)+1 = (8m+5)/3 = (p*+2)/2, both exact, so
                                   (p*-1)·B = 1·C + 2·((p*+2)/2)·D = C + (p*+2)D]
```

Combining (i), (ii) gives the exact reduction (verified as `Θ*p* == 6C - (p*+4)(C-D)` on every tested row):

```
Θ = [ (2-p*) C + (p*+4) D ] / p*  =  [ 6C - (p*+4)(C-D) ] / p*
```

**This term is NOT sign-definite in general — it is POSITIVE at every one of 52 tested rows** (`m = 107` through `260`,
step 3, i.e. every residue-2-mod-3 row in that range including the required control row `m=107` and both required fresh
rows `m=110,113`; the script field `E0_0_T_negative` — `T` there is a code identifier for `Θ`, not the tree — is `False`
throughout, `sweep_E0_0_T_always_positive: true`). This is not a defect: the paired block carries weight exactly
`C(m-1,0) = 1`, the minimum possible weight in the whole sum, and it needs only to be **dominated**, not individually
negative.

### 7. Domination: the total is negative at every tested row, with a growing, comfortable margin from a single other term

Comparing `|Θ|` against the weighted contribution of the already-proved-negative `E0_1` block alone (weight `C(m-1,1)=m-1`):

| `m` | `\|(m-1)Δ(E0_1)\| / \|Θ\|` |
|---|---|
| 107 (control) | 7.4969 |
| 110 (fresh) | 7.7076 |
| 113 (fresh) | 7.9183 |
| 140 | 9.8147 |
| 200 | 14.0288 |
| 260 | 18.2429 |

The ratio is **monotonically increasing** over the tested range, comfortably above 1 already at `m=107` — the smallest,
hardest case in the entire class — and this uses only ONE of the many other strictly-negative, more heavily weighted terms
(`E1_j` for every `j`, `E0_j` for `j≥2`, plus `E0_1` itself, none of which is even needed in this comparison beyond `E0_1`).
The full assembled sum `Δ_{p^*}(T-c)` (all blocks, all weights, `leftover` included) is **exactly negative** at every one of
the 52 tested rows, confirmed by an independent computation (direct block-sum convolution, not the recurrence generator) —
see the numeric claims below.

### 8. Symmetry transfer to every private leaf

`CB(8,m)`'s automorphism group contains `S_8 ≀ S_m`: for fixed choke `u_i`, permuting the 8 branches `(b_{ij},c_{ij})_{j=1}^8`
is a graph automorphism (each branch is an isomorphic pendant path `u_i - b_{ij} - c_{ij}`); permuting the `m` chokes
`u_1,…,u_m` (with their attached branches) is also an automorphism (each choke-block is an isomorphic pendant structure
attached to `r`). This group acts transitively on `{c_{ij} : 1≤i≤m, 1≤j≤8}`: any `c_{ij}` is carried to `c_{i'j'}` by first
permuting branches at choke `i` to bring `c_{ij}` to position `1`, then permuting chokes to carry `i` to `i'`, then
permuting branches at `i'` to bring position `1` to `j'`. Since `T-c_{ij} ≅ T-c_{i'j'}` under this automorphism,
`Δ_{p^*}(T-c_{ij}) = Δ_{p^*}(T-c_{i'j'})` for all `(i,j),(i',j')`. Having established the inequality for one representative
`c = c_{11}` (the computation above makes no reference to which private leaf, only to the deletion of "a" private leaf, by
construction — `G_c` is the closed form after deleting any single private leaf), it holds for **every** private leaf. (Same
citation convention as r30: "orbit transfer valid under `S_d ≀ S_m`",
`sources/r30/records/cycles__cycle-6__stage4__critics__T1__F__CRITIQUE.md:214,254`.)

## On `x` and `Δ_k`

This route does not compute or use the first-descent index `x(T)` anywhere (that is T1's, T3's and U1's object;
eligibility is out of this route's scope). Every difference used here is `Δ_k` of the **deleted-tree** polynomial
`I(T-c)` or one of its blocks, with the index `k` stated explicitly at each use: `Δ_{p^*}(T-c) = [x^{p^*}]I(T-c) -
[x^{p^*-1}]I(T-c)`; `Δ_k(E0_j) = [x^k]E0_j - [x^{k-1}]E0_j`; likewise for `E1_j` and the paired block. The underlying
two-binomial index `t` (e.g. `t=p^*-j-1` for `E0_j`) is distinguished from the difference index `k=p^*` throughout §2–6.

## Fidelity (duty 2 of the common brief)

This route builds no network; the weight, relation and (HALL) are not exercised, and no `S(T,p)` assertion is made or
needed. `F_{p^*}` is not computed here (it is the favorability key's object, cited at its own grade for the "every leaf
favorable" conclusion, §4 of the semantic contract). `x` is not recomputed here (T3/T1/U1's object); this route is purely
about `Δ_{p^*}(T-c)` for the deleted-tree polynomial. The closed forms used are re-derived by hand (§1) and DP-validated
(`tree_dp.py`) against a literal-tree independence polynomial computed by splitting on membership of the root in the
independent set, with an explicit acyclicity-and-connectivity test (`is_tree`: edge count `|E|=|V|-1` plus a BFS reaching
every vertex) run on every literal tree built.

## Numeric claims (exact integer arithmetic; every claim below is a deterministic generator with a SHA-256 digest and a
copy-out-first replay command)

All scripts use `python3 -B`. IMPORT LIST: `math`, `hashlib`, `json`, `sys` (stdlib only; `tree_dp.py` also imports
`collections.deque`). Scratch: `scratchpad/c2-T2/`. Replay target (copy-out-first):
`scratchpad/c2-T2-replay/` (never `/tmp`).

1. **`tree_dp.py`** — literal-tree acyclicity/connectivity test (6 trees, `d,m` up to `(8,3)`); closed-form vs literal DP
   cross-check (`d∈[1,8], m∈[1,3]`, `I(T)`, `I(T-v)`, `I(T-c)`): **72 checks, 0 mismatches**; two-binomial direct-sum sanity
   (`a,b∈[0,11]`, all `k`): **1728 checks, 0 mismatches**.
   `RESULT_DIGEST_SHA256 = af0177fa12262c946edc1a87cafe585055b60374922320215923482c5940709a`.
   Replay: `cp scratchpad/c2-T2/tree_dp.py scratchpad/c2-T2-replay/ && cd scratchpad/c2-T2-replay && python3 -B tree_dp.py`
   — reproduced, byte-identical digest (done; see Process disclosures).

2. **`main_verify.py`** — the core derivation instrument (§2–7 above). At the control row `m=107` and the fresh rows
   `m=110,113`, and a sweep of every residue-2-mod-3 row `m∈[116,260]` (52 rows total spanning the three required rows):
   - `E1_gap_failures = []` and `E0_j_ge2_gap_failures = []` on **every** row, checked over the **entire** range of `j`
     (not a sample) — tool (G) applies to `E1_j` for all `j∈[0,m-1]` and to `E0_j` for all `j∈[2,m-1]`, at every tested `m`.
   - `E0_0_gap_deficit = 3`, `E0_1_gap_deficit = 1` on every row (exact).
   - `E0_1` deficit-1 identity (★) verified as an **exact integer equality** on every row; ascent tool (G') hypothesis
     holds on every row; `E0_1` descent (`r(p*-1)<r(p*-2)`) holds on every row.
   - `E0_0` identities (i), (ii) verified as **exact integer equalities** (residual `0`) on every row; `Θ = A+2B-2C-D` is
     **positive** on every one of the 52 rows (`E0_0_T_digits` — the script's field name for `Θ`'s digit count — at
     `m=107`: 405 digits).
   - **`Δ_{p^*}(T-c)` (the full, all-blocks assembled quantity) is negative on every one of the 52 rows**, computed by an
     independent direct block-convolution (not the recurrence generator used for the identities above):
     - `m=107` (control): `Δ = -6983307...536051745...`, **407 digits**, negative.
     - `m=110` (fresh): `Δ`, **419 digits**, negative.
     - `m=113` (fresh): `Δ`, **430 digits**, negative.
     (full exact values are in `scratchpad/c2-T2/main_verify_out.json` and the run log; digit counts confirmed by an
     independent standalone script, see disclosure below).
   - recurrence-vs-direct-convolution cross-check: 3 `(a,b)` pairs derived from `m=107`'s blocks, all `k∈[0,40]`:
     **all match**, 123 checks, 0 mismatches (`recurrence_vs_direct_cross_checks = 123`).
   `RESULT_DIGEST_SHA256 = 2888f81f08798d3681f3355d907f59b475cce4eae93398842672529b515e22a8` (over
   `scratchpad/c2-T2/main_verify_out.json`; no wall-clock/PID/host field in the hashed payload; `sweep_count=49`,
   `sweep_all_negative=True`, `sweep_E0_0_T_always_positive=True`, `recurrence_vs_direct_cross_checks=123`).
   Replay: `cp scratchpad/c2-T2/main_verify.py scratchpad/c2-T2-replay/ && cd scratchpad/c2-T2-replay && python3 -B main_verify.py`
   — reproduced, byte-identical digest (done; PID `16519`, see Process disclosures).

3. **`alias_check.py`** — lexical scan of the candidate key against the run-local registry (497 claims) and the
   mathematically-nearby keys named in §"Registered claims". `EXACT_KEY_COLLISION = False`; 7 substring hits, all on shared
   family/rank tokens (`16M-PLUS-4-OVER-3`, `CB-8-M-AT-LEAST-107`), none on a private-leaf/two-binomial-favorability
   statement. Also checked (separately, by direct load) against the frozen concurrent master (494 claims,
   `sources/concurrent/master-494-2026-09-28/CLAIM-IDENTITY.json`, digest verified above): 0 hits for `PRIVATE-LEAF`,
   `TWO-BINOMIAL`, `TWOBINOM`.
   `ALIAS_CHECK_DIGEST_SHA256 = 5816bd5c46233d843a171ebd8e33c65f5409736993de5d197edf4855e30f33a3`.
   Replay: `cp scratchpad/c2-T2/alias_check.py scratchpad/c2-T2-replay/ && cd scratchpad/c2-T2-replay && python3 -B alias_check.py`
   — reproduced, byte-identical digest (done; see Process disclosures).

## Alias check — lexical AND mathematical

**Lexical** (script above): no exact-key collision against 497 run-local claims or 494 concurrent-master claims; no
substring hit on any private-leaf or two-binomial-descent-specific token.

**Mathematical distinctness**, against the two nearest registered objects:
- `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3` proves the SAME
  conclusion (`Δ_{p^*}(T-c)<0`, among others) but by a **different method**: Tool (D) (Newton + Darroch's mode theorem)
  applied per-block, requiring every block (after the `E0_0` pairing) to be individually `≤0`. This route proves it by tool
  (G)/(G') (elementary recurrence + log-concavity, no mode theorem) for all blocks except the weight-1 paired block, which
  is instead dominated by the aggregate. The two proofs are mathematically distinct objects (different sufficient
  conditions, different exceptional sets — the informal-key's proof needs no domination argument since Tool (D) handles the
  `E0_0`+leftover pairing directly via its mean; this route's Tool (G)-based method cannot and does not attempt to, needing
  domination instead). This route does **not** supersede or re-register that key; it is cited at its existing grade.
- `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-BLOCK-PRODUCT-...` (C1-LA3, `formally_verified`) applies tool (G) to
  **`I(T)` itself** (the parent tree, `(ELIG-top)(a)`'s object), for `j≥5` only, with its own certificate for `j≤4`. This
  route applies tool (G) (and the new tool (G')) to **`I(T-c)`** (private-leaf deletion), for `j≥1`, with a different
  exceptional structure (`j=0` only, via domination rather than a fixed positivity certificate). Different polynomial,
  different index range, different resolution of the exceptional set — mathematically distinct.

**Candidate key proposed** (STATED only; not registered; needs an isolated second read):
`E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-EVERY-PRIVATE-LEAF-FAVORABLE-AT-RANK-16M-PLUS-4-OVER-3-VIA-TWO-BINOMIAL-DESCENT-EXCEPT-ONE-CERTIFIED-BLOCK`.
Predicate of its statement: *for every `m≥107`, `m≡2(mod 3)`, `T=CB(8,m)`, `p^*=(16m+4)/3`, every private leaf `c`:
`Δ_{p^*}(T-c)<0`, established Darroch/Newton-free for the sub-sum of all blocks except the weight-1 `j=0` pairing, which is
instead shown to be dominated at 52 exact rows spanning `[107,260]` by the (already Darroch/Newton-free) `j=1` block alone,
with growing margin.* Grade: `computer_assisted` on the class (weakest-input rule, SOLUTION-CONTRACT §4 — the domination
step is verified on a finite range, not proved for every `m`).

## Grades

- `E1_j` descent, all `j∈[0,m-1]`, tool (G): **proved** (elementary, universal in `m`, Darroch/Newton-free).
- `E0_j` descent, `j∈[2,m-1]`, tool (G): **proved** (elementary, universal in `m`, Darroch/Newton-free).
- `E0_1` descent (`j=1`), via the deficit-1 equivalence + new tool (G'): **proved** (elementary, universal in `m`,
  Darroch/Newton-free — this is new content beyond anything in the frozen r30/r31 record).
- `E0_0` paired-block exact reduction identity `Θ=[6C-(p*+4)(C-D)]/p*`: **proved** (exact algebra, universal in `m`).
- `E0_0`'s own sign (`Θ<0`): **false in general** — `Θ>0` at every tested row; not needed for the obligation.
- Domination of `Θ` by the aggregate (equivalently, `Δ_{p^*}(T-c)<0` in full): **computer_assisted**, verified exactly at
  52 rows (`m=107,110,...,260`, all `≡2 mod 3`), including both required control/fresh rows; **not** proved for every
  `m≥107`.
- Overall obligation (`Δ_{p^*}(T-c)<0` for every private leaf, every class `m`, Darroch/Newton-free): grade
  **computer_assisted** by the weakest-input rule (SOLUTION-CONTRACT §4), carried almost entirely by an elementary,
  universal mechanism, with one precisely-scoped finite-verified residual.

## Gate lines

`ELIG_formal: not_advanced`
`HALL_formal: not_advanced`
`FAV_darroch_free: advanced`
`cut_candidate: none`

`headline_resolved: no`

## Route verdict

`bounded_evidence`

(Not `proved`: the domination step is exact-verified over a wide finite range, not proved for every `m≥107`. Not merely
`compiled` or `blocked`: the mechanism removing Darroch/Newton is complete and universal for every block except one, and
that one block's needed property is reduced to a single, precisely stated, comfortably-margined inequality, checked at the
control row, both fresh rows, and 49 further rows.)

## Remaining obligation

Written as what a successor inherits:

1. **The exact remaining lemma.** Prove, for every `m≥107` with `m≡2(mod 3)`: `|Θ(m)| < (m-1)·|Δ(E0_1)(m)|`, where
   `Θ(m) = A+2B-2C-D` (the `E0_0`+leftover paired block's own discrete derivative at `p^*`, for the pair `a=1,b=8m-1`) and
   `Δ(E0_1)(m) = r_{9,8m-8}(p^*-1) - r_{9,8m-8}(p^*-2)` (already proved `<0` for every `m`, §5). This single inequality,
   once closed, finishes the whole obligation universally (it dominates `Θ`'s positive excess using only ONE of the many
   other strictly-negative terms, with margin to spare — every other block adds further negative slack this lemma does not
   even use). Verified exactly at 52 rows with a monotonically growing ratio (`7.50` at `m=107`, the smallest/hardest case
   in the class, up to `18.24` at `m=260`); very likely provable by extending the exact-identity technique of §6 to the
   `(9,8m-8)` pair (a third identity analogous to (i)/(ii), then a direct algebraic comparison), or by a local-CLT-style
   magnitude estimate on two-binomial coefficients near their mode. I did not close it in the time available for this
   route; I judge it the smallest open lemma left by this route.
2. **A cleaner alternative (untried).** It may be possible to avoid the `E0_0`/leftover pairing altogether and instead
   bound `|Δ(E0_0)|` (unpaired) and `|Δ(leftover)|` separately against, respectively, `E1_0` and `E0_2` (or similar), which
   could avoid the algebraic identities of §6 entirely in favor of two simpler domination comparisons. Untried; flagged for
   a successor as a possible shortcut.
3. **Lean-readiness.** Tool (G') (§5) is new content not present in any frozen Lean source; if funded, it is a direct,
   short companion to C1-LA3's own `descent_of_recurrence_logconcave` (the same proof, run in the opposite direction) and
   should formalize easily against the same recurrence and log-concavity lemmas C1-LA3 already proved
   (`twoBinomCoeff_recurrence`, `twoBinomCoeff_logConcave`, `twoBinomCoeff_pos`) — no new Mathlib dependency.
4. **Not attempted here (out of this route's scope).** (ELIG-top)(a) (T1/U1's object); the mark-clone criterion flow (T3's
   object); `(L-S)_top` (untouched, per the Cycle 1 close). This route touches only the private-leaf favorability half of
   the Tier 3 dependency chain.

## Process disclosures

- No network access, no package installs; every Python invocation used `python3 -B`.
- Long-running computation: `main_verify.py`'s 52-row sweep was launched with `nohup python3 -B main_verify.py >
  main_verify_run.log 2>&1 & echo $!` (literal PID captured at launch: `12607` for the first, buggy attempt — killed by
  literal PID after discovering and fixing the identity-(ii) coefficient bug; `15127` for the corrected, final run),
  polled in a bounded loop via the `Monitor` tool (`until ! kill -0 <PID>; do sleep 3; done`) and by direct `kill -0`
  checks — never detached-and-abandoned. No pattern kill and no full process listing was used; `pgrep -f main_verify.py`
  (a targeted, non-recursive pattern match, not a full listing) was used once to recover the literal PID of a command the
  harness itself had auto-backgrounded on a tool timeout, immediately followed by killing those exact PIDs.
- The first sweep attempt (PID 12607, `sweep_horizon=500`) was killed after discovering an algebra transcription bug
  (identity (ii) used coefficient `p*+4` instead of the correct `p*+2`; the correct value was re-derived from the same
  recurrence substitution and is shown in §6). The second attempt (PID 15127, horizon reduced to 260 for tractability)
  completed successfully; see the numeric claims above. A third, independent standalone diagnostic
  (`diagnose_e00.py`, not part of the certified digest chain, used only to characterize the sign pattern of `Θ`) confirmed
  the same finding (`Θ` positive at every row `107..260`) via a separate, shorter script. The copy-out-first replay of
  `main_verify.py` (PID `16519`, `scratchpad/c2-T2-replay/`) completed and reproduced `RESULT_DIGEST_SHA256
  2888f81f08798d3681f3355d907f59b475cce4eae93398842672529b515e22a8` byte-identically to the primary scratch's output.
  Every background job (PIDs `12607`, `15127`, `16519`) was confirmed stopped (`kill -0` / `pgrep -f main_verify.py`
  returning nothing) before this return was finalized.
- All scratch under `scratchpad/c2-T2/`; all replays under `scratchpad/c2-T2-replay/`; no writes under `sources/`, no
  writes to any other experiment root, no writes to `/tmp`.
- No Lean/lake was invoked (this route is coefficient-level; no network build).

## Artifact inventory (`scratchpad/c2-T2/`, SHA-256 of the scripts)

| File | SHA-256 | Role |
|---|---|---|
| `tree_dp.py` | `202c174e1718a02dfe935518dc7bab558cd5ac5a8b1533ef456d123a5f685933` | literal-tree acyclicity/connectivity test; closed-form vs literal DP (72/0); two-binomial direct-sum sanity (1728/0) |
| `main_verify.py` | `308fa57501d6e865021531afe20fffc9016ca5a0dd357560db8c0eab8fd845c4` | core derivation instrument (§2–7); control+fresh+52-row sweep |
| `alias_check.py` | `d55d71c2a9d717cd232ae5ed9f547aa22837653be73fb3400b967581b0b703dc` | lexical alias check against the 497-claim run-local registry |
| `diagnose_e00.py` | `ae921f4dd7b251968ad915c0cb8eb1716d9b03a35d0f6205a801910abc237ff7` | standalone (uncertified) sign-pattern check of `Θ`, used only to characterize the domination finding of §7 |
| `tree_dp_out.json` | `af0177fa12262c946edc1a87cafe585055b60374922320215923482c5940709a` | tree_dp.py output (= RESULT_DIGEST_SHA256) |
| `alias_check_out.json` | `5816bd5c46233d843a171ebd8e33c65f5409736993de5d197edf4855e30f33a3` | alias_check.py output (= ALIAS_CHECK_DIGEST_SHA256) |
| `main_verify_out.json` | `2888f81f08798d3681f3355d907f59b475cce4eae93398842672529b515e22a8` | main_verify.py output (= RESULT_DIGEST_SHA256) |
| `main_verify_run.log` | (progress log; no hashed field) | main_verify.py progress log (52-row sweep) |

Replay commands (copy-out-first, target `scratchpad/c2-T2-replay/`, never `/tmp`):
```
cp scratchpad/c2-T2/tree_dp.py scratchpad/c2-T2/alias_check.py scratchpad/c2-T2/main_verify.py scratchpad/c2-T2-replay/
cd scratchpad/c2-T2-replay
python3 -B tree_dp.py        # reproduced: RESULT_DIGEST_SHA256 af0177fa... (done, byte-identical)
python3 -B alias_check.py    # reproduced: ALIAS_CHECK_DIGEST_SHA256 5816bd5c... (done, byte-identical)
python3 -B main_verify.py    # reproduces the 52-row sweep (several minutes) -- DONE: reproduced,
                              #   RESULT_DIGEST_SHA256 2888f81f08798d3681f3355d907f59b475cce4eae93398842672529b515e22a8,
                              #   byte-identical to the primary scratch's main_verify_out.json
```
