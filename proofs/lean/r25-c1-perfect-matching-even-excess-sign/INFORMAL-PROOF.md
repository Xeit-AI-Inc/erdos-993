# Informal Proof — `C1-LA2` `PERFECT-MATCHING-UNIFORM-SIGN` (Award group B)

Run `lean-2026-09-20-c1-perfect-matching-uniform-sign`, contract
`c1-la2-perfect-matching-uniform-sign-v1`. Source authority: synthesis
`cycles/cycle-1/stage6/SYNTHESIS.md`, `## Lean awards`, "Award group B
(companion) — the perfect-matching uniform lemma"; capsule
`control/c1-stage7-capsules/C1-LA2-PACKET-MANIFEST.json` (seal
`c9c57e52d812166a1eb905874f38963b1972815800dcb17469b0f0dfd35aecd7`, verified —
see `CAPSULE-VERIFICATION.json`).

## 1. Definitions (verbatim, `SEMANTIC-CONTRACT.md` / frozen G1 Lean source
`sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean`,
SHA-256 `aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4`,
entries 1–3)

```lean
noncomputable def Erdos993G1.indepCount {V : Type u} (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)
noncomputable def Erdos993G1.coeff {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0
noncomputable def Erdos993G1.delta {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k
```

`i_k(F) = indepCount F k` counts actual independent `k`-subsets once;
`i_0 = 1`; zero beyond the independence number; `coeff` is the integer
zero-extension; `Δ_k(F) = i_{k+1} - i_k`.

These three definitions are re-registered in this run's `LeanProject/LeanProof/Main.lean`
(entries 1–3) with the identical defining bodies. Tooling note: the current
`lean-formalization` registration validator requires the declared keyword
(`def`) to be the first token of its source line, so a top-level dotted
declaration (`def Erdos993G1.indepCount ...`, the literal form frozen in the
G1 source) cannot be registered as-is; these entries are instead written as
`namespace Erdos993G1 ... def indepCount ... end Erdos993G1`, which elaborates
to the exact same fully qualified declarations `Erdos993G1.indepCount`,
`Erdos993G1.coeff`, `Erdos993G1.delta` with byte-identical defining bodies.
The registered source bytes therefore do not reproduce the frozen entries'
SHA-256 digests exactly (namespace wrapping vs. dotted declaration is a purely
syntactic difference), but the defining terms are unchanged. `SEMANTIC-CONTRACT.md`
and the frozen C3 source remain the authority for these definitions; nothing
about their meaning is altered.

## 2. Exact theorem (synthesis, Award group B)

For every finite simple graph `G` on a vertex type `X` of cardinality `2m`
carrying a perfect matching (an injective `f : Fin m × Bool → X` with
`G.Adj (f (i, false)) (f (i, true))` for every `i : Fin m`), and every natural
`r` with `2m ≤ 3r + 1`: `Δ_r(G) ≤ 0`.

Lean-facing declaration (registered as
`Erdos993G1.C1LA2.perfectMatching_delta_nonpos`, entry 18, the terminal
theorem):

```lean
theorem perfectMatching_delta_nonpos {X : Type u} [Finite X]
    (G : SimpleGraph X) (m r : ℕ) (hn : Nat.card X = 2 * m) (hr : 2 * m ≤ 3 * r + 1)
    (f : Fin m × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin m, G.Adj (f (i, false)) (f (i, true))) :
    Erdos993G1.delta G (r : ℤ) ≤ 0
```

## 3. The two new lemmas named by the synthesis

### 3.1 `perfectMatching_containment` (entry 16)

Statement (ℤ, unconditional in `r`, using the ℕ-truncated form of `m - r`
cast into ℤ — see the scope note in §5):

```lean
lemma perfectMatching_containment {X : Type u} [Finite X] {m : ℕ}
    (G : SimpleGraph X) (f : Fin m × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin m, G.Adj (f (i, false)) (f (i, true)))
    (hn : Nat.card X = 2 * m) (r : ℕ) :
    ((r : ℤ) + 1) * Erdos993G1.indepCount G (r + 1) ≤
      ((2 * (m - r) : ℕ) : ℤ) * Erdos993G1.indepCount G r
```

**Proof (the incidence double count).** Because `Nat.card X = 2m =
Fintype.card (Fin m × Bool)` and `f` is injective, the `m` pairs `{f(i,
false), f(i, true)}` partition `X` into `m` disjoint edges of `G` — a perfect
matching — and `Finset.univ.image f = Finset.univ : Finset X`
(`perfectMatching_endpoints_univ`, entry 11; a cardinality argument,
`Finset.eq_of_subset_of_card_le`, no case split). Consequently every
independent set of `G` is (via this identification) a partial transversal of
the `m` edges: an independent set can contain at most one endpoint of each
edge (both endpoints of an edge are adjacent), so a size-`k` independent set
meets exactly `k` distinct edges.

Apply `Finset.card_mul_le_card_mul` (double counting) to the containment
relation `B ⊆ S` between `S ∈ G.indepSetFinset (r+1)` and
`B ∈ G.indepSetFinset r`:

- **Each `S` contains exactly `r+1` such `B`** (`perfectMatching_extend_card`,
  entry 12). Every subset of an independent set is independent, so every one
  of the `r+1` sets `S.erase x` (`x ∈ S`) is an `r`-independent subset of `S`;
  the map `x ↦ S.erase x` is injective on `S` (`Finset.erase_injOn`), giving
  exactly `|S| = r+1` distinct such `B`.
- **Each `B` extends by at most `2(m-r)` vertices**
  (`perfectMatching_extension_bound`, entry 13). `B` is independent of size
  `r`, so (by the forbidden-set argument below) it meets exactly `r` of the
  `m` edges, leaving `m-r` edges entirely free of `B`. If `B ∪ {z}` is
  independent (`z ∉ B`), the forbidden-set lemma applied to `B` rules out `z`
  lying on any of the `r` edges `B` already meets (both endpoints of such an
  edge are forbidden: one *is* the point of `B` on that edge, the other is
  adjacent to it). So `z` must be an endpoint of one of the `m-r` free edges,
  of which there are `2(m-r)` vertices, at most two per free edge.
  Injectivity of `S ↦ (the unique element of S \ B)` over the filtered
  supersets converts this into a cardinality bound via
  `Finset.card_le_card`/`Finset.card_image_le`.

The **forbidden-set lemma** (`perfectMatching_forbidden`, entry 8; the
top-stratum specialization of C3's `fiveMatching_forbidden`, entry 155,
mirrored line for line with `Fin 5` generalized to `Fin m`): for independent
`S`, build `C = {p : Fin m × Bool | f p ∈ S}` and its `flip` (swap the `Bool`
coordinate); `C` and `C.image flip` are disjoint (else two matched partners
would both lie in `S`, forcing an edge inside the independent set), and
`Q := (C ∪ C.image flip).image f` is the required forbidden set with
`Q.card = 2·|S ∩ image f|` and every element of `Q` in `S` or adjacent to `S`.

`Finset.card_mul_le_card_mul` then gives, in ℕ (`perfectMatching_containment_nat`,
entry 14):

```text
(r+1) · |indepSetFinset (r+1)| ≤ 2(m-r) · |indepSetFinset r|
```

unconditionally in `r` (no case split — when `r > m` no `r`-independent set
exists at all, by the same forbidden-set support bound
(`perfectMatching_support`, entry 10, `|S ∩ image f| ≤ m` for every
independent `S`), so both sides degenerate to `0 ≤ 0` automatically). Casting
this ℕ inequality via `indepCount_eq_indepSetFinset_card` (entry 4) gives
`perfectMatching_containment` exactly as stated.

### 3.2 `perfectMatching_threshold_arith` (entry 17)

```lean
lemma perfectMatching_threshold_arith (m r : ℕ) (hr : 2 * m ≤ 3 * r + 1) :
    ((2 * (m - r) : ℕ) : ℤ) ≤ (r : ℤ) + 1
```

By `omega` on the ℕ statement `2 * (m - r) ≤ r + 1`, which `2m ≤ 3r+1`
implies for every `m, r` (including `r ≥ m`, where the ℕ-truncated left side
is `0`). Equivalently: with `d = 2(m-r)` and `2m = 2r+d`, the contract's
`3d ≤ 2m+2` hypothesis gives `d ≤ r+1`.

## 4. Assembly: `perfectMatching_delta_nonpos` (entry 18)

From §3.1 and §3.2, for `r < m`:

```text
(r+1)·i_{r+1} ≤ 2(m-r)·i_r ≤ (r+1)·i_r
```

(the second step multiplies `perfectMatching_threshold_arith` by
`i_r = indepCount G r ≥ 0`, `indepCount_nonneg_aux`, entry 7). Since `r+1 > 0`,
cancel (`le_of_mul_le_mul_left`) to get `i_{r+1} ≤ i_r`, i.e.
`Δ_r(G) = i_{r+1} - i_r ≤ 0` (`delta_nat_aux`, entry 6, unfolds `delta`/`coeff`
into the `indepCount` difference — the re-derivation, under this run's
namespace, of the frozen `coeff_nat`/`delta_nat` facts, entry 5 `coeff_nat_aux`).

**The `r ≥ m` case** (handled explicitly, by case split `by_cases hrm : r < m`
inside `perfectMatching_delta_nonpos`): if `r ≥ m` then `r+1 > m`, so no
`(r+1)`-independent set exists — every independent set is a partial
transversal of the `m` matching edges, hence has cardinality `≤ m`
(`perfectMatching_support`, entry 10, combined with
`perfectMatching_endpoints_univ`, entry 11) — giving
`indepCount G (r+1) = 0` (`perfectMatching_indepCount_eq_zero`, entry 15).
Since `indepCount G r ≥ 0`, `Δ_r(G) = 0 - indepCount G r ≤ 0` directly.

## 5. Scope limits (mandatory; must appear in the contract)

- **Uniform over even `d` only.** The perfect-matching hypothesis forces
  `Nat.card X = 2m`, hence (with `d := |V(G)| - 2r`) `d = 2(m-r)` — always
  even. This lemma says nothing about odd `d`.
- **Not Tier 3a.** The hypothesis is a perfect matching on all of `X`
  (`2m = Nat.card X`), not merely a matching of size `≥ m(d)` inside a larger
  graph (`Tier 3a` / `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN` requires
  `|V| > 2ν` to be meaningful as a *bare-matching* reduction). This award says
  nothing about graphs without a perfect matching.
- **No sharpness claim.** The conclusion is the non-strict sign
  `Δ_r(G) ≤ 0`; the threshold's sharpness on `mK₂` is a comparator fact only
  and is not part of this award.
- **No transfer.** Nothing here bears on `firstDescent`/`x(G)`, forests,
  residuals, G1 tuples, Tier 1, Tier 2, the diagnostic band, FOREST, TREE,
  TRANSFER, `E993-BETA-AGG`, or Erdős #993 (synthesis, Award group B,
  "Excluded conclusions").

## 6. Grade

`compiled-candidate` (this run). Kernel-verified (`RECEIPTS/kernel-verification.json`,
verdict `verified`, axioms exactly `propext`, `Classical.choice`, `Quot.sound`).
Not `formally_verified`: no reviewer assignment, no independent informal audit,
no independent fidelity review, and no `close` have run in this run (see
`FORMALIZER-REPORT.md`, "Remaining gates").
