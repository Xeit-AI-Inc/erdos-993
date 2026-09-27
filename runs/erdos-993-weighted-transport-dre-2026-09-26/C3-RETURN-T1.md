# RETURN — Route `T1`, Cycle 3, r30 (weighted mixed-boundary transport, Erdős #993)

**Route ID / mechanism fingerprint:** `C3-T-01 CB-CHOKE-FOREST-HALL-AND-SECTOR-ABSORPTION`. Orientation `T` (prove).
**Model disclosure (two-part, on the face):** chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter);
runtime-reported model id: `claude-sonnet-5`.

## Boot

I am operating within VerityOS. Boot reads: exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in full. Per the dispatch's override I did not follow the
startup protocol's own task-type map into memory, conversations, modules, operations, logs or decisions for this task.

## Read-boundary disclosure

1. **Order.** The outer wrapper session's project instructions (`CLAUDE.md`) mandate a VerityOS boot with an acknowledgment
   before any substantive response, and I performed that boot (`verity.md`, `identity/startup-protocol.md`) before verifying
   the dispatch digest and reading the dispatch file. The two files actually read are exactly the two the dispatch itself
   authorizes, so no unauthorized file content entered on this account, but the order deviates from the dispatch's own
   "FIRST … THEN" sequence and is disclosed, matching the precedent recorded in Cycle 2's `T1` return.
2. **Non-recursive `ls` inside `cycles/`.** To resolve the Worker Common Brief's glob-style pointers ("every return
   `cycles/cycle-{1,2}/stage3/returns/*/RETURN.md`", "every critique `cycles/cycle-{1,2}/stage4/critics/*/*/CRITIQUE.md`",
   "adjudications `cycles/cycle-{1,2}/stage5/adjudicators/*/ADJUDICATION.md`") into the concrete seat/critic directory names I
   needed, I ran nine non-recursive, single-directory `ls` calls: `cycles/cycle-2/`, `cycles/cycle-2/stage3/returns/`,
   `cycles/cycle-2/stage6/`, `cycles/cycle-2/stage4/critics/`, `cycles/cycle-2/stage4/critics/T1/`,
   `cycles/cycle-2/stage4/critics/T1/F/`, `cycles/cycle-2/stage4/critics/T1/U/`, `cycles/cycle-2/stage5/`,
   `cycles/cycle-2/stage5/adjudicators/`. None used `-R`, a glob, or `find`; each returned only file/directory names, never
   contents, and `cycles/` is listed as above this seat's grant for recursive search. Disclosed out of caution, consistent with
   the run's disclosure culture; no content beyond names was obtained this way, and every file I actually opened by content is
   one the Worker Common Brief names as an authorized read (the two cycle closes; the Cycle 2 `T1` return; the Cycle 2 `C-T1-U`
   critique; the Cycle 2 orientation-`T` adjudication).
3. **Files actually read for content, all within the explicit grant:** `verity.md`, `identity/startup-protocol.md`;
   `control/C3-WORKER-COMMON-BRIEF.md`; `control/C3-STAGE2-PACKET-MANIFEST.json`; `SEMANTIC-CONTRACT.md`;
   `SOLUTION-CONTRACT.md`; `control/C3-ALLOCATION.md`; `control/C3-STAGE1-GATE.md`; `cycles/cycle-3/stage2/ROUTE-STATE.md`;
   `cycles/cycle-2/CYCLE-CLOSE.md`; `cycles/cycle-1/CYCLE-CLOSE.md`; `cycles/cycle-2/stage3/returns/T1/RETURN.md`;
   `cycles/cycle-2/stage4/critics/T1/U/CRITIQUE.md`; `cycles/cycle-2/stage5/adjudicators/T/ADJUDICATION.md`;
   `control/CLAIM-IDENTITY.run-local.json` (443 claims, used only for the alias check, Step 0 below).
4. **No file under `sources/` was read this route.** All mathematics below is derived from the definitions in
   `SEMANTIC-CONTRACT.md`/`SOLUTION-CONTRACT.md` and the Cycle 1–2 inheritance named above, plus this route's own from-scratch,
   brute-force-verified code. Since nothing under `sources/` was opened, no entry of `control/SOURCE-DIGESTS.json` needed
   verification for this route (the requirement is conditional on reading a `sources/` file).
5. **Not read:** sibling Cycle 3 seats' scratch, returns or critiques (none exist yet at Stage 3); `C-T1-F`'s Cycle 2 critique
   (only `C-T1-U` was read, sufficient for this route's purpose since the adjudication already reconciles both critics'
   findings); any other experiment root; any live root; Mathlib (no Lean in this route); no network; no installs; no
   `skills/optimization-loop/skill.md`, no `ls experiments/`, no pre-grant `find`.
6. **Background jobs.** None were started; every script below ran to completion in the foreground. Nothing to kill.

## Stage 2 seal and source digests verified

- Dispatch file digest (wrapper check, performed first): SHA-256 of
  `control/dispatch/c3-stage3/DISPATCH-T1.md` = `adbc292ded55225d6302d51b5a656b4a9ba4d4ae42bcc85a0ef4936fa64d4ded` — **matches**
  the wrapper's stated digest exactly.
- Stage 2 packet manifest inner seal: recomputed SHA-256 of the canonical JSON of `control/C3-STAGE2-PACKET-MANIFEST.json`
  with the `seal_sha256` field removed (`sort_keys=True`, `separators=(",",":")`, no trailing newline) =
  `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416` — **matches** both the manifest's own `seal_sha256`
  field and the value cited in the dispatch. **I cite this seal value:
  `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416`.**
- No `sources/` file was read (see disclosure item 4), so no `control/SOURCE-DIGESTS.json` entries required verification.

## IMPORT LIST (standard library only, across every script in `scratchpad/c3-T1/`)

`math.comb`, `fractions.Fraction`, `itertools.combinations`, `itertools.product`, `sys`. No non-stdlib import anywhere in this
route; the authorized `ordinary_tree_checked.py` evaluator was **not** used (this route needed no `sources/` read at all — the
independence polynomial is derived and computed from scratch below, structurally and numerically cross-checked against the
`n`, `α`, `x` figures already of record from Cycle 2's `T1` return and its adjudication, not by importing that file).

## Setting recap (binding definitions used below; SEMANTIC-CONTRACT.md §1.2, SOLUTION-CONTRACT.md §2)

`CB(d,m)`: root `r`, arm `r–s–v`, `m` chokes `u_i ~ r`, each with `d` supports `b_{ij} ~ u_i`, each support with one private
leaf `c_{ij} ~ b_{ij}`. Active-tag weight `w_F(B) = #{v∈F∩B : (B∖{v})∩W_v ≠ ∅}`, `W_v = N_T(s_v)∖{v}` (erratum R30-E-b).
Relation (D)∪(S). Arm-state classes (Cycle 2 `E3`, critic-attributed): `sec` (`r,v∈B`), `R0` (`r∈B,v∉B`), `S` (`s∈B`), `V`
(`v∈B,r,s∉B`), `O` (none of `r,s,v`). **This route's assigned object is the choke forest** `T' := T − {r,s,v}` — deleting the
arm leaves `m` disjoint components, each a "choke gadget" `u_i` with `d` legs `u_i–b_{ij}–c_{ij}` (a spider with `d` legs of
length 2) — and `O ≅ I_{p+1}(T')`/`I_p(T')` under the induced independent-set structure.

## Step 0 — registered claims named before any census (alias check, lexical AND mathematical)

Before reporting any table or number, the claims this route touches, re-confirms, or proposes against
(`control/CLAIM-IDENTITY.run-local.json`, 443 claims — the master's 434 fused with the run-local additions, per
`control/C3-STAGE1-GATE.md`):

- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — OPEN. Touched, **not closed**, by this route.
- **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` — VERIFIED `formally_verified` (C1-LA1). Not used directly below
  (this route never computes `S(T,p)`; it works entirely inside the transport network), cited only for context.
- **(INV)** `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` — VERIFIED `proved_informal`. Used implicitly: `Aut(CB(d,m))
  = S_d ≀ S_m` (order `(d!)^m m!`, corrected notation per the Cycle 2 `T` adjudication) acts on `T'` by permuting the `m`
  chokes and, within each choke, permuting its `d` leg-identities; the "class `q`" defined below (number of chokes present) is
  by construction a union of `Aut`-orbits, so restricting attention to `q`-classes is consistent with (but does not itself
  require re-deriving) the INV reduction to invariant families.
- **(NM)** `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` — VERIFIED `proved_informal`. **Distinguished**: NM is
  a *degree* (double-counting) bound for the root-plus-arm sector's *deletion* shadow, `δ = k/(2Z')`. This route's two new
  lemmas (Step 2) are exact chain-counting/LYM statements on **two different posets entirely** — the `d(m−q)`-position
  "2-colour" ternary-leg lattice, and the `qd`-element Boolean lattice of in-choke leaves — neither of which is the sector's
  cover-matrix poset `{0,1,2}^N` that NM/the second-eigenvalue key concern.
- **`E993-R30-TERNARY-COVER-SECOND-EIGENVALUE`** — VERIFIED `proved_informal` (Cycle 2). **Distinguished, explicitly, because
  the underlying ground set is easy to confuse with this route's**: that key's poset is `{0,1,2}^N` graded by **support size**,
  used for a **second-moment** (spectral, Cauchy–Schwarz) argument on a **non-uniformly-weighted** family (the root-plus-arm
  sector, where weight varies with which chokes are present). This route's T-lemma (Step 2.1) uses the *same abstract shape*
  of ground set (`N` positions, each in one of 2 non-empty states plus "empty") but only ever needs a **first-moment**
  (chain-counting) argument, because on the choke forest's own out-choke legs the weight is **identically zero** and the
  relevant Hall problem is a **uniform-weight-within-rank** problem (Step 2.1) — a strictly simpler question than the sector's,
  answered by a different, elementary technique, not a re-derivation or special case of the registered spectral key.
- **Ten refuted mechanism keys** (`SOLUTION-CONTRACT.md` §3.2) — none of this route's arguments is any of these: the weight
  used throughout is the literal active-tag `w_F`; every Hall statement below is checked against the literal (D)∪(S) relation
  (via the exact `t=p+1-q-ℓ` bookkeeping, or, for the isolated ternary-leg sub-lattice probe, the literal shadow map); no cut
  is deletion-only-claimed-universal; nothing here re-asserts `E993-R23-LITERAL-DELETE-ONLY-HALL` (this route's positive
  results are explicitly scoped to sub-families where a plain shadow argument is proved sufficient, never claimed universal).
- **New candidate keys proposed by this route** (naming only; registration is the synthesis's act, not mine — checked against
  all 443 run-local claims by a keyword search for `choke|ternary|lym|chain.?count|shadow|boolean lattice|normalized
  matching|colour.?flip|two.?colou?r`, 23 hits, all lexically and mathematically distinct as itemized above and below):
  1. `E993-R30-TERNARY-LEG-LATTICE-SHADOW-THRESHOLD` (Step 2.1: the exact `t ≥ ⌈(2N+2)/3⌉` iff-threshold for uniform-weight
     Hall on the "N positions, each `{empty, colour-1, colour-2}`" shadow lattice).
  2. `E993-R30-CHOKE-IN-BLOCK-RANK-WEIGHTED-LYM-THRESHOLD` (Step 2.2: the exact `ℓ ≥ ⌈(n+2)/2⌉` iff-threshold for
     rank-weighted Hall on the Boolean lattice `B_n`, applied at `n = qd`).
  3. `E993-R30-CHOKE-FOREST-SAFE-STRATUM-DELETION-HALL` (Step 3: the composite finding — deletion-only Hall holds for every
     subfamily of sources restricted to a `(q,ℓ)` stratum of `T'` whenever stratum 1 or 2's threshold is met — together with
     the exact measured coverage fractions at the three assigned rows, Step 4).

## Step 1 — the choke-forest model, derived and brute-force verified (where `IsTree`, finiteness and the literal relation enter)

`T' = T − {r,s,v}` is a **forest** (not a tree): `cb_build.py::build_choke_forest` builds it explicitly and
`cb_build.py::is_tree`'s two separate tests (edge count, then BFS reachability) are applied to `T` itself (confirming
`IsTree`: connectivity **and** acyclicity, checked separately, exactly as the brief requires) and, for `T'`, the analogous
"edges `= n′ − m`, `m` BFS components" check confirms it is an **acyclic forest of exactly `m` components** — every claim
below about `T'` presupposes this, and it is checked in code, not assumed, for all five named rows (`out_cb_build.txt`).

For a leaf `c_{ij}`: `s_{c_{ij}} = b_{ij}`, so `W_{c_{ij}} = N_T(b_{ij}) ∖ {c_{ij}} = {u_i}` **exactly** (a single vertex,
the choke — *not* another leaf, unlike the root-plus-arm sector's own arm tag). Hence `c_{ij}` is active in `B` **iff
`u_i ∈ B`**, independent of how many *other* leaves of choke `i` are present. Writing, for `B ∈ O` (i.e. `r,s,v ∉ B`):

- a choke `u_i` is **IN** `B` iff `u_i ∈ B` — then no `b_{ij} ∈ B` (adjacency), and each of choke `i`'s `d` leaves may be
  freely present or absent (a subset of size `ℓ_i ∈ [0,d]`), each present leaf **active**;
- a choke `u_i` is **OUT** — then each leg `j` is independently in one of 3 states, `∅`, `b_{ij}` alone, or `c_{ij}` alone (a
  path-of-length-2's own independent sets), and **every** element present there is **inactive** (`u_i ∉ B`).

So `w_F(B) = Σ_{i : u_i ∈ B} ℓ_i(B)` — weight is exactly the total leaf count **inside in-chokes only**.

**Brute-force verification (`verify_model.py`, `ALL_OK=True`, `out_verify_model.txt`).** Built `CB(d,m)` literally for
`(d,m) ∈ {(1,1),(2,1),(1,2),(2,2),(2,3),(3,2)}`, enumerated **every** independent set up to a working size cutoff by
backtracking, computed `w_F` **literally** from the definition (leaves = literal degree-1 vertices; `support(v)` = literal
unique neighbour; `W_v = N(support(v)) ∖ {v}`; no shortcut), and checked, member by member: (i) every `sec` member has
weight exactly 1, every `R0` member weight exactly 0; (ii) every `O`/`S`/`V` member's literal weight equals the "number of
present leaves whose choke is present" model above; (iii) the **aggregate** weight of every `(q,size)` stratum
(`q` = number of chokes present) equals the closed form
`C(m,q) · Σ_{ℓ=0}^{qd} ℓ·C(qd,ℓ)·C(d(m−q), size−q−ℓ)·2^{size−q−ℓ}`; (iv) the analogous **size-count** closed form
(same sum, without the `ℓ·` factor) matches the literal count of `O`-members at every size. All four checks pass on every
`(d,m)` instance and every size tested (`member_weight_ok`, `q_class_aggregate_ok`, `O_size_count_ok` all `True` for all 6
instances). This is where **finiteness** enters explicitly (the enumeration is over a finite vertex set) and where the
**literal (D)∪(S) relation is never invoked** — Step 1 only needs the *definition* of independent set and of `w_F`, not the
transport relation itself, which is only used in Step 2's isolated shadow-lattice checks and in naming what remains open
(Step 5).

## Step 2 — two elementary, general, unconditional threshold lemmas (chain-counting; where the fixed-selector and active-tag witness enter)

Both lemmas below are about **abstract graded posets carrying a weight that is constant within each rank** (a strictly easier
situation than the sector's, where weight varies within a rank) — this is *why* they are provable by first-moment
chain-counting rather than the sector's second-moment/spectral machinery, and it is exactly the special structure that the
active-tag witness (`W_{c_{ij}} = {u_i}` alone, not "another leaf") produces: **fixing a leaf-set `S` inside the in-chokes
fixes the weight for every out-choke ("`T`-part") configuration compatible with it**, so the out-choke part of the network is,
for that fixed `S`, a uniform-weight-within-rank Hall problem; symmetrically, fixing the out-choke part (`t=0`, none
available) makes the in-choke part a uniform-weight-within-rank problem on a Boolean lattice.

### 2.1 — Ternary-leg lattice threshold (`E993-R30-TERNARY-LEG-LATTICE-SHADOW-THRESHOLD`)

**Statement.** Fix `N ≥ 1`. Let a *config of size `t`* be a choice of `t` of the `N` "positions" together with one of 2
colours for each chosen position (`|configs of size t| = C(N,t)·2^t`); let the *shadow* of a config be the set of configs
obtained by removing (zeroing) exactly one of its `t` non-zero positions. Then: **for every `X` among configs of size `t`,
`|∂X| ≥ |X|` holds — i.e. plain (unweighted, since weight is uniform within a rank here) Hall holds for every subfamily — if
and only if `t ≥ ⌈(2N+2)/3⌉`.**

**Proof (chain-counting, elementary, general `N,t`; the *if* direction).** Count *coloured permutations*: pairs `(π,c)`, `π` a
permutation of the `N` positions, `c` an independent colour (1 of 2) assigned to every position — `N!·2^N` of them. For a
coloured permutation, its *size-`t` prefix* is the config with the first `t` positions of `π` active, coloured by `c`. For a
**fixed** size-`t` config `S`: the number of coloured permutations whose size-`t` prefix is exactly `S` is `t!(N−t)!·2^{N−t}`
(the first `t` slots of `π` must be a permutation of `S`'s active positions, `t!` ways; their colours are forced to match `S`;
the remaining `N−t` positions permute freely, `(N−t)!` ways, with free colours, `2^{N−t}` ways). So the number of coloured
permutations whose size-`t` prefix lies in `X` is `|X|·t!(N−t)!·2^{N−t}`. Every such permutation's size-`(t−1)` prefix (drop
position `π(t)`) is, by definition of the shadow, a member of `∂X`; a symmetric count gives the number of coloured
permutations whose size-`(t−1)` prefix lies in a fixed `Y` as `|Y|·(t−1)!(N−t+1)!·2^{N−t+1}`, so, with `Y = ∂X`:
`|X|·t!(N−t)!·2^{N−t} ≤ |∂X|·(t−1)!(N−t+1)!·2^{N−t+1}`. Dividing by `(t−1)!(N−t)!·2^{N−t}`: `|X|·t ≤ |∂X|·2(N−t+1)`, i.e.
`|∂X| ≥ |X|·t/(2(N−t+1))`. This is `≥ |X|` exactly when `t/(2(N−t+1)) ≥ 1`, i.e. `3t ≥ 2N+2`, i.e. `t ≥ ⌈(2N+2)/3⌉`. **Proof
(the *only if* direction).** Take `X` = the entire rank `t` (`|X| = C(N,t)2^t`); its shadow is the entire rank `t−1`
(`N ≥ t` makes every `(t−1)`-config extendable), so the inequality `|X| ≤ |∂X|` becomes `C(N,t)2^t ≤ C(N,t-1)2^{t-1}`, i.e.
`2(N-t+1) ≤ t`, the same threshold — so it is **necessary** too, and the bound is tight. Both directions are elementary,
general in `N,t`, and proved once and for all (not case-checked).

**Independent exact confirmation (`gap_probe.py`, `out_gap_probe.txt`).** For `N ∈ {4,5,6,8}` and every `t = 1..N`, built
the literal shadow bipartite graph and computed a **maximum bipartite matching by Kuhn's algorithm** (augmenting paths; not
subfamily enumeration) — by Hall's marriage theorem, `matching = |sources|` **is** the Hall-condition check. Result: Hall
holds **exactly** for `t ≥ ⌈(2N+2)/3⌉` and **fails** for every smaller `t`, on every one of the 4 values of `N` tested (26
`(N,t)` pairs total) — an exact, independent (matching-based, not the chain-counting proof itself) confirmation that the
threshold is tight in both directions, and that deletion-only Hall on the **isolated** ternary-leg sub-lattice genuinely fails
below threshold (this does **not** by itself show the full choke-forest network fails there — switches and cross-`ℓ` arcs are
not modelled by this isolated probe; see Step 5).

### 2.2 — Boolean in-choke-block threshold (`E993-R30-CHOKE-IN-BLOCK-RANK-WEIGHTED-LYM-THRESHOLD`)

**Statement.** On the Boolean lattice `B_n` with weight of a rank-`k` set defined as `k` itself (uniform within each rank):
**weighted Hall (`k|X| ≤ (k−1)|∂X|` for every `X` at rank `k`) holds for every `X` iff `k ≥ ⌈(n+2)/2⌉`.**

**Proof.** Classical chain-counting (Lubell/Yamamoto/Meshalkin): counting the `n!` maximal chains of `B_n`, those through a
fixed rank-`k` set number `k!(n−k)!`, so chains through `X` number `|X|·k!(n−k)!`; every such chain's rank-`(k−1)` point lies
in `∂X`, and chains through a fixed rank-`(k−1)` set number `(k−1)!(n−k+1)!`, giving `|X|·k!(n−k)! ≤ |∂X|·(k−1)!(n−k+1)!`,
i.e. `|∂X| ≥ |X|·k/(n−k+1)` (this is the ordinary LYM inequality). Multiplying by `(k−1)`: `(k−1)|∂X| ≥ |X|·k(k−1)/(n−k+1) ≥
k|X|` exactly when `(k−1)/(n−k+1) ≥ 1`, i.e. `k ≥ ⌈(n+2)/2⌉`. Necessity: at `X` = full rank `k`, `∂X` = full rank `k−1`,
and `k·C(n,k) ≤ (k−1)C(n,k−1)` reduces to the same inequality, so it is tight. This is the classical, standard normalized
matching property of `B_n`; I reprove it here (rather than citing it as an undischarged external dependency) precisely
because it is what is applied, at `n = qd`, to the single extremal `t=0` in-choke stratum in Step 3.

## Step 3 — where the two lemmas apply on the choke forest (where eligibility and the fixed selector enter)

Fix a `q`-class (`q` of the `m` chokes "in", `Aut`-invariant by construction — Step 1's INV note). A source has leaf-count
`ℓ ∈ [0,qd]` inside its `q` in-chokes and out-choke ("`T`-part") size `t = (p+1) − q − ℓ` on the `N = d(m−q)` out-choke
positions. **`w_F` is exactly `ℓ`, constant across every `T`-part configuration compatible with that `ℓ`** — this is where
the fixed selector enters: `F = F_p(T)` is fixed at the original rank `p` (never re-selected), so `w_F` for a member of `O`
never depends on which rank the member currently occupies except through which chokes/leaves are literally present, exactly
as computed here.

- **Lemma 2.1 applies (per fixed `ℓ`, i.e. per fixed `S`)** whenever `t ≥ ⌈(2N+2)/3⌉`: for that `S`, deletion of an out-choke
  element gives a target with the **same** weight `ℓ` (unchanged, `S` untouched), so Lemma 2.1's uniform-weight-within-rank
  Hall — applied to the `T`-part alone, with `S` frozen — gives Hall's condition for **every** subfamily of sources sharing
  that `S`, using deletion arcs confined to the `T`-part.
- **Lemma 2.2 applies at the single extremal stratum `t = 0`** (`ℓ = p+1−q`, only when `≤ qd`, i.e. only for `q` with
  `q(d+1) > p`): there `T`-deletion is unavailable (`T = ∅`), and Hall for that stratum reduces exactly to weighted (rank-`ℓ`)
  Hall on `B_{qd}` between ranks `ℓ` and `ℓ−1`, covered by Lemma 2.2 whenever `ℓ ≥ ⌈(qd+2)/2⌉`.

`qclass_rows.py` computes, in exact integers via `math.comb`, the total supply (rank `p+1`) and capacity (rank `p`) of every
`q`-class at the three assigned rows, and separates each `q` into **source-safe** (`q(d+1) ≤ p`: *every* member of this class
automatically has `t ≥ 1`, so Lemma 2.1 could apply to *some* stratum of it — see coverage below for exactly how much) versus
**exposed** (the extremal `t=0` stratum is reachable). At all three rows, the **thinnest whole-class ratio (supply/capacity,
`q` fixed) occurs at `q=1`**, confirming the Cycle 2 critic-cited figure "`≈0.9902`" **exactly**, now as an exact fraction:

| Row | `q=1` supply/capacity ratio (exact) | decimal |
|---|---|---|
| `CB(8,86)/460` | `1325825212805/1338918371349` | `0.990221` |
| `CB(8,89)/476` | `4727130817223/4772229963615` | `0.990550` |
| `CB(8,92)/492` | `117301488813803/118383886278251` | `0.990857` |

(`qclass_rows.py`, `out_qclass_rows.txt`; every ratio for `q ∈ {0, 1, 2, floor(m/4), floor(m/2), floor(3m/4), m-2, m-1, m}`
is also reported there, all `< 1`, decreasing away from `q=1` — so the aggregate whole-class check
passes with the tightest margin at `q=1` at all three rows, and `q=1` is comfortably **source-safe** (`9 ≤ 460,476,492`), so
Lemma 2.1 is the relevant tool there, not Lemma 2.2.)

## Step 4 — exact coverage measurement (`coverage_analysis.py`, `gap_weight.py`; bounded_computation)

`coverage_analysis.py` computes, for every `q = 1..m` and every achievable `ℓ`, whether that `(q,ℓ)` stratum is covered by
Lemma 2.1 (`t ≥ ⌈(2N+2)/3⌉`, `N = d(m−q)`) or by Lemma 2.2 at the single extremal point (`t=0`, `ℓ ≥ ⌈(qd+2)/2⌉`). By
**stratum count** roughly a third of all `(q,ℓ)` pairs are uncovered (`out_coverage_analysis.txt`); by **supply weight**
(`gap_weight.py`, the Hall-relevant measure, since a stratum's relevance scales with its total weight, not with 1) the
uncovered fraction is much smaller:

| Row | total O-supply (digits) | uncovered supply (digits) | **fraction uncovered** | fraction covered |
|---|---|---|---|---|
| `CB(8,86)/460` | 330-digit integer (`out_gap_weight.txt`) | 329-digit integer | **17.158674%** | 82.841326% |
| `CB(8,89)/476` | 341-digit integer | 341-digit integer | **17.178670%** | 82.821330% |
| `CB(8,92)/492` | 353-digit integer | 352-digit integer | **17.193174%** | 82.806826% |

(Exact integers, not rounded, are in `out_gap_weight.txt`; the percentages above are computed there from those integers, not
typed in by hand.) So: **for roughly 82.8% of the choke forest's total source supply (all three rows, to within 0.04
percentage points of each other), deletion-only Hall is now proved, by an elementary and general argument, for *every*
subfamily of sources restricted to the covered `(q,ℓ)` strata** — a strictly stronger and more general statement than a
whole-class aggregate check, and reached without the spectral/Johnson-scheme machinery the sector needed. The remaining
`≈17.2%` of supply mass sits in the "middle" `t`-range (`1 ≤ t < ⌈(2N+2)/3⌉`, excluding the single `t=0` point when it is
covered by Lemma 2.2) of the exposed `q`-classes — `gap_probe.py`'s exact matching confirms that the **isolated** ternary-leg
sub-lattice genuinely fails Hall there, so closing this gap on the full network (if it closes) needs either (i) combining
`T`-deletion with `S`-deletion or switch arcs across **different** `ℓ` within the same `q` (not attempted here), or (ii) a
sharper, non-uniform-weight argument on the mixed `(ℓ,t)` stratum directly (also not attempted here).

## Step 5 — obligations (a)/(b)/(c)/(d): what is and is not closed

- **(CF-HALL)** (Hall on `O ≅ I_{p+1}(T')` for every `Aut`-invariant `X`): **not proved**. Steps 2–4 prove it for every `X`
  confined to the covered `(q,ℓ)` strata (≈82.8% of supply by weight, all three rows); the remaining ≈17.2% (the "middle"
  `t`-range) is open, and — crucially — even the covered part only used **intra-`q`-class, intra-stratum deletion arcs**: I
  have **not** shown Hall for an `X` that **mixes** several `q`-classes or several `ℓ`-strata (switches move mass between
  adjacent `q`, and I have not analyzed whether covered-stratum capacity can be "double-claimed" by sources from two different
  strata the way Cycle 2's mixed-case gap arose for the sector). This is a real, named gap, not a rounding error.
- **(O1)** (Hall on `R0 ∪ S ∪ V ∪ O`): **not addressed for `R0`/`S`/`V` at all in this route.** One structural fact worth
  recording for a successor: `R0`-sources always have weight 0 (Cycle 2 `C-T1-U` R7, re-derivable directly from Step 1: `r ∈ B`
  forces every choke out); `S`- and `V`-sources reduce to **exactly the same `T'`-model** of Step 1 (one fixed extra vertex,
  `s` or `v`, contributing 0 weight, occupying one slot of the total size budget) — so Lemmas 2.1/2.2 and the Step 4 coverage
  figures **transfer verbatim** to `S`- and `V`-sources' own `(q,ℓ)` strata (only the total-size arithmetic shifts by the one
  fixed extra vertex). I did not carry out this transfer numerically here (it is mechanical, not attempted, to keep the
  assigned object — the choke forest itself — the focus), and it does not touch the genuinely new difficulty of (O1)/(O2):
  the **coupling** between `sec`'s switch exits, `V`'s deletions, and the choke-forest's own targets (Cycle 2's `C-T1-U` R7(b)
  already showed the naive "sector by Lemma C, `V∪O` by their own targets" split fails for supply reasons).
- **(O2)** (the coupled allocation): **not attempted.** No explicit flow or allocation crossing `sec`/`V`/`S`/`O` capacity is
  constructed here.
- **(c)** exact scope of anything proved: Lemmas 2.1 and 2.2 are stated and proved at **full generality** (any `N`, any `n`,
  respectively) with no tree structure at all — they are pure poset facts. Their **application** (Step 3–4) is scoped exactly
  to `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`, restricted to the covered `(q,ℓ)` strata, as tabulated in Step 4.
- **(d)** — no restricted-scope (HALL) theorem is produced; no (CUT) is found or attempted; nothing here is offered as a
  candidate for F's search.

## Grades (SOLUTION-CONTRACT.md §4)

- **Choke-forest model (Step 1):** `proved_informal` — elementary, general in `d,m`, and computationally cross-checked
  (member-level, aggregate-level, and size-count-level) against literal brute force on 6 small `(d,m)` instances,
  `ALL_OK=True`.
- **Lemma 2.1 (ternary-leg threshold):** `proved_informal`, own contribution, general and unconditional in `N,t`; both
  directions proved by chain-counting; independently confirmed exact (not merely consistent) on 26 `(N,t)` pairs by an
  unrelated method (bipartite matching).
- **Lemma 2.2 (Boolean in-choke threshold):** the underlying inequality is classical (LYM); its **application** at `n=qd` to
  this network is this route's own scoping. Grade: `proved_informal` (elementary, general, reproved here rather than cited as
  an undischarged import).
- **Step 4 coverage figures (≈82.8% of O-supply covered, all three rows):** `bounded_computation` — exact integers, three
  named instances, not a family theorem.
- **(CF-HALL), (O1), (O2):** **not proved** — `bounded_evidence`. The remaining gap is named exactly (the "middle" `t`-range
  of exposed `q`-classes; the entirely-untouched cross-class/cross-arm-type coupling), not merely asserted to be small.

## `headline_resolved: no`

## Route verdict: `bounded_evidence`

This route produced two new, general, unconditional, elementary threshold lemmas (chain-counting on the choke forest's two
natural sub-posets) that are strictly simpler than the spectral/Johnson-scheme machinery the root-plus-arm sector required,
proved a brute-force-verified exact combinatorial model of the choke forest from scratch, and used the two lemmas to prove
deletion-only Hall, **for arbitrary subfamilies**, on a precisely measured ≈82.8% of the choke forest's total source supply at
all three assigned `CB(8,·)` rows — a genuinely new elementary technique, not a re-scoping of anything already registered.
It did **not** prove (CF-HALL), (O1), or (O2); it did not attempt a restricted-scope (HALL) theorem or a (CUT); the remaining
gap (the "middle" `t`-range, and all cross-stratum/cross-class/cross-arm-type coupling) is named exactly, with an
independent exact confirmation (Lemma 2.1's tightness) that the gap is a genuine limitation of this proof technique on the
isolated sub-lattice, not merely an unproved-but-true loose end.

## Remaining obligation (successor inheritance)

1. **Close the "middle" `t`-range** (`1 ≤ t < ⌈(2N+2)/3⌉`) of every exposed `q`-class at the three rows — the ≈17.2% of
   O-supply not covered by Lemma 2.1 or 2.2 alone. `gap_probe.py` shows the **isolated** ternary-leg sub-lattice genuinely
   fails Hall there, so a successor needs either a joint argument combining `S`-deletion (within the in-choke leaves) with
   `T`-deletion (varying both `ℓ` and `t` together, not one at a time), or the switch arcs (choke-switch, support-switch) that
   this route did not model at all beyond the Step 1 definitions.
2. **Mixed-`q`/mixed-stratum Hall**, even restricted to `O` alone: this route only proved Hall for `X` confined to a single
   covered stratum; an `X` spanning several `q`-classes or several `ℓ`-values needs the shared-target-capacity accounting that
   stalled Cycle 2's `T1` for the sector's own mixed case (`C-T1-U` R7(b)) — the same structural risk (a target's capacity
   claimed twice by two different strata's certificates) has not been checked here.
3. **Transfer to `S` and `V`:** mechanically extend Lemmas 2.1/2.2 and the Step 4 measurement to `S`-sources and `V`-sources
   (same `T'`-model, one fixed zero-weight extra vertex) — not done here, flagged as straightforward but unattempted.
4. **(O1)/(O2) proper:** the coupling between `sec`'s switch exits, `V`'s `r`-switch and deletion exits, and the choke
   forest's own targets remains completely open; Cycle 2's `C-T1-U` R7(b) already shows the naive "prove each piece
   separately" strategy fails for supply reasons, so a successor needs a genuinely joint argument, not a composition of this
   route's per-stratum results with a sector-side Hall statement.
5. **Synthesis action requested:** consider registering (subject to review and an isolated second read)
   `E993-R30-TERNARY-LEG-LATTICE-SHADOW-THRESHOLD` and `E993-R30-CHOKE-IN-BLOCK-RANK-WEIGHTED-LYM-THRESHOLD` as reusable
   general poset lemmas (they have no tree structure in their statements at all and may be useful again, e.g. for `T2`'s
   `CBstar` self-covering residual or `F2`'s `G_k`/`T(m,2)` families, which have structurally similar "in/out" gadgets).

## Replay (copy-out-first; scratch under `scratchpad/c3-T1/`, replay copies under `scratchpad/c3-T1-replay/`)

All scripts ran in the foreground; no background job was started, so none required killing. Every script uses
`python3 -B` (no bytecode anywhere).

```
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-T1/{cb_build.py,verify_model.py,cb_polynomial.py,qclass_rows.py,coverage_analysis.py,gap_weight.py,gap_probe.py} \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-T1-replay/
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-T1-replay
python3 -B cb_build.py           # IsTree (connectivity + acyclicity, separately) on T and the T' forest check, all 5 rows
python3 -B verify_model.py       # brute-force model verification, 6 small (d,m); ALL_OK=True
python3 -B cb_polynomial.py      # independence polynomial, n/alpha/x/Delta_x/Delta_{x-1}, all 5 rows
python3 -B qclass_rows.py        # exact q-class supply/capacity, all q, three T1 rows (+2 context rows)
python3 -B coverage_analysis.py  # per-(q,ell) stratum coverage by Lemma 2.1 / Lemma 2.2, stratum-count metric
python3 -B gap_weight.py         # per-(q,ell) stratum coverage, SUPPLY-WEIGHT metric (the Step 4 percentages)
python3 -B gap_probe.py          # exact bipartite-matching confirmation of Lemma 2.1's tight threshold, N=4,5,6,8
```

### Digests (SHA-256, this route's own scratch files and their stdout)

| file | sha256 |
|---|---|
| `cb_build.py` | `4914f06839d4e7516c0d188bdf8051ecc23ce55c1e12d6f20619dec2384b2a5c` |
| `verify_model.py` | `ccb248257f56afcfc73d7765cb1888b389af848a98e3bd44d52dca015f9a98ea` |
| `cb_polynomial.py` | `c06eb3cce05528ae408d3a0188c34da0004971b13d6d36a4d35955e477e5d1de` |
| `qclass_rows.py` | `14d4cf9148558e8b5658c62a9a2cb5955f96191028a68b3690ac72ee7beef64d` |
| `coverage_analysis.py` | `42cb829ef7521d917079f2dd41373aa0b1da02abe1fe08b945f78ef4531a0562` |
| `gap_weight.py` | `7a9a8efc6ae81421ef538daa5da17cd03e904561e9a4d2321c890b5cc06c2d20` |
| `gap_probe.py` | `a0fe8d1b790223e17c6a4febaef9e7c6b4b074be2d54f433594e9c88098d4d75` |
| `out_cb_build.txt` (stdout) | `6d6787dd8dd12b48d6c8a9a7c210068c465b2ff25be1f71bd3ca7b00635d1676` |
| `out_verify_model.txt` (stdout) | `2e4583e809d4052e7696d47e76d29c7b2568b5a643061a62623f16cc13332201` |
| `out_cb_polynomial.txt` (stdout) | `ee065dc7203d32be775b61fd0778cfae78da4e71593fc93308247cf62ceeed68` |
| `out_qclass_rows.txt` (stdout) | `b9de4e2886368ddd28a56cf20c3e86e56162b1c42ca7e8ffa6e4de5eb6749696` |
| `out_coverage_analysis.txt` (stdout) | `4392dfaffeb4e281316d32866cd08f710f682290c595e029e419b90d6b5099a3` |
| `out_gap_weight.txt` (stdout) | `f5dd742072fca939036a828e74203d78751597a8629bad55c4d0f2b5614573bc` |
| `out_gap_probe.txt` (stdout) | `34c9aede4a1c1c5defb21b749a171c7af42e4e2f10047415302f7600d4acdce7` |

All seven replay stdouts were verified byte-identical to the shipped `out_*.txt` files by copy-out-first re-execution in
`scratchpad/c3-T1-replay/` immediately before this return was written. No wall-clock, PID, or host field entered any hashed
output. Every numeric claim in this return (the model's member/aggregate/size-count checks; the `q=1` ratios and their exact
fractions; the coverage percentages; the 26 `(N,t)` matching results) is produced by the generator whose digest is listed
above, not typed in by hand. No `__pycache__` was written anywhere (`python3 -B` throughout, verified by directory listing
after every run). Census counts above are **labelled** counts (independent sets of a specific labelled tree/forest), named as
such; no isomorphism-class count is used or claimed.

## `x`, `Δ_k` on every row (`cb_polynomial.py`, `out_cb_polynomial.txt`; independent third-instrument reproduction)

Independence polynomial derived from scratch by the standard rooted-tree recursion (root at `r`; closed form
`P(x) = (1+2x)·[(1+2x)^d + x(1+x)^d]^m + x(1+x)(1+2x)^{dm}`, structurally matching, as an independent cross-check, the
"`β = (1+2t)^d + t(1+t)^d`" bracket the Cycle 2 critic `C-T1-U` reported for the same tree — not read from that critique's
code, only compared against its cited numbers below), evaluated in exact integers. `x` computed as the first `k` with
`Δ_k := i_{k+1} − i_k < 0`, **scanning through rank `α`** with the terminal difference `i_{α+1} := 0` made explicit (never
relying on a coefficient-storage cutoff):

| Row | `n` | `α` | `x` | `p` | eligible | `Δ_x` sign (index `k=x`) | digits | `Δ_{x-1}` sign (index `k=x-1`) | digits |
|---|---|---|---|---|---|---|---|---|---|
| `CB(8,86)/460` | 1465 | 775 | 458 | 460 | True | `< 0` | 326 | `≥ 0` | 327 |
| `CB(8,89)/476` | 1516 | 802 | 474 | 476 | True | `< 0` | 337 | `≥ 0` | 338 |
| `CB(8,92)/492` | 1567 | 829 | 490 | 492 | True | `< 0` | 349 | `≥ 0` | 350 |
| `CB(8,108)/577`* | 1839 | 973 | 575 | 577 | True | `< 0` | 408 | `≥ 0` | 411 |
| `CB(7,144)/673`* | 2163 | 1153 | 671 | 673 | True | `< 0` | 479 | `≥ 0` | 482 |

*The last two rows are `T2`'s object (obligation-(b) rows), computed here only as a third independent instrument matching the
Cycle 2 `T` adjudication's own corrected digit counts (326/337/349/408/479 and 327/338/350/411/482) exactly — confirming that
adjudication's correction of the original `T1` return's mis-stated digit counts (330/340/352/415/485 and 327/338/350/412/482),
via a wholly independent, from-scratch polynomial derivation (not the authorized evaluator, not either critic's code). `Δ_j ≥
0` for every `j < x` was asserted directly in code (`cb_polynomial.py::all_deltas_report`), not merely inferred from
`first_strict_descent`'s scan order.
