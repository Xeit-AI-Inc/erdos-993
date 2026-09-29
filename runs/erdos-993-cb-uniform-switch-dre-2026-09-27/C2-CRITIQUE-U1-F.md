# Critique

Critic `C-U1-F` of r31 Cycle 2, Stage 4. Cross-orientation critic, orientation F (falsify), assigned to seat `U1`'s return (route
`C2-U-01`, mechanism token `FORMAL-ELIG-TOP-PARENT-DESCENT`, orientation U).

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I loaded no other VerityOS subsystem. The dispatch restricts the boot to
those two files. The controller owns conversation logging for this run, so I wrote no conversation log.

**Model disclosure (two-part):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Dispatch.** `control/dispatch/c2-stage4/DISPATCH-C-U1-F.md` has SHA-256
`d90cfcb195c775f39aa940cab2b8f03f21ccca8586d3d064c07741488c5367cf`. I checked this before reading the file. **MATCH.**

## Identity and seal audit

To recompute each seal I took SHA-256 over compact key-sorted JSON (`sort_keys=True`, `separators=(",",":")`), without `seal_sha256`
and without a trailing newline. The script is `scratchpad/c2-crit-U1-F/seals.py`.

| Object | Recorded seal | Recomputed | Result |
|---|---|---|---|
| Capsule `control/c2-critic-capsules/U1-PACKET-MANIFEST.json` | `9ffad3154e5a19f7ecde8fb1797621fadb5531aeaf4ec80f21eb2649acfa5897` | same | **MATCH** |
| Stage 4 dispatch manifest `control/C2-STAGE4-DISPATCH-MANIFEST.json` | `af5d13510a82108cb7e584d0909f5f1fee4055d0f2a6448e9dde08411a2145bb` | same | **MATCH** |
| Stage 3 packet manifest `control/C2-STAGE3-PACKET-MANIFEST.json` | `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5` | same | **MATCH** |
| Stage 2 packet manifest `control/C2-STAGE2-PACKET-MANIFEST.json` | `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4` | same | **MATCH** (equals the protocol's value) |

- **Capsule members.** All 14 files have the SHA-256 and byte count the capsule records, including the return
  (`327718437d3d…a847c`, 29,748 bytes).
- **The return's artifact digests.** All five digests replay exactly:
  - `Main.lean`: `40789438…dcbe`
  - `u1_cb8s5.py`: `c5210c76…419a`
  - `u1_cb8s5_out.json`: `757a5e0a…7cfc`
  - `u1_cb8_delta_check.py`: `c4dad7fd…c81b`
  - `u1_cb8_delta_check_out.json`: `b5db1905…73c6`
- **The frozen C1-LA3 award.** All 91 files under `sources/c1-results/runs/lean-2026-09-28-c1-la3-two-binomial-descent/` match
  `sources/c1-results/SOURCE-DIGESTS.json`. The award's `Main.lean` (`c0605e12…3f011`) equals the kernel receipt's
  `source_sha256_before` and `source_sha256_after`. The receipt verdict is `verified`, and its allowed axioms are `propext`,
  `Classical.choice` and `Quot.sound`.
- **Claim identity.** The return proposes no new key. It names the registered eligibility key
  `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE`
  (`computer_assisted`) and leaves its grade unchanged. That is correct: compiled scratch has no grade.
  - The return also cites the favorability key `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`
    for the closed form only, which is proper.
  - I propose no key. The critic-derived Lean lemmas below are scratch and have no grade.

## Independent re-derivation

**Fidelity (this route has no network).**
- This route builds no transport network. So (WID), `F_{p*}`, the weight and the relation are not objects here, and nothing about
  (HALL) is claimed.
- The fidelity items that do apply are these:
  - which `G` is used;
  - that the closed form equals the literal tree's independence polynomial;
  - that `x` is computed through `α`.

**Which `G` (controller fact CF-C2-G).**
- The Lean text defines `cb8G : ℤ[X] := X * (1 + X) ^ 8 + (1 + 2 * X) ^ 8`. This is `(1+2x)^8 + x(1+x)^8` with the addition
  commuted, which is exactly the contract's `G` (SEMANTIC-CONTRACT §2 at `d = 8`).
- It is not the allocation's swapped `(1+x)^8 + x(1+2x)^8`.
- `u1_cb8_delta_check.py::cb8G_poly` builds the same `x(1+x)^8 + (1+2x)^8`.
- **Confirmed: the contract's `G` is used throughout, in both Lean and Python.**

**Instrument 1: `crit_literal.py`.** This is my own code. It is a generic tree dynamic program over an explicit edge list of
`CB(8,m)`, with labels `r, s, v, u_i, b_ij, c_ij`. It asserts `|E| = n − 1` and connectivity, and it uses no closed form.
- It checks the literal independence polynomial against the closed form of record, coefficient by coefficient.
- It computes the following directly from the literal polynomial:
  - `α`;
  - `x`, the least `k` with `i_{k+1} < i_k`, zero-extended above `α`;
  - both eligibility inequalities;
  - the descent at `L = p* − 2`.
- It also computes the block pieces `g_j` from an explicit convolution formula
  `[x^k]P_j = Σ_i C(8j,i) 2^{k−i} C(8(m−j)+1, k−i)`. This is a different code path from U1's polynomial multiplication.
- It asserts `Σ_j C(m,j) g_j + τ = i_L − i_{L+1}` exactly.

Results for control rows 107, 110, 113, fresh rows 116, 119 and the larger row 137, plus outside rows 95 and 104 for contrast:

| m | n | α | p* | x | literal = closed form | descent at p*−2 | `x+2 ≤ p*`, `3p* < 2α+1` | `S_5 > 0` | `S_4 > 0` | signs of `g_0..g_5`, `τ` |
|---|---|---|---|---|---|---|---|---|---|---|
| 95 | 1618 | 856 | 508 | 506 | yes | yes | yes | **no** | no | `− − − + + +`, `−` |
| 104 | 1771 | 937 | 556 | 554 | yes | yes | yes | yes | no | same |
| 107 | 1822 | 964 | 572 | 570 | yes | yes | yes | yes | no | same |
| 110 | 1873 | 991 | 588 | 586 | yes | yes | yes | yes | no | same |
| 113 | 1924 | 1018 | 604 | 602 | yes | yes | yes | yes | no | same |
| 116 | 1975 | 1045 | 620 | 618 | yes | yes | yes | yes | no | same |
| 119 | 2026 | 1072 | 636 | 634 | yes | yes | yes | yes | no | same |
| 137 | 2332 | 1234 | 732 | 730 | yes | yes | yes | yes | **yes** | same |

- The 16-hex prefixes of SHA-256(`str(S_5)`) agree with U1's recorded `S5_sha256` on every common row: `b64f2686`, `e07f8d15`,
  `74cb122b`, `9bbc113b`, `5128ec95` and `aaa47624`.
- So the object U1 defines in Lean as `cb8S5` and computes in Python is the same integer that my separate construction produces.
- To confirm that the Lean `def cb8S5` is that integer, I read it line by line: `Σ_{j<6} C(m,j)·(P_j[L−j] − P_j[L−j+1])` plus the
  tail difference, at `L = (16m+4)/3 − 2`.
- These rows are `bounded_computation`, never evidence for the universal claim.
- The fixed points of SEMANTIC-CONTRACT §5 are reproduced: `CB(8,107)/572` has `n = 1822`, `α = 964`, `x = 570`, and `CB(8,95)/508`
  has `n = 1618`, `α = 856`, `x = 506`.

**Instrument 2: `crit_symbolic.py`.** This is a symbolic, non-interpolated derivation of the `S_5` certificate. Put `m = 3t+2`,
`B = 24t+17`, `L = 16t+10` and `c = B − L = 8t+7`.
- Each term `C(m,j)·C(8j,i)·2^{k−i}·C(B−8j, k−i)` of `S_5`, and each tail term, becomes `2^L C(B,L)` times an exact product of linear
  factors in `t`. The identity used is
  `C(B−a, L−b)/C(B,L) = [ff(L,b) or 1/rf(L+1,−b)]·[ff(c,a−b) or 1/rf(c+1,b−a)]/ff(B,a)`.
- Clearing denominators by the least common multiple of the factor multisets gives
  `S_5 · 2^46 · 120 · Den(t) = 2^L C(B,L) · N(t)`.
- `Den(t) = Π_{q=0}^{39}(24t+17−q)·(16t+11)·Π_{q=1}^{5}(8t+7+q)`, of degree 46. This is exactly SR-4's `D_5`.
- `deg N = 50`. The content of `N` is `2^44·3`.
- **The primitive `N` has SHA-256 (JSON, ascending) `893a21b6fdd0f7c2ac7e151db10873351c164c949ee12582812fc3452db651f7`.** This equals
  SR-4's recorded `893a21b6…51f7`, from a construction written independently by me.
- The identity was also guarded exactly against direct binomial sums at `t ∈ {1,2,5,10,28,33,34,35,36,40,60,100,200}`, and all
  checks pass. The guard is not the proof: the identity is exact factorial algebra.
- **Signs.** `N(t) < 0` for every integer `t ∈ [1, 32]`, and `N(t) > 0` from `t = 33`. All 51 coefficients of `N(t0 + u)` are
  strictly positive for `t0 = 33` (the smallest such shift) and for `t0 = 35`. At `t0 = 35` the coefficients have 70 to 147 digits
  before the content is removed.
- So `S_5 > 0` for every real `t ≥ 33`, that is, for every class `m ≥ 107` and also at `m = 101, 104`, which lie outside the class.
- This agrees with SR-4 (negative at `t = 28..32`, positive from `t = 33`). The mathematics of node (2) is sound at its recorded grade
  (`computer_assisted`: one fixed polynomial positivity certificate).

**Replay of U1's generators.** I copied them out first into `scratchpad/c2-crit-U1-F/replay/` and ran them with `python3 -B`. Both
output files came back byte-identical (`757a5e0a…`, `b5db1905…`).

**Lean rebuild.** I copied the project out first into `scratchpad/c2-crit-U1-F/LeanProject/`, bound `.lake/packages` by manual
symlink to the pinned shared project, and ran `lake build LeanProof` after `cd` into the project.
- The build succeeds: `LeanProof.Main` takes 26 s, `LeanProof` 4.6 s, and the wall time is 35.5 s.
- `#print axioms` reports `[propext, Classical.choice, Quot.sound]` for `cb8_block_identity`, `cb8_coeff_diff`,
  `cb8_tail_blocks_nonneg` and `cb8_elig_top_a_conditional`.
- A text scan finds no `sorry`, `admit`, `native_decide`, `decide`, `axiom`, `opaque`, `implemented_by` or `extern`.
- The only warning is an unused binder `hj` in `cb8_term_eq`.
- **Carry (gate ruling 12).** The award's `Main.lean` (18,989 bytes) is a byte-exact prefix of U1's `Main.lean`. All 21
  `Snippets/*.lean.fragment` files are byte-identical to the award's. Entries 1–21 are unmodified, and the file has 644 − 464 = 180
  new lines.

## Attacks and findings

1. **The conditional hypothesis encodes the right statement, not the conclusion.** `hS5 : 0 < cb8S5 m` is exactly SR-4's pooled
   `S_5` positivity: blocks `j = 0..5` plus the tail, at `L = p* − 2`, with weights `C(m,j)`. It is a strictly partial statement.
   - The conclusion also needs `Σ_{j=6}^{m} C(m,j) g_j ≥ 0`, which the proof takes from the carried
     `cb8_block_descent_topRank` (`5 ≤ j ≤ m`, strict).
   - The hypothesis is also *true* on the class: see my instrument 2 and the Lean `Nt_pos` below. So the conditional theorem is not
     vacuous. **Holds.**
2. **The block identity.** `cb8_block_identity` is stated for every `m : ℕ` (no class restriction needed).
   - Its weights are `(m.choose j : ℤ[X])`, and the block is `X^j (1+X)^{8j}(1+2X)^{8(m−j)+1}`.
   - The ℕ-subtraction `m − j` is harmless because `j ∈ range(m+1)`. The tail is `X(1+X)(1+2X)^{8m}`.
   - In `cb8_coeff_diff`, `m ≤ L` makes every `L − j` exact. At `L = (16m+4)/3 − 2` with `m ≥ 107`, `omega` discharges this.
   - My literal-tree dynamic program confirms the identity numerically at eight rows. **Holds.**
3. **The carried node is used within its scope.** It is applied at `j ≥ 6`, inside its `5 ≤ j ≤ m`. The pooling puts `j = 5` in
   `S_5`, as SR-4 does, and that is harmless. **Holds.**
4. **The return's text overclaims (E).**
   - The return says: "My Lean scratch formalizes this statement (and (E), which follows from it plus `α = 9m+1` and
     `3p* < 2α+1`)".
   - The route verdict says: "a genuine conditional proof of (ELIG-top)(a)/(E)".
   - The Lean file contains **no** statement about `α`, `deg (cb8I m)`, a crossing index, or either eligibility inequality. It proves
     only `(cb8I m).coeff (p*−1) < (cb8I m).coeff (p*−2)` under `hS5`.
   - Deriving (E), even for the closed form, would need `deg cb8I m = 9m+1` and a first-descent lemma. Neither is present.
   - **Narrowed:** the conditional theorem is (ELIG-top)(a) for the closed-form polynomial only.
5. **Unbacked certification literal: the shifted-coefficient signs.** In node-(2) step 4 the return says: "With `N_5(35+u)`'s 51
   integer coefficients in hand (I confirmed their signs numerically above, matching SR-4's table)". Remaining obligation 1 says:
   "The 51 shifted-coefficient signs are independently confirmed (bounded_computation, six rows, this return's replay)".
   - Neither of U1's scripts computes `N_5`, a Taylor shift or any coefficient of a polynomial in `t`. `u1_cb8s5.py` evaluates `S_5`
     at six integer rows.
   - The literal is **struck**. The fact itself is true: I confirm it with instrument 2, and its digest matches SR-4. It stands on the
     critic's evidence, not on the return's.
6. **Minor unbacked literals.**
   - (a) "Every row independently reproduces SR-4's reported `(n, α, x, p*)`": U1's instruments work only with the closed form and
     never compute `n`. Strike "`n`". My literal instrument does reproduce `n`.
   - (b) The second script is called "a second, independent code path" for `cb8S5`. It rebuilds `S_5` by the same
     block-polynomial construction; it is independent only in obtaining `α`, `x` and `Δ_L` from the full closed form. Narrow the
     word "independent" accordingly.
   - (c) "179 new lines": the count is 180. This is immaterial.
7. **Fresh rows (gate rulings 2 and 9).** At `m = 116, 119` and the larger row 137, the parent descent, both eligibility inequalities
   and `S_5 > 0` hold. The control rows 107, 110 and 113 are reproduced.
   - `S_4 > 0` at `m = 137` but not at 107–119. This is consistent with SR-4's "`S_4 < 0` at `t = 35..44`" (`t = 45` is `m = 137`).
   - The pool `j ≤ 5` is the smallest pool that covers the whole class. No row gives a counterexample.
8. **Hunt for a cut or refutation.** This route's objects are pure coefficient statements. A failure would have to be:
   - a class row where the descent fails, which my rows exclude and instrument 2 excludes universally at the certificate's grade;
   - a false carried input, which the byte-identical carry and the kernel receipt exclude;
   - or a Lean statement that does not mean the contract's statement.
   - On the last point, `cb8I` is the contract's closed form with the contract's `G`. `(16*m+4)/3 − 1` and `(16*m+4)/3 − 2` are
     `p* − 1` and `p* − 2` exactly on the class. The strict `<` is in the right direction: `i_{p*−1} < i_{p*−2}`.
   - **No failure found.** This route has no network, so no cut can arise here (`cut_candidate: none`).
9. **The unlinked bridge is named correctly.** The route is about `cb8I`, not `cbGraph`. The link from `cb8I`'s coefficients to
   `C5LA1.crossingIndex (cbGraph m)` belongs to U3. The return says so. **Holds**, with the (E) narrowing of item 4.

**Critic-derived advance (attributed to critic C-U1-F; compiled scratch, no grade).** This is my attempt at node (2) using the return's
own four-step split.

- **Step 4 is done.** `LeanProof/CritStep4.lean` defines:
  - `CritU1F.Nt`, the primitive `N_5` in `t`, with the 51 literal coefficients of my instrument 2 (SHA-256-identical to SR-4's
    primitive `N_5`);
  - `CritU1F.Nsh`, its Taylor shift at `t = 35`.
  - It proves `Nt_shift : Nt (u+35) = Nsh u` by `ring`, `Nsh_pos : ∀ u : ℕ, 0 < Nsh u` by `positivity`, and
    `Nt_pos : ∀ u : ℕ, 0 < Nt (u + 35)`.
  - This is sorry-free, `#print axioms` gives `[propext, Classical.choice, Quot.sound]`, and it takes **14.8 s wall** (`lake env lean`,
    including the Mathlib import).
  - It uses no `decide` and no enumeration: positivity over `u : ℕ` of a fixed polynomial with positive literal coefficients.
- **Steps 1 and 2 are done as general lemmas.** `LeanProof/CritSteps12.lean` proves three lemmas:
  - `coeff_one_add_two_X_pow : ((1+2X)^b).coeff n = 2^n · C(b,n)`;
  - `coeff_twoBinom : ((1+X)^a (1+2X)^b).coeff k = Σ_{i ≤ a} C(a,i)·[i ≤ k]·2^{k−i}·C(b,k−i)`. It applies verbatim to `cb8P m j`.
  - `choose_ratio`, the subtraction-free binomial-ratio lemma
    `C((K+x)+(c+y), K+x)·(K+1)^{(x)}·(c+1)^{(y)} = C(K+c, K)·(K+c+1)^{(x+y)}`, where the superscript denotes the rising factorial.
    Every factorial-ratio identity of instrument 2 is an instance of it.
  - All three are sorry-free, `#print axioms` gives `[propext, Classical.choice, Quot.sound]`, and the file takes **6.0 s wall**.
- **Step 3 is not done; I measured its feasibility.** Step 3 is the single bridge
  `cb8S5 (3u+107) · 2^46·120·Den(u+35) = 2^L C(B,L) · 2^44·3 · Nt(u+35)`.
  - Its dominant cost is expanding 256 products of 46 linear factors each into the degree-50 numeral polynomial.
  - One such term under `ring` (`CritRingK1.lean`) takes **35.5 s wall**, about 25–30 s beyond the import.
  - The monolithic 256-term `ring` (`CritRingTest.lean`) had **not** finished after 15 min 27 s of elaboration (resident memory
    2.5–3.2 GB). I killed it by literal PID, so one-shot `ring` is not a feasible design.
  - A Horner-chain design is feasible, with each step a `have` holding explicit numeral intermediates: `S_i = w_i·P_i + K_i·S_{i+1}`,
    `P_i = D_i·P_{i+1}`.
  - I measured one representative step (a degree-45 numeral polynomial with 148-digit coefficients, times a linear factor, plus a
    scalar multiple) at **9.0 s wall**, about 3–4 s beyond the import (`CritHornerStep.lean`).
  - Estimate: about 500 steps (six blocks of at most 82 terms, plus the tail and the cross-block scaling by `ff(B,8j)`), so roughly
    25–35 min of elaboration. This should be split into per-block files as U1 suggests, and generated by a script from instrument 2.
  - U1's "one `ring` call per block" is therefore also too coarse: block 5 alone has 82 terms of degree about 41, roughly 30–40 min
    per `ring`. Per-step Horner decomposition is the workable granularity.
- **Net.** After this critique, node (2) is one explicit Lean bridge identity (step 3) away from closing. Every other piece of
  (ELIG-top)(a) for the closed form is sorry-free in scratch:
  - U1's nodes 1, 3 and 4;
  - the critic's steps 1, 2 and 4.

## Mechanism-equivalence and fence check

- **Mechanism.** The block identity is the binomial theorem applied to `G^m`. (BD) is the carried two-binomial tool (G) from C1-LA3.
  The pooled certificate is SR-4's `S_5`. No refuted mechanism is revived (SOLUTION-CONTRACT §3.6).
- **Darroch/Newton.** Neither is used by U1 or by me. `E993-TREE-REAL-ROOTED` is not invoked, and there is no real-rootedness claim
  about `cb8I`, `G` or `G^m`.
- **Fences.**
  - Fence 1: one rank per tree (`p*`), class `m ≥ 107`, `m ≡ 2 (mod 3)` only. The `cb8_block_identity`/`cb8_coeff_diff` identities
    hold for all `m` as algebra and claim nothing about any other rank.
  - Fence 4: no network, so not applicable.
  - Fence 5: no asymptotics. The threshold is the class endpoint, and the certificate's range starts at `t = 33 < 35`.
  - Fence 7: every row table is `bounded_computation`.
  - Fence 8: no sealed root was edited; all work was copy-out-first.
  - Fence 9: attribution is correct in the return. Nodes 1 (difference form) and 4 are U1's. Entries 1–21 and (G)/(BD) are C1-LA3's.
    The closed form is r30's. The `S_5` construction is SR-4's. The instrument-2 re-derivation and the Lean lemmas `Nt_pos`,
    `coeff_twoBinom` and `choose_ratio` are this critic's.
- No status transfers to (HALL), to either aggregate key or to any other key.

## Certification audit

| Literal in the return | Evidence | Ruling |
|---|---|---|
| "sorry-free"; "`#print axioms`: `[propext, Classical.choice, Quot.sound]`" (four declarations) | my rebuild | **backed** |
| "byte-identical carry … entries 1–21" | prefix plus 21/21 snippet `cmp`; award digest equals the kernel receipt | **backed** |
| compile times "~26–27s / ~3.4–3.6s / ~31–34s" | mine: 26 s / 4.6 s / 35.5 s | **backed** (same order) |
| "Delta_L negative … descends" at rows 95–119; hashes | replay byte-identical, and my literal dynamic program | **backed** (`bounded_computation`) |
| "reproduces SR-4's reported `(n, α, x, p*)`" | `n` never computed by U1 | **strike "n"** (the rest is backed) |
| "a second, independent code path" for `cb8S5` | same block construction | **narrow** |
| "I confirmed their signs numerically above" (51 shifted coefficients) | no such computation in U1's artifacts | **strike** (true by my instrument 2) |
| "The 51 shifted-coefficient signs are independently confirmed (… six rows, this return's replay)" | same | **strike** |
| "formalizes this statement (and (E) …)"; "(ELIG-top)(a)/(E)" | no (E), `α` or crossing-index statement in Lean | **strike (E)**; narrow to (a) for `cb8I` |
| the S5/(−Δ) ratios `0.1417…, 0.1625…, 0.1759…` | my literal instrument gives `0.14170727…, 0.1625373…, 0.17593013…` | backed as a non-evidentiary cross-read |
| "644 lines … 179 new" | 644 total / 180 new | immaterial |

**`## Remaining obligation` (of the return), judged for exactness.**
- Item 1 is exact about the object: `∀ m, 107 ≤ m → m % 3 = 2 → 0 < cb8S5 m`. Its evidence sentence is struck (item 5 above), and the
  split it proposes is too coarse at the `ring` level (see the advance).
- Item 2 is exact.
- Item 3 is exact about the `cbGraph` link. It should add that (E) itself (`α = 9m+1` and `crossingIndex ≤ p* − 2`) is not formalized
  here even for the closed form.

## Verdict

The return's Lean content is correct and verified by my rebuild:
- the block identity, unconditional for all `m`;
- the difference form;
- the carried (BD) used within its scope;
- the composition, conditional exactly on SR-4's `S_5` positivity.

The hypothesis is true on the class: I derived it independently, symbolically, and my primitive numerator is identical to SR-4's by
digest. Its sign pattern is also formally checked in scratch by the critic's `Nt_pos`. The return's text overclaims in two respects,
both struck: (E) is not formalized, and the shifted-coefficient signs were never computed by the seat. The retained statement is
narrowed to: "(ELIG-top)(a) for the closed-form polynomial `cb8I`, sorry-free in scratch, conditional on `0 < cb8S5 m`". The
mathematics of (ELIG-top)(a) on the closed form is complete at `computer_assisted` (the fixed certificate). There is no new grade.

verdict: retained_narrowed
headline_resolved: no

ELIG_formal: advanced
HALL_formal: not_advanced
FAV_darroch_free: not_advanced
cut_candidate: none

## Remaining obligation

1. **Step 3, the single bridge identity.** The following must hold in `ℤ` for every `u : ℕ`, with `m = 3u+107`, `B = 24u+857` and
   `L = 16u+570`:
   `cb8S5 m · 2^46 · 120 · Den(u+35) = 2^L · C(B, L) · 2^44 · 3 · CritU1F.Nt (u+35)`.
   Here `Den(t) = Π_{q=0}^{39}(24t+17−q)·(16t+11)·Π_{q=1}^{5}(8t+7+q)`.
   - Build it from `coeff_twoBinom` (expand each `cb8P m j` coefficient and the tail) and from instances of `choose_ratio`.
   - Use a script-generated Horner chain of explicit numeral intermediates, split per block, at an estimated 25–35 min of total
     elaboration. Do not use one `ring` per block.
   - With `Nt_pos`, positivity of `Den` and `C(B,L) > 0` (`Nat.choose_pos`), it gives `0 < cb8S5 m` on the class. That discharges
     `hS5` and makes `cb8_elig_top_a_conditional` unconditional: a sorry-free (ELIG-top)(a) for `cb8I`.
2. **(E) on the closed form.** `natDegree (cb8I m) = 9m+1` and "a strict descent at `L` gives a first descent `≤ L`" still need to be
   formalized. Only then does (E) follow; it does not follow from the present file.
3. **The `cbGraph` link (U3).** Coefficients of `I(cbGraph m)` equal `(cb8I m).coeff`, which links to `C5LA1.crossingIndex (cbGraph m)`
   and discharges terminal conjunct 2.
4. None of this touches (HALL) or favorability. The Tier 1 headline stays open (`headline_resolved: no`).

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-U1-F/`.

| File | SHA-256 | Role |
|---|---|---|
| `seals.py` | `bc1794525cc5a278d46e6b46d4f50bcc9b8d976a61c393078a716f4a03ea13e0` | seal and capsule-member digest check |
| `crit_literal.py` | `9dc22c30b21f37bc40d3d622ca47bd3529dae7d63aa5cc22c60f0d0e6a664abd` | instrument 1: literal-tree dynamic program, closed-form check, `α`, `x`, eligibility, `g_j`, `S_4`, `S_5` |
| `crit_literal_out.json` | `0bca45dda941072e54b233f3450afebe90853553b455353eedc3fbc1efb518e0` | its output (rows 95, 104, 107, 110, 113, 116, 119, 137) |
| `crit_symbolic.py` | `9e1f7559dd1a3e18446551ec67223a2c43487c9b20b888eecb443d2e7aafa9db` | instrument 2: symbolic `N(t)/Den(t)`, Taylor shifts, sign scan, identity guards |
| `crit_symbolic_out.json` | `4ed5ad9b20d23c38e458eb157d268d3141c6c95ba8ad3c692de3f7568d9c4b82` | its output |
| `crit_symbolic_poly.json` | `9cbf388fa890e044642b24f15d089160d1b845cfe80839f4ced508d1e31ff70b` | `N`, `Den` factors, content, shift-35 coefficients |
| `crit_N5_digest.txt` | `4fab8793beaef6063418bdf6b9f3d3939e06ea172141e57d0a209c5deb987627` | primitive `N_5` digest (`893a21b6…51f7`, equal to SR-4's) |
| `replay/u1_cb8s5.py`, `replay/u1_cb8_delta_check.py` and their `*_out.json` | identical to U1's (`c5210c76…`, `c4dad7fd…`, `757a5e0a…`, `b5db1905…`) | copy-out replay |
| `LeanProject/` (copied from `scratchpad/c2-U1/LeanProject/`, `.lake/packages` symlinked) | `Main.lean` `40789438…dcbe` | rebuild of U1's project |
| `LeanProject/LeanProof/CritStep4.lean` | `504613d159ba026b8300892a15b4c84b82d2b76daf27b82a5102b9c65895bdd5` | critic: `Nt_shift`, `Nsh_pos`, `Nt_pos` (step 4), 14.8 s |
| `LeanProject/LeanProof/CritSteps12.lean` | `24332a9397c1b3e43952a16cecea9518e20240d8bfb8c64c08a9a9d25e596429` | critic: `coeff_one_add_two_X_pow`, `coeff_twoBinom`, `choose_ratio` (steps 1–2), 6.0 s |
| `LeanProject/LeanProof/CritRingK1.lean` | `250cc246882b1153d1361a1fec2af92caef24323ce5b60a2fa542f2469ab43c3` | timing: one 46-factor term under `ring`, 35.5 s |
| `LeanProject/LeanProof/CritRingK4.lean` | generated, not run | timing scaffold (unused) |
| `LeanProject/LeanProof/CritRingTest.lean` | `33dc9b43fb241a239d42bb0a45f408ed1c6cf5de2436bcdda1c08d935eac061a` | timing: monolithic 256-term `ring`, unfinished after 15 min 27 s, killed by literal PID |
| `LeanProject/LeanProof/CritHornerStep.lean` | `e9866bf28fceb58aedfcde1551ec093bbb522c6d5786309d14c8a72ce222ef43` | timing: one Horner step, 9.0 s |
| `gen_ringtest.py`, `gen_ringtest_k.py` | `74f9071d…00ab`, `52e16440…5387` | generators of the timing files |
| `ringtest.log` | not digested (the run was killed and the log is empty) | log of the monolithic `ring` run |

**Read-boundary disclosures.**
1. **Harness-injected context.** The harness injected the project `CLAUDE.md`, the user memory index and the user's email into my
   context before any tool call. I did not fetch them and did not use them.
2. **Headings of other seats' sections.** To locate my seat's section of `control/C2-CRITIC-ATTACK-BRIEFS.md` (a capsule member), I
   printed that file's `## ` heading lines. This displayed the one-line headings of the other seats' sections (T1–U3). I read no body
   text of those sections and used nothing from them.
3. **Paths of sibling returns.** Printing the Stage 3 packet manifest (a capsule member) displayed the paths of sibling returns. I read
   none of them.
4. **Reads under `sources/`, all authorized.** I read the C1-LA3 kernel receipt and digest file. I read lines of
   `sources/c1-results/second-reads/SR-4/SECOND-READ.md` through a `grep` rooted at that file, for the `D_5`/`N_5` concordance.
5. **Mathlib.** I ran `grep` on Mathlib sources, only for API names.
6. **What I did not do.** I ran no search above my grant, used no network and installed no packages. I ran no `lake update` or
   `lake clean`, and I invoked Lean only after `cd` into my copied project.

**Background job.** The monolithic `ring` timing run was moved to the background by the harness when it exceeded the foreground
budget. Its PIDs were 30258/30260 (shells), 30261 (`time`), 30262 (`timeout 1500`), 30263 (`lake`) and 30282 (`lean`). At
15 min 27 s I killed it by literal PID (`kill 30282 30263 30262 30261 30260 30258`). A follow-up `kill -9` on the same literal PIDs
found no such process, and `pgrep` found no `CritRingTest` process.

A second background job, a wait loop polling `kill -0 30282` (task `bvw8wkb34`), exited on its own when that process ended. No
background job is running at this final write.

My final `pgrep` for Lean processes also showed one Lean job that is not mine (`CriticS5.lean`, PIDs 34396, 34398 and
34419). Its working directory is the sibling critic scratch `scratchpad/c2-crit-U1-T/`. I learned only the process name and working
directory, read nothing of that directory, and left the job untouched. I disclose this as a process-listing exposure.
