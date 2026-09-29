# Critique

Critic `C-U2-F` (orientation F, falsify) of seat `U2`: route `C3-U-02`, mechanism token `FORMAL-CB-E1-DELETION-FLOW-CONSTRUCTION`,
orientation U (formal / structural). Run `erdos-993-math-dre-20260927-r31-cb-uniform-switch`, Cycle 3 Stage 4, 2026-09-28.

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file. The harness put the project `CLAUDE.md`, the user
memory index and the user's e-mail address into my context before my first action. I did not open or act on any of them beyond the
boot that the dispatch authorizes.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Read boundary.** I read the dispatch (`control/dispatch/c3-stage4/DISPATCH-C-U2-F.md`, SHA-256 `b47bbf0d…6cace`, verified), the
14 capsule members and `control/C3-WORKER-COMMON-BRIEF.md` (a Stage 2 member the common brief names; digest `302d6533…8427953` matches
the Stage 2 manifest). I also read these frozen sources under `sources/`, all authorized: the two C1 carry sources
`sources/c1-results/runs/lean-2026-09-28-c1-la{2,3}-*/LeanProject/LeanProof/Main.lean`, `sources/c1-results/SOURCE-DIGESTS.json`,
`sources/mathlib-binding/PIN.json` and `sources/c2-results/second-reads/SR-C2-2/SECOND-READ.md` (to check the arc values against the
record). I ran one `grep -rl "SR-C2-2" c2-results`, rooted inside `sources/`, which is within my grant. Every other search I ran named a
single file in my own scratch. I made the U2 scratch copy copy-out-first from `scratchpad/c3-U2/`. I did **not** read
`scratchpad/c3-U2-replay/` (the return's build log and `.out.json` live there, outside the dispatch's grant). I read no sibling return,
critique, adjudication or other experiment root. I used no network, installed nothing, ran no process listing and started no
background job.

## Identity and seal audit

Recomputed as SHA-256 of the compact, key-sorted JSON without `seal_sha256`, with no trailing newline:

| Object | Recomputed = recorded |
|---|---|
| Capsule `control/c3-critic-capsules/U2-PACKET-MANIFEST.json` | `13d69b2bf489f6368b9ecfe67e6d51cdd3f8fc910fe7b168853e2c494b6423bf` — **match** (capsule seal of record) |
| Stage 4 dispatch manifest | `cc9683b593e4bf84ab6164b5fe9abdd759e31c50937f74ab502258b3ec6c0c05` — match |
| Stage 3 packet manifest | `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d` — match |
| Stage 2 packet manifest | `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3` — match (= the protocol's value) |

- **Capsule members.** All 14 match their SHA-256 and byte counts. The return (`96e61484…1ddad`) is also the Stage 3 manifest's entry.
- **Digests the return lists.**
  - The C1-LA2 and C1-LA3 `Main.lean` files (`a906ec17…`, `c0605e12…`) match on disk and in `sources/c1-results/SOURCE-DIGESTS.json`.
  - The PIN (Lean v4.32.2, Mathlib `905b9581…`) matches the shared package `git rev-parse HEAD`.
  - Project `Main.lean` `7fbf0531…` matches. My byte check: it is C1-LA2's `Main.lean` verbatim (84,219 B), then one comment line
    (`-- ===== CARRIED FROM … =====`), then C1-LA3's `Main.lean` from byte 165 on (its `import Mathlib` header stripped). The carry is
    confirmed.
  - `E1FlowConstruction.lean` `54e011f2…` matches.
  - `u2_rho1_fixedpoint.py` `f1c504e7…` matches. Its replay (copy-out-first, `python3 -B`) reproduces `sha256_of_result_json =
    cc9a82ec…bcfa5`.
- **Carry note (gate ruling 19).** The concatenation keeps both origin terminals (`cb8_topRank_of_descent_and_flow`,
  `cb8_block_descent_topRank`) as `theorem`. That is harmless in scratch, but a Stage 7 carry must apply the `theorem` → `lemma` edit
  and record its reversibility.
- **Route identity.** Route ID, token and orientation are bound verbatim and agree with `C3-ALLOCATION.md`.

## Independent re-derivation

**Rebuild.** I copied the project into `scratchpad/c3-crit-U2-F/LeanProject`, bound Mathlib by manual symlink, ran `cd` into the
project and ran `lake build LeanProof`. Result: `Build completed successfully (8658 jobs)`. The file has 8 `#print axioms` commands, all
reporting `[propext, Classical.choice, Quot.sound]`. There is no `sorry`, `admit` or `native_decide` in either file (the only `sorry`
matches are in doc comments). There are 6 linter warnings.

**The arc function against the record.** `cb8E1Val` is literally SR-C2-2's explicit flow:
- `G_α/N(α,j)` on an active-tag deletion;
- `w·H_α/((j−α)·N(α,j))` on a closed-leg or arm deletion, with `ℓ = j − α`;
- 0 on a choke deletion, and 0 when `w = 0` or `q = 0`;
- 0 on sources containing `r` (the outer guard).

The index conventions are right: `j = p* − q` in ℤ; `a = 8q − 1` and `b = 8(m − q) + 1` are safe ℕ-subtractions on the nonzero branch
(`q ≥ 1`, and `q ≤ m` because the count ranges over `range m`); `α = w − 1` truncates only when `w = 0`, where the guard fires first.
`cb8Rho` is `r_q(j)/r_q(j−1)` with `r_q` the contract's polynomial coefficient.

**My own derivation of the three content clauses.** This is written from the contract, not from U2's scripts. Put `S_{<α} := Σ_{α'<α}
N(α',j)` and `T_{<α} := Σ_{α'<α} N(α',j−1)`.
- **(Out)** For an r-free `B` with `q ≥ 1`:
  - `B` has exactly `w` active-tag vertices (this is definitional, from `activeWeight`'s filter) and exactly `j − α = |B| − q − w`
    non-choke inactive vertices.
  - So `Σ_A f(B,A) = w·(G_α + H_α)/N(α,j)`, and `G_α + H_α = N(α,j)` by telescoping.
  - When `ℓ = 0` there is no ternary term, and one needs `H_α = 0`. That holds because `S_{≤j}(j) = r(j)` and `T_{<j}(j−1) = r(j−1)`,
    which requires the expansion `Σ_α N(α,k) = r_q(k)`.
  - **No double count and no `ρ ≤ 1` enter Out.**
- **(In)** For an r-free `A ∈ I_{p*}` with `q ≥ 1`:
  - The sources are `8q − w(A) = a − α` active-tag insertions and `2(b − (j−1−α))` inactive non-choke insertions. Each keeps `q` and
    raises `w` by `[z active]`.
  - Multiplying the two binomial identities `(α+1)N(α+1,j) = (a−α)N(α,j−1)` and `(j−α)N(α,j) = 2(b−j+1+α)N(α,j−1)` through turns the
    column sum into `w·(G_{α+1} + H_α)/N(α,j−1)`.
  - Then `G_{α+1} + H_α = ρ·N(α,j−1)` by telescoping, so In `= ρ·w(A)`. **`ρ ≤ 1` is not an input.**
- **(Nonnegativity)** Both signs hold for every `α ∈ ℕ` and every `j ≥ 1` with `r(j−1) > 0`, by a single-crossing argument that differs
  from the one on record.
  - `ψ(α) := ρT_{<α} − S_{<α} = G_α`. Its increments are `ρN(α,j−1) − N(α,j)`. The ratio `N(α,j)/N(α,j−1) = 2(b−j+α+1)/(j−α)` is
    strictly increasing where both terms are positive, and the support ends give `+` on the left and `−` on the right. So the increments
    change sign at most once, from `+` to `−`. Since `ψ(0) = 0 = ψ(∞)` (by the expansion), `ψ ≥ 0`.
  - `φ(α) := S_{≤α} − ρT_{<α} = H_α`. Its increments are `N(α,j) − ρN(α−1,j−1)`, with ratio `(a−α+1)/α` strictly decreasing. The same
    argument gives `φ ≥ 0`.
  - The record (SR-C2-2 (5)) proves the same two inequalities by pairwise log-concavity sums. **So this is an independent
    re-derivation, not an advance.**

**Instruments.** These are mine; each derives the tree, supports and witnesses from the contract's description. Label layout: 0 = r,
1 = s, 2 = v, `u_i = 3+(2d+1)i`, `b_ij = u_i+1+2j`, `c_ij = u_i+2+2j`. At `d = 8` this is C1-LA2's layout exactly.

1. **`crit_e1_literal.py` (literal CB(d,m)).** Trees: (2,1), (2,2), (2,3), (3,2), (3,3), (8,1) and (8,2); 45 (tree, rank) pairs.
   - **Fidelity first, at every pair:**
     - `F_p` is derived by `i_{p+1}(T−t) < i_p(T−t)` (ruling 16).
     - (WID) `supply − capacity = S(T,p)` is asserted from independent sides: enumeration with the literal active-tag weight on one side,
       `Σ_F[Δ_{p−1}(G−H_t) − Δ_{p−1}(G−R_t)]` from separately counted deletion families on the other. It holds for derived `F` and for
       `F = leafSet` at all 45 pairs.
   - **Then U2's function, arc by arc, with `F = leafSet`** (the object `hfav` supplies), Lean's `x/0 = 0` and `cb8N`'s guard:
     - 0 negative arcs;
     - 0 In failures;
     - 0 nonzero loads on `r ∈ A` or `q(A) = 0` targets;
     - 0 Out failures at `q = 0`, i.e. `hZeroChoke` literally;
     - Out failures only at `j = p − q = 0`.
   - **The `j = 0` failures.** `diag_outfail.py` confirms every failure is exactly `(p, q, 0)`. There `r(j−1) = 0`, so `ρ := 0` and no
     flow of that class can exist. At `p*`, `j ≥ p* − m = (13m+4)/3 ≥ 465`, so this corner never arises in the class.
2. **`crit_counts.py`.** It checks explicitly the per-set neighbourhood counts that Out and In rest on (B1–B3 in §Remaining obligation).
   It covers 134,895 literal sets at ranks `p ≥ m+1` on five trees, including CB(8,1) and CB(8,2): 0 failures.
3. **`crit_rows.py` (class rows, quotient level).** Rows `m = 95` (fixed point), the controls 107, 110, 113, 116, 119, 122 and the fresh
   rows 125, 128, 140 (ruling 17). At every `q ∈ [1, m]` and every `α ∈ [0, a+1]` (563,687 `(q, α)` cells):
   - `r_q(k)` is computed two independent ways: the type sum `Σ C(a,α)C(b,k−α)2^{k−α}`, and the different expansion
     `Σ_t C(b,t)C(a+b−t,k−t)` from `1+2x = (1+x)+x`. 0 mismatches.
   - `G_α ≥ 0` and `H_α ≥ 0` in exact integers (multiplied through by `r(j−1) > 0`): 0 negatives.
   - The Out identity (including the `ℓ = 0` boundary) and the In identity: 0 failures.
   - `ρ_q < 1` at every `q`.
   - `ρ_1(95) = 1354839571516225/1361543988640524` reproduces the §5 fixed point, by an instrument that shares no code with U2's.

These are bounded corroboration, never proof of the universal statement. Mathematically, Out, In and nonnegativity at `p*` are
`proved_informal` on record (SR-C2-2) and in my re-derivation above.

## Attacks and findings

1. **Three of the four "named nodes" are the conclusion's own clauses (the principal finding).**
   - `hIn` is clause (4) verbatim.
   - `hOut` is clause (3) restricted to `q(B) ≥ 1`.
   - `hVal_nonneg` is clause (1) on its only nonzero branch.
   - What `cb8E1Arc_spec_topRank_of_named_nodes` proves outright is therefore:
     - clause (2) (shape, via `cb8E1Arc_shape`);
     - clause (5) (via the two zero lemmas);
     - the `q = 0` half of clause (3), from `hZeroChoke`.
   - This is a correct and useful assembly, and the return's §2 says `hOut`/`hIn` are "taken verbatim". But the summary lines overstate
     it: "the full spec is formal modulo four named hypotheses" and "reduced to four named open hypotheses". The mathematical content of
     E1 (Out, In and signs) is entirely assumed. The theorem is **not** a reduction to T1/T2's nodes.
   - The binders `hm`, `hres` and `hfav` are unused (linter), so the hypothesis list also overstates what the theorem depends on.
2. **Wrong attribution of the hypotheses.**
   - The return says `hOut` is "T1's node (b), the `S_{α'+1}(α'+1) = T_{α'}(a−α')` double count". Out needs **no** double count; it
     needs only telescoping `G + H = N`, the expansion at `ℓ = 0`, and the literal deletion-class count (B1).
   - The return says `hIn` is "the in-balance composed with T2's `ρ_q` bridge". In needs the two binomial identities, the in-balance and
     the literal insertion-class counts (B2, B3); the `ρ_q` bridge / `ρ ≤ 1` is not an input. SR-C2-2 already records that condition (i)
     enters only as the capacity step.
   - The literal-to-quotient neighbourhood counts (B1–B3) are the real formal gap under `hOut`/`hIn`, and no Cycle 3 route owns them.
     T1's `clone_fiber_card` is a different statement (a clone-bijection fiber). U2's per-set formulation never needs the clone
     bijection, only the per-set counts plus binomial identities.
3. **`hZeroChoke` is true and needs neither `hfav` nor the rank.** The return sketches it "via `hfav`". The favorable filter is a subset
   of `leafSet` by definition, and the carried witness lemmas finish it for every `p` and every finset `B`. **Formalized by me**, see
   §Remaining obligation (critic-derived advance).
4. **`hVal_nonneg` is stronger than needed but true.** It quantifies over **all** finsets `B` and all `z`, not only independent sets.
   - The value depends only on `(q(B), w(B))`, with `1 ≤ q ≤ m`, `j ≥ (13m+4)/3 ≥ 1` and `r(j−1) > 0`.
   - For `α > a+1`, `G = H = 0`; when `N(α,j) = 0` or `j = α`, Lean's `x/0 = 0` gives 0.
   - So the hypothesis is satisfiable, and the conditional theorem is not vacuous. Instrument 3 covers every `α ∈ [0, a+1]` at ten rows.
5. **`hOut`/`hIn` are true of the literal Lean function at `p*`.** I checked this by derivation (§Independent re-derivation) and by
   instruments 1–3. The only corner where Out fails for this function, `j = 0`, is outside the class. No cut and no template failure.
6. **`cb8Rho_lt_one_topRank`.**
   - It is correct and kernel-checked (rebuild). It is a two-line division-form restatement of the already-verified C1-LA3 entry 20.
   - Calling it "genuine new formal content advancing T2's node (d)" overstates it: it is a corollary, and the spec theorem does not
     even use it. It becomes useful only at the capacity step of a composition (`ρ_q·w ≤ w`), which needs an extra `cbOpenChokeCount_le`
     (`q ≤ m`) lemma that is not provided.
7. **Interface gap (not U2's object, but on its face).** Clause (3) covers only `r ∉ B`.
   - Non-sector sources with `r ∈ B, v ∉ B` are outside it. They have weight 0 (no choke; `v` absent), and `f = 0` there by the guard.
   - Saturating them in the composition therefore needs the zero-weight classification lemma, which is not in U2's spec.
   - I did not verify whether U2's clause shapes match U1's/U3's consumer hypotheses: those returns are outside my read boundary.
8. **Process.** The return's §7 full process listing breaches the worker brief's "never a full process listing". It was disclosed and
   its product was unused. The return's reading that the rule "concerns kill discipline specifically" is not what the brief says.

## Mechanism-equivalence and fence check

- **Fences, per `SOLUTION-CONTRACT.md` §3:**
  - One rank per tree, class only: yes.
  - No refuted mechanism: the (G′) two-binomial ascent tool (ruling 20) is not used; `twoBinomCoeff_pos` and entry 20 are the verified
    C1-LA3 lemmas.
  - Darroch and Newton do not appear.
  - No census is used as proof, no `θ*` law, and no r30 bounded record.
  - No status transfer. The Tier 1 key is cited `proved_informal`, which is correct.
- **Selector.** The spec correctly uses the derived `favorableLeaves`, not `leafSet`.
- **Mechanism.** It is the registered mark-clone criterion flow (`E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`,
  `proved_informal`) with SR-C2-2's explicit values. U2 correctly proposes no new key.
- **Alias check.** `cb8Rho_lt_one_topRank` is an instance of the threshold key
  (`E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`) through C1-LA3 entry 20. It is not a
  new claim, lexically or mathematically.
- **Keys touched** (return §3, confirmed): the criterion key, the threshold key, the favorability key and the Tier 1 key
  `E993-R31-CB-8-M-AT-LEAST-107-…-SATISFIES-WEIGHTED-HALL`.

## Certification audit

- **Struck** "nine `#print axioms` calls". The file has **8**, and all 8 print `[propext, Classical.choice, Quot.sound]`.
- **Struck** "four cosmetic linter warnings". My rebuild shows **6**: three unused `if_true` simp arguments and three unused binders,
  `hm`, `hres` and `hfav`. The unused `hfav` is substantive, not cosmetic (Finding 1).
- **Struck** the grade `formally_verified` on `cb8Rho_lt_one_topRank` and on the six structural lemmas, and "`formally_verified` AS A
  CONDITIONAL" on the spec theorem. A seat's compiled declarations are scratch with no grade until a governed award closes (worker
  brief item 8; `SOLUTION-CONTRACT.md` §4). Correct label: compiled, kernel-checked in scratch (my rebuild confirms), no grade.
- **Struck** the hypothesis count. The theorem's docstring says "Three hypotheses", §2 says "four hypotheses" and then lists five.
  Correct: five binders (`hfav`, `hVal_nonneg`, `hZeroChoke`, `hOut`, `hIn`), of which `hfav` is unused and three restate clauses (1),
  (3) and (4).
- **Struck** the attributions "hOut = T1 node (b)" and "hIn = T1 in-balance + T2 `ρ_q` bridge" (Finding 2).
- **Corrected** the Python IMPORT LIST: the script also uses `math.comb`, which is not listed, and its docstring lists `sys`, which is
  not imported.
- **Narrowed** the claim that the replay is a check of "the Lean `cb8R` definition". It computes the type sum `Σ N`, not the polynomial
  coefficient `cb8R`, so it is corroboration of the expansion at one point. My two-instrument check (instrument 3) closes this at ten
  rows.
- **Upheld:**
  - "`Build completed successfully (8658 jobs)`" (reproduced);
  - zero `sorry`;
  - the file digests;
  - the carry;
  - the `ρ_1(95)` fixed point and the replay digest `cc9a82ec…`.
- **Not audited:** the build-log digest `9043d2da…` and the `.out.json` digest. They are in `scratchpad/c3-U2-replay/`, outside my
  grant, so they are neither upheld nor struck. My own log is inventoried below.
- **`## Remaining obligation` of the return:** inexact.
  - Item 1 attributes `hVal_nonneg` to "T1 node b + T2 node c". It is T2's (ii-1)/(ii-2) plus the expansion lemma; no double count.
  - Item 3 misattributes `hOut`/`hIn` (Finding 2).
  - Item 4's "once (1)-(4) close … no further assembly" is right only for the E1 spec. Conjunct 4 still needs the composition, the
    capacity step (`ρ_q ≤ 1` with `q ≤ m`) and the `r ∈ B, v ∉ B` zero-weight lemma.

## Verdict

verdict: retained_narrowed
headline_resolved: no

**Retained:**
- the named literal arc function `cb8E1Arc`, which is exactly SR-C2-2's explicit flow;
- the outright shape lemma and the two zero-branch lemmas;
- the `ρ_q < 1` corollary;
- the assembly theorem as a correct kernel-checked scratch statement.

**Narrowed:**
- The assembly theorem is **not** a reduction of the E1 spec to T1/T2's open nodes. Its hypotheses `hOut`, `hIn` and `hVal_nonneg`
  restate the spec's content clauses (3), (4) and (1).
- The formal E1 obligation is therefore still the whole of Out, In and signs, over a literal neighbourhood-count bridge that no route
  owns.
- Grades are struck to compiled scratch, and the counts are corrected as above.

**Critic-derived advance:** `hZeroChoke` is formally discharged in scratch, so the assembly needs one hypothesis fewer. No grade until
a governed award closes.

**Mathematics.** In my reading, the E1 flow's mathematics (Out, In, nonnegativity at `p*`, every class `m`) is complete at
`proved_informal`. That is already on record via SR-C2-2; my single-crossing proof of the signs is an independent re-derivation, not
new.

COND4_formal: not_advanced
E1_formal: advanced
TERMINAL_integration: not_advanced
cut_candidate: none

The two gate readings:
- **`E1_formal` is advanced, narrowed.** The literal `ℚ` function, the support/shape clause and both zero clauses are compiled outright,
  and so is `hZeroChoke` (critic). Out, In and signs remain hypotheses.
- **`COND4_formal` is not advanced.** Nothing beyond the E1 component, which is counted under `E1_formal`, touches conjunct 4: there is
  no composition, sector or capacity step.

## Remaining obligation

**What I did (critic-derived advance, attributed to C-U2-F).** File
`scratchpad/c3-crit-U2-F/LeanProject/LeanProof/CriticU2F.lean` imports U2's file. It was checked with `lake env lean` inside the pinned
project: exit 0, no `sorry`, `#print axioms` = `[propext, Classical.choice, Quot.sound]`.

```lean
theorem cb8_activeWeight_eq_zero_of_no_open_choke (m p : ℕ) (hm : 0 < m)
    (B : Finset (Fin (17 * m + 3))) (hr : cbVertex m 0 ∉ B)
    (hq : cbOpenChokeCount m B = 0) :
    activeWeight (cbGraph m) (favorableLeaves (cbGraph m) p) B = 0
theorem cb8E1Arc_spec_topRank_of_three_nodes …  -- U2's five-clause conclusion from hfav, hVal_nonneg, hOut, hIn only
```

The proof uses only carried C1-LA2 entries (`mem_leafSet_cbGraph_iff`, `mem_cb_tagWitnesses_v_iff`, `mem_cb_tagWitnesses_leaf_iff`,
`eq_cbVertex_iff`) plus `Finset.filter_subset`.

**What a successor inherits (the exact formal E1 obligation, at `p = (16m+4)/3`, `107 ≤ m`, `m % 3 = 2`):**

- **(B1) Deletion-class count on `cbGraph m`.** For `B` with `cbVertex m 0 ∉ B` and `1 ≤ q(B)`:
  - `#{z ∈ B : z ∈ F ∧ ¬Disjoint (B.erase z) (tagWitnesses z)} = activeWeight F B`. This is definitional.
  - `#{z ∈ B : z non-choke} = |B| − q(B)`. This needs injectivity of `i ↦ cbVertex m (3+17i)` on `range m`.
- **(B2) Insertion-class count.** For `A ∈ indepFamily p` with `cbVertex m 0 ∉ A` and `1 ≤ q(A)`:
  - the active-tag insertions number `8q − w(A)`;
  - the non-choke inactive insertions, with `insert z A ∈ indepFamily (p+1)` and `z ≠ r`, number `2·(8(m−q)+1 − (p − q − w(A)))`.
- **(B3) Invariance under insertion.** For every such insertion, `q(insert z A) = q(A)` and `w(insert z A) = w(A) + [z active]`.
- **(E) Expansion.** `Σ_{α ≤ a} cb8N a b α k = cb8R a b k` for all `k : ℤ`.
- **(A) Algebra.**
  - `G_α + H_α = N(α,j)`;
  - `H_j = 0` (from (E));
  - the two binomial identities;
  - `G_{α+1} + H_α = ρ·N(α,j−1)`.
- **(N) Signs.** `G_α ≥ 0` and `H_α ≥ 0` for all `α`. Either the single-crossing proof (§Independent re-derivation) or SR-C2-2's
  pairwise log-concavity proof works. Both use only binomial log-concavity plus (E); the carried C1-LA3 `twoBinomCoeffZ_strongLC` at
  `b = 0` gives consecutive log-concavity of `C(a,·)`.
- **How these assemble:**
  - `hOut` follows from (B1) + (A) + (E).
  - `hIn` follows from (B2) + (B3) + (A).
  - `hVal_nonneg` follows from (N) + (E).
  - With `cb8E1Arc_spec_topRank_of_three_nodes` these give the unconditional `cb8E1Arc_spec_topRank`.
- **Still needed for conjunct 4:**
  - `cbOpenChokeCount_le : q ≤ m`, so that `cb8Rho_lt_one_topRank` gives the capacity step `ρ_q·w ≤ w`;
  - the zero-weight lemma for `r ∈ B, v ∉ B` sources;
  - the composition with the sector flow and the rational-to-integral step (U1/U3's objects).
- **Stage 7 carry:** `theorem` → `lemma` on the two concatenated origin terminals, with a reversibility record.

## Artifact inventory

Everything is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-U2-F/`.
The scripts use the standard library only, run with `python3 -B`, and hash no wall-clock, PID or host fields.

| File | SHA-256 | Role |
|---|---|---|
| `copy/u2_rho1_fixedpoint.py` | `f1c504e7d37b8d6b773fab0d01a9fcba5753d7d2d7b569abda470c86c0bc4117` | U2 replay, copy-out-first; result digest `cc9a82ec…bcfa5` reproduced |
| `LeanProject/LeanProof/Main.lean` | `7fbf053123fa58a36e7a49e09937af54c5d3f153b41a96efd68b5ccf3e9ac9df` | U2 carry, copied |
| `LeanProject/LeanProof/E1FlowConstruction.lean` | `54e011f22e1ab95d6c09d930e76a5d53896e16bd7424d6aaf6cdb722cce27c84` | U2 file, copied, rebuilt |
| `LeanProject/LeanProof/CriticU2F.lean` | `41bdeac67d4670136d43e28e2ee79f3a206288cae9139e1a0088f56ce46c96c6` | critic advance (`hZeroChoke` discharged) |
| `lake_build_crit.log` | `8d7a5bde98bb172bc3d2206db8f76a6c07670657733586f60bf11735f8d009aa` | rebuild log (8658 jobs, 8 axiom lines, 6 warnings) |
| `critic_lean_check.log` | `6d9727d504cb416131f066c80e22c7e4e4c38d38df47d89d794732f8b9da2ba4` | `lake env lean` check of the critic file, exit 0 |
| `crit_e1_literal.py` | `b5cce89de2043e36cb66edeb198a36540dc428383fe2afe2affe40fddafc9002` | literal instrument, run in `literal` mode only (its `rows` mode was not run; `crit_rows.py` replaces it) |
| `literal.out.json` | `4575992d70b96f86fd8ee4372dcc834d9117e85bb022070aefc2d48955e4c425` (inner `47a9a34f…0f1e`) | 45 (tree, rank) pairs |
| `diag_outfail.py` | `0c137ce18f952040de09de41368bb236e713e69a070e482ca186f7cd678438d2` | locates the `j = 0` Out corner |
| `crit_counts.py` / `counts.out.json` | `2bbb21de…f38e` / `facf032d…c9` (inner `854437d4…a6ce`) | (B1)–(B3) literal counts, 0 failures |
| `crit_rows.py` / `rows.out.json` | `bc4dc775…3872` / `3579fc83…19dc2` (inner `1920df01…53f3`) | ten class rows, two `r_q` instruments |

**Replay:**

```
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-U2-F
python3 -B crit_e1_literal.py literal
python3 -B crit_counts.py
python3 -B crit_rows.py 95 107 110 113 116 119 122 125 128 140
cd LeanProject && lake build LeanProof && lake env lean LeanProof/CriticU2F.lean
```

Background jobs: none were started (every run was foreground), so there is nothing to kill.
