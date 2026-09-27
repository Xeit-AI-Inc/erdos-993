# Second Read

`SR-C5-3`: GK-MONO and (HALL) at every eligible rank of `G_k`, registration and the `C5-LA1` award's informal input. r30 Cycle 5
(`erdos-993-math-dre-20260926-r30-weighted-transport`), 2026-09-27. Isolated reader, Claude Opus 5.5, high.

**Boot.** I am operating within VerityOS. My boot reads were exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. My tool display truncated about 5,000 characters in the middle of
`verity.md`, and I read the first 150 lines of the startup protocol, which covers the boot sequence. I opened no other VerityOS file.
The host put the project `CLAUDE.md` and the user memory index into context at session start. I did not open either one or act on it, and I kept
no conversation log, because this read writes only this file and its scratch.

**Model disclosure (two parts):** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Answer the brief asks for:** GK-MONO and the every-eligible-rank composition are CONFIRMED at `proved_informal`. This read
clears the `C5-LA1` award's informal input. The count bridge N4a must be stated in guarded ℕ form (finding 5).

## Identity and seal audit

- **Protocol** `control/C5-SECOND-READ-PROTOCOL.md`: read in full first. Its manifest digest is `78bc4897…` and it matches.
- **Brief** `control/C5-SECOND-READ-BRIEF-SR-C5-3.md`: `shasum -a 256` gives
  `cd46478cded94556ea402a58bc90cd03fba572bbde0aa9ded79bdec521b98967`. This equals the dispatch literal, and I verified it before following the brief.
- **Capsule seal** `control/c5-second-read/SR-C5-3-PACKET-MANIFEST.json`: I recomputed SHA-256 of the canonical JSON without
  `seal_sha256` (`sort_keys`, separators `(",", ":")`, no trailing newline) and got
  `097f8a3ba84cb6f2c86817107ccd5017ea057bb1989743fb3b8b60275bcece70`. It **matches** the recorded seal. `file_count` 112 equals
  `len(files)` 112, and all 112 members match on bytes and SHA-256 (`seal_audit.py`).
- **Frozen reference instruments.** All 77 members under `sources/c5-stage7-sources/` appear in that directory's `SOURCE-DIGESTS.json`
  (`98f4561a…`) with identical SHA-256 and bytes. I checked this before reading any of them.
- **Award text binding.** The award file `runs/lean-2026-09-27-c4-la1-gk-deletion-saturating-flow-every-rank/LeanProject/LeanProof/Main.lean`
  hashes to `66db6c73ad8f0dbe58dfdf31bf6a5d0b50e3f33459ca08f89ba372cc9ca979bf`. The first 2956 lines of the frozen seat file
  `Main.lean` (`05c24dda…`) are **byte-identical** to that file (`cmp`). The prefix binding is therefore checked against the award file itself, not only
  against a quoted digest. `VERIFICATION-REPORT.json` gives `status: formally_verified`, the kernel receipt `dd9c21f7…` gives verdict
  `verified`, and `EVIDENCE/axioms.txt` shows the terminal theorem on `[propext, Classical.choice, Quot.sound]`.
- **Registry.** The frozen run-local snapshot `CLAIM-IDENTITY.run-local.c5-stage2.json` (`e55151a0…`) has 453 claims, 19 of them run-local.
  The frozen master `sources/authority/CLAIM-IDENTITY.json` (`eba20be3…`) has 434.

## Statements read

Statement of record: `cycles/cycle-5/stage6/SYNTHESIS.md` (`83b9f816…`), namely `## Exact established results` items 4–5,
`## Lean awards` → `C5-LA1`, `## Progress and stop-gate ruling` → SR-C5-3, and `## Registrations` items 4–5 plus the scope notes.
Origins: C-U1-F `CRITIQUE.md` (`52b9b2b2…`; the proof of record), C-U1-T `CRITIQUE.md` (`791abfb8…`; the Newton route), the
U1 return (`a8b79b4e…`), and the U adjudication (`b641724e…`; the paired-proof table, composition item 2, Lean readiness G-U-A). Controller
facts `C5-STAGE6-CONTROLLER-FACTS.json` (`dde51894…`), CF-5, CF-U1, CF6-6 and CF6-8, are read as facts only, never as authority.
Registry faces read: the three `G_k` keys, (HALL), the primary aggregate key's `G_k` sentences, and the two `INDEPENDENCE-*` master keys.

- **SR-C5-3a (GK-MONO).** For every `k ≥ 0` and `0 ≤ j ≤ k`, `Δ_j(G_k) ≥ 0`, and `8·Δ_{k+1}(G_k) = −2^k(k²+3k−8)`. Hence
  `x(G_k) = k+1` for `k ≥ 2`, `x(G_1) = 3` and **`x(G_0) = 2`**. (`I(G_0) = 1 + 5y + 6y² + 2y³`, so `Δ = (4, 1, −4, −2)`. The first descent
  is at rank 2.)
- **SR-C5-3b.** (HALL) at every eligible rank of every `G_k`, supported on deletion arcs. It is a composition, and the eligible set is nonempty iff `k ≥ 3`.
- **SR-C5-3c.** The eligibility key's face asserts eligibility only at `p = k+3` (erratum R30-E-m).
- **SR-C5-3d.** The two proposed keys, their names as predicates, the alias screen, and attribution.
- **SR-C5-3e.** The `C5-LA1` statement as the synthesis froze it: DAG closure, fences, and the N4a bridge.

`G_k` is the literal `gkEdge` (C4-LA1 entry 22, read in the award text) on `Fin (3k+5)`. Its edges are `0–1`, `0–2`, `2–3`, `2–4`, and
`0–(5+3i)–(6+3i)–(7+3i)` for `i < k`. The leaves are `1, 3, 4, 7+3i`, with supports `0, 2, 2, 6+3i`.

## Independent re-derivation

**Own instrument** (`scratchpad/c5-sr-SR-C5-3/sr_gk.py`; standard library; exact integers and `Fraction`). It builds adjacency from the
literal `gkEdge` disjunction via `fromRel`. It runs a tree test (connectivity plus `|E| = n−1`) and computes `I(G_k)` three ways: a
**generic rooted-tree DP** from two different roots, the **closed form** `(1+y)[(1+3y+y²)^{k+1} + y(1+y)(1+2y)^k]`, and **brute force** over all
subsets for `k ≤ 4`. It computes `α = deg I`, `Δ_j` with zero extension through rank `α` (the terminal `Δ_α = −i_α` included), and
`x = Nat.find(Δ_j < 0)`. It then checks the eligible windows, the N4a bridge, and every link of both proofs. Runs:

- `k ≤ 60`, `M ≤ 400`: `n_fails = 0`, `RESULT_SHA256 9984b987…5435`.
- `k ≤ 100`, `M ≤ 400`: `n_fails = 0`, `RESULT_SHA256 e75bcba4…f492`.

Results for every `k ≤ 100`:
- every `G_k` is a tree;
- DP (both roots) = closed form, and brute force = closed form for `k ≤ 4`;
- `α = 2k+3`;
- `Δ_j ≥ 0` for all `j ≤ k`;
- `8Δ_{k+1} = −2^k(k²+3k−8)` holds from **`k = 0`** (value `+1` at `k = 0, 1`; `−1` at `k = 2`; `−10` at `k = 3`);
- `x(G_0) = 2`, `x(G_1) = 3`, `x(G_k) = k+1` for `2 ≤ k ≤ 100`;
- every eligible rank is `≥ k+3`;
- the eligible set equals `[k+3, ⌊2(2k+3)/3⌋]` for `k ≥ 2` and is nonempty iff `k ≥ 3`.

**Root split (checked against the literal edge set).** Excluding `0` leaves `K_1 = {1}`, the cherry `{2,3,4}` (`1+3y+y²`) and `k` paths
`P_3` (`1+3y+y²`). Including `0` removes `1, 2, 5+3i` and leaves `{3}, {4}` isolated (`(1+y)²`) and `k` edges `{6+3i, 7+3i}` (`1+2y`).
So `I = (1+y)Q^{k+1} + y(1+y)²(1+2y)^k = (1+y)U`. This matches the brief's factored form, C-U1-F's form and C-U1-T's form.

**C-U1-F's elementary chain (proof of record), re-proved step by step.**
1. From `I = (1+y)U` we get `i_j = u_j + u_{j−1}` and `Δ_{m−1} = u_m − u_{m−2}`, with integer indices and `u_t = 0` for `t < 0`. So `Δ_j ≥ 0` for `j ≤ k` is
   equivalent to `u_m ≥ u_{m−2}` for `1 ≤ m ≤ k+1`. At `m = 1` this reads `u_1 ≥ 0`.
2. From `Q = (1+y)² + y`, `Q^{k+1} = Σ_i C(k+1,i) y^i (1+y)^{2(k+1−i)}`. Row `i` spans degrees `i..2k+2−i` and is symmetric about `k+1`. From
   `1+2y = (1+y)+y`, `y(1+y)(1+2y)^k = Σ_l C(k,l) y^{l+1}(1+y)^{k−l+1}`. The coefficient extraction gives the adjudicator's `u_m` exactly
   (binomials zero outside `0 ≤ t ≤ N`).
3. Row `i = 0` contributes `E(2k+2, m)`. This is `≥ 0` because `E(N,t) ≥ 0` iff `t ≤ N/2 + 1`, and `m ≤ k+1 = N/2`.
4. Pairing row `i = l+1` with row `l` gives `M = k−l`, `t = m−l−1 ≤ M` (since `m ≤ k+1`), and
   `C(k+1,l+1)E(2M,t) + C(k,l)E(M+1,t) ≥ C(k,l)h(M,t)`. This uses `C(k+1,l+1) = C(k,l) + C(k,l+1) ≥ C(k,l)` and `E(2M,t) ≥ 0` (`t ≤ M`). The
   pairing is exhaustive: `i = 1..k+1` corresponds to `l = 0..k`. My instrument checks the **exact row-sum identity**
   `u_m − u_{m−2} = E(2k+2,m) + Σ_l [...]` at every `(k, m)`.
5. `h(M,t) ≥ 0` in three cases.
   - `t ≤ 1`: trivial.
   - `2 ≤ t ≤ (M+3)/2`: then `C(M+1,t−2)/C(M+1,t) = t(t−1)/((M−t+3)(M−t+2)) ≤ 1`.
   - `(M+3)/2 < t ≤ M`: this forces **`M ≥ 4`** (C-U1-F wrote `M ≥ 3`, which is true but loose; ADJ-U noted the same) and `t − 2 ≥ M/2` (integer `t`). Then:
     - the bracket `1 − t(t−1)/((2M−t+2)(2M−t+1))` is decreasing in `t` and equals `(4M+2)/((M+1)(M+2))` at `t = M`;
     - each factor satisfies `(2M−u)/(M+1−u) ≥ 2M/(M+1)`, because this is equivalent to `u(M−1) ≥ 0`;
     - `2M/(M+1) ≥ 3/2` for `M ≥ 3`;
     - `(3/2)^{M/2} ≥ (M+2)/3`: at the base `M = 3`, `(3/2)^3 = 3.375 ≥ (5/3)² = 2.78`, and the step uses `√(3/2) > 6/5 ≥ (M+3)/(M+2)`;
     - `(M+2)/3 ≥ (M+1)(M+2)/(4M+2)` because this is equivalent to `M ≥ 1`.

     So `E(2M,t) ≥ C(M+1,t−2) ≥ C(M+1,t−2) − C(M+1,t) = −E(M+1,t)`.

   My instrument checks every link exactly (squared where a half-power occurs) on all 39,601 case-3 pairs with `M ≤ 400`, `h ≥ 0` on all
   `0 ≤ t ≤ M ≤ 400`, and the base and step. **Valid.**
6. `Δ_{k+1}`: `(1+y)Q^{k+1}` is palindromic of degree `2k+3`, so its coefficients at `k+1` and `k+2` are equal. Hence
   `Δ_{k+1} = β_{k+1} − β_k` with `β = [(1+y)²(1+2y)^k]`, which gives `2^k − k2^{k−1} − C(k,2)2^{k−2} = −2^{k−3}(k²+3k−8)`. This also holds at `k = 0`
   (`β_1 − β_0 = 2 − 1 = 1`). C-U1-F's scope `k ≥ 1` is conservative, not wrong. The value is negative iff `k²+3k−8 > 0` iff `k ≥ 2`.
7. `x`: `Δ_j ≥ 0` for `j ≤ k` gives `Nat.find ≥ k+1`, and `Δ_{k+1} < 0` for `k ≥ 2` gives `x = k+1`. For `k = 1`, my DP gives
   `I(G_1) = 1+8y+21y²+22y³+9y⁴+y⁵`, so `Δ = (7, 13, 1, −13, −8, −1)` and `x(G_1) = 3`. For `k = 0`, `x = 2`.

**C-U1-T's Newton route, re-proved step by step.** The classical theorem is **Newton's inequalities**: for a real polynomial with only real
roots, `c_j² ≥ c_{j−1}c_{j+1}·(1+1/j)(1+1/(N−j))` (ultra-log-concavity).
- *Availability.* `1+3y+y²` has discriminant 5 > 0 and roots `(−3±√5)/2 < 0`, so `C = (1+3y+y²)^{k+1}` is real-rooted with positive
  coefficients and no internal zeros. Newton therefore applies to `C`. Log-concavity with positive coefficients gives nonincreasing ratios
  `c_{j+1}/c_j`. **Only `C` needs real-rootedness.** The other factor `R = y(1+y)(1+2y)^k` enters only through coefficientwise domination, so no
  log-concavity of `R` or of the tree sequence is used. That matters, because tree log-concavity is refuted in general (`E993-UNIV-TREE-TRS2`), and the route does not
  touch it.
- *Domination.* `C ≥ (k+1)R` coefficientwise. Keep two binomial terms of `((1+2y) + y(1+y))^k`, then use `Q ≥ y+y²` on the first term and
  `Q ≥ 1+2y` on the second. At `k = 0` the second term is absent and `Q ≥ y(1+y) = R`. **Valid.**
- *Centre ratio.* At `j = n = k+1`, `N = 2n`, the factor is `(1+1/n)²`, and palindromy `c_{n+1} = c_{n−1}` gives `c_n ≥ c_{n−1}(1+1/n)`. By nonincreasing ratios,
  `c_{j+1} − c_j ≥ c_j/n ≥ r_j` for `j ≤ k`. Then `q_{j+1} − q_j ≥ r_{j+1} ≥ 0`, and multiplying by `(1+y)` preserves this through index `k+1`. **Valid.**
- *First descent.* `c_{k+2} = c_k`, so `Δ_{k+1} = r_{k+2} − r_k` with `r_{k+2} = 2^k` and `r_k = k2^{k−1} + C(k,2)2^{k−2}` (0 at `k = 0`, 1 at `k = 1`). **Same value.**

My instrument checks, for every `k ≤ 100`: the truncated-binomial step, domination, palindromy, log-concavity, Newton at **every** index
`1 ≤ j ≤ 2n−1`, the centre ratio, the margin `c_{j+1} − c_j ≥ c_j/n ≥ r_j`, the `q`-increment and `r_{k+2}`, `r_k`. There were no failures.

**Comparison of the two proofs.** They share the root split and the palindromic first-descent computation. They differ on the
monotone-through-`k+1` step: C-U1-T uses domination plus the Newton margin on `U`'s two summands, and C-U1-F uses the binomial-row pairing and
`h ≥ 0` on `u_m − u_{m−2}`. I found **no disagreement on any step**. The only differences are the scopes `k ≥ 1` versus `k ≥ 0` for the `Δ_{k+1}` form (both true)
and C-U1-F's loose `M ≥ 3`. These are two genuinely distinct constructions. C-U1-F's proof has no classical dependency, and C-U1-T's names Newton.

**The composition (3b), re-derived.** Fix `k` and an eligible `p` (`x(G_k)+2 ≤ p`, `3p < 2α+1`).
- 3a gives `x ≥ k+1`, so `p ≥ k+3`.
- `favorableLeaves = leafSet.filter(IsFavorableAt · p) ⊆ leafSet`.
- The flow key's Lean statement (read in the award text, entries 110/113) holds for **every `k : ℕ`**, every `p` with `k+3 ≤ p` and every
  `F ⊆ leafSet`. It gives `f` with `IsSaturatingFlow (gkGraph k) F p f`, supported on `B → B.erase q`.

**Inputs consumed:** exactly the flow key (`formally_verified`), the `x ≥ k+1` half of 3a, and the filter inclusion. `3p < 2α+1` is **unused**. The
`Δ_{k+1}` half, `α`, favorability, (WID), FLOW⇒SIGN, r29, (LIFT) and (DCB) are **not** used by the flow conclusion. The tree property (`3k+4` edges on
`3k+5` vertices, all joined to 0; U1's `gkGraph_isTree` compiled) is used only to present the result as an instance of the tree-scoped (HALL).
Non-vacuity uses `α = 2k+3` and `x ≤ k+1` (the eligibility key) for `k ≥ 3`. Emptiness for `k ≤ 2` uses `x ≥ k+1` with `α`.
The grade is `proved_informal`, the weakest input's.

**Literal-fidelity corroboration** (`sr_flow.py`; `bounded_computation`, never proof). For `k = 3..8`, I computed `x` through `α`, asserted
nonempty eligibility first, derived `F_p` from `Δ_p(G_k − v) < 0` on the original carrier, used the literal active-tag weight
`w_F(B) = #{v ∈ F∩B : B ∩ W_v ≠ ∅}`, and asserted `supply − capacity = S(G_k,p)`, with `S` computed from the `H_v`/`R_v` deletion counts, on **every** row before the
flow. I then ran an exact Dinic max-flow on deletion arcs only.

| `k` | `n` | `α` | `x` | `p` | `|F|` | supply | capacity | `S` | deletion max-flow |
|---|---|---|---|---|---|---|---|---|---|
| 3 | 14 | 9 | 4 | 6 | 6 | 253 | 527 | −274 | 253 |
| 4 | 17 | 11 | 5 | 7 | 7 | 1542 | 2735 | −1193 | 1542 |
| 5 | 20 | 13 | 6 | 8 | 8 | 8875 | 14196 | −5321 | 8875 |
| 6 | 23 | 15 | 7 | 9 | 9 | 49422 | 73573 | −24151 | 49422 |
| 6 | 23 | 15 | 7 | 10 | 9 | 23001 | 49422 | −26421 | 23001 |
| 7 | 26 | 17 | 8 | 10 | 10 | 269507 | 380552 | −111045 | 269507 |
| 7 | 26 | 17 | 8 | 11 | 10 | 138663 | 269507 | −130844 | 138663 |
| 8 | 29 | 19 | 9 | 11 | 11 | 1448816 | 1964489 | −515673 | 1448816 |
| 8 | 29 | 19 | 9 | 12 | 11 | 805154 | 1448816 | −643662 | 805154 |

All nine eligible rows saturate (`RESULT_SHA256 61bd6b76…35a5`). The `k = 3, 4, 5` rows reproduce the registered eligibility key's
`253/527/−274`, `1542/2735/−1193` and `8875/14196/−5321`. `F_p` is the whole leaf set on every row.

**Third instrument.** The controller replays `CF-REPLAY-c5{a,b,c,d}` do **not** concern `G_k`; their keys are CB and threshold rows only.
Instead I replayed, copy-out-first under `replay/`, C-U1-F's `gk_monotone_check.py` (`ALL True`) and ADJ-U's `adj_gk.py`. The latter's output is
byte-identical to the frozen `adj_gk.out` (`RESULT_SHA256 2af4f8c8…`, `fails []`). These are the seats' own checks and corroboration only.

**Lean (optional; the verdict rests on the informal proofs).** I copied the frozen `sources/c5-stage7-sources/C-U1-F/LeanProject/` (no
`.lake`) into `scratchpad/c5-sr-SR-C5-3/lean/LeanProject/` and symlinked `.lake/packages` to the shared
`mathlib-v4.32.2-project/.lake/packages`. From inside that directory I ran `lake build` in the foreground. There was no `lake update`, no `lake clean`, and nothing was run in the background. It reported
`Build completed successfully (8657 jobs)`, and the only diagnostic was the carried line-758 `Try this` hint. `lake env lean SRProbe.lean` (`ed175fe4…`,
my probe appended to a copy of `Corollary.lean`) compiled two scratch theorems, each depending on `[propext, Classical.choice, Quot.sound]`:
- `sr_probe_closure`. It proves the synthesis's frozen `expected_statement` verbatim from `gkGraph_isTree` (N1), `gk_crossing_lower_iff`
  (N2) and `gk_weightedHall_flow_of_crossing_lower` (N3), plus an explicit hypothesis
  `hN4 : ∀ k j, j ≤ k → 0 ≤ C5LA1.forwardDifferenceDel (gkGraph k) ∅ j`. So N4 is the only missing node, and `hLow` is passed through unused.
- `sr_probe_N3_via_entry110`. It is N3 re-authored to call the carried **lemma** entry 110 `gk_exists_deletionSupported_saturatingFlow`, not
  the terminal theorem 113, as the synthesis's carry rule requires. It compiles, and entries 110 and 113 have identical statements (read in
  the award text).

These are compiled scratch with no grade.

## Findings and repairs

1. **3a is correct as stated, and both proofs are sound.** The two proofs agree on every shared step. C-U1-F's proof is self-contained, and C-U1-T's needs
   only Newton's inequalities for the real-rooted `(1+3y+y²)^{k+1}`. The Newton route is legitimately available for the one factor it is applied to. Two
   literals are loose but not errors: C-U1-F's "`k ≥ 1`" for the `Δ_{k+1}` form (it holds from `k = 0`) and its case-3 "`M ≥ 3`" (in fact `M ≥ 4`).
   `x(G_0) = 2`.
2. **Attribution repair (3d).** The frozen snapshot shows that the eligibility key
   `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO` **already** carries, as `proved_informal` companion
   content, the closed form of `I(G_k)`, `α(G_k) = 2k+3`, `8Δ_{k+1}(I(G_k)) = −2^k(k²+3k−8)` **for every `k ≥ 0`**, and `x(G_k) ≤ k+1` for `k ≥ 2`
   (F2, r30 Cycle 2; SR-C2-4). The new content of the independence-count key is exactly `Δ_j(G_k) ≥ 0` for `j ≤ k`, which is the lower bound
   `x(G_k) ≥ k+1`. The synthesis (item 5; registration 4) and the brief attribute the whole of GK-MONO, including the `Δ_{k+1}` form, to C-U1-T and C-U1-F.
   Repair: on the face, the `Δ_{k+1}` form and `x ≤ k+1` are marked as **re-derived companion content first registered on the eligibility key**, and are credited
   to its authors. Both critics say as much themselves ("an independent proof of the closed form on the eligibility key's face"; "re-derives the
   registered `8Δ_{k+1}`"). A second, minor repair: the brief's "the `G_k` family to r30 Cycles 2–3" omits that the eligibility key's certificate credits the
   **construction** of `G_k` to C-F2-T in r30 Cycle 1. I write "r30 (construction by C-F2-T, Cycle 1; registered in Cycles 2–3)".
3. **3b uses nothing else, with one citation repair.** The flow conclusion consumes only the flow key, `x ≥ k+1` and `F_p ⊆ leafSet`. The
   synthesis's "the eligible set is nonempty iff `k ≥ 3`, using `α(G_k) = 2k+3`" needs more than `α` alone. The "if" direction also needs `x(G_k) ≤ k+1` (eligibility
   key), and the "only if" direction needs `x(G_k) ≥ k+1` (3a); `α` alone does not fix `x`. Repaired text: "nonempty iff `k ≥ 3` (by `α(G_k) = 2k+3` and
   `x(G_k) = k+1` for `k ≥ 2`, `x(G_1) = 3`, `x(G_0) = 2`)". The eligible set is then exactly `k+3 ≤ p ≤ ⌊2(2k+3)/3⌋`.
4. **3c confirmed against the face, from four sides.** The eligibility key's statement (1) asserts eligibility at `p = k+3` only, and its companion
   content says "a strict descent at rank k+1 and `x(G_k) <= k+1` for every `k >= 2`". It asserts neither `x(G_k) = k+1` nor "every eligible rank".
   Three other faces in the frozen snapshot record the lower bound as **not** of record:
   - the flow key's scope ("'every eligible rank of `G_k`' (needs `x(G_k) ≥ k+1`, open; bounded `k ≤ 400`)") and its fence sentence;
   - the (HALL) `[r30 C4; SR-C4-1; G_k flow]` note ("(HALL) holds at every eligible rank of `G_k` if `x(G_k) >= k+1`, which is not proved");
   - the GK-SIGN key's scope ("possibly below if `x(G_k) <= k` (not excluded by a registered statement …)").

   CF-5 and CF-U1 overstated the registered scope, and CF6-6's correction is right. The registered (HALL) scope on `G_k` was "every rank `p ≥ k+3` that is
   eligible". The widening to every eligible rank is exactly the new lower bound. **For the controller (no text written here):** the OPEN primary aggregate
   key `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` carries two `G_k` family sentences (`[r30 C3; SR-C3-2]`, `[r30 C4; SR-C4-1]`) that say ranks below
   `k+3` "would exist only if `x(G_k) <= k`, which no registered statement excludes". After registration these sentences are stale as facts. Whether to
   annotate that key is the controller's decision, because this read does not touch the primary aggregate. No status is affected either way.
5. **3e: the N4a bridge as displayed is correct only over ℤ with zero extension. Read literally in ℕ it is WRONG exactly where N4 needs it.** The
   synthesis's N4a display `i_j = u_j + u_{j−1}`, `u_m = Σ_i C(k+1,i)·C(2(k+1−i), m−i) + Σ_l C(k,l)·C(k−l+1, m−l−1)` equals `indepSetCount (gkGraph k) ∅ j`
   at every `(k, j)` I tested (`k ≤ 60`, all `j`) **when binomials vanish at negative lower index and `u_{−1} = 0`**. In Lean's ℕ, `m − i` truncates to 0
   when `i > m`, so `C(·, 0) = 1` adds spurious terms, and `j − 1` truncates at `j = 0`. My instrument (`sr_n4a.py`) finds the literal ℕ reading wrong at
   **exactly `j = 0, …, k+1` for every `k ≤ 60`** (104 cells for `k ≤ 12`), which is precisely N4's range. The synthesis's "must not use truncated ℕ subtraction"
   names the hazard, but the displayed formula is not safe to transcribe. Exact repaired text for N4a and N4b:

   > **N4a (count bridge, guarded ℕ form).** For every `k` and `j`: `indepSetCount (gkGraph k) ∅ 0 = 1` and
   > `indepSetCount (gkGraph k) ∅ (j+1) = gkU k (j+1) + gkU k j`, where
   > `gkU k m := Σ_{i ∈ range (k+2), i ≤ m} C(k+1,i)·C(2(k+1−i), m−i) + Σ_{l ∈ range (k+1), l+1 ≤ m} C(k,l)·C(k−l+1, m−l−1)`.
   > Every ℕ subtraction is guarded by its filter (`i ≤ m`, `l+1 ≤ m`) or its range (`i ≤ k+1`, `l ≤ k`), and `Nat.choose`'s zero above the top handles
   > the upper end. **N4b.** `gkU k (m−2) ≤ gkU k m` for `2 ≤ m ≤ k+1`, and then
   > `forwardDifferenceDel (gkGraph k) ∅ 0 = gkU k 1` and `forwardDifferenceDel (gkGraph k) ∅ j = gkU k (j+1) − gkU k (j−1)` in ℤ for `1 ≤ j`.

   Checked for `k ≤ 60` and every `j ≤ α+2` with 0 failures (`RESULT_SHA256 5ee6c90f…`). (At `m = 1` the truncated N4b reads `u_1 ≥ u_0`, which is true since
   `3k+4 ≥ 1`, so that part is harmless. The bridge is not.)
6. **3e: DAG closure and fences confirmed.** With the flow key and the reduction, the informal DAG is closed by 3a. My Lean probe shows the frozen
   `expected_statement` follows from N1–N3 and an explicit N4 hypothesis, with nothing else. Three further checks hold:
   - `hLow` is carried and unused, and the face must say so;
   - `IsTree` sits in the conclusion (Mathlib's structure);
   - it is not a second family for ruling 39, because `G_k` is the family of the registered scope.

   **Repair for the formalizer:** C-U1-F's compiled N3 calls the terminal theorem 113. It must call the lemma entry 110, as the synthesis's carry rule
   requires. The replacement compiles (`sr_probe_N3_via_entry110`).
7. **Keys are predicates, and the screen is clean.** Neither name asserts more than its statement:
   - `…-INDEPENDENCE-COUNTS-NONDECREASING-THROUGH-RANK-K-PLUS-ONE` is exactly `i_0 ≤ … ≤ i_{k+1}`;
   - `…-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK` is satisfied by the saturating flow, which is equivalent to (HALL-COND) for every `X`, and is vacuous for `k ≤ 2`.

   Screen of the final registration text against all 453 snapshot and 434 master claims (`sr_alias_screen.py`, `c2dbebc3…`):
   - no exact key collision, and no new alias captures an existing claim;
   - no ALIASES line carries `:`, `[`, a comma or "none";
   - the brief's three banned alias phrases (a token, a two-word aggregate phrase and a two-word injection phrase) are absent, as are "C4-LA1", "C5-LA1",
     "GK-MONO", "GK-SIGN" and the other working labels;
   - token overlap is at most 6 shared tokens (60% of GK-SIGN's 10) for the first key and 6 of 18 for the second, with no `≥ 85%` hit.

   The residual hits, all benign:
   - `active.tag.weight.*identity` (WID key) and `weighted.hall.*implies.*aggregate` (FLOW⇒SIGN key) match those keys' own names where I cite them by key, as
     the naming rule requires;
   - the standard fence tokens TREE, FOREST and TRANSFER;
   - the short aliases `A1` and `AdjU`, which appear only inside `C5LA1` and "adjudicator";
   - **`C5`, an alias of `E993-R25-DRIFT-SUP-TAU-7`, which word-bounded matches every `[r30 C5; …]` tag and every `SR-C5-…` read id.** This affects every Cycle 5 scope
     note, not only mine. **For the controller.**

   Two real hits were removed while drafting:
   - the word "universal" in the delete-only fence triggered `R2.*Hall.*universal` (`E993-R19-R2-HALL-UNIVERSAL`);
   - "(a)"/"(b)" labels matched the `(A)`/`(B)` aliases of `E993-THEOREM-A/B`.

   Distinction rows are written for the three `G_k` keys and both `INDEPENDENCE-*` master keys. Neither master key has alias patterns, and no pattern hit arises from them.
8. **Minor, note only.** The flow key's informal gloss reads "for every `k ≥ 1`", while its Lean statement quantifies over every `k : ℕ`. This is immaterial here,
   because `G_0` has no eligible rank.

## Registration text

To be registered verbatim after the run-local registry unfreezes (ruling 43). Status changes are only those stated. The scope note on
`E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE` (the fourth block) is **recommended, not required**; it corrects that key's stale
"not excluded by a registered statement" sentence. The screen of this exact text is `sr_alias_screen.out` (finding 7).

```text
KEY: E993-R30-GK-TREE-INDEPENDENCE-COUNTS-NONDECREASING-THROUGH-RANK-K-PLUS-ONE
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: For k >= 0 let G_k be the tree on Fin(3k+5) with root 0, leaf 1, support 2 with leaves 3 and 4, and arms 0–(5+3i)–(6+3i)–(7+3i) for i < k (the gkGraph k of the registered flow key; n = 3k+5). Write i_j = i_j(G_k) for the number of independent j-sets and Delta_j = i_{j+1} − i_j in the integers. Then for every k >= 0 and every 0 <= j <= k, Delta_j(G_k) >= 0; that is, i_0 <= i_1 <= … <= i_{k+1}. Companion content on the face (same grade), first: 8·Delta_{k+1}(G_k) = −2^k(k^2 + 3k − 8) for every k >= 0 (re-derived here; first registered as companion content of E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO); second: hence x(G_k) = C5LA1.crossingIndex(G_k) >= k+1 for every k >= 0, x(G_k) = k+1 for every k >= 2, x(G_1) = 3 and x(G_0) = 2 (x computed through rank alpha with the terminal difference). Proof of record (elementary; no classical dependency): conditioning on vertex 0 gives I(G_k) = (1+y)·U with U = (1+3y+y^2)^{k+1} + y(1+y)(1+2y)^k, so i_j = u_j + u_{j−1} and Delta_{m−1} = u_m − u_{m−2} (integer indices, u_t = 0 for t < 0); by 1+3y+y^2 = (1+y)^2 + y and 1+2y = (1+y) + y, u_m = Σ_{0<=i<=k+1} C(k+1,i)·C(2(k+1−i), m−i) + Σ_{0<=l<=k} C(k,l)·C(k−l+1, m−l−1) (binomials zero outside 0 <= t <= N); with E(N,t) = C(N,t) − C(N,t−2) and 1 <= m <= k+1, u_m − u_{m−2} = E(2k+2, m) + Σ_l [C(k+1,l+1)·E(2M,t) + C(k,l)·E(M+1,t)] (M = k−l, t = m−l−1 <= M) >= Σ_l C(k,l)·h(M,t), h(M,t) = E(2M,t) + E(M+1,t) >= 0 for 0 <= t <= M by three cases (t <= 1; 2 <= t <= (M+3)/2 where E(M+1,t) >= 0; (M+3)/2 < t <= M, which forces M >= 4 and t−2 >= M/2, where E(2M,t) >= C(2M,t)(4M+2)/((M+1)(M+2)) and C(2M,t) >= C(2M,t−2) >= C(M+1,t−2)(2M/(M+1))^{t−2} with (2M/(M+1))^{t−2} >= (3/2)^{M/2} >= (M+2)/3 >= (M+1)(M+2)/(4M+2), so E(2M,t) >= C(M+1,t−2) >= −E(M+1,t)). The first companion by palindromy of (1+y)(1+3y+y^2)^{k+1} (degree 2k+3): Delta_{k+1} = [y^{k+1}] − [y^k] of (1+y)^2(1+2y)^k. An independent second proof: coefficientwise domination (1+3y+y^2)^{k+1} >= (k+1)·y(1+y)(1+2y)^k plus the centre ratio of the palindromic real-rooted (1+3y+y^2)^{k+1} by Newton's inequalities (classical; named; not under sources/).
SCOPE: One explicit tree family G_k, every k >= 0; the unweighted independence counts of G_k at ranks 0 through k+1 and the first strict descent. Hypotheses: none beyond the definition of G_k (no IsTree, eligibility, selector, weight or rank hypothesis). Every difference is an integer; the indices j−1 and m−2 are integer indices with zero extension (in a natural-number formalization the bridge is stated as i_0 = u_0 and i_{j+1} = u_{j+1} + u_j with the sums filtered to i <= m and l+1 <= m). With alpha(G_k) = 2k+3 (registered companion content of the eligibility key) the eligible window of G_k is exactly k+3 <= p <= ⌊2(2k+3)/3⌋ for every k >= 2, nonempty iff k >= 3. Bounded corroboration (bounded_computation, never proof): three critic and adjudicator instruments k <= 400 (h(M,t) to M = 600) and the SR-C5-3 instrument k <= 100 (every link of both proofs; h(M,t) to M = 400).
ATTRIBUTION: The statement Delta_j(G_k) >= 0 for j <= k (the lower bound x(G_k) >= k+1) and its two independent proofs: critics C-U1-F (the elementary binomial-row proof, proof of record) and C-U1-T (the Newton route), r30 Cycle 5 Stage 4 (Claude Opus 5.5); step-by-step comparison and the k >= 0 scope of the Delta_{k+1} formula: the r30 Cycle 5 U adjudicator (Claude Opus 5.5); isolated second read SR-C5-3 (Claude Opus 5.5). The closed form of I(G_k), alpha(G_k) = 2k+3, the Delta_{k+1} formula and x(G_k) <= k+1 for k >= 2: F2 (r30 Cycle 2, Claude Sonnet 5; SR-C2-4), registered on the eligibility key and re-derived here. The G_k family: r30 (construction by C-F2-T, Cycle 1; registered in Cycles 2–3). Definitions of record (indepSetCount, forwardDifferenceDel, crossingIndex): the first-interior run (Codex), entries 1–18.
FENCES: A statement about the unweighted independence counts of one explicit family; no flow, weight, relation, selector, Hall or aggregate content. Nothing about Delta_j(G_k) for j >= k+2 (no unimodality claim for G_k, and none for any other tree); not a statement about any other tree or graph; no census value in the proof. No status change to E993-INDEPENDENCE-UNIMODAL-IFF-NORECOVERY, E993-INDEPENDENCE-POSITIVE-DELTA-SIZE, the registered G_k keys, (HALL), the primary aggregate, TREE, FOREST, TRANSFER, E993-BETA-AGG or Erdős #993. No RTree wording. The Delta_{k+1} formula and the upper bound x(G_k) <= k+1 are not new content of this key.
ALIASES: E993-R30-GK-TREE-CROSSING-INDEX-EQUALS-K-PLUS-ONE-FOR-K-AT-LEAST-TWO
ALIASES: G_k independence counts nondecreasing through rank k+1
```

```text
KEY: E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: For every k >= 0 and every natural p with x(G_k) + 2 <= p and 3p < 2·alpha(G_k) + 1 (every eligible rank of G_k; G_k = gkGraph k, a finite ordinary tree), with F = F_p(G_k) the fixed original strict selector, the active-tag weight w_F and the relation (D) ∪ (S) of SEMANTIC-CONTRACT §1.2, the transport network has an integral flow saturating every source supply, supported on single-deletion arcs; equivalently (HALL-COND) holds for every X ⊆ I_{p+1}. The eligible ranks are exactly k+3 <= p <= ⌊2(2k+3)/3⌋, nonempty iff k >= 3 (by alpha(G_k) = 2k+3 and x(G_k) = k+1 for k >= 2, x(G_1) = 3, x(G_0) = 2). Proof (a composition using nothing else): E993-R30-GK-TREE-INDEPENDENCE-COUNTS-NONDECREASING-THROUGH-RANK-K-PLUS-ONE gives x(G_k) >= k+1, so every eligible p satisfies p >= x(G_k) + 2 >= k+3; F_p(G_k) ⊆ leafSet(G_k) by the selector's filter; E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET (formally_verified; every k, every p >= k+3, every F ⊆ leafSet) at F = F_p(G_k) gives the flow. The upper eligibility bound 3p < 2·alpha + 1 is carried and not used; the tree property is elementary (3k+4 edges on 3k+5 vertices, every vertex joined to 0). Non-vacuity for k >= 3 and the window top use alpha(G_k) = 2k+3 and x(G_k) <= k+1 from E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO; emptiness for k <= 2 uses x(G_k) >= k+1 as well.
SCOPE: One explicit tree family G_k at every eligible rank; F fixed at the original rank p; original leaves, supports and witnesses. Grade proved_informal (the grade of its weakest input, the independence-count key); formally_verified only if its own governed award (terminal theorem gk_lowerRegionWeightedHall_everyEligibleRank, the synthesis's frozen expected statement) closes at exactly this scope, as the controller decides. The row k = 3 (n = 14 = 2p+2) lies in the formally closed order band n <= 2p+2 and is covered without being a contribution there; for k >= 4 every eligible rank lies in the unresolved band 2p+3 <= n <= 4p−8. Consequence on this family only: S(G_k, p) <= 0 at every eligible rank of G_k by E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE (non-strict). Bounded corroboration (bounded_computation, never proof): SR-C5-3 literal rows k = 3..8 at all nine eligible ranks (x through alpha, F_p derived, literal w_F, the source-minus-target weight total checked equal to S(G_k, p) on every row, deletion-arc max-flow equal to the source total).
ATTRIBUTION: The composition and its Lean dependency graph: the r30 Cycle 5 U adjudicator (Claude Opus 5.5); the Lean reduction of the corollary to one lower bound on the crossing index (compiled scratch, no grade): critic C-U1-F (Claude Opus 5.5); the tree layer gkGraph_isTree (compiled scratch, no grade): seat U1 (Claude Sonnet 5); the lower bound x(G_k) >= k+1: C-U1-T and C-U1-F (Claude Opus 5.5) via E993-R30-GK-TREE-INDEPENDENCE-COUNTS-NONDECREASING-THROUGH-RANK-K-PLUS-ONE; the flow: the r30 Cycle 4 award E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET (critic C-F2-T, the Cycle 4 F adjudicator, its formalizer); the G_k family and the eligibility key: r30 Cycles 1–3; the network, the active-tag weight and (HALL): Codex GPT-6 (Astra/Sol/Luna), the lower-region run and its corrections; transport definitions: the r30 Cycle 1 award E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY; definitions of record: the first-interior run (Codex), entries 1–18, with the r26/r24/r25 layers; isolated second read SR-C5-3. The r29 high-tail certificates are not used.
FENCES: G_k only; flows supported on single-deletion arcs; not (HALL) at full scope and not 'every tree' (E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN); nothing about switch arcs on any tree; not the strict sign of E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE at any rank other than k+3; nothing about the primary aggregate beyond G_k; no RTree statement; not a second infinite eligible family (the family of the registered G_k scope); not E993-R23-LITERAL-DELETE-ONLY-HALL (an unweighted delete-only inequality over every eligible ordinary tree, refuted at its own scope) and not E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY (a matching is not linear injectivity), neither revived; no closed region re-proved; no census value in the proof. No status change to the flow key, the eligibility key, (HALL), the primary aggregate, E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG or Erdős #993.
ALIASES: E993-R30-GK-TREE-SATURATING-FLOW-AT-EVERY-ELIGIBLE-RANK
ALIASES: G_k weighted Hall at every eligible rank
```

```text
SCOPE NOTE ON: E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET
TEXT: [r30 C5; SR-C5-3] Every eligible rank, with the independence-count key. E993-R30-GK-TREE-INDEPENDENCE-COUNTS-NONDECREASING-THROUGH-RANK-K-PLUS-ONE (proved_informal) gives x(G_k) >= k+1 for every k, so every eligible rank of G_k is at least k+3 and this key's flow, applied at F = F_p(G_k) ⊆ leafSet, covers every eligible rank of every G_k. That composition is registered as the SEPARATE key E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK (proved_informal; formally_verified only by its own award). The exclusion in this key's scope "'every eligible rank of G_k' (needs x(G_k) >= k+1, open; bounded k <= 400)" and the fence sentence "It does not assert (HALL) at every eligible rank of G_k (that needs x(G_k) >= k+1, open; bounded only)" are discharged by that separate key at proved_informal. This key's statement, grade (formally_verified), hypotheses and remaining fences are unchanged; nothing transfers to it. Attribution: C-U1-T, C-U1-F, the r30 Cycle 5 U adjudicator; SR-C5-3.
```

```text
SCOPE NOTE ON: E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO
TEXT: [r30 C5; SR-C5-3; erratum R30-E-m] Face confirmed against the frozen registry: this key asserts eligibility of the single rank p = k+3 for k >= 3 (x(G_k) + 2 <= k+3 and 3(k+3) < 2(2k+3) + 1), which needs only x(G_k) <= k+1, and its companion content states x(G_k) <= k+1 for k >= 2 (a strict descent at rank k+1). It does not assert x(G_k) = k+1, crossingIndex(G_k) = k+1, or anything about every eligible rank of G_k. The r30 Cycle 5 Stage 5 controller facts CF-5 (crossingIndex(G_k) = k+1 "proved_informal by the r30 Cycle 2–3 record") and CF-U1 ("the same scope already of record via the registered eligibility key") overstated this face; the Stage 6 controller fact CF6-6 corrects them (found by the r30 Cycle 5 U adjudicator). The lower bound x(G_k) >= k+1, hence x(G_k) = k+1 for k >= 2, is new with E993-R30-GK-TREE-INDEPENDENCE-COUNTS-NONDECREASING-THROUGH-RANK-K-PLUS-ONE (proved_informal); with it the eligible window of G_k is exactly k+3 <= p <= ⌊2(2k+3)/3⌋, nonempty iff k >= 3, and the (HALL) scope of record on G_k widens from every eligible rank p >= k+3 to every eligible rank (the separate key E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK). This key's statement, grade and fences are unchanged. Attribution: the r30 Cycle 5 U adjudicator; CF6-6; SR-C5-3.
```

```text
SCOPE NOTE ON: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL
TEXT: [r30 C5; SR-C5-3; G_k every eligible rank] On the explicit family G_k the restricted scope of record widens from every rank p >= k+3 at which (G_k, p) is eligible (the [r30 C4; SR-C4-1; G_k flow] note) to EVERY eligible rank of every G_k, deletion arcs alone: E993-R30-GK-TREE-INDEPENDENCE-COUNTS-NONDECREASING-THROUGH-RANK-K-PLUS-ONE (proved_informal) gives x(G_k) >= k+1, so no eligible rank lies below k+3, and the flow key applies at F = F_p(G_k). Registered as the separate key E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK (proved_informal, its weakest input's grade; formally_verified only by its own award). The eligible ranks are k+3 <= p <= ⌊2(2k+3)/3⌋ (k >= 3); for k >= 4 they lie in the unresolved band 2p+3 <= n <= 4p−8. This supersedes the C4 note's sentence "(HALL) holds at every eligible rank of G_k if x(G_k) >= k+1, which is not proved (bounded: x(G_k) = k+1 for 2 <= k <= 400; x(G_1) = 3)". (HALL) stays OPEN at full scope; one family; nothing here is a cut; nothing about switch arcs; no status transfer; the primary aggregate is untouched. Attribution: C-U1-T, C-U1-F, the r30 Cycle 5 U adjudicator; the flow key's authors; SR-C5-3.
```

```text
SCOPE NOTE ON: E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE
TEXT: [r30 C5; SR-C5-3] This key's scope sentence "possibly below if x(G_k) <= k (not excluded by a registered statement; x(G_k) = k+1 observed for 2 <= k <= 60, bounded)" is superseded: E993-R30-GK-TREE-INDEPENDENCE-COUNTS-NONDECREASING-THROUGH-RANK-K-PLUS-ONE (proved_informal) gives x(G_k) = k+1 for k >= 2, so the eligible window of G_k has no rank below k+3. With this key's [r30 C4; SR-C4-1] note, S(G_k, p) <= 0 at every eligible rank of G_k (non-strict; strict only at p = k+3, by this key). This key's statement, grade and fences are unchanged; no status change to any aggregate key. Attribution: C-U1-T, C-U1-F; SR-C5-3.
```

```text
DISTINCTION ROW: DR-SR-C5-3-01
KEY: E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO
TEXT: Same family, complementary content. The eligibility key asserts eligibility of the single rank k+3, favorability of 3 and 4, the unique no-in-arc target A_k and the gap 2; its companion content carries the closed form of I(G_k), alpha(G_k) = 2k+3, formula 8·Delta_{k+1} = −2^k(k^2+3k−8) and hence the UPPER bound x(G_k) <= k+1. The independence-count key asserts Delta_j(G_k) >= 0 for every j <= k, the LOWER bound x(G_k) >= k+1; the Delta_{k+1} formula appears on both faces and is attributed to the eligibility key's authors. Neither implies the other's main clause.
```

```text
DISTINCTION ROW: DR-SR-C5-3-02
KEY: E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET
TEXT: The flow key asserts a deletion-supported saturating flow at every rank p >= k+3 for every leaf tag set F, with no eligibility, crossing-index or independence-number content. The every-eligible-rank key quantifies over the ELIGIBLE ranks (x(G_k) + 2 <= p, 3p < 2·alpha + 1) with F = F_p(G_k) fixed; it is the flow key composed with the lower bound x(G_k) >= k+1, which the flow key does not contain. The independence-count key is a statement about unweighted independence counts, not about flows.
```

```text
DISTINCTION ROW: DR-SR-C5-3-03
KEY: E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE
TEXT: That key is an exact strict sign theorem for S(G_k, k+3) at one rank with every per-leaf summand negative. The every-eligible-rank key concludes a saturating flow (a transport statement) at every eligible rank; it implies only S(G_k, p) <= 0 there, non-strict. The independence-count key concerns the counts i_j(G_k), not the aggregate.
```

```text
DISTINCTION ROW: DR-SR-C5-3-04
KEY: E993-INDEPENDENCE-UNIMODAL-IFF-NORECOVERY
TEXT: Lexical neighbour. That key is a general equivalence for finite independence sequences (weak unimodality iff Delta_k <= 0 at every k >= x). The independence-count key asserts monotonicity of one family's counts up to rank k+1 and the location of the first strict descent; it asserts nothing at ranks past k+1 and makes no unimodality claim.
```

```text
DISTINCTION ROW: DR-SR-C5-3-05
KEY: E993-INDEPENDENCE-POSITIVE-DELTA-SIZE
TEXT: Lexical neighbour. That key bounds the order of any graph with Delta_r > 0 (|H| > 2r+1). The independence-count key is a sign statement on one family; it is consistent with that key (n = 3k+5 > 2j+1 for j <= k) and neither uses nor extends it.
```

```text
DISTINCTION ROW: DR-SR-C5-3-06
KEY: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL
TEXT: The every-eligible-rank key is (HALL) restricted to one explicit infinite family, proved there with deletion arcs; (HALL) at full scope stays OPEN and nothing transfers to it.
```

```text
RECORD: SR-C5-3-R1
CLAIM: Literal G_k rows k = 3..8 at all nine eligible ranks (6; 7; 8; 9,10; 10,11; 11,12): x through alpha, F_p = all leaves, literal w_F, the source-minus-target weight total checked equal to S(G_k, p), deletion-arc max-flow equal to the source total (source total, target total and S: 253, 527, −274 at k = 3 through 805154, 1448816, −643662 at k = 8, p = 12)
STATUS: bounded_computation
PROVENANCE: SR-C5-3 instrument sr_flow.py (scratchpad/c5-sr-SR-C5-3/), corroboration only
```

## Verdicts

verdict[SR-C5-3a]: confirmed
verdict[SR-C5-3b]: confirmed_with_repairs
verdict[SR-C5-3c]: confirmed
verdict[SR-C5-3d]: confirmed_with_repairs
verdict[SR-C5-3e]: confirmed_with_repairs

- **3a:** confirmed as stated. Both proofs are valid and there is no step disagreement; `x(G_0) = 2`.
- **3b:** the composition uses only the flow key, `x ≥ k+1` and `F_p ⊆ leafSet`. The repair is the non-vacuity citation (finding 3), carried in the KEY text above.
- **3c:** the eligibility key's face states eligibility at `p = k+3` only, and R30-E-m and CF6-6 are right.
- **3d:** both names are predicates and the screen is clean. The repairs are the attribution of the `Δ_{k+1}` companion to the eligibility key's authors and the
  family's Cycle 1 construction (finding 2). The KEY blocks above carry the repaired text.
- **3e:** the DAG is closed by 3a plus the flow key plus the reduction, and the fences are right. The repairs are N4a/N4b in guarded ℕ form (finding 5; exact text
  there) and N3 calling entry 110 (finding 6). This item informs the formalizer through the controller and is not a registration.

**One line:** GK-MONO (`Δ_j(G_k) ≥ 0` for `j ≤ k`, so `x(G_k) = k+1` for `k ≥ 2`) and the every-eligible-rank composition are CONFIRMED at `proved_informal`.
This read clears the `C5-LA1` award's informal input, provided N4a is formalized in guarded ℕ form.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Artifact inventory

Everything is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-sr-SR-C5-3/`. Nothing was written anywhere else except this file. No sealed member was edited. No background job was started,
none is running, and no process was killed. There is no `__pycache__` (`python3 -B`).

| File | SHA-256 | Note |
|---|---|---|
| `seal_audit.py` | `10bbc831c9ce7defaecbc83b51c484c06b0df4578a52a02030a454bfd489b470` | capsule seal + 112 member digests |
| `sr_gk.py` | `92a5f97f1bb9f544c62b23623a79751532040e7c3960c8a9bfcfa73d811da824` | own instrument: literal G_k, tree test, generic DP (two roots), closed form, brute force k<=4, alpha, Delta, x, windows, N4a/N4b, every link of both proofs |
| `sr_gk_60_400.out` | `f77bd8eb21e4efcc1791448484283a352d91c19b2f3440698916ce4698fed3d6` | k<=60, M<=400; n_fails 0; RESULT_SHA256 9984b987…5435 |
| `sr_gk_100_400.out` | `d49529bd8448f3f1f08f8d9b4e98553164df941e0e55a6109064307a899791ba` | k<=100, M<=400; n_fails 0; RESULT_SHA256 e75bcba4…f492 |
| `sr_n4a.py` | `414238bf72ffe095b6a68d1d80707cc6140b0f9862c953344b4375ee3c1011ae` | N4a under integer / literal-N / guarded-N readings; N4b guarded |
| `sr_n4a_60.out` | `bf92ff6f58669be64c6f144974860e4a0ee90e01bb9d2756560b8f67689b9a9b` | guarded fails []; literal-N wrong exactly at j = 0..k+1 (k<=60); RESULT_SHA256 5ee6c90f… |
| `sr_flow.py` | `fc8b626dd2cb858b76484e1beb357315b6d989e03dfe265faf32d3dc2c7925b2` | literal-fidelity corroboration: F_p derived, literal w_F, supply − capacity = S asserted, deletion-arc Dinic max-flow |
| `sr_flow_6.out` | `f01862e46fa2fc1d18eca873d1b7213dfd123d044579fb068fc3f4988f9240a4` | k = 3..6; fails [] |
| `sr_flow_8.out` | `97925fe96a4429706c73112219fc548fc3da1c3ca84a52f14d956b4d94615cb2` | k = 3..8, nine eligible rows; fails []; RESULT_SHA256 61bd6b76…35a5 |
| `sr_alias_screen.py` | `791091656a7a61325a7bf0b190fd4015cd6d84f61d5ffa854af5bf48d2c3532b` | alias / pattern / forbidden-token / token-overlap screen vs snapshot (453) and master (434) |
| `sr_alias_screen.out` | `e5849a343645c5753e2bec37825cdecec8b0041d0fef8d73a2f1514ef9fe0aa6` | screen of the final registration text (RESULT_SHA256 c2dbebc3…) |
| `registration.txt` | `10681e68ad8c771faaa92ec2e903ef3fab29f58620bafb0db884fc9c9c289696` | the registration text reproduced verbatim above |
| `replay/gk_monotone_check.py` | `4ce6d7067c937d3aeda7ca6b056bf1c4ffbae25696268bc420657d9e953f8005` | frozen C-U1-F instrument, copied out; replay ALL True |
| `replay/gk_crit.py` | `c87725c8373bf869dbbe55b6f89622d4ab03704f2b6ae0957951585d5229c75e` | frozen C-U1-F module needed by the replay, copied out |
| `replay/adj_gk.py` | `87d4ff0e31f403d455ecde2471823d8bbdb1f64388af651208220beeb92b1257` | frozen ADJ-U instrument, copied out |
| `replay/adj_gk.replay.out` | `ff127304d4624e2c6b746820485363757eb508a52bb1e3ba472ade5926e430c6` | replay output (plus a shell timing line); body byte-identical to frozen adj_gk.out |
| `lean/LeanProject/SRProbe.lean` | `ed175fe47e97cb83d34e4f4ea2ebd450a9d2ba5ae9de917f348bb887471410ce` | copy of Corollary.lean + sr_probe_closure + sr_probe_N3_via_entry110; compiled scratch, no grade |
| `lean/LeanProject/LeanProof/Main.lean` | `05c24dda55cea6f877bc2e3caed0a156e559e6ef6254d303d81e377aaf64165e` | copy of the frozen seat file (05c24dda…); built |
| `lean/LeanProject/Corollary.lean` | `32ac25a1ea2d99e9d65836593a53b1298b0512f01cf42edfc882cf0e0050e0ec` | copy of the frozen C-U1-F file (32ac25a1…) |
| `body_top.md` | `092f61e9e1210c6b5b1c4f4d4b6bdde51f5df2b9136d5c7d3d063fec732df522` | drafting fragment of this file |
| `body_mid.md` | `81f70d698ca7d77e3ce617f5f1dff4c3796f364bf996b177168b35124b9913a0` | drafting fragment of this file |

The Lean scratch project also holds copies of the four frozen seed files (`lakefile.toml` `45d0ca58…`, `lake-manifest.json` `52a4d73c…`,
`lean-toolchain` `2bdc48ad…`, `LeanProof.lean` `f4dfdef8…`). `.lake/packages` is a symlink to the shared pinned project, never copied, updated or cleaned,
and `.lake/build` was produced by the foreground `lake build`.

Replay: `cd <scratch> && python3 -B sr_gk.py 100 400 && python3 -B sr_n4a.py 60 && python3 -B sr_flow.py 8 && python3 -B sr_alias_screen.py`;
then `cd <scratch>/lean/LeanProject && lake build && lake env lean SRProbe.lean`.

**Read-boundary record and deviations.**
- I read the protocol, the brief, the capsule manifest and its 112 members. Among them were the award's `Main.lean`, report, receipt and axioms log, and the frozen
  registry snapshot and master. I also read the two VerityOS boot files.
- The `verity.md` display was truncated in the middle, and the startup protocol was read to line 150.
- **Deviation:** one names-only `ls` of `second-reads/` (outside the capsule) to see whether the output directory existed. No file there was opened.
- Outside the capsule the only other paths touched were my scratch and the shared Lean packages, bound as a symlink target and used only by `lake`. I ran no `grep` inside Mathlib and no
  `find`, `grep` or `rg` above the capsule members, used no network, and installed nothing.
- One shell command failed harmlessly on zsh `=` expansion (`echo ======`) before any output was used.
- The host injected `CLAUDE.md` and the memory index into context. I neither opened nor acted on them.
- No controller prior or frozen census is used as evidence. The bounded rows above are corroboration only.
