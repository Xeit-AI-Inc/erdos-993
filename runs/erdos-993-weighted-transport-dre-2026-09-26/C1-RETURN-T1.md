# RETURN — Seat T1, Cycle 1, r30 (correctly weighted mixed-boundary transport)

Route `C1-T-01 WEIGHTED-SHADOW-NORMALIZED-MATCHING`. Orientation T (prove).

## Boot acknowledgment

Operating within VerityOS. Boot reads for this seat, exactly as authorized and nothing else:
`/Users/ashtonsperry/VerityOS/verity.md`, `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. Per
`DISPATCH-T1.md` and `control/C1-WORKER-COMMON-BRIEF.md`, the startup protocol's own task-type map, memory,
conversations, modules, skills, logs and decisions directories were **not** read (the controller booted for the run).
No other VerityOS file outside the run root was read. **No read-boundary disclosure.**

## Model disclosure

Chartered Sonnet/xhigh; transport-resolved model Sonnet (explicit parameter); runtime-reported model id:
`claude-sonnet-5` (per this runtime's own system disclosure).

## Stage 2 seal and source digests

`control/C1-STAGE2-PACKET-MANIFEST.json` inner seal recomputed: SHA-256 of the canonical JSON of the manifest with
`seal_sha256` removed (`sort_keys=True`, separators `(",", ":")`, no trailing newline) =
`886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92`, which **matches** the recorded
`seal_sha256`. Cited seal value: `886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92`.

Every source file this route reads was verified against `control/SOURCE-DIGESTS.json` before reading (own
recomputation, not trust): `sources/lower-region/instruments/cb-switch-cut/{RESULTS.json,run.py,PROTOCOL.md}`,
`sources/lower-region/cycle-6/C6-U5/{C6-U5-ROOT-ACTIVE-WEIGHT-CORRECTION.md,REPORT.md,EVIDENCE.json}`,
`sources/lower-region/cycle-6/C6-F5/{C6-F5-root-corrected-direct-audit.py,C6-F5-ROOT-CORRECTED-FLOW-EVIDENCE.json,C6-F5-ROOT-CORRECTION-NOTE.md}`,
`sources/lower-region/cycle-6/C6-T4/{REPORT.md,evidence_t22.json,replay_t22.py}`,
`sources/lower-region/inputs/ordinary_tree_checked.py` — all `OK` (sha256 recomputed and compared byte-for-byte).
`SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C1-ALLOCATION.md`, `control/C1-STAGE1-GATE.md`,
`cycles/cycle-1/stage2/ROUTE-STATE.md`, `control/CLAIM-DISTINCTIONS.json` and
`control/CLAIM-IDENTITY.run-local.json` were read directly from the run root (not under `sources/`, hence not
digest-gated by `SOURCE-DIGESTS.json`; their own inner seal is the Stage 2 manifest seal verified above, which lists
their sha256 and byte counts and was cross-checked against the files present on disk).

## IMPORT LIST (standard library only, all instruments)

`itertools`, `math` (`comb`), `json`, `hashlib`, `sys`, `pathlib.Path`. No network, no third-party packages, no
`pip`/`elan`/`lake` (this route needs no Lean).

## Fixed points reproduced (own instrument, BEFORE any table)

Own script: `scratchpad/c1-T1/t1_instrument.py` (sha256 of the script file `5bae3eed7d104d2bc20d995bc8e31179784cc4c8d05b7898fffcb6b081497de1`;
sha256 of the canonical JSON output body `385a1c7b0f9f938e5acd918cfa78d714f2bcc193268b810a3a9ccfa2382eb693`, no
wall-clock/PID/host field included in the hashed body). Copy-out-first replay, verified to reproduce the identical
digest:

```
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-T1/t1_instrument.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-T1-replay/t1_instrument.py
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-T1-replay
python3 t1_instrument.py
# stdout line "DIGEST 385a1c7b0f9f938e5acd918cfa78d714f2bcc193268b810a3a9ccfa2382eb693" reproduced exactly.
```

**`K_{1,12}` at `p = 8`** (from first principles: literal 13-vertex graph, `is_tree` = connectivity ⋀ acyclicity both
checked and both true, brute-force independent-set enumeration, no value written in as a literal): `n = 13`,
`α = 12`, `x = 6`, `|F| = 12` (all leaves favorable), supply `= Σ_{B∈I_9} w_F(B) = 1980`, capacity
`= Σ_{A∈I_8} w_F(A) = 3960`, `S = supply − capacity = −1980`, `supply − capacity = S` **asserted true** (WID
confirmed on this instance before any other output), no vertex has exactly two neighbours in any source `B`
(`any_switch_exists = False`) — reproduces the registered record exactly.

**Sector ratio `492/491`** (CB(8,92), `p = 492`; own exact-integer recomputation, independent of the frozen
`cb-switch-cut/RESULTS.json`, which is a controller PRIOR and is cited only for cross-check, never as evidence):
source branch-rank `k = (p+1) − 2 = 491`, target branch-rank `k − 1 = 490` (the `−2` is the fixed rank contributed
by root `r` and arm leaf `v`, both always present in this sector — named where it enters, §1 below). `R_{491} =
\binom{736}{491}\,2^{491}`, `R_{490} = \binom{736}{490}\,2^{490}` (exact `math.comb`, big integers). Own script
confirms `R_{491}\cdot 491 = R_{490}\cdot 492` exactly (`ratio_492_491_exact: true`) and that the deletion-only
deficit of the **whole** sector, `R_{491}-R_{490}`, equals `R_{490}/491` exactly (`deficit_equals_R_bot_over_491_exact:
true`) — both digits-exact, not rounded.

## Registered claims named before any census (obligation 3)

Touched/relevant, named before any numeric table below:

- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — Tier 1, OPEN. This route neither proves nor refutes it.
- **Primary aggregate** `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` — OPEN, untouched (fence: mechanism ≠
  aggregate; nothing below is offered as a proof of `S(T,p) ≤ 0`).
- **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` — OPEN (run-local, Stage 1). This route does **not**
  prove it (that is F2/U2's target) but **numerically reconfirms it on three literal instances** (§ Fixed points and
  the two small literal sector instances below), by two independent routes each time (direct layer-weight
  summation vs. the leaf/tag `Δ_{p-1}(H_v)-Δ_{p-1}(R_v)` route), before any other output for those instances.
- **Ten refuted mechanism keys** of `SOLUTION-CONTRACT.md` §3.2. The one nearest to this route's object is
  **`E993-R23-LITERAL-DELETE-ONLY-HALL`** (REFUTED; witness order 91 via `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`).
  It differs from every statement in this return on two independent grounds, stated on the face: (i) its scope is
  *deletion-only* (no switch arcs (S) at all), and this route's Part 1(b)/(c) work is specifically about what the
  *switch* arcs contribute — a mechanism that literal key never had; (ii) even restricted to deletion, this route's
  Lemma 1 (§1) does **not** claim deletion-only Hall holds — on the contrary, Lemma 1 exhibits an exact,
  non-vanishing deletion-only **deficit** (`|R_{491}|-|R_{490}|`, positive) at the CB(8,92) fixed point, i.e. this
  route's own computation is consistent with, and quantifies, exactly the kind of shortfall that makes
  deletion-only Hall false in general. No claim below revives `E993-R23-LITERAL-DELETE-ONLY-HALL`.
  Also distinguished: **`E993-C3-CB-ARM-EXACT-DELETE-NEIGHBORHOOD`** (a literal-era, pre-active-weight "Delete/Retag"
  relation record on the CB arm — different relation, different (unweighted, presence-based) counting; not reused
  here) and **`E993-C3-CB8-92-ORDINARY-RANK-SCOPE-CERTIFICATE`** (the frozen complete-aggregate value/leaf-orbit
  record for CB(8,92) — cited below once, for context only, never re-derived or used as a proof step, per the
  census-discipline fence).
- **(LIFT)** `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT` (VERIFIED, `proved_informal`) — not invoked; this route's
  group-action argument (§1) proves a **normalized-matching shadow bound**, a different statement from (LIFT)'s
  quotient-flow lift, and does not use (LIFT) or its converse.
- **(DCB)** `E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY` and **(TSB)** `E993-BIPARTITE-TAGGED-SHADOW-BOUND` —
  not invoked (T2's route, not T1's).
- **`T_m`, spider, path-star family theorems** — settled, closed regions; not re-proved; not touched.
- **Alias check (new claim; lexical AND mathematical):** grepped `control/CLAIM-IDENTITY.run-local.json` for every
  key containing `NORMALIZED`, `SHADOW`, `MATCHING`, or `CB`. Lexically closest: `E993-GRAPH-CLIQUE-PARTITION-NORMALIZED-COMPARISON`,
  `E993-LC-SPANNING-FOREST-NORMALIZED-COMPARISON` (different objects: clique partitions / spanning forests, not an
  independent-set product poset), `E993-BIPARTITE-TAGGED-SHADOW-BOUND` (a bipartite incidence inequality on `q_j`
  counts, not a shadow-cardinality bound on a product poset), and the eighteen `*MATCHING*` keys of r25 (all about
  graph-theoretic matchings/LYM bounds on a *different* combinatorial object — the `d`-uniform matching-slack
  family, not the CB pendant-pair product poset). **No mathematical collision** with the statement proved in §1
  below (Lemma `E993-R30-CB-SECTOR-DELETION-NORMALIZED-MATCHING`, candidate name; not yet registered — this return
  states it and needs an isolated second read before registration, per the brief).

## Grades (this return's own claims)

| Claim | Statement location | Grade |
|---|---|---|
| Lemma 1 (transitive double-level action ⇒ normalized matching) | §1, general poset lemma | `proved_informal` (complete, self-contained proof given; not Lean-formalized) |
| Lemma 1, CB(d,m) sector instantiation (`491/492` bound) | §1 | `proved_informal` |
| Switch-image weight formula + overlap phenomenon | §2 | `proved_informal` (derived from the definitions; exhibited literally on two small instances) |
| Full-sector (`X` = whole `R_{491}`) combined-capacity margin at CB(8,92), `p=492` | §3 | `bounded_computation` (one instance, own exact-integer script) |
| General per-`X` "switch covers deletion deficit" inequality | not established | **open** — see Remaining obligation |
| WID reconfirmation on 3 literal instances | Fixed points, §4 | `bounded_computation` (own instrument; WID's own certificate is F2/U2's, not conferred by this reconfirmation) |

`REFUTED never regresses`; nothing here strengthens a certification without strengthening its evidence; the two
`bounded_computation` rows are records, not proofs, and are reported as attained horizons (one fixed point, two
small literal analogs), never as filtered/extrapolated bounds.

---

## §1. Part (a): the deletion-only normalized-matching bound on the CB(d, m) root-plus-arm sector

**Setup, with every hypothesis named where it enters.** `T = CB(d,m)` (`d,m ≥ 1`): a path `r–s–v` (`IsTree`: this
route's own script checks connectivity and acyclicity of every literal graph it builds, `is_tree()`, separately and
both are asserted before anything else is computed on that graph); `m` "chokes" `u_1,\dots,u_m` each adjacent to
`r`; each choke has `d` "branches", branch `(i,j)` a support `b_{ij}\sim u_i` and a private leaf `c_{ij}\sim b_{ij}`.
Fix a rank `p` and `F = F_p(T)` (the fixed original strict selector, evaluated on the undeleted tree, never
recomputed — SEMANTIC-CONTRACT §1.1/§3). The **root-plus-arm sector** at layer `j∈\{p,p+1\}` is
`\mathcal S_j := \{X\in I_j(T) : r\in X, v\in X\}`. Because `r\in X` forces every choke absent (`u_i\sim r`) and
forces `s` absent, `X\cap\mathcal S_j` is determined exactly by, for each of the `N:=dm` branches, one of three
states `\{\emptyset, b_{ij}, c_{ij}\}$ (support and leaf are adjacent, so mutually exclusive) — this is the literal
independence structure of `T`, not an assumption. Writing `k := j-2` (branch-rank; the `-2` is `r,v`'s fixed
contribution, named explicitly since it is an ℕ-subtraction that is always valid here as `j\ge 2$ whenever
`\mathcal S_j\ne\emptyset`), `\mathcal S_j$ is in exact bijection with the rank-`k` layer of the **abstract branch
poset** `\mathcal B_N := \{0,1,2\}^N$ graded by `\mathrm{rank}(\sigma)=\#\{i:\sigma_i\ne 0\}$, and
`|\mathcal S_{k+2}| = \binom{N}{k}2^{k}=:R_k`. This is the poset the contract calls the product of `N` copies of the
three-element pair poset `\{\emptyset<b,\emptyset<c\}` (rank sizes `1,2`).

**Lemma 1 (transitive double-level group action ⇒ normalized matching; proved, not cited).** *Let `P` be a finite
graded poset and `G` a group acting on `P` by rank-preserving poset automorphisms. Fix consecutive ranks `k,k-1` and
suppose `G` acts transitively on `P_k` and on `P_{k-1}`. Then for every `X\subseteq P_k`,
`|\partial X|\cdot |P_k| \ge |X|\cdot|P_{k-1}|` (equivalently `|\partial X|/|P_{k-1}| \ge |X|/|P_k|`), where
`\partial X` is the down-shadow (elements of `P_{k-1}` covered by some member of `X`).*

*Proof.* Since `G` preserves the covering relation and acts transitively on `P_k`, every `x\in P_k` has the same
down-degree `d_k := \#\{y\in P_{k-1}: y \lessdot x\}$ (any two elements of `P_k` are related by some `g\in G`, which
carries the cover-set of one bijectively to the cover-set of the other). Symmetrically every `y\in P_{k-1}` has the
same up-degree `d_{k-1}`. Double-counting the edges of the covering bipartite graph between the *whole* two levels:
`d_k\,|P_k| = d_{k-1}\,|P_{k-1}|`. For `X\subseteq P_k`: every edge out of `X` lands in `\partial X` by definition of
`\partial X`, so the number of `(X,\partial X)`-edges is exactly `d_k|X|`; each `y\in\partial X` receives at most
`d_{k-1}` edges from *all* of `P_k`, hence at most `d_{k-1}` from `X`. So `d_k|X| \le d_{k-1}|\partial X|`.
Substituting `d_k/d_{k-1}=|P_{k-1}|/|P_k|` gives the claim. ∎*

**Application.** Let `G = S_N \wr (\mathbb Z/2)^N$ act on `\mathcal B_N$: `S_N$ permutes the `N` branch indices,
and, independently at each branch, `\mathbb Z/2$ swaps the roles `b\leftrightarrow c`. This action preserves rank and
preserves the covering (one-branch deletion) relation, and is transitive on each rank level `\mathcal B_{N,k}`: any
two rank-`k` elements `(S,\chi),(S',\chi')` (`S,S'\subseteq[N]$ the occupied branches, `\chi,\chi'$ their
`\{b,c\}`-colourings) are related by first choosing `\sigma\in S_N$ with `\sigma(S)=S'$, then flipping colours at
each position to match `\chi'$. Lemma 1 gives, for every `X\subseteq \mathcal B_{N,k}`:

`|\partial X|\cdot R_k \ge |X|\cdot R_{k-1}`, i.e. `|\partial X| \ge |X|\cdot R_{k-1}/R_k`.

For `N=dm=736`, `k=491`: `R_{491}/R_{490} = 2(N-k+1)/k = 2\cdot 246/491 = 492/491$ (own exact-integer recomputation,
§ Fixed points), so **`|\partial X| \ge |X|\cdot 491/492`** for every `X\subseteq\mathcal S_{493}` (translating back
through the `\mathcal S\leftrightarrow\mathcal B_N` bijection; `\partial X` here is deletion *within the sector*
only — deleting a branch element, not `r` or `v`). Equivalently: **the deletion-only deficit of any such `X`,
`|X|-|\partial X|`, is at most `|X|/492`.** This is a genuine theorem (Lemma 1 applied to `\mathcal B_{736}`),
`proved_informal`, not a citation: obligation 1(a) is discharged in full, at the stated scope (the root-plus-arm
sector of `CB(d,m)`; the general form is Lemma 1 itself, stated for arbitrary `N,k`).

**Independent brute-force corroboration of Lemma 1** (own script, exhaustive, not a proof substitute but a check on
the proof above): for `(N,k)\in\{(2,1),(3,1),(3,2)\}`, the script enumerates the *entire* rank-`k` layer of
`\mathcal B_N`, checking `|\partial X|\cdot R_k \ge |X|\cdot R_{k-1}` **for every one of the `15`/`63`/`4095`
nonempty subsets `X`** of the rank-`k` layer respectively (rank sizes `4,6,12`; attained horizons, not samples,
`2^4-1`, `2^6-1`, `2^{12}-1`) with no violation — every `assert` in `nm_bruteforce_check` passed,
i.e. the run did not raise. `(4,2)`/`(6,3)`/`(8,3)` have layers too large (`R_k=24,160,448`) to enumerate all
subsets, so the script instead checks the algebraically-forced equality case (`X=$ whole layer ⇒ `\partial X = $
whole lower layer, exactly) on those.

**Where the active-tag weight enters.** Every member of `\mathcal S_j` has the *same* active weight, `w_F(\cdot) =
[v\in F]` — the arm's sole witness is `\{r\}` (`W_v = N(s)\setminus\{v\}=\{r\}`, `s` has degree 2), always present
in the sector, so `v` is active in every sector member whenever `v\in F`; every private tag's sole witness is its
choke, always **absent** in the sector, so private tags are never active *inside* the sector regardless of the
branch state (own script asserts this exactly: `active_weight == (1 if v in F else 0)` on every sector member of
every instance tested, before any other per-instance output). Hence, on the sector, the Hall-condition cardinality
bound above is *literally* the weighted bound `\Sigma_X w_F \le \Sigma_{\partial X} w_F` up to the (491/492)
shortfall — no re-derivation needed once `w_F\equiv[v\in F]` is established.

## §2. Part (b): the switch-image weight formula and the overlap obstruction

For `B\in\mathcal S_{p+1}$ with branch state `\sigma`, a choke `u_i` is switch-insertable (`|N(u_i)\cap B|=2`) iff
exactly one of `u_i`'s `d` supports is occupied in `B$ — call its branch index `j_0(i)`. The image
`A=(B\setminus N(u_i))\cup\{u_i\}` (literal (S), independence and `|A|=p` checked by the script on every instance,
not assumed) satisfies: `r\notin A` (removed — so `A\notin\mathcal S_p`, the switch **leaves** the sector), `v\in A`
but now **inactive** (`v`'s witness `r` is gone), `b_{i,j_0}\notin A$ and contributes nothing, and for every branch
`j\ne j_0` of group `i`, a leaf tag present there becomes **active** (its witness `u_i` is now present). Hence
`w_F(A) = \ell_i(B) :=$ number of `j\ne j_0` with a leaf present in group `i` — matching the allocation's stated
form exactly.

**Overlap (the obstruction named in the allocation).** `A`'s identity as a *set of vertices* retains no memory of
which position was `j_0`: it is fully determined by `(i,\ L\subseteq[d]$, the leaf-present positions,\ \text{other
`m-1` groups' states unchanged})`, with `j_0` any position of `[d]\setminus L`. So **every `B` differing only in the
choice of `j_0\notin L`, with the same `L` and the same other-groups state, switches to the *same* `A`.** Own
script exhibits this literally and exactly on two small CB instances (`d=2,m=3` and `d=3,m=2`, both `dm=6`, an
"all-leaves-favorable" regime found by an independent DP scan and chosen only for tractable brute force — not
claimed eligible in the SEMANTIC-CONTRACT sense): 48 distinct switch targets each reached by exactly 2 sources in
both cases (`overlap_example_count = 48`). Consequence: **`\Sigma_{A\in N_S(X)} w_F(A)` cannot be computed by
summing `\ell_i(B)` over `(B,i)` pairs — it must be computed over the *distinct target set*, which this route's
formula (§3) does by summing over `(i,L,\text{other-state})` directly (never over `j_0`), so overlap is accounted
for exactly, not approximately.**

## §3. Combined capacity at the full sector (own exact computation, one instance)

For `X = \mathcal S_{p+1}$ (the whole sector — the exact case where Lemma 1's bound is tight, since
`\partial(\text{whole layer})` is trivially the *whole* lower layer, `R_{490}`, matching `R_{491}\cdot 491/492 =
R_{490}$ exactly, own script confirms this identity digit-for-digit), the distinct switch-target weight is,
by §2's non-overlapping-by-choke-index, exactly-once-per-`(i,L,\text{other-state})` accounting:

`\text{switch\_total} = m\cdot\sum_{\ell=0}^{d-1} \ell\binom{d}{\ell}\,R^{(m-1)}_{\,490-\ell}`, `R^{(m-1)}_k:=\binom{d(m-1)}{k}2^k`.

At `d=8,m=92,p=492` (own script, exact `int`, `math.comb`):

| quantity | value (own instrument, exact 350-digit integers unless noted) |
|---|---|
| `R_{491}` (sector source count) | `4.520…×10^349` (350-digit integer, exact; full value in `t1_instrument_output.json`) |
| `R_{490}` (sector target count) | `4.510…×10^349` |
| deletion-only deficit `R_{491}-R_{490}` | `9.187…×10^346` (347-digit integer, exact) |
| `R_{491}\cdot491 = R_{490}\cdot492`? | **True** (exact) |
| deficit `= R_{490}/491`? | **True** (exact) |
| distinct switch capacity, whole sector | `7.003…×10^348` (349-digit integer, exact) |
| combined capacity `R_{490}` + switch | `5.211…×10^349` (exact) |
| `R_{491} \le$ combined capacity? | **True** |
| `\lfloor$switch / deficit`\rfloor` | 76 |

(Every digit is in `scratchpad/c1-T1/t1_instrument_output.json` and reproduced by the replay above; only orders of
magnitude are typeset here for readability, per the row-reporting convention — no number is rounded in the
computation itself.) So **for `X` equal to the whole sector**, deletion + switch together exceed demand by a factor
of order 76. This is `bounded_computation`, one instance, and does **not** establish the Hall condition for
arbitrary `X\subseteq\mathcal S_{p+1}` (see Remaining obligation) — it establishes it only for this one extremal
`X`. It is consistent with, and independent of, the controller's PRIOR finding (`control/controller-prerun/wt_check.py`,
not evidence) that the complementary switch-free family `X'` (no group has exactly one support — for which the
switch capacity is identically zero) is *also* not deficient, via deletion alone; this route did not recompute that
prior and cites it only as a prior.

`x`, `α`, `p`, `|F|`, graph on the CB(8,92) row: `n=1567` (own construction, `is_tree` asserted true),
`α=829`, `x=490` (through rank `α`, per the authorized evaluator's documented omission — this route did not need to
recompute `x` independently since it is not load-bearing for §1–§3, which depend only on `p=492` and the branch-poset
ranks `491,490`), `p=492`, `|F|=737` (cited from the frozen record, not re-derived, since re-deriving it exactly
would mean re-running the full favorable-leaf census on a 1567-vertex tree — a re-proof of a bounded record already
frozen, which the fences disallow as a route contribution; this route's own contribution is the *sector* quantities
above, all newly computed).

## §4. Generalization (obligation (c), candidate outcome-B lemma)

**Candidate claim `E993-R30-CB-SECTOR-DELETION-NORMALIZED-MATCHING` (not yet registered; alias-checked above; needs
an isolated second read).** *Statement:* Let `T` be a finite ordinary tree containing `N` "free pendant pairs"
`(b_i,c_i)`, `i=1,\dots,N` — disjoint edges `b_i\sim c_i` with `b_i` additionally adjacent only to a fixed vertex
set `Z` (possibly one common vertex, possibly several "chokes", each choke owning some pairs) not otherwise
adjacent to any `c_i`, and such that there is a group `H\le\mathrm{Aut}(T)` permuting the `N` pairs transitively
within each choke-class and independently swapping `b_i\leftrightarrow c_i` while fixing the rest of `T` pointwise.
Fix any subset `Q\subseteq V(T)\setminus\bigcup_i\{b_i,c_i\}` to be simultaneously present in every set considered
(here `Q=\{r,v\}`). Then, in the poset of independent sets containing `Q`, graded by number of occupied pendant
pairs, the deletion shadow between ranks `k` and `k-1` satisfies `|\partial X|\ge |X|\cdot R_{k-1}/R_k` for every
`X`, `R_k=\binom{N}{k}2^k`, by Lemma 1 applied to the wreath-product subgroup of `H`. *Grade:* `proved_informal`
(Lemma 1 is the general fact; the hypotheses on `T` are exactly what CB(d,m)'s root-plus-arm sector satisfies, with
`Z` = the `m` chokes and `H` = the subgroup permuting branches within each choke and swapping support/leaf per
branch — the *chokes themselves* are not required to be permuted for this particular application, only the branches
within the fixed `Q`-sector, which is why the CB(8,92) case above needs no assumption that the `m` chokes are
interchangeable). The structural feature that makes the pair-poset expansion work is exactly: **a pendant edge pair
hanging off a single fixed attachment point that is itself forced absent by `Q`** — this is what makes the two
"branch states" (support-only, leaf-only) interchangeable by a literal graph automorphism (swap `b_i,c_i`), which is
what Lemma 1 needs.

## Remaining obligation (successor inheritance)

1. **The general per-`X` inequality is open.** Lemma 1 gives, for *every* `X\subseteq\mathcal S_{p+1}` of the
   CB(d,m) sector, deletion deficit `\le |X|/492`. §3 shows switch capacity clears this bar for `X=$ whole sector
   (margin ≈76×) and the controller's prior shows the complementary switch-free `X'` needs no switch help at all.
   **Not established:** a proof that `\text{switch-reachable weight from }X \ge |X|/492` for *every* `X` in
   between (the true adversarial candidates are `X`'s that are large but still switch-poor, e.g. `X` a large subset
   of `\mathcal S_{p+1}` in which most branch groups already have zero or ≥2 supports occupied). §2's overlap
   phenomenon is the concrete obstruction: a naive per-source additive bound overcounts; the correct bound needs
   the *distinct*-target accounting demonstrated in §3, generalized from `X=$ whole sector to arbitrary `X`, most
   likely via a second normalized-matching argument on the *switch* bipartite graph analogous to Lemma 1 (the
   switch graph is not obviously vertex-transitive on the source side once `X$ is a proper, structured subset,
   because "how many of `X`'s members have a given choke insertable" varies with `X`'s shape — this is exactly
   where a successor should start).
2. **CB(d,m) family beyond the one fixed point.** §3's computation is for `(d,m,p)=(8,92,492)` only. The formulas in
   §1–§3 are stated for general `d,m,p` (own script's `R_dm`/`cb_8_92_sector_capacity` functions generalize
   directly; only the driver call is fixed) — a successor can sweep the whole eligible `(d,m,p)$ range for `CB(d,m)`
   cheaply (the formulas are closed-form, no brute force needed) to see whether the ≈76× margin (or worse) persists
   near the `3p=2\alpha+1` boundary, which is exactly where Lemma 1's ratio bound is tightest.
3. **Beyond CB(d,m).** §4's general lemma applies to any tree with the stated pendant-pair-behind-a-fixed-point
   structure; a successor should check whether *every* eligible tree admits such a decomposition relative to *some*
   choice of `Q`, or whether trees exist with favorable leaves but no such symmetric pendant block at all (in which
   case Lemma 1 gives no traction and a genuinely different argument is needed for those trees — a question this
   route did not resolve).

## headline_resolved / route verdict

`headline_resolved: no`

**Route verdict: `bounded_evidence`** (for the route's object, (HALL)/the CB(d,m) sector Hall condition). Within
that: Lemma 1 and its CB(d,m) sector instantiation (§1) are themselves `proved_informal` — a genuine, complete,
self-contained proof, not a citation and not a census value — but they are a component (part 1(a) of the
allocation), not a resolution of (HALL) or even of the sector's full Hall condition for arbitrary `X`, hence the
route-level verdict is `bounded_evidence` rather than `proved`.

## Fences checked

Mechanism ≠ aggregate (nothing above claims `S(T,p)\le 0`); finite ≠ universal (Lemma 1's *application* is one
sector of one family; Lemma 1 itself is stated and proved in full generality, but its hypotheses — a transitive
double-level action — are not asserted to hold for every eligible tree, see Remaining obligation 3); no refuted
mechanism revived (§ Registered claims); no closed region re-proved (`T_m`/spider/path-star/high-tail/order-bands
untouched; `|F|=737` for CB(8,92) cited, not re-derived); no census value used *as a proof step* (Lemma 1's proof is
purely group-theoretic; the CB(8,92) numbers are bounded evidence, reported as such, never substituted into a
universal argument); no RTree wording; no sealed root read or written; no source mutation; no background process
left running (confirmed by process check after killing one stray diagnostic process from an earlier, corrected,
oversized brute-force attempt — that attempt's output was discarded and does not appear in any figure above); all
computation here ran in the foreground.
