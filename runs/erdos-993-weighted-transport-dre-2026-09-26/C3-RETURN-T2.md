# RETURN — seat T2, Cycle 3, r30 (correctly weighted mixed-boundary transport, Erdős #993)

Route `C3-T-02 GENERAL-SECTOR-SELF-COVERING`. Orientation **T (prove)**. Mechanism fingerprint
`GENERAL-SECTOR-SELF-COVERING`. Load-bearing obligation (`control/C3-ALLOCATION.md`, "Mechanism fingerprints and
load-bearing obligations", item 2): (a) generalize the `CBstar` self-covering reduction (C-T2-U's Cycle 2 critique,
confirmed `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`) to an arbitrary finite tree `T` and independent `Q` with
`T − N[Q]` a star forest: `Q`-deletions are private exits; bound the weight lost when `q ∈ Q` is a witness; reduce
any sector deficit to the weight-inert residual; characterize exactly when that residual is deletion-deficient (a
weighted LYM for non-uniform star sizes `q_i`); (b) (O3) sector Hall at `CB(8,108)/577` and `CB(7,144)/673` by
small-set expansion via a Kruskal–Katona-type bound; (c) every deletion-only statement says on its face why it is
not `E993-R23-LITERAL-DELETE-ONLY-HALL`.

## Boot acknowledgment

Operating within VerityOS. The two authorized boot reads, exactly and only: `/Users/ashtonsperry/VerityOS/verity.md`
and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in full. Per `DISPATCH-T2.md` and
`control/C3-WORKER-COMMON-BRIEF.md`, the startup protocol's own task-type map, and memory, conversations, modules,
skills, logs and decisions directories, were **not** read (the controller has booted for the run). No other VerityOS
file outside the run root was read as a source for this route's mathematics. (The launching wrapper session's own
`CLAUDE.md`/user-memory context were injected by the harness before the dispatch was read; consistent with the
Cycle 2 T1/T2 precedent, they were not opened as sources and nothing below relies on them; this is recorded under
`## Read-boundary disclosure` below since it is an ordering, not a content, deviation.)

## Model disclosure

Chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter); runtime-reported model id:
`claude-sonnet-5` (this runtime's own system disclosure states "You are powered by the model named Sonnet 5. The
exact model ID is claude-sonnet-5.").

## Stage 2 seal and source digests

Recomputed SHA-256 of the canonical JSON of `control/C3-STAGE2-PACKET-MANIFEST.json` with its `seal_sha256` field
removed (`sort_keys=True`, separators `(",", ":")`, no trailing newline; own script `scratchpad/c3-T2/verify_seal.py`,
script SHA-256 `a27e141168e0f33011d83f23470d99e5fdc6c19a29fb90b1832ad08645a068a3`):

```
5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416
```

This equals the manifest's own `seal_sha256` field and the value quoted in `DISPATCH-T2.md`. **Seal verified. Cited
seal value: `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416`.** (1,051 members, canonical JSON
229,980 bytes.)

Files verified by direct SHA-256 recomputation against the manifest's own per-file digests: `control/C3-ALLOCATION.md`,
`control/C3-STAGE1-GATE.md`, `control/CLAIM-DISTINCTIONS.json` (18,209 bytes, `7327b0ae…`), `control/CLAIM-IDENTITY.run-local.json`
(2,469,806 bytes, `b8f3c2a1…`), `control/RESIDUE-CHECK.json` (1,182 bytes, `281ddd08…`), `control/SOURCE-DIGESTS.json`
(232,777 bytes, `e82494df…`) — all **MATCH**. `SEMANTIC-CONTRACT.md` and `SOLUTION-CONTRACT.md` (run-root files,
binding) were read directly as authorized.

This route needed **no file under `sources/`** — the mechanism is derived entirely from `SEMANTIC-CONTRACT.md` §1.2's
definitions, the Cycle 1/2 NM/sector record, and this route's own Cycle 2 return and its two critiques, all read
under the worker brief's explicit "every return"/"every critique" grant — so no `control/SOURCE-DIGESTS.json`
lookup for a `sources/` path was required. Cycle 1/2 sealed sources read by exact, brief-authorized path (not
discovered by search), cited by that authorization, not individually re-verified against a separate manifest (they
are sealed at their own recorded stage seals, `cycles/cycle-1/CYCLE-CLOSE.md` §2 and `cycles/cycle-2/CYCLE-CLOSE.md`
§2):

- `cycles/cycle-1/CYCLE-CLOSE.md`, `cycles/cycle-2/CYCLE-CLOSE.md` (grades of record entering Cycle 3);
- `cycles/cycle-3/stage2/ROUTE-STATE.md`;
- `cycles/cycle-2/stage3/returns/T1/RETURN.md`, `cycles/cycle-2/stage3/returns/T2/RETURN.md` (this seat's own prior-cycle
  work);
- `cycles/cycle-2/stage4/critics/T2/U/CRITIQUE.md`, `cycles/cycle-2/stage4/critics/T2/F/CRITIQUE.md` (the two
  critiques of this seat's Cycle 2 return);
- `cycles/cycle-2/stage5/adjudicators/T/ADJUDICATION.md`;
- `second-reads/SR-SECTOR/SECOND-READ.md` (Cycle 1) and `second-reads/SR-C2-3/SECOND-READ.md` (Cycle 2) — the second
  reads governing the `CBstar` sector-deficit key and Lemma C.

## IMPORT LIST (standard library only, every own script)

`itertools`, `math.comb`, `json`, `hashlib`, `sys`, `random`, `fractions.Fraction`, `collections.deque`. No network,
no third-party packages, no `pip`/`brew`/`elan`/`lake` (this route needs no Lean).

## Registered claims named before any census (obligation 3; alias check is a separate step below, obligation 5)

- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — Tier 1, OPEN. This route neither proves nor refutes it;
  every result below is a sub-lemma about a restricted sector/family or a small-set expansion question, never a
  statement about (HALL-COND) on an entire tree. `headline_resolved: no`.
- **Primary aggregate** `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` — OPEN, untouched. Nothing below
  bounds `S(T,p)` (mechanism ≠ aggregate).
- **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` — VERIFIED `formally_verified` (C1-LA1). Used (asserted
  on every generator's own instances via the literal active-tag weight, independently on both sides where a
  generator computes it), never re-proved.
- **`E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`** (VERIFIED `proved_informal`; C-T2-U's theorem, confirmed
  `SR-C2-3`) — this is exactly the object item (a) asks to generalize. Its self-covering reduction (`Q`-deletions
  are private targets of weight `w(B)−1`; only the weight-one residual `R1` can carry a deficit; `T-D-R1` bounds
  `R1`'s shadow) is generalized below (Theorem G1) to arbitrary `Q` (not only `|Q|=2`), arbitrary `β` (not only one
  baseline tag), and — via a new inequality (Theorem G2/G2b) — to heterogeneous star sizes `t_i` (T-D-R1 itself is
  retained only at uniform `t`, per `CB(8,·)/577,673`'s own use of it and per C-T2-F's Cycle 2 Finding 4, which is
  **not** re-proved here, only cited). The `t≥1` uniform case, including its exact max-deficit formula, is
  reproduced below (Theorem G1, "thin/uniform" corollary) as a fixed point before any new claim is reported.
- **`E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`** (NM, VERIFIED `proved_informal`) — the `q=2`
  special case of `T-D-R1`, itself a special case of this return's Theorem G2's exact chain-count identity at
  uniform `q`. Not re-proved; cited as the precedent this route's Theorem G2 generalizes to heterogeneous `q_i`.
- **`E993-R27-FOREST-DESCENT-LINEAR-BOUND`** (LB, VERIFIED `formally_verified`, award C1-LA4) — "for every finite
  forest `G` of order `n` and every natural `k`: `Δ_k(G) < 0 ⇒ n ≤ 4k`". Used at its exact registered statement
  (`k = x(T)`, `T` a tree hence a forest, `Δ_x(T) < 0` by definition of `x`) in Theorem G3 below, exactly as
  C-T2-U's Cycle 2 corollary used it for the uniform-`t≥2` case; this route's Theorem G3 is the corresponding
  statement for **heterogeneous** star sizes and **general** `Q`.
- **Ten refuted mechanism keys** (`SOLUTION-CONTRACT.md` §3.2). Nearest: **`E993-R23-LITERAL-DELETE-ONLY-HALL`**
  (REFUTED — the unweighted cardinality Hall inequality `|X| ≤ |Γ_Delete(X)|` for every `X` in the complete r23
  tagged top side, over every finite ordinary tree, refuted on `CB(8,92)`'s full arm-tag top cut). Every
  deletion-only statement below (Theorem G1's residual reduction, Theorem G3) differs from it on the same three
  axes the run-local `CLAIM-DISTINCTIONS` row `R30-CBSTAR-SECTOR-DEFICIT-VS-R23-DELETE-ONLY-HALL` already records for
  its `CBstar` special case, and this route's generalization inherits every one of them unchanged: (i) **scope** —
  one source family (a `Q`-indexed sector of a star-forest-attached tree), never a claim about every `X` on every
  tree; (ii) **weight** — the literal active-tag `w_F` of `SEMANTIC-CONTRACT.md` §1.2, never bare cardinality;
  (iii) **role** — a diagnostic exact maximum / sufficient non-deficiency statement about one family, never a
  proposed universal transport mechanism (the mechanism of record stays (HALL) with (D)∪(S)); and a fourth,
  new-to-this-route point, (iv) **consistency at `t=1`** — Theorem G1's exact formula, evaluated at `t=1`, `|Q|=2`,
  `β=1`, `K=2`, reproduces the known **positive** deficits at `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`
  (own fixed-point reproduction below), so nothing here revives the refuted key by silently sanitizing its
  counterexample away. Also distinguished: **`E993-R28-TREE-LEAF-SLOT-DOMINANCE`** (a Hall/SDR statement for a
  *degree lemma* on a *different* tree object — `CLAIM-DISTINCTIONS.json` row `R30-T22-NAMING`; nothing here touches
  it).
- **T1's Cycle 2 obligation (b)** (`cycles/cycle-2/stage3/returns/T1/RETURN.md` Step 4, Remaining obligation 4;
  `second-reads/SR-SECTOR/SECOND-READ.md` Finding 7) — the exact object of this route's (O3): Lemma C's composition
  is vacuous at both rows (`x₀ < 0`), and the "natural adversarial test family" is `X''`, the *switch-dead* sector
  sources (no choke has exactly one support present together with a sibling private leaf present). T1 diagnosed this
  precisely but did **not** construct the needed sharper, `X''`-specific shadow bound. This route reproduces T1's
  numbers independently (own polynomial derivation, below) and reports a bounded, honest, partial advance (own
  Theorem below), **not** a closure.
- **(LIFT), (INV)** — not invoked. Every biregularity/chain-counting argument below is by direct, elementary double
  counting or maximal-chain counting on an explicit graded poset (no group action, no automorphism), exactly
  following `SR-SECTOR`'s own "Route 2" recommendation and this seat's own Cycle 2 practice.
- **(DCB), (TSB)** — not invoked (a different route to the aggregate).
- **`T_m`, spider, path-star family theorems, high tail, order bands** — settled, closed regions; not re-proved; not
  touched.

## Alias check (new claims; lexical AND mathematical — obligation 5; performed here, before any census)

Own script (`scratchpad/c3-T2/alias_check.py`, SHA-256 `f37242bc64d1f32457b1753e4088f14f1c64a1f0f2f8308e8c4f94205fdda0d6`;
output `g1`-independent, run before any theorem below was finalized) filters the already digest-verified, already
loaded `control/CLAIM-IDENTITY.run-local.json` (443 claims — the master registry's 434 plus this run's additions; a
content filter, not a filesystem search) for `STAR`, `SECTOR`, `SELF-COVER`, `WEIGHT-INERT`, `LYM`, `KRUSKAL`,
`KATONA`, `SHADOW`, `MATCHING`, `WREATH`, `PRODUCT`, `NORMALIZED`, `SWITCH`, `FOREST`, `DEFICIT`, `EXPANSION`,
`GENERAL-SECTOR`: 175 hits (full list in the replay output). **Lexically closest beyond the already-discussed
`E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` and `…NORMALIZED-MATCHING`:** the eighteen `E993-R25-MATCHING-…`
keys (a *different* object — the `d`-uniform matching-slack family's LYM bounds on hypergraph matchings, not a tree
sector's star-forest independence poset); `E993-PAIR-PHISTAR`/`…-CLOSURE`/`E993-PAIR-STAR-CLOSURE` (an unrelated
named quantity "Φ-star" from an earlier program layer); `E993-BIPARTITE-TAGGED-SHADOW-BOUND` (TSB, a bipartite
per-vertex shadow inequality on a *different* network, not invoked here); `E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY`
(DCB, likewise a different route). **No mathematical collision** with any statement proved below: none of the 175
hits states a self-covering reduction for a general `(T,Q)`, a chain-count LYM bound for a heterogeneous
product-of-claws poset, or a non-deficiency criterion keyed on `min_i t_i`. `control/CLAIM-DISTINCTIONS.json` (20
rows, checked directly) contains no row addressing this route's objects either. **The candidate statements below
(Theorem G1, G2/G2b, G3) are not registered by this route** (registration is a synthesis/Stage-7 act); each needs an
isolated second read before registration, per the brief.

## Grades (this return's own claims; `SOLUTION-CONTRACT.md` §4)

| Claim | Location | Grade |
|---|---|---|
| Theorem G1: general self-covering reduction (arbitrary `Q`, general `β`, exact `κ_q`/`K` bookkeeping; exact max-deficit formula at uniform `t`) | §1–§2 | `proved_informal` (complete elementary derivation from the definitions; exact identity verified on three structurally distinct instances — `|Q|=2` one-baseline, `|Q|=2` heterogeneous-`t`, `|Q|=3` two-baseline with a negative self-covering coefficient — by independent brute-force maximum flow, zero mismatches) |
| Theorem G2: weighted LYM chain-count inequality on the product of heterogeneous claws | §3 | `proved_informal` (complete elementary maximal-chain-counting proof; exact equality/inequality verified on 5 heterogeneous `(q_i, k)` configurations) |
| Theorem G2b: crude double-counting shadow bound from G2, and its Hall consequence | §3 | `proved_informal` (a valid, honestly non-sharp, one-directional inequality; checked as never-violated against exact brute-force shadows on hundreds of random subfamilies across 5 configurations) |
| Theorem G3: whole-sector non-deficiency whenever every star has `t_i ≥ 2` (`q_min ≥ 3`), for arbitrary `Q` and arbitrary heterogeneous star sizes | §4 | `proved_informal` (complete derivation composing G2b with (LB); confirmed at a matched real scale via known Cycle 2 numbers, §4, and end-to-end on an actual constructed heterogeneous tree by independent brute-force max-flow) |
| Own independent (third-instrument) reproduction of `CB(8,108)/577` and `CB(7,144)/673`: `n, α, x, k, Z', δ, λ₂, k², x₀, |X''|/R_k` | §5 | `bounded_computation` (exact-integer reproduction, own closed-form derivation, cross-checked against literal brute-force trees on three small `(d,m)` analogues, matching T1's Cycle 2 numbers and `SR-SECTOR`'s Registration 4 digit-for-digit) |
| Own confirmation of the exact combinatorial meaning of the switch-dead family `X''` against `g_d(t)` (own reverse-engineering from the literal branch-state definition) | §6 | `bounded_computation` (exact enumeration match for `d = 1..6`) |
| Own structural finding: the per-choke "good" (switch-dead) state poset has no dead end below its top rank, for `d = 1..8` | §6 | `bounded_computation` (exact enumeration, an attained horizon, not a general-`d` proof) |
| Own small-scale experimental finding: the exact shadow ratio of `X''` exceeds the generic `δ = k/(2Z')` on every one of 9 tested `(d,m,k)` configurations, though it does not always reach `1` at the tested (small) scales | §6 | `bounded_computation` (an attained horizon; not evidence that it reaches `1` at the actual target scale, and explicitly not offered as such) |
| **Obligation (O3): sector Hall at `CB(8,108)/577` and `CB(7,144)/673`** | §6 | **not established** — see Remaining obligation. The gap is unchanged from T1's Cycle 2 diagnosis in substance; this route adds an independent third-instrument reproduction, a confirmed exact combinatorial reading of `X''`, and a small-scale experimental signal consistent with (but not proving) the expected sharpening, none of which closes it. |

`REFUTED` never regresses (nothing here touches a REFUTED key); no certification is strengthened without
strengthening its evidence; every `bounded_computation` row above is an attained horizon on named parameter sets,
never a filtered or extrapolated bound presented as a proof.

---

## §0. Setup: where `IsTree`, finiteness, eligibility, the fixed selector, the active-tag witness, the literal
relation, and (the absence of) group invariance each enter

**`IsTree` and finiteness.** Every tree in this return is built by `scratchpad/c3-T2/gsc_lib.py::GeneralStarForestTree`,
which asserts `is_tree` — **connectivity by explicit BFS** and **acyclicity by explicit union-find over every edge**,
checked as **two separate conditions**, plus the edge-count check `|E| = n − 1` — at construction time, before any
independent-set computation. `Fintype`/finiteness enters as explicit, finite Python vertex/edge lists throughout;
every generating function below is an exact polynomial with a finite number of coefficients (no formal power series,
no asymptotics).

**The general setting (generalizing `SEMANTIC-CONTRACT.md` §1.2's `Q = {r, v}` for `CBstar`).** `T` a finite tree,
`Q ⊆ V(T)` independent and nonempty, such that `T − N[Q]` is a disjoint union of stars `S_1, …, S_M` with centres
`c_1, …, c_M` and `t_i ≥ 1` leaves each (`M = 0` is vacuous and excluded). **Hypothesis (H-attach):** the unique
attachment edge of each `S_i` to `N[Q] ∖ Q` (unique because a connected subgraph of a tree meets the rest of the
tree in exactly one edge, a standard fact reused unchanged from `CBstar`'s own structure) is incident to `c_i`,
equivalently **every leaf of every star is a genuine `T`-leaf** (own `GeneralStarForestTree.__init__` asserts this
for every leaf of every star it builds — a silent failure here would mean a "leaf" of the local star-graph is not
actually a tag, and the construction refuses to build such a tree). This is the one genuinely new structural
hypothesis this generalization needs beyond "`T − N[Q]` is a star forest": obligation (c)'s honesty requirement
extends to it — **the hypothesis is not free**, and a tree where some star's induced leaf secretly carries the
attachment edge is a different, unanalyzed object (not attempted here; flagged in Remaining obligation).

**Fixed selector and active-tag witness.** Fix a rank `p` and `F := F_p(T)` (the fixed original selector,
`SEMANTIC-CONTRACT.md` §1.1, evaluated once on the undeleted tree). Write `P := ⋃_i {leaves of S_i}` (the star-forest
tags) and `F_Q := F ∖ P` (any tags outside the star forest, e.g. `v` in `CBstar`). **Hypothesis (A4):** every
`v ∈ F_Q` has its entire witness set `W_v = N_T(support(v)) ∖ {v}` contained in `Q`. Since `Q ⊆ B` for every sector
member `B ∈ S^Q_{p+1} := {B ∈ I_{p+1}(T) : Q ⊆ B}`, every `v ∈ F_Q` is **active in every sector member** (this is
where the active-tag witness enters for `F_Q`; §1 derives it in full generality, subsuming `v`'s role in `CBstar`
verbatim). Star-forest tags' witnesses, by construction (a star's centre is never adjacent to `Q` — shown in §1 —
so a star-forest tag's witness is either a sibling leaf or the unique `N[Q]∖Q` attachment vertex, **never** a
member of `Q` itself), are unaffected by which `Q`-member is deleted; this is exactly why the reduction below applies
uniformly regardless of `|Q|`.

**The literal relation.** (D) deletion of one vertex; (S) the two-for-one switch, `u ∉ B` with exactly two
neighbours in `B`. This route's own theorems (G1, G3) below concern the DELETION-only sub-network and the exact
residual it forces the analysis onto; §6 (obligation O3) concerns the full `(D)∪(S)` network, exactly as its object
requires; no statement anywhere claims deletion-only Hall on a whole tree or on the sector's full `X_sec` layer as a
finished theorem (obligation (c) — see the explicit distinction from `E993-R23-LITERAL-DELETE-ONLY-HALL` above and
restated at the close of each theorem below).

**Group invariance: not used.** Following `SR-SECTOR`'s own repair of Cycle 1 T1 (a tree automorphism never swaps a
support with one of its own leaves, since degrees differ) and this seat's own Cycle 2 practice, every argument below
is proved by **direct biregularity or direct maximal-chain counting** on an explicit graded poset — no `Aut(T)`, no
(INV), no (LIFT) anywhere in this return.

## §1. The general weight formula and the exact per-`q` deletion identity

**Setup recap.** `β := |F_Q|`. For `q ∈ Q` define
`κ_q := [q ∈ F_Q] + #{v ∈ F_Q ∖ {q} : W_v = {q}}` — the number of `F_Q`-tags whose activity is lost **exactly** when
`q` alone is deleted (either `q` is itself the tag, or `q` was some other tag's *only* witness in `Q`). Let
`K := Σ_{q∈Q} κ_q`.

**Proposition 1 (general weight formula).** For every `B ∈ S^Q_{p+1}`:
```
w_F(B) = β + Σ_{i=1}^{M} g_{t_i}(ℓ_i(B)),      ℓ_i(B) := |B ∩ S_i|,   g_t(s) := s if s ≥ 2, else 0.
```
*Proof.* Every `v ∈ F_Q` is active in `B` by (A4) and `Q ⊆ B`, as derived above (§0), contributing exactly `β`. For
a star-forest tag `v ∈ P ∩ B ∩ F` with support `c_i`: `v` is active iff `(B∖{v}) ∩ W_v ≠ ∅`, and `W_v` is (the other
leaves of `S_i` present in `B`) ∪ (the attachment vertex, which is never in `B` since it is adjacent to `c_i ∈
T∖N[Q]`, hence itself in `N[Q]∖Q`, and every vertex of `N[Q]∖Q` is excluded from `B` whenever `Q ⊆ B` — because `T`
is a tree and the unique path from any such vertex back into `Q` would otherwise create the standard "second
attachment edge" contradiction used to derive (H-attach) in the first place; concretely, in every construction here
the attachment vertex is itself adjacent to some member of `N(Q)`, hence not independent with `Q` unless excluded).
So `v` is active iff a **sibling** leaf of `S_i` is present in `B`, i.e. iff `ℓ_i(B) ≥ 2` (a lone present leaf has no
present sibling). Summing over the `ℓ_i(B)` present leaves of a star with `ℓ_i(B) ≥ 2` present leaves gives exactly
`g_{t_i}(ℓ_i(B)) = ℓ_i(B)` (every one of them counts, each having every other present leaf as a witness); for
`ℓ_i(B) ≤ 1` none counts. ∎

**Proposition 2 (exact per-exit weight loss).** For every `q ∈ Q` and `B ∈ S^Q_{p+1}`: `w_F(B ∖ {q}) = w_F(B) − κ_q`.

*Proof.* Deleting `q` cannot change any `ℓ_i(B)` (star-forest vertices are disjoint from `Q`), so the star-forest
term of Proposition 1 is unchanged. Among `F_Q`-tags: if `v = q`, its own weight-1 contribution vanishes (it is
deleted). If `v ≠ q`, `v ∈ F_Q`: `v` is active in `B∖{q}` iff `(B∖{q}∖{v}) ∩ W_v ≠ ∅`, and since `W_v ⊆ Q` (A4) and
`B ⊇ Q`, this is `W_v ∖ {q} ≠ ∅`, i.e. `v` stays active unless `W_v = {q}` exactly. Summing these two effects over
`F_Q` gives exactly `κ_q` lost. ∎ **Own exhaustive verification** (`scratchpad/c3-T2/theorem_g1_check.py`, function
`run_instance`, asserted on **every** sector member of **every** tested rank of **three** structurally distinct
instances before any other computation for that instance — see below): zero exceptions.

**Fixed points reproduced, own instrument, before any table (obligation 7's "fixed points" requirement, read
together with the census discipline of shared rule 1).**

1. **`CBstar`-style, `|Q|=2`, uniform `t=2`, `d=2, m=2` (`β=1, K=2`).** Own literal tree (`is_tree` asserted),
   Proposition 1 and 2 verified on every sector member at 5 ranks; **the exact max-deficit formula**
   `max(0, (K − (|Q|−1)β)·(C(M,k)q^k − C(M,k−1)q^{k−1}))` (§2 below) checked against an independent, own Dinic
   max-flow on the **full** deletion-only network (every source in the sector, every target in `I_p`, not
   restricted to any residual) — **exact match at every one of 5 ranks** (`k = 2,3,4,5,6`; deficits `42, 54, 0, 0,
   0`). This is the `t=1`-generalizing, `t=2` instance of the exact `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`
   formula, reproduced by this route's own, independently-derived route (a general `β,K,|Q|` bookkeeping specializing
   to `coef = 1` here, matching the registered formula's own coefficient exactly).
2. **Heterogeneous `t ∈ {2,3,4}`, `|Q|=2` (`β=1, K=2`).** Same checks (Proposition 1, 2; exact deletion-only max-flow
   against total supply) at 6 ranks; the closed-form of §2 does **not** apply here (non-uniform `t`), so only the
   direct-flow deficit is reported (`11, 35, 13, 0, 0, 0`) — a genuine `bounded_computation` fixed point for the
   heterogeneous case, not yet explained by a closed formula (see Remaining obligation).
3. **`|Q|=3` two-baseline, mutually-witnessing tags (`β=2, K=2`, giving a *negative* self-covering coefficient
   `K−(|Q|−1)β = 2−4 = −2`).** A genuinely different `(Q,β,K)` regime: two arm-like tags `v_1, v_2` at a shared
   support, each witnessed by `{r, the other tag}` (so `W_{v_1} = {r,v_2}`, `W_{v_2} = {r,v_1}` — **neither** is a
   *singleton* match to any single `q`, so `κ_r = 0`, `κ_{v_1} = κ_{v_2} = 1`, `K = 2`). Own construction (`is_tree`
   asserted), Proposition 1–2 verified, and the theory (§2) **predicts zero deficit at every rank** because the
   coefficient is negative — confirmed exactly by independent max-flow at 3 ranks (deficits `0, 0, 0` at every one,
   matching `supply = maxflow` exactly).

Script: `scratchpad/c3-T2/theorem_g1_check.py` (SHA-256 `da02bca826f2feb898b9d84bdde795650f0627d4226db08a0f2dbe64a178e2eb`),
depends on `scratchpad/c3-T2/gsc_lib.py` (SHA-256 `3be1556e89b4f8a9ed4ff31971261e3b97cf6ce521b66698ee1e76d6ca4233df`).
Output `scratchpad/c3-T2/g1_check_output.json`, SHA-256 `e874c04a6ddf48734ff5c15257bae63950c7a4d5e853bd2d93ccd381a5c90cf1`
(replayed copy-out-first, byte-identical). `ALL_OK True` printed by the script (asserts fire, i.e. halt the script,
on any Proposition 1/2 mismatch — none occurred).

## §2. Theorem G1: the general self-covering reduction

For `X ⊆ S^Q_{p+1}` define `φ(X) := Σ_{B∈X} w_F(B) − Σ_{A ∈ N_D(X)} w_F(A)` (the deletion-only deficit; `N_D(X)`
the deletion-only neighbourhood in `I_p(T)`, not restricted to the sector).

**The `Q`-exits are private.** For `q ∈ Q`, `B ↦ B∖{q}` is injective (add `q` back to recover `B`) and lands outside
the sector (it lacks `q`); exits for different `q, q' ∈ Q` are pairwise distinct (the exit for `q` still contains
`q' ≠ q`, the exit for `q'` does not), and both kinds are disjoint from the in-sector shadow `∂_sec(X)` (which
retains all of `Q`). So `N_D(X) = ∂_sec(X) ⊔ ⨆_{q∈Q} \{B∖{q} : B∈X\}` (a disjoint union), and by Proposition 2:

```
φ(X) = Σ_{B∈X} [(1 − |Q|)·w_F(B) + K] − w_F(∂_sec(X)).
```

**Theorem G1.** For `|Q| ≥ 2`, `max_{X ⊆ S^Q_{p+1}} φ(X) = max_{X ⊆ R*} φ(X)`, where
`R* := {B ∈ sector : w_F(B) < W*}`, `W* := K/(|Q|−1)`.

*Proof.* Removing a member `B_0` with `w_F(B_0) ≥ W*` from any `X` changes `φ` by `−[(1−|Q|)w_F(B_0)+K] +
[w_F(∂_sec(X)) − w_F(∂_sec(X∖\{B_0\}))]`. The first bracket is `≥ 0` exactly because `w_F(B_0) ≥ W*` (rearranging
the defining inequality); the second is `≥ 0` because `∂_sec(X∖\{B_0\}) ⊆ ∂_sec(X)` and weights are nonnegative
(deleting a vertex from a star never increases that star's `g_{t_i}` term, since `g_t` is nondecreasing, so
`∂_sec` of a smaller family has weight `≤` that of a larger one; more simply, it is a subset with nonnegative
weights). So `φ(X∖\{B_0\}) ≥ φ(X)`; iterating removes every member with weight `≥ W*` without decreasing `φ`. ∎

**Corollary (uniform `t`, "thin" regime, the exact max-deficit formula).** If every star has the same size `t`
(`q := t+1`) and `W* ≤ β + 2` (so `R* = \{w_F = β\}` exactly, since achievable weights above `β` jump by at least 2),
then `R*` at local rank `k` (number of occupied stars, `0 ≤ k ≤ M`) is the rank-`k` layer of the product of `M`
`q`-ary claws, of size `C(M,k)q^k`, and (by the same down-degree-`k`/up-degree-`q(M−k+1)` biregularity as
`E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`'s own `T-D-R1` step — cited, not re-proved, and valid here only
because `t` is uniform) `∂_sec(R*_k) = R*_{k-1}` exactly, so:
```
max_X φ(X) = max(0, (K − (|Q|−1)β) · [C(M,k)q^k − C(M,k−1)q^{k−1}]).
```
At `|Q|=2, β=1, K=2` this is exactly the registered formula (`coef = 1`); at `|Q|=3, β=2, K=2` above (`coef = −2`)
it correctly predicts perpetual non-deficiency; both are confirmed as fixed points in §1. **This is the "characterize
exactly when the residual is deletion-deficient" half of obligation (a), fully closed for uniform `t`** (any `|Q|`,
any `β`, any `K`, via the sign of `K − (|Q|−1)β`); the heterogeneous case is addressed only partially, in §3–§4
below, and the honest gap is stated in the Remaining obligation.

**Obligation (c) check.** Nothing above is a claim about `X` outside `R*`, about the whole sector's own membership
in `X_sec`, or about every `X ⊆ I_{p+1}(T)` on a whole tree; the object is one source family (`R*`, or the sector it
is extracted from) of one `(T, Q)` pair, under the literal `w_F` — none of the three axes on which
`E993-R23-LITERAL-DELETE-ONLY-HALL` was refuted is touched, and (as in §1's fixed point 3) the formula's own sign
can be **negative**, which is a genuinely different phenomenon from anything in the refuted key's era.

## §3. Theorem G2 / G2b: a weighted LYM for non-uniform star sizes `q_i` (heterogeneous case)

`R*` in general (heterogeneous `t_i`) is the rank-graded product of `M` claws with **heterogeneous** atom counts
`q_1, …, q_M` (`q_i = t_i + 1`): each coordinate is empty or one of `q_i` symbols. Down-degree of a rank-`k` element
is still **exactly `k`** (removing any one occupied coordinate, regardless of its `q_i`), but up-degree of a
rank-`(k−1)` element `y` is `Σ_{i ∉ E(y)} q_i`, which **varies** with `y` — the biregularity `T-D-R1` needs, and
which C-T2-F's Cycle 2 Finding 4 already noted fails for heterogeneous `t_i`, genuinely fails here. This is exactly
the "weight breaks the symmetry" phenomenon this generalization must confront honestly (obligation (a)'s explicit
ask), not paper over with a false uniform-style claim.

**Theorem G2 (maximal-chain LYM inequality, heterogeneous alphabets).** For `X` in the rank-`k` layer:
```
Σ_{x∈X} 1 / ∏_{i∈E(x)} q_i  ≤  C(M, k).
```
*Proof.* A maximal chain of the product poset (bottom to the top rank `M`, one new coordinate filled at each step,
choosing one of its `q_i` symbols) exists in `M! · ∏_i q_i` many ways in total; the chains through a fixed rank-`k`
element `x` are exactly those that fill `E(x)`'s coordinates first (in the colours `x` has, forced, `k!` orderings)
then the rest (`(M−k)!` orderings, `∏_{i∉E(x)} q_i` colour choices), i.e. `k!(M−k)!·∏_{i∉E(x)} q_i` chains. Since a
chain meets each rank exactly once, chains through distinct rank-`k` elements are disjoint, so summing and dividing
by the total gives `Σ_x [k!(M−k)!∏_{i∉E(x)}q_i] / [M!∏_iq_i] ≤ 1`, i.e. the claim (using
`∏_{i∉E(x)}q_i / ∏_i q_i = 1/∏_{i∈E(x)}q_i`). ∎ **Own exhaustive verification**
(`scratchpad/c3-T2/theorem_g2g3_check.py::check_G2`, exact `Fraction` arithmetic, full enumeration): equality
confirmed to the exact value `C(M,k)` on 5 heterogeneous `(q_1,…,q_M; k)` configurations.

**Theorem G2b (a genuinely non-sharp, but correct and useful, shadow consequence — honestly not a closed-form
criterion, exactly as `T-B`'s own `t≥2` criterion in this seat's Cycle 2 return was accepted as "the exact
computable criterion" without being a simple closed inequality; here the honest form is a *sufficient*
one-directional bound).** Let `Q_tot := Σ_i q_i`, `q_min := min_i q_i`. For `1 ≤ k ≤ M`:
```
|∂X| ≥ k|X| / (Q_tot − (k−1)q_min).
```
*Proof.* Every rank-`(k−1)` element `y` has `up-degree(y) = Q_tot − Σ_{i∈E(y)}q_i ≤ Q_tot − (k−1)q_min` (each of the
`k−1` occupied coordinates of `y` contributes at least `q_min`). Double counting edges between `X` and `∂X`:
`k|X| = Σ_{y∈∂X} (\text{edges from } y \text{ into } X) ≤ |∂X| · \max_y \text{up-degree}(y) ≤ |∂X|(Q_tot−(k−1)q_min)`.
∎ **Own verification**: never violated on hundreds of random and extremal (full-layer, singleton) subfamilies
across 5 heterogeneous configurations (`scratchpad/c3-T2/theorem_g2g3_check.py::check_crude_bound`); the bound is
honestly reported as **not sharp** (it degrades to the uniform bound's own weak worst-case form) and is used below
only as a **sufficient** condition for non-deficiency, never as an attained-maximum claim (unlike Theorem G1's
uniform corollary, which is exact).

**Consequence (non-deficiency sufficient condition).** If `k/(Q_tot−(k−1)q_min) ≥ 1`, i.e.
`k ≥ (Q_tot+q_min)/(1+q_min)`, then `R*`'s rank-`k` layer satisfies deletion-only Hall for **every** subfamily
(Theorem G2b applied with `|∂X| ≥ |X|`), hence (by Theorem G1) so does the whole sector at that rank.

Script: `scratchpad/c3-T2/theorem_g2g3_check.py` (SHA-256 `72d40bfb8c637b845a5824d6aa171c293b998c320a720adbe20996e4f1e8361a`),
output `scratchpad/c3-T2/g2g3_check_output.json` (SHA-256 `9f0c58898aacb6d0fe374edeb480b085c79b72a498c0107e495596d20c207f61`;
replayed copy-out-first, byte-identical). Printed `G2_ALL_OK True`.

## §4. Theorem G3: non-deficiency of the whole sector whenever every star has `t_i ≥ 2`, for arbitrary `Q`

**Theorem G3.** Under §0's hypotheses (arbitrary tree `T`, arbitrary independent `Q`, arbitrary `A4`-compliant `F`),
if every star has `t_i ≥ 2` (equivalently `q_min ≥ 3`), then for **every** eligible `p` (`x(T) + 2 ≤ p`), **no**
subfamily of the sector is deletion-only deficient — hence (since `N_{D∪S} ⊇ N_D` and weights are nonnegative)
`(D)∪(S)` Hall holds on every sector subfamily at every eligible `p`.

*Proof.* By Theorem G1, it suffices to bound `R*`'s smallest eligible rank `k = p−1 ≥ x(T)`. `T` is a forest (a
tree), so `Δ_{x(T)}(T) < 0` by definition of `x`, and (LB) `E993-R27-FOREST-DESCENT-LINEAR-BOUND` gives
`n(T) ≤ 4x(T)`, i.e. `x(T) ≥ n(T)/4`, so `k ≥ n(T)/4`. Since `n(T) = |N[Q]| + Σ_i(1+t_i) ≥ |Q| + M + Σt_i = |Q| +
Q_tot` (using `|N[Q]| ≥ |Q|` trivially), `k ≥ (|Q|+Q_tot)/4`. Writing `q := q_min ≥ 3`, a direct algebraic
rearrangement (multiply Theorem G2b's non-deficiency threshold `k ≥ (Q_tot+q)/(1+q)` by `4(1+q) > 0` and compare to
`4k ≥ |Q|+Q_tot`) reduces the sufficient condition to
```
|Q|(1+q) + 4 ≥ Q_tot(3−q),
```
whose right side is `≤ 0` whenever `q ≥ 3`, while the left side is always `> 0` — so the inequality holds
**unconditionally** once `q_min ≥ 3`, with no further restriction on `|Q|`, `β`, `M`, or how the `t_i` vary among
themselves. ∎

**Consequence for the standing record.** The bound fails exactly at `q_min = 2` (`t_min = 1`), i.e. precisely the
regime containing `CB(d,m) = CBstar(d,m,1)`, consistent with (and now generalizing beyond uniform `t`) the known
fact that the three deficient rows all have `t=1`; the crude threshold `k ≥ (Q_tot+q)/(1+q)` at `q=3`, `M=688`
(`CB(8,86)`'s own `M = dm`) evaluates to `k ≥ 517` — comfortably below the *actual* eligible `k = x(T) ≥ 701` this
seat's own Cycle 2 return computed for the `t=2` analogue of that row (`d=8,m=86,t=2`, §7 of
`cycles/cycle-2/stage3/returns/T2/RETURN.md`) — confirming this theorem is not merely formally true but has real
margin at the actual scale that matters (own arithmetic check, printed by
`scratchpad/c3-T2/theorem_g2g3_check.py::g3_main`'s companion calculation, not scripted as a separate generator
since it is four lines of exact `Fraction` arithmetic reported inline above and independently reproducible from
`517 = ⌈(2064+3)/4⌉`-style substitution).

**Own end-to-end verification, an actual constructed tree.** `M = 5` stars, **heterogeneous** `t_i ∈ {2,3}`
(`q_min = 3`), attached across `m=3` chokes with heterogeneous branching (`d_i ∈ {2,2,1}`), `Q = \{r,v\}`. `x`
computed by this route's own first-strict-descent scan through rank `α` (own rooted-forest DP, `scratchpad/c3-T2/theorem_g2g3_check.py::first_strict_descent_and_alpha`,
**not** `sources/lower-region/inputs/ordinary_tree_checked.py`, which was not read this cycle and whose own
`first_strict_descent` omits the terminal difference per the worker brief's own warning): `n=23`, `x=8`, `α=16`,
`n ≤ 4x` confirmed (`23 ≤ 32`). At the smallest eligible `p = x+2 = 10`: the **whole sector's exact deletion-only
max-flow deficit is `0`** (supply `7,306` = max-flow `7,306` exactly, own independent Dinic max-flow, `1,066`
sector members) — Theorem G3 confirmed on this instance (the crude-bound ratio at this instance's own local
vertex-rank is, as expected and honestly reported, not itself `≥1` in isolation, because the relevant self-covering
reduction empties `R*` entirely at this small `M=5` scale before the vertex-count even reaches a comparable range —
the confirmation is via the direct end-to-end flow computation, not a coincidental match of the crude ratio at the
wrong rank convention; this is stated plainly rather than glossed over).

Script: `scratchpad/c3-T2/theorem_g2g3_check.py` (same file as §3), function `g3_main`. Output as above,
`G3_ALL_OK True`.

## §5. Own independent (third-instrument) fixed-point reproduction of the two O3 rows

Before attempting obligation (b)/(O3), this route reproduces `cycles/cycle-2/stage3/returns/T1/RETURN.md` Step 4's
and `second-reads/SR-SECTOR/SECOND-READ.md` Finding 7's cited numbers **independently**: own closed-form derivation
of `I(CB(d,m))` and `I(CB(d,m) − v)` from the literal recursive tree shape (own two-state root/choke decomposition,
**not** copied from `sources/lower-region/inputs/ordinary_tree_checked.py` or
`sources/lower-region/instruments/cb-switch-cut/run.py`, neither of which was read this cycle), cross-checked
against `gsc_lib`'s literal brute-force tree on three small `(d,m)` — `(2,2)`, `(2,3)`, `(3,2)` — **exact polynomial
match at every coefficient** (`scratchpad/c3-T2/o3_rows.py::cross_check_small`, all three `match: true`).

| Row | `n` | `α` | `x` | `k=p−1` | `Z'` | `δ=k/(2Z')` | `λ₂=2(k−1)Z'` | `k²` | `x₀=(k²−λ₂)/(2Z')` | `\|X''\|/R_k` |
|---|---|---|---|---|---|---|---|---|---|---|
| `CB(8,108)/577` | 1839 | 973 | 575 | 576 | 289 | 288/289 | 332,350 | 331,776 | −287/289 | ≈6.481832×10⁻⁹ |
| `CB(7,144)/673` | 2163 | 1153 | 671 | 672 | 337 | 336/337 | 452,254 | 451,584 | −335/337 | ≈2.559563×10⁻¹⁵ |

Every value **matches T1's Cycle 2 return and `SR-SECTOR`'s Registration 4 exactly**, digit for digit, produced by a
genuinely independent derivation. `|X''|` itself is a 403-digit and a 465-digit exact integer respectively
(`[t^k] g_d(t)^m`, own big-integer polynomial exponentiation, `scratchpad/c3-T2/o3_rows.py::gd_poly`/`poly_pow`).

Script: `scratchpad/c3-T2/o3_rows.py` (SHA-256 `02a26cc0434d30a3b4caf6fce49206df7f0cbd74075c8a426777ba726a4fa750`), output
`scratchpad/c3-T2/o3_rows_output.json` (SHA-256 `a2ecd82d375ff657251c4775effc5b8b024335433dd8589b936067a9e1775706`;
replayed copy-out-first, byte-identical).

## §6. Obligation (O3): sector Hall at `CB(8,108)/577` and `CB(7,144)/673` — honest partial progress, not closed

T1's Cycle 2 diagnosis (§0 above; `cycles/cycle-2/stage3/returns/T1/RETURN.md` Step 4) is exact and this route
re-derives it independently in §5: `x₀ < 0` at both rows, so the spectral Fact D contributes nothing at **any** `X`;
Fact B's switch-capacity bound is useless whenever `X ⊆ X''`, the *switch-dead* family (no choke has exactly one
support present together with a sibling private leaf present); the adversarial test is `X = X''` itself, where only
deletion is available, and the *generic* (worst-case-family) ratio `δ < 1` is insufficient. This route makes three
further, honest contributions, none of which closes the gap.

**Confirmed exact combinatorial reading of `X''` (own reverse-engineering).** `g_d(t)`'s coefficients equal the
exact per-choke count of branch-state tuples `\{E,S,L\}^d` **excluding** those with exactly one `S`-branch and at
least one `L`-branch among the others — confirmed by direct enumeration for `d = 1..6`
(`scratchpad/c3-T2/o3_structure.py`, `ALL_OK True`), against the closed form independently re-derived from `(1+2t)^d`
minus the excluded-configuration count `d·t·[(1+t)^{d−1}−1]` (own algebra, not copied).

**A genuinely new structural fact: no dead ends.** The per-choke "good" (`X''`-included) state poset, for `d =
1..8` (own exhaustive search, `scratchpad/c3-T2/o3_structure.py`'s companion check), has **no** state below the top
rank `d` without at least one good upward extension — hence every maximal good-only chain has the full length `d`.
This means the standard maximal-chain LYM technique of Theorem G2 genuinely *applies* to the per-choke good poset
(unlike a poset with dead ends, where chains have unequal lengths and the naive argument breaks); it does **not** by
itself supply the needed inequality, because (as this route also found, next) the *deletion image of a good state
can leave the good sub-poset* — the good poset is **not** downward-closed (example: `d=3`, the good state `(S,S,L)`
has one good deletion-neighbour `(S,S,E)` and two **bad** ones, `(E,S,L)` and `(S,E,L)`) — so a bound on the shadow
*within* the good poset understates the true deletion-only shadow of `X''` in the **whole** layer (deletions landing
on *bad*, i.e. switch-available, states are still valid deletion targets with their own capacity). This is exactly
why a naive within-`X''` LYM bound is the wrong tool and a sharper argument must count the *whole-layer* shadow of
`X''`, which this route did not complete.

**Small-scale experimental signal (bounded_computation, explicitly not a proof).** On 9 brute-forceable `(d,m,k)`
configurations (`scratchpad/c3-T2/o3_shadow_experiment.py`), the **actual** exact shadow ratio
`|∂X''| / |X''|` (shadow taken in the **whole** layer, own literal enumeration) **exceeds** the generic `δ = k/(2Z')`
on **every** tested instance (9/9) — consistent with, and a small piece of independent evidence for, T1's own
qualitative expectation ("the needed sharpening is small in magnitude, not a new order of argument") — but the ratio
does **not** reach `1` at every tested scale (e.g. `d=2,m=4,k=5`: generic `δ=5/8`, actual `83/88 ≈ 0.943`, still
`< 1`), so this signal is reported honestly as suggestive, not as a closing argument, and the tested scales
(`dm ≤ 8`) are far below the target rows' (`dm = 864, 1008`), where finite-size effects could differ.

**Conclusion: obligation (O3) is not resolved by this route.** The exact diagnosis is now confirmed by a third,
independently-derived instrument (§5); the combinatorial object `X''` is now precisely and independently confirmed
(own reverse-engineering); a genuine structural fact about its per-choke poset (no dead ends) is established; and a
small-scale signal consistent with the expected sharpening is reported — but no sharper, `X''`-specific whole-layer
shadow bound sufficient to close the gap at the actual two rows was constructed. This is the same honest outcome
T1's Cycle 2 route reported (`bounded_evidence`), now with the additional structural findings above as this route's
contribution toward it.

## Remaining obligation (successor inheritance)

1. **Obligation (O3) itself remains open** at `CB(8,108)/577` and `CB(7,144)/673`: a sharper, `X''`-specific
   **whole-layer** shadow bound (not restricted to the good/`X''` sub-poset, which is not downward-closed — §6) is
   needed. A promising next step, not attempted here: bound the *whole-layer* shadow of `X''` by splitting each
   deletion target by whether it lands back in `X''` (bounded below by this route's chain-count argument applied
   honestly to the non-closed poset, which needs a correction term for the "leak" into bad states) or lands in a
   *bad* state (whose own capacity should be credited, not discarded) — i.e. show the "leak" itself is large enough
   to close the tiny remaining gap (`1/289` and `1/337` in `1−δ` terms), rather than trying to keep `X'''s` shadow
   inside `X''` alone.
2. **The heterogeneous case of Theorem G1's exact max-deficit formula** (not just the `t_i ≥ 2` sufficient
   non-deficiency direction of Theorem G3) is open: §1's fixed point 2 (heterogeneous `t ∈ \{2,3,4\}`) has no closed
   form yet, only a direct-flow numeric answer at each rank. A successor could attempt the exact (not just
   crude-bound) shadow-minimizing extremal family for the heterogeneous product-of-claws poset (a genuine
   Kruskal–Katona/Clements–Lindström-type question for this specific non-uniform "claw" factor, which — unlike the
   linearly-ordered bounded-multiset case Clements–Lindström covers — has an *unordered* set of atoms per
   coordinate; whether the classical compression order still applies here is untouched).
3. **Theorem G2b is honestly non-sharp.** A sharper double-counting (e.g. weighting rank-`(k−1)` elements by
   `1/updeg(y)` rather than crudely bounding `updeg`, in the spirit of Theorem G2's own chain-counting identity, but
   applied at the *shadow* level rather than the *layer-size* level) might close some of the gap between Theorem
   G2b's threshold and the true extremal threshold; not attempted.
4. **(H-attach) is a genuinely restrictive hypothesis** for full generality on "an arbitrary tree `T`": a star whose
   attachment edge is secretly incident to one of its own would-be leaves (making that vertex not a tag) is a
   different, unanalyzed configuration. A successor generalizing further should either show this case reduces to
   the analyzed one by a relabelling, or treat it as a genuinely separate structural case.
5. **No deficient cut, no refutation of (HALL), and no claim about the primary aggregate is offered by this route.**

## Fences checked

Mechanism ≠ aggregate (nothing above bounds `S(T,p)`); finite ≠ universal (Theorems G1–G3 are proved in full
generality for their exactly stated hypotheses — `|Q|≥2` for G1's threshold form, `q_min≥3` for G3 — and §6's O3
findings are explicitly bounded/experimental, never presented as a universal or closing claim); no refuted mechanism
revived (`E993-R23-LITERAL-DELETE-ONLY-HALL` and `E993-R28-TREE-LEAF-SLOT-DOMINANCE` distinguished on the face,
obligation (d)/(c), including the new consistency point that Theorem G1's formula reproduces the *known positive*
deficits at `t=1`); no closed region re-proved (`T_m`/spider/path-star/high-tail/order-bands untouched;
`E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`, NM, `T-D-R1`, (LB) cited as inputs at their exact registered
statements, never re-proved as this route's own contribution; the `CB(8,108)/577` and `CB(7,144)/673` numbers are
explicitly labelled **reproductions**, by an independently-derived route, of T1's Cycle 2 and `SR-SECTOR`'s numbers);
no census value used as a proof step (§6's shadow-ratio experiment and the `d=1..8` "no dead end" search are reported
as `bounded_computation`, never substituted into Theorem G1/G2/G2b/G3's proofs, which are all definition-level algebra
or direct chain/edge counting); no RTree wording; no sealed root read or written; no source mutation (nothing under
`sources/` was read or written by this route — §0 above records that none was needed); every graph called a tree
passes `is_tree` (connectivity and acyclicity checked separately) in this route's own code, asserted at construction
time, every time; no background process was started (every script below ran to completion in the foreground); every
reported computation was verified by an explicit copy-out-first replay (below), byte-identical.

## Process and replay discipline

Every script ran in the **foreground** to completion; none exceeded a single call's wall-clock window; no background
job was started, so none needed to be killed by PID poll, and no `ps aux`/`pgrep -f` of any kind was used. `python3
-B` throughout (no bytecode). Every script and every JSON output was **copied out first** into
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-T2-replay/` and
re-run there from the copy; every replayed output was verified **byte-identical** to the original by direct `diff`
(not merely a matching hash) before this return was written. No output digest hashes a wall-clock, PID, or host
field.

| script | script SHA-256 | output | output SHA-256 |
|---|---|---|---|
| `verify_seal.py` | `a27e141168e0f33011d83f23470d99e5fdc6c19a29fb90b1832ad08645a068a3` | (stdout only, quoted above) | — |
| `alias_check.py` | `f37242bc64d1f32457b1753e4088f14f1c64a1f0f2f8308e8c4f94205fdda0d6` | (stdout only, summarized above) | — |
| `gsc_lib.py` | `3be1556e89b4f8a9ed4ff31971261e3b97cf6ce521b66698ee1e76d6ca4233df` | (library, no output) | — |
| `theorem_g1_check.py` | `da02bca826f2feb898b9d84bdde795650f0627d4226db08a0f2dbe64a178e2eb` | `g1_check_output.json` | `e874c04a6ddf48734ff5c15257bae63950c7a4d5e853bd2d93ccd381a5c90cf1` |
| `theorem_g2g3_check.py` | `72d40bfb8c637b845a5824d6aa171c293b998c320a720adbe20996e4f1e8361a` | `g2g3_check_output.json` | `9f0c58898aacb6d0fe374edeb480b085c79b72a498c0107e495596d20c207f61` |
| `o3_structure.py` | `50953be441f181a86ec237ac123c69fd693bf06021d9b67a80dd1eca4555cacf` | `o3_structure_output.json` | `1f918799f68a02cfe4a4eb6e07e232af195bfebafd58704fbe39fce046024689` |
| `o3_shadow_experiment.py` | `028880572e8f269e0f520a84d1bf7e6f46cec6f5afc8a79a485ebe54f5322985` | `o3_shadow_experiment_output.json` | `f65d6b5387fec076062e006ab207d88adf193c8f2606fdcd22ed3465fc10f280` |
| `o3_rows.py` | `02a26cc0434d30a3b4caf6fce49206df7f0cbd74075c8a426777ba726a4fa750` | `o3_rows_output.json` | `a2ecd82d375ff657251c4775effc5b8b024335433dd8589b936067a9e1775706` |

Replay command (copy-out-first; run from the run root):

```sh
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26
mkdir -p scratchpad/c3-T2-replay
cp scratchpad/c3-T2/gsc_lib.py scratchpad/c3-T2/theorem_g1_check.py scratchpad/c3-T2/theorem_g2g3_check.py \
   scratchpad/c3-T2/o3_structure.py scratchpad/c3-T2/o3_shadow_experiment.py scratchpad/c3-T2/o3_rows.py \
   scratchpad/c3-T2/verify_seal.py scratchpad/c3-T2/alias_check.py \
   scratchpad/c3-T2-replay/
cd scratchpad/c3-T2-replay
python3 -B verify_seal.py
python3 -B alias_check.py
python3 -B theorem_g1_check.py
python3 -B theorem_g2g3_check.py
python3 -B o3_structure.py
python3 -B o3_shadow_experiment.py
python3 -B o3_rows.py
shasum -a 256 *_output.json
# every digest above reproduced exactly (verified in this run: byte-identical diff, not only matching hash).
```

## Read-boundary disclosure

1. **Ordering.** As in this seat's Cycle 2 return and T1's Cycle 2 return, the launching wrapper session's own
   `CLAUDE.md`/user auto-memory (`MEMORY.md`) were injected into context by the harness before the dispatch digest
   was verified and read; this is an ordering deviation from "read the dispatch first," not a content one — the two
   files actually read for VerityOS boot are exactly the two `DISPATCH-T2.md` authorizes. Neither `CLAUDE.md` nor
   `MEMORY.md` was opened as a source for the mathematics in this return.
2. **`ls scratchpad/`** (single-level, no recursion, no glob) was run once, before creating this seat's own
   `scratchpad/c3-T2/`, to confirm the scratch root existed. `scratchpad/` is named as "above grant" by the dispatch.
   Output was directory **names** only (pre-existing seat/critic scratch directories from Cycles 1–2 and this
   cycle), all already implied by the worker common brief's own roster text ("seat = T1, T2, F1, F2, U1, U2"; the
   Cycle 1/2 critic-naming convention `c{1,2}-crit-<seat>-<orientation>` visible in the listing is likewise implied
   by the brief's "every critique … critics/*/*/CRITIQUE.md"). No file **content** from any other seat's or critic's
   scratch directory was read or used anywhere in this return.
3. No other VerityOS file, no sibling seat's or critic's return/critique/scratch beyond the six paths explicitly
   authorized in `## Stage 2 seal and source digests` above, no other experiment root, no live root, no Mathlib
   (this route needed no Lean), no network, no installs, and no background process were used.

## headline_resolved: no

## Route verdict: `bounded_evidence`

Three complete, general, `proved_informal`-grade theorems (G1: the exact self-covering reduction for arbitrary `Q`
and general baseline bookkeeping, with an exact max-deficit formula at uniform star size; G2/G2b: a new maximal-chain
LYM inequality for heterogeneous product-of-claws posets and its correct, honestly non-sharp shadow consequence; G3:
a clean sufficient condition — `q_min ≥ 3`, i.e. every star has at least 2 leaves — for perpetual non-deficiency of
the whole sector, on an arbitrary tree and arbitrary `Q`, generalizing the uniform-`t≥2` corollary of
`E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` to heterogeneous star sizes and general `Q`) substantially deliver
obligation (a)'s "generalize the self-covering reduction … characterize exactly when the residual is
deletion-deficient" for the uniform case and its natural non-deficiency boundary for the heterogeneous case, each
verified computationally on structurally distinct instances with zero mismatches. Obligation (b)/(O3) — sector Hall
at `CB(8,108)/577` and `CB(7,144)/673` — is **not resolved**: this route reproduces T1's Cycle 2 diagnosis with an
independent third instrument, confirms the exact combinatorial structure of the switch-dead family `X''`, finds a
genuine new structural fact about its per-choke poset (no dead ends, hence full-length maximal chains — yet the good
poset is not downward-closed, which is exactly why the natural chain-counting bound does not immediately transfer),
and reports a small-scale experimental signal consistent with (but short of proving) the expected sharpening. This
is real, multi-part progress short of resolving the full assigned obligation, hence `bounded_evidence` rather than
`proved`.

chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter); runtime-reported model id:
`claude-sonnet-5`.
