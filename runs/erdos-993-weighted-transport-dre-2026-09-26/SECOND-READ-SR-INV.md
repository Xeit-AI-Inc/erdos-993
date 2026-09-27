# Second Read

Isolated second read `SR-INV`, r30 Cycle 1 (`erdos-993-math-dre-20260926-r30-weighted-transport`), Erdős #993, weighted
mixed-boundary transport. Date 2026-09-26. Statements: SR-5 (P4, the invariant-cut reduction and its key) and SR-6 (P16, the
support-move lemma, a route record).

**Boot.** I am operating within VerityOS. I read `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and no other VerityOS file. The subsystem loaded is `experiments/`,
limited to this read's sealed capsule. The harness injected the root `CLAUDE.md` and the user auto-memory index into context at
session start. I did not open either as a source, and nothing below relies on them.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

**Capsule.** `control/c1-second-read/SR-INV-PACKET-MANIFEST.json`, stage `cycle-1-second-read-SR-INV`, 15 members. I recomputed
SHA-256 over the canonical JSON without `seal_sha256` (`sort_keys`, separators `(",", ":")`, no trailing newline):
**`33cb99e78c70ae9838e5d0232b74633363dab83cd8ae53743d550e2a848cc8ff`**, equal to the recorded seal (prefix `33cb99e78c70ae98`).
All 15 members match their SHA-256 and byte counts, with 0 mismatches (`scratchpad/c1-sr-SR-INV/seal_check.py`):

| member | sha256 (prefix) | bytes |
|---|---|---|
| `SEMANTIC-CONTRACT.md` | `ee7ca2e2…` | 17018 |
| `SOLUTION-CONTRACT.md` | `3168e7a1…` | 13035 |
| `control/C1-SECOND-READ-BRIEF-SR-INV.md` | `baf32c16…` | 3599 |
| `control/C1-SECOND-READ-PROTOCOL.md` | `1f7ef6b1…` | 3338 |
| `control/C1-STAGE6-CONTROLLER-FACTS.json` | `91546889…` | 7074 |
| `control/C1-STAGE6-PACKET-MANIFEST.json` | `00b5c467…` | 5681 |
| `control/CLAIM-IDENTITY.run-local.json` | `86f94811…` | 2409146 |
| `control/PATH-CHECK-c1-second-read-briefs.json` | `7910d946…` (0 findings) | 527 |
| `control/SOURCE-DIGESTS.json` | `e82494df…` | 232777 |
| `cycles/cycle-1/stage3/returns/U1/RETURN.md` | `2f74c265…` | 36305 |
| `cycles/cycle-1/stage4/critics/U1/F/CRITIQUE.md` | `b17625c9…` | 30742 |
| `cycles/cycle-1/stage4/critics/U1/T/CRITIQUE.md` | `40a7532e…` | 31892 |
| `cycles/cycle-1/stage5/adjudicators/U/ADJUDICATION.md` | `e461798e…` | 47515 |
| `cycles/cycle-1/stage6/SYNTHESIS.md` | `339a208e…` | 53703 |
| `sources/authority/CLAIM-IDENTITY.json` | `eba20be3…` | 2624107 |

I did not open `control/C1-STAGE6-PACKET-MANIFEST.json` or `control/SOURCE-DIGESTS.json` beyond hashing them; no statement below
depends on their contents.

**Read boundary and disclosures.**
- Read: the two boot files, the protocol, the brief, the manifest, and the capsule members above. Both registries were parsed in
  code only to print the (LIFT), (HALL) and (WID) rows and to run an alias scan over key names and statements
  (`alias_scan.py`).
- **Disclosure 1.** Before reading the protocol I ran one non-recursive `ls` of the run root, `control/` and
  `control/c1-second-read/` to locate the protocol and my brief. That listing is above the capsule members. I opened nothing it
  showed outside the capsule.
- **Disclosure 2.** When taking digests at close, one non-recursive `ls` of `second-reads/` showed a sibling directory name
  (`SR-NET`). I did not open it.
- **Disclosure 3.** The harness saved the oversized C-U1-T critique output into its session tool-results store, which is outside
  the run root. I did not read that copy; I read the capsule member in place.
- No Mathlib or Lean source was needed (no Lean API meaning enters either statement). No `lake`/`lean`, no network, no installs,
  no `find`/`grep`/`rg` above the capsule members, no background job. Python standard library and exact integers only, run
  with `PYTHONDONTWRITEBYTECODE=1`. No sealed member was edited.

**Frozen definitions used.** SEMANTIC-CONTRACT §1.1–1.2, with controller erratum R30-E-b (CF6-1) applied: a tag `v ∈ F ∩ B` is
active iff `(B ∖ {v}) ∩ W_v ≠ ∅`, `W_v = N(s_v) ∖ {v}`. The contract's shortcut `= B ∩ N(s_v)` is wrong because `v ∈ N(s_v)`.
My instrument implements the W-form.

**(LIFT), read verbatim from `sources/authority/CLAIM-IDENTITY.json`** (the run-local copy is identical).
`E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT`, status VERIFIED, `evidence_grade` `proved_informal_adjudicated_no_formal_award`,
`novelty_claimed: false`:

> Let a finite group act on two finite sets U,V and preserve a relation R subset U times V and nonnegative integer supplies s on
> U and capacities c on V, with s(g.u)=s(u) and c(g.v)=c(v) for every group element g. Form an orbit network with source supply
> sum_{u in A}s(u) at each U-orbit A, target capacity sum_{v in B}c(v) at each V-orbit B, and an uncapacitated edge A to B
> exactly when R meets A times B. If this quotient network has an integral flow saturating every source supply, then the
> original R network has an integral flow saturating every supply s(u) and respecting every capacity c(v).

Scope (verbatim): "Generic finite invariant relation; weights must be invariant and nonnegative integers, and orbit
supplies/capacities are totals. Does not assert feasibility of any particular quotient. T_m orbit formulas and three bounded
primal applications are evidence of applicability, not an all-parameter flow-feasibility theorem."

**Alias scan** (both registries, 434 master and 435 run-local claims). None of the three candidate names
(`E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`, `E993-R30-TRANSPORT-HALL-IFF-INVARIANT-QUOTIENT-HALL`,
`E993-R30-INVARIANT-DEFICIENT-CUT-REDUCTION`) is registered. The only registered claim whose name or statement concerns orbit
quotients, invariant cuts or supermodular maximizers is (LIFT). The other two name hits (`E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER`
and `E993-C3-CB8-92-ORDINARY-RANK-SCOPE-CERTIFICATE`) are unrelated.

## Statements read

- **SR-5 (P4; synthesis Registration 3).**
  - Sources: synthesis `## Exact established results` P4 and `## Reconciliation` R8; U1 RETURN §4.1–4.7; C-U1-T A3 and A4 with
    its proposed registration text; C-U1-F A3 and A4, its canonical-cut advance and its proposed registration text; the U
    adjudication (U1 decision, Cross-route reconciliation item 1, Established results (B), and Lean readiness award group 2).
  - Claim: supermodularity of `φ(X) = Σ_X w − Σ_{N(X)} w`; the maximizer lattice; the invariant maximizer and the canonical cuts
    `X_min` and `X_max`; Hall ⇔ Hall on unions of orbits ⇔ quotient Hall; automatic `Aut(G)`-admissibility and
    `Aut(G)`-invariance of `F_p(G)`; if (HALL) fails at `(T, p)`, it fails on an `Aut(T)`-invariant family of positive-weight
    sources.
  - Proposed key: `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`, with `novelty_claimed` limited to the (⇒) converse,
    automatic `Aut`-admissibility, invariance of `F_p` and the canonical cuts.
  - Proposed side effects: a `CLAIM-DISTINCTIONS` row against (LIFT), and a scope note on (LIFT) reading "(⇐) direction; see
    the r30 INV key for the converse".
- **SR-6 (P16; synthesis Registration 13, "Not registered").**
  - Sources: synthesis P16; U1 RETURN §6; C-U1-T A1 and A2; C-U1-F A1 and A2; the U adjudication (Cross-route reconciliation
    items 3–4).
  - Claim, with `F` degree-one tags, `B` independent and `v ∈ F ∩ B`:
    - (a) `(B ∖ {v}) ∪ {s_v}` is independent iff `v` is inactive in `B`;
    - (b) if so, the weight changes by `#{t ∈ (F ∩ B) ∖ {v} : t inactive in B, s_t ~ s_v} ≥ 0`.
  - Ruling under review: a route record, not a key.

## Independent re-derivation

### SR-5: the reduction theorem, from the definitions

**Setting.** `U`, `L` are finite sets, `R ⊆ U × L`, `s : U → ℕ` and `c : L → ℕ`. For `X ⊆ U`, write
`N(X) = {A : ∃ B ∈ X, (B, A) ∈ R}` and `φ(X) = s(X) − c(N(X)) ∈ ℤ`.

**(a) Supermodularity.**
- `N(X ∪ Y) = N(X) ∪ N(Y)` and `N(X ∩ Y) ⊆ N(X) ∩ N(Y)`.
- Hence, using `c ≥ 0` at the inclusion:
  `c(N(X∪Y)) + c(N(X∩Y)) ≤ c(N(X) ∪ N(Y)) + c(N(X) ∩ N(Y)) = c(N(X)) + c(N(Y))`.
  (This is U1's coverage-indicator argument in one line.)
- `s(·)` is modular, so `φ(X∪Y) + φ(X∩Y) ≥ φ(X) + φ(Y)`.
- The only sign hypothesis used is `c ≥ 0`. No natural-number subtraction occurs: `φ` lives in ℤ.

**(b) Lattice.**
- Let `M = max φ`, which is attained because the domain is finite. It satisfies `M ≥ φ(∅) = 0`.
- If `φ(X) = φ(Y) = M`, then (a) gives `φ(X∪Y) + φ(X∩Y) ≥ 2M`, and each term is at most `M`. So both equal `M`.
- By finiteness, `X_min := ⋂{maximizers}` and `X_max := ⋃{maximizers}` are maximizers.

**(c) Invariance and canonical cuts.**
- A network automorphism is a pair of bijections `(σ_U, σ_L)` with `(B, A) ∈ R ⇔ (σB, σA) ∈ R`, `s∘σ_U = s` and `c∘σ_L = c`.
- It satisfies `N(σX) = σN(X)`, so `φ(σX) = φ(X)`. It therefore permutes the finite set of maximizers, and fixes their
  intersection `X_min` and their union `X_max`.
- A finite group `Γ` preserving `R`, `s` and `c` acts through network automorphisms. So `X_min` is `Γ`-invariant.
- U1's translate intersection `⋂_γ γX₀` is also an invariant maximizer (reindex `γ' = δγ`). But it can retain zero-weight
  sources (take `X₀ = X_max`), so the "positive-weight" clause must be carried by `X_min`.
- `X_min = ∅ ⇔ M = 0`: if `M = 0` then `∅` is a maximizer; if `X_min = ∅` then `M = φ(∅) = 0`.
- **Private targets of `X_min`.** For `B ∈ X_min`, the set `X_min ∖ {B}` is not a maximizer, since it does not contain `X_min`.
  So `0 < φ(X_min) − φ(X_min ∖ {B}) = s(B) − c(N(B) ∖ N(X_min ∖ {B}))`. The subtracted term is `≥ 0`, so `s(B) ≥ 1`.
- **Characterization of `X_max`.** If `N(B) ⊆ N(X_max)`, then `φ(X_max ∪ {B}) ≥ M`, using `s ≥ 0`. So `X_max ∪ {B}` is a
  maximizer and `B ∈ X_max`. The converse is immediate. Hence `X_max = {B : N(B) ⊆ N(X_max)}`.

**(d) Equivalences for a finite group `Γ` preserving `R`, `s`, `c`.** Write (A) for "Hall holds for every `X ⊆ U`", (B) for "Hall
holds for every `Γ`-invariant `X`", and (C) for "the orbit quotient satisfies Hall".
- **(A) ⇒ (B)** is trivial.
- **(B) ⇒ (A).** If (A) fails, then `M > 0` and the invariant `X_min` has `φ = M > 0`, so (B) fails.
- **(B) ⇔ (C).** Let `X` be invariant. Then `N(X)` is invariant, because `N(γX) = γN(X)`.
  - A target orbit `O′` is joined in the quotient to an orbit inside `X` ⇔ `R` meets `X × O′` ⇔ `O′` meets `N(X)` ⇔ `O′ ⊆ N(X)`
    (by invariance).
  - Invariant sets `X` correspond bijectively to sets of source orbits. The orbit totals then sum to exactly `s(X)` and
    `c(N(X))`.
  - So the quotient inequality at the orbit set of `X` is literally the inequality of (A) at `X`. This is the step U1 left
    implicit; both critics filled it, and I confirm it.
- **Flow form.** Both networks have nonnegative integer supplies and capacities. The finite capacitated Hall theorem (integral
  max-flow/min-cut, or Hall on the clone expansion) turns each Hall condition into "an integral flow saturating every supply
  exists". So the original network has a saturating integral flow iff the quotient does.

**(e) The r30 transport network (Part (iii)).** Let `γ ∈ Aut(G)` for a finite simple graph `G`.
- **Layers.** `γ` preserves adjacency and non-adjacency, so `γ(I_j(G)) = I_j(G)`.
- **Leaves and witness sets.** `γ` maps degree-one vertices to degree-one vertices, with `s_{γv} = γ(s_v)`. Hence
  `W_{γv} = N(γ s_v) ∖ {γv} = γ(W_v)`, and `(γB ∖ {γv}) ∩ W_{γv} = γ((B ∖ {v}) ∩ W_v)`.
- **Weights.** If `γF = F`, then `F ∩ γB = γ(F ∩ B)`. So the active set of `γB` is `γ` of the active set of `B`, and
  `w_F(γB) = w_F(B)`.
- **(D).** `A = B ∖ {q}` ⇔ `γA = γB ∖ {γq}`.
- **(S).** `u ∉ B`, `|N(u) ∩ B| = 2` and `A = (B ∖ N(u)) ∪ {u}` hold ⇔ `γu ∉ γB`, `|N(γu) ∩ γB| = |γ(N(u) ∩ B)| = 2` and
  `γA = (γB ∖ N(γu)) ∪ {γu}` hold. The reverse direction applies `γ⁻¹`.
- **Invariance of `F_p`.** `γ` bijects the independent `k`-sets avoiding `v` onto those avoiding `γv`, so
  `indepSetCount G {v} k = indepSetCount G {γv} k` for every `k`. Therefore `Δ_p(G − v) = Δ_p(G − γv)` and `γ(F_p(G)) = F_p(G)`.
  This holds at every `p`, with no tree, eligibility or `p ≥ 1` hypothesis.
- **Consequence.** For `F = F_p(G)`, every `Γ ≤ Aut(G)` is admissible. For a general `F`, exactly the subgroups of the stabilizer
  `{γ ∈ Aut(G) : γF = F}` are admissible.
- **Application to (HALL).** If `WeightedHall G (F_p(G)) p` fails, then `X_min` is a nonempty `Aut(G)`-invariant deficient
  family whose members all have `w_F ≥ 1`.

**(f) Which direction is (LIFT)?**
- (LIFT)'s hypotheses are exactly those of (d): a finite group, an invariant relation, invariant nonnegative integer weights,
  orbit totals, and an orbit arc iff `R` meets the product.
- Its conclusion is "a saturating integral quotient flow ⇒ a saturating integral original flow".
- Under the capacitated Hall theorem on both networks, that implication is equivalent to (C) ⇒ (A).
- **So the (⇐) direction of the biconditional is exactly (LIFT) in Hall form.** The r30 proof of it (the invariant maximizer) is
  a re-derivation, not new content.
- SEMANTIC-CONTRACT §1.2 already names the (⇒) direction as (LIFT)'s "elementary" converse, which "may be used once stated".
  It also attributes the existence of an invariant deficient cut to "the supermodular-maximizer argument of its proof".
- C-U1-T A3 and C-U1-F A3 quote and read the (LIFT) text the same way. I confirm their reading against the registry row
  verbatim.
- U1's reading that (LIFT) "explicitly disclaims (⇒)" is wrong. The scope sentence disclaims only the feasibility of any
  particular quotient.

**Instrument** (`scratchpad/c1-sr-SR-INV/sr_inv.py`; `bounded_computation`, a check on a proof, never a proof).
- **Section C: 60 transport networks.** Stars `K_{1,3..5}`; `P_6` (U1's toy); a double star; a 3×2 spider; `C_4` with pendants;
  `2K_2 + P_3`, which has `K_2` components, so both ends are tags; and random graphs and trees with nontrivial automorphisms.
  `F` is either all degree-one vertices or `F_p`, at `p ≤ 4`. 32 of the networks are deficient.
  - `Aut(G)` is computed by brute force.
  - `F_p`, `w_F` and (D) ∪ (S) are asserted invariant or equivariant at every `p ≤ min(α, 6)`, and (WID) is asserted where
    `p ≥ 1`.
  - Supermodularity: exhaustive over all pairs where `|I_{p+1}| ≤ 12`, 200,000 random pairs otherwise; 0 violations.
  - The maximizer lattice is closed.
  - `X_min` and `X_max` are maximizers and `Aut`-invariant. `X_min = ∅ ⇔ M = 0`. Every member of `X_min` strictly
    out-supplies its private targets, and the `X_max` characterization holds.
  - The translate intersection is an invariant maximizer.
  - Hall ⇔ orbit-union Hall ⇔ quotient Hall holds on every network. The quotient is built independently from orbit totals
    with "arc iff some member pair related".
  - Integral max-flow saturates on the original network iff it saturates on the quotient, and Gale's defect identity
    `maxflow = supply − max φ` holds on both.
  - All 60 rows pass. Example: `P_6`, `p = 1`, `F` = both leaves gives supply 2, capacity 0, `max φ = 2`, quotient maximum 2,
    and 524,800 exhaustive pairs with 0 violations. This reproduces U1's toy `max φ = 2`.
- **Section D: 150 abstract networks** with a cyclic group acting on both sides (130 with nontrivial orbits, 102 deficient).
  Every check passes.
- **`sr_inv_eligible.py`.** For every eligible free tree of orders 11–12, `Aut(T)`-invariance of `F_p`, `w_F` and (D) ∪ (S) is
  asserted.
  - Free-tree counts 1–12 match A000055: `1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, 551`.
  - There are 5 eligible rows at order 11 and 34 at order 12, which agrees with erratum R30-E-a.

### SR-6: the support-move lemma, from the definitions

**Setting.** `G` is a finite simple graph, `F` a set of degree-one vertices, `B` independent, `v ∈ F ∩ B`, `s = s_v`, and
`B′ = (B ∖ {v}) ∪ {s}`. Since `v ∈ B` and `s ~ v`, `s ∉ B`, so `|B′| = |B|`.

**(a)** `B ∖ {v}` is independent. `B′` is independent iff `s` has no neighbour in `B ∖ {v}`, that is, iff
`(B ∖ {v}) ∩ N(s) = ∅`. Since `v ∉ B ∖ {v}`, this is `(B ∖ {v}) ∩ W_v = ∅`: `v` is inactive in `B`.

**(b)** Assume `v` is inactive. Then `F ∩ B′ = ((F ∩ B) ∖ {v}) ∪ ({s} ∩ F)`.
- **The removed tag.** `v` contributed 0, being inactive.
- **The added vertex.** If `s ∈ F` (only when `{v, s}` is a `K_2` component), then `N(s) = {v}`, so `W_s = ∅` and `s` is
  inactive in `B′`.
- **No sibling of `v` lies in `B`.** Take `t ∈ (F ∩ B) ∖ {v}`. If `s_t = s`, then `t ∈ (B ∖ {v}) ∩ N(s)`, contradicting (a).
  So `s_t ≠ s`, and `v ∉ W_t`, because `v`'s only neighbour is `s`.
- **The change for each other tag.** Since `B′ ∖ {t} = ((B ∖ {t}) ∖ {v}) ∪ {s}`:
  `(B′ ∖ {t}) ∩ W_t = ((B ∖ {t}) ∩ W_t) ∪ ({s} ∩ W_t)`.
  - A tag active in `B` stays active.
  - An inactive tag becomes active iff `s ∈ W_t`, that is, iff `s ~ s_t` (`s ≠ t` because `t ∈ B`).
- **Conclusion.** `w_F(B′) = w_F(B) + #{t ∈ (F ∩ B) ∖ {v} : t inactive in B, s_t ~ s_v}`. This is an identity in ℕ, with no
  subtraction.

**U1 §6 is false.** Its inference "`|F ∩ B′|` ≤ `|F ∩ B|`, hence the active weight can only stay the same or drop" conflates
presence with activity (SOLUTION-CONTRACT §3.3). Where the move is defined, the weight never decreases, and it can strictly
increase.

**Witness rebuilt from the critique text** (C-U1-T A1).
- **Tree.** Edges `0–1`, `0–2…6`, `1–7`, `1–8`, `1–9`, `7–10`, `7–11`. It has `n = 12` and passes `|E| = n − 1` plus BFS
  connectivity.
- **Row.** Computed by my instrument (explicit enumeration of all independent sets; `x` scanned through rank `α` with
  `i_{α+1} = 0`):

  | n | i_0..i_10 | α | x | p | eligible | F = F_6(T) | supply | capacity | S |
  |---|---|---|---|---|---|---|---|---|---|
  | 12 | 1, 12, 55, 134, 201, 197, 126, 50, 11, 1, 0 | 9 | 4 | 6 | yes (`6 ≤ 6`, `18 < 19`) | {2,3,4,5,6,8,9,10,11} | 308 | 630 | −322 |

  (WID) is asserted: `308 − 630 = −322 = Σ_F [q_v(6) − q_v(5)]`.
- **The move.**
  - Take `B = {2,3,4,5,6,9,11}` and `v = 9`, so `s_v = 1` and `W_9 = {0, 7, 8}`.
  - `(B ∖ {9}) ∩ W_9 = ∅`, so tag 9 is inactive.
  - `B′ = {1,2,3,4,5,6,11}` is independent.
  - `w(B) = 5`: tags 2–6 are active through each other; 9 and 11 are inactive.
  - `w(B′) = 6`: tag 11 (`s_11 = 7 ~ 1`) becomes active. The predicted gain is 1.
- **Other witnesses, also reproduced.**
  - C-U1-F's order-14 witness: `α = 9`, `x = 4`, `p = 6`, `F = {0,4,5,8,9,10,11}`, supply 290, capacity 627, `S = −337`;
    `B = {4,5,6,8,9,10,11}`, `v = 8`, `w` goes `4 → 5` (tag 11 activates).
  - U1's `CB(1,3)` witness: `B = {3,5}`, `v = 5` active through `W_5 = {3}`, and `B′ = {3,4}` is not independent. This is an
    instance of (a).
  - C-U1-T's support-shift `φ` witness on the order-12 tree: `N(X)` has 7 targets of total weight **30** (not the 36 printed in
    C-U1-T), and `φ` goes `−25 → −34`. This confirms the U adjudicator's literal correction.
- **Sweeps.**
  - `sr_inv.py` section B: 800 graphs (random trees of orders 4–12 and random general graphs to order 10, 171 of them with an
    added `K_2` component). `F` is all degree-one vertices, a random subset, or `F_p` at every eligible `p` found. Of 210,939
    `(B, v)` cases, 0 fail (a) or (b) and 14,085 are strict increases.
  - `sr_inv_eligible.py`: every eligible `(T, p)` of orders 11–12 (39 rows), `F = F_p(T)`. Of 101,041 cases, 0 fail and 2,775
    are strict increases.

## Findings and repairs

**SR-5: the mathematics is confirmed. The registration needs five repairs.**
1. **The novelty scope is narrowed further.**
   - The synthesis limits `novelty_claimed` to four items: the (⇒) converse, automatic `Aut`-admissibility, invariance of `F_p`,
     and the canonical cuts.
   - The (⇒) converse cannot carry a bare novelty claim. SEMANTIC-CONTRACT §1.2, a frozen definition of this run, already
     names it as (LIFT)'s elementary converse. The same text attributes the existence of an invariant deficient cut to the
     supermodular-maximizer argument of (LIFT)'s proof, which is Codex C6-T5's argument.
   - Registry practice records such items as "Elementary; new as …". The repaired text is under `## Registration text`: the
     converse is recorded as elementary and first written on an r30 face, not as new.
   - Genuinely new in-run content: Part (iii), the automatic `Aut(G)`-admissibility of the r30 active-weight two-for-one
     network, including the `Aut(G)`-invariance of `F_p(G)`; and the canonical-cut form (`X_min`, `X_max` with their
     properties). The canonical cuts are standard lattice facts about maximizers of a supermodular function, new as stated
     for this network.
2. **The group hypothesis must be stated for a general `F`.** With the scope widened to every set `F` of degree-one tags,
   admissibility requires `γF = F`. "Every `Γ ≤ Aut(G)`" is correct only for `F = F_p(G)`, or for another `Aut(G)`-invariant
   `F`. The registered text states both.
3. **The positive-weight clause belongs to `X_min`.**
   - "If (HALL) fails, it fails on an `Aut(T)`-invariant family of positive-weight sources" is true because of `X_min`.
   - It is not true of an arbitrary invariant maximizer. U1's `⋂_γ γX₀` may contain zero-weight sources.
   - Separately, the brief's clause (c) hypothesis "if `max φ > 0`" is unnecessary for existence (`∅` is invariant when
     `M = 0`). It is harmless and is dropped.
4. **The scope note on (LIFT) must name the key exactly and say "flow form".** "(⇐) direction; see the r30 INV key for the
   converse" names no key: "INV key" is a template label, not a key. It is replaced by the exact text below.
5. **The active-tag test is written in W-form** (erratum R30-E-b), never as `B ∩ N(s_v) ≠ ∅`.

**Ruling on the key.**
- **(⇐) is exactly (LIFT) in Hall form.** It is (C) ⇒ (A), equivalent to (LIFT) under the capacitated Hall theorem on both
  networks, with identical hypotheses. The distinction row says so, and the (LIFT) scope note reads as below.
- **`E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` is a predicate the statement satisfies.**
  - "WEIGHTED-HALL" names the (HALL-COND) predicate `WeightedHall G F p`, not the OPEN key.
  - "IFF … QUOTIENT-HALL" is the proved biconditional.
  - "AUT-ORBIT" holds with `Γ = Aut(G)` for `F = F_p(G)`, and with the stabilizer of `F` in general (repair 2).
  - The name asserts no feasibility and no instance of (HALL).
- C-U1-T's `E993-R30-TRANSPORT-HALL-IFF-INVARIANT-QUOTIENT-HALL` is also a valid predicate. The synthesis's choice of ONE key is
  within contract (CF6-5(ii)). The retired names are recorded as `aliases` so that later alias checks catch them.
- **It is not an alias of (LIFT).** It adds the converse, the canonical cuts and Part (iii).
- **Grade: `proved_informal`.** It is not a restricted-scope (HALL) theorem and not a mechanism, and it revives no refuted key.

**Fences checked.**
- The theorem decides no instance of (HALL).
- The quotient's feasibility is never supplied by the lift. Neither direction asserts that any quotient is feasible.
- There is no RTree wording.
- The primary aggregate is untouched.
- No census value or instrument output enters the proof.
- No natural-number subtraction: `φ ∈ ℤ`. The adjudicator's Lean draft `exists_aut_invariant_deficient_of_not_weightedHall`
  compares ℕ sums with `<`, and no `p − 1` occurs.

**SR-6: confirmed, with textual repairs only.**
- The synthesis row P16 lists only "finite simple graph" as its hypothesis. The statement must carry:
  - `F` a set of degree-one vertices;
  - `B` independent;
  - `v ∈ F ∩ B`;
  - "inactive in `B`" in W-form;
  - that the change is an ℕ identity.
- The general-graph form (C-U1-F; it covers `s_v ∈ F` on a `K_2` component) supersedes C-U1-T's tree form (`n ≥ 3`); both are
  attributed.
- U1 §6's opposite claim is false, as verified above.
- **The route-record ruling is confirmed.** P16 closes no identified part of (HALL) or of the budget (SOLUTION-CONTRACT §1, Tier
  2). Supply monotonicity under the support move does not give `φ`-monotonicity: the capacity `c(N(·))` can grow through new
  switch arcs at `s_v`, as the reproduced shift witness `φ −25 → −34` shows. Its standing role is diagnostic: it corrects U1 §6
  and records why the support compression fails.

**Observation (not registered; first made here, so it would need its own read).** From (d), the maximal deficiency of the
original network equals that of any admissible orbit quotient. My instrument agrees on all 210 networks. It is noted for the
Cycle 2 U route only.

## Registration text

**R-SR5-1. New key** (register verbatim; run-local, then master at the close per the controller's practice).

```text
claim_key: E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL
status: VERIFIED
evidence_grade: proved_informal
formal_award: false
statement: (INV) (i) Let U, L be finite sets, R ⊆ U × L, s : U → ℕ, c : L → ℕ; for X ⊆ U let N(X) = {A ∈ L : (B, A) ∈ R for
  some B ∈ X} and φ(X) = Σ_{B∈X} s(B) − Σ_{A∈N(X)} c(A) ∈ ℤ. Then φ is supermodular; its maximizers are closed under ∪ and ∩;
  X_min = ⋂{maximizers} and X_max = ⋃{maximizers} are maximizers and are fixed by every pair of bijections (σ_U, σ_L) with
  (B, A) ∈ R ⇔ (σ_U B, σ_L A) ∈ R, s∘σ_U = s and c∘σ_L = c; X_min = ∅ iff max φ = 0; every B ∈ X_min satisfies
  s(B) > Σ_{A ∈ N(B) ∖ N(X_min ∖ {B})} c(A) ≥ 0; and X_max = {B ∈ U : N(B) ⊆ N(X_max)}.
  (ii) If a finite group Γ acts on U and on L preserving R, s and c, the following are equivalent: (a) Σ_{B∈X} s(B) ≤
  Σ_{A∈N(X)} c(A) for every X ⊆ U; (b) the same for every Γ-invariant X (every union of Γ-orbits); (c) the Γ-orbit network —
  supply Σ_{B∈O} s(B) at each U-orbit O, capacity Σ_{A∈O'} c(A) at each L-orbit O', an uncapacitated arc O → O' exactly when R
  meets O × O' — satisfies the same inequality for every set of source orbits. Equivalently (finite capacitated Hall theorem
  with integrality, on both networks): the original network has an integral flow saturating every supply and respecting every
  capacity iff the orbit network has one.
  (iii) For every finite simple graph G, every p ∈ ℕ and every set F of degree-one vertices (s_v the unique neighbour of v,
  W_v = N_G(s_v) ∖ {v}, w_F(B) = #{v ∈ F ∩ B : (B ∖ {v}) ∩ W_v ≠ ∅}), every γ ∈ Aut(G) with γ(F) = F maps I_j(G) onto I_j(G),
  preserves the deletion/two-for-one relation (D) ∪ (S) from I_{p+1}(G) to I_p(G) in both directions, and satisfies
  w_F(γB) = w_F(B); and γ(F_p(G)) = F_p(G) for every γ ∈ Aut(G) and every p. Hence (i)–(ii) apply to the r30 transport network
  with Γ any subgroup of {γ ∈ Aut(G) : γF = F}; for F = F_p(G), with any Γ ≤ Aut(G), in particular Γ = Aut(G):
  WeightedHall(G, F_p(G), p) holds iff the Aut(G)-orbit quotient satisfies weighted Hall, and if WeightedHall(G, F_p(G), p)
  fails then X_min is a nonempty Aut(G)-invariant deficient family whose every member has w_F ≥ 1 and strictly out-supplies
  its private targets.
scope: (i)–(ii) any finite bipartite relation with nonnegative integer weights (invariance of R, s, c required in (ii));
  (iii) every finite simple graph, every rank p, every set of degree-one tags — no tree, eligibility or F = F_p hypothesis
  except where stated. A reduction, not a feasibility result: it decides no instance of E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL
  (OPEN), asserts the feasibility of no quotient, and is not a restricted-scope (HALL) theorem. The direction (c) ⇒ (a) of
  (ii), in flow form, is the registered E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT; (LIFT) never supplies quotient
  feasibility. Ordinary graphs only; no governed RTree assertion (bridge E993-G1-ORDINARY-RTREE-TRANSPORT OPEN).
  E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE is untouched.
novelty_claimed: "Limited; elementary throughout. None for (ii)'s (c) ⇒ (a): it is (LIFT) in Hall form. The (a) ⇒ (c)
  summation converse and the existence of an invariant deficient cut are named in SEMANTIC-CONTRACT §1.2 as (LIFT)'s elementary
  converse and a consequence of the supermodular-maximizer argument of (LIFT)'s proof; new only as a written, second-read proof
  on an r30 face. New in-run: (iii), the automatic Aut(G)-admissibility of the r30 active-weight two-for-one transport network
  including the Aut(G)-invariance of F_p(G); and the canonical-cut form of (i) (X_min, X_max), standard lattice facts about
  maximizers of a supermodular function, new as stated for this network."
aliases: [E993-R30-INVARIANT-DEFICIENT-CUT-REDUCTION, E993-R30-TRANSPORT-HALL-IFF-INVARIANT-QUOTIENT-HALL]  (retired candidate
  names of this claim; not separate claims)
relations: (c) ⇒ (a) of (ii) equivalent_in_flow_form_to E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT
attribution: r30 U1 (Claude Sonnet 5; proof of (i)–(ii) and the r30 specialization, RETURN §4.2–4.7); critics C-U1-T and C-U1-F
  (Claude Opus 5.5; the quotient-neighbourhood step, the widened scope, the canonical cuts X_min/X_max); r30 U adjudicator
  (verification); isolated second read SR-INV (Claude Opus 5.5); Codex (GPT-6 Astra/Sol/Luna), lower-region run C6-T5,
  adjudicated C6-AT, for (LIFT) and the supermodular-maximizer argument.
fences: decides no (HALL) instance; supplies no quotient feasibility; not a transport mechanism and revives no refuted key
  (SOLUTION-CONTRACT §3.2); no RTree wording; primary aggregate untouched; bounded computations cited in support are
  bounded_computation and are not evidence for the proof.
```

**R-SR5-2. `CLAIM-DISTINCTIONS` row** (verbatim).

```text
key: E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL
against: E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT
relation: not_alias; contains_as_one_direction
distinction: The direction (c) ⇒ (a) of the r30 key's part (ii) — orbit-quotient weighted Hall implies original weighted
  Hall — is (LIFT) restated in Hall form: under the finite capacitated Hall theorem (integral max-flow/min-cut) on both
  networks, (LIFT)'s implication "saturating integral quotient flow ⇒ saturating integral original flow" and (c) ⇒ (a) are
  equivalent, with identical hypotheses (finite group; invariant relation; invariant nonnegative integer supplies and
  capacities; orbit totals; an orbit arc exactly when the relation meets the product). The r30 proof of that direction (an
  invariant maximizer of the supermodular deficiency) is a re-derivation and carries no novelty. The r30 key adds the converse
  (a) ⇒ (c) (elementary; named in SEMANTIC-CONTRACT §1.2), the canonical invariant cuts X_min and X_max, and the automatic
  Aut(G)-admissibility of the r30 transport network with Aut(G)-invariance of F_p(G). Neither key asserts the feasibility of
  any quotient. Attribution: Codex (LIFT); r30 U1, C-U1-T, C-U1-F; second read SR-INV.
```

**R-SR5-3. Scope note on `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT`** (append verbatim; status, grade and statement unchanged).

```text
r30 Cycle 1 (second read SR-INV): this is the (⇐) direction, in flow form, of E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL;
the converse (original feasibility ⇒ quotient feasibility), the Hall form, the canonical invariant cuts and the automatic
Aut(G)-admissibility of the r30 transport network are recorded there. No quotient's feasibility is asserted.
```

**R-SR6. Route record for P16** (NOT a registry key; record verbatim in the Cycle 1 route records).

```text
Support-move lemma (P16; route record, not a key; proved_informal; STATED at Stage 4, confirmed by isolated second read SR-INV).
Let G be a finite simple graph, F a set of degree-one vertices (s_t the unique neighbour of t, W_t = N_G(s_t) ∖ {t}; t ∈ F ∩ B
is active in B iff (B ∖ {t}) ∩ W_t ≠ ∅), B an independent set and v ∈ F ∩ B; put B' = (B ∖ {v}) ∪ {s_v}. (a) B' is independent
iff v is inactive in B, and then |B'| = |B|. (b) If so, w_F(B') = w_F(B) + #{t ∈ (F ∩ B) ∖ {v} : t inactive in B, s_t ~ s_v};
every tag active in B stays active in B', and w_F(B') ≥ w_F(B). It corrects U1 §6 ("where defined it can only weakly decrease
the active weight"), which is false: on the order-12 tree with edges 0–1, 0–2..6, 1–7, 1–8, 1–9, 7–10, 7–11 (α = 9, x = 4,
p = 6 eligible, F = F_6 = {2,3,4,5,6,8,9,10,11}, supply 308, capacity 630, S = −322), B = {2,3,4,5,6,9,11}, v = 9 gives
w 5 → 6. It is not a transport relation and not a φ-monotone compression (the support shift fails φ-monotonicity by exact
singleton witnesses: capacity grows through new switch arcs at s_v). Attribution: C-U1-T (tree form, n ≥ 3) and C-U1-F
(general form, including s_v ∈ F on a K_2 component); r30 U adjudicator (2,493-case check); SR-INV (re-derivation; 210,939 +
101,041 cases, 0 failures, bounded_computation).
```

## Verdicts

verdict[SR-5]: confirmed_with_repairs
verdict[SR-6]: confirmed_with_repairs

- **SR-5.** The mathematics is confirmed in full.
  - The key name is a predicate the statement satisfies.
  - (⇐) is exactly (LIFT) in Hall form.
  - Repairs: novelty is narrowed (the converse is elementary and pre-named); `γF = F` is required for a general `F`; the
    positive-weight clause is carried by `X_min`; the scope note on (LIFT) names the key exactly; the active test is in
    W-form.
- **SR-6.** The lemma is confirmed, U1 §6 is confirmed false, and the route-record-not-key ruling is confirmed. Repairs are
  textual (explicit hypotheses; W-form; ℕ identity).

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-sr-SR-INV/`.
Standard library only, exact integers, foreground runs with `PYTHONDONTWRITEBYTECODE=1`, no background job.

| file | SHA-256 | role |
|---|---|---|
| `seal_check.py` | `52a73e6461c6763f92de4a69ea160fff14c80697ed6a92de8ef3f13206bbe4be` | capsule seal and 15 member digests |
| `alias_scan.py` | `81f1b8edb49147e462b5d87a3b6cb3017f0307df97993985767f67ac075bcf7b` | registry alias scan (both registries) |
| `sr_inv.py` | `c23dfe509883e25e423bc5c06b0586e35e59d6ac009970b8ecab7bc8a6a1531a` | own instrument: P16 witnesses and sweep; P4 checks on 60 transport and 150 abstract networks (seed 20260926) |
| `sr_inv_out.txt` | `3678a9dd09758af389558c2073ab946034261549c51a97d9f976245c1b75c0fa` | output; result digest `94092d3d2af9bdb974a30eeea4d869b9389893e1e77907515e64d04980968f4c` |
| `sr_inv_eligible.py` | `917360c55cfa856c2e58dfbf1b837bff23d5c119ac2c78e3f6c2c681b5649ec0` | free trees by leaf addition plus AHU canonical form (A000055 to 12); P16 and `Aut` invariance on all 39 eligible rows of orders 11–12 |
| `sr_inv_eligible_out.txt` | `dd95ac38287a6788ca64c93100467ef292746e2af7394da2013e04979bcacf7b` | output |

Replay: `cd <scratch root> && PYTHONDONTWRITEBYTECODE=1 python3 sr_inv.py` (about 7 s); `… python3 sr_inv_eligible.py`.

Written output: this file, `second-reads/SR-INV/SECOND-READ.md`. Nothing else was written outside the scratch root.
