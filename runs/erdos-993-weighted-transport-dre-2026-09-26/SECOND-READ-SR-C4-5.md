# Second Read

Read `SR-C4-5`, r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`), Cycle 4. The object is CD-1 of Cycle 4 (EST-7, the
heterogeneous claw-product normalized-matching lemma, with two critic proofs), T2's struck chain-product discharge, C1's promotion,
and the proposed key `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING`. Date 2026-09-27.

**Boot.** Operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, the two files the protocol grants. I loaded no other VerityOS
subsystem (memory, decisions, logs, conversations, operations, modules, skills).

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Capsule.** `control/c4-second-read/SR-C4-5-PACKET-MANIFEST.json` (11,066 bytes), stage `cycle-4-second-read-SR-C4-5`,
  run id `erdos-993-math-dre-20260926-r30-weighted-transport`.
- **Inner seal.** I recomputed the SHA-256 of the compact, key-sorted JSON of the manifest without `seal_sha256`, with no
  trailing newline: `aa06a963a14f70116297f141b7d99250567e9308f6f8db10f7757b5894c4e759`. It **matches** the recorded seal.
  The ASCII-escaped serialization gives the same digest.
- **Members.** `file_count` is 60 and 60 files are listed. All 60 match their listed SHA-256 and byte count, with 0
  mismatches (`verify_capsule.py`). I did this before reading any member except the protocol, which the charter says to read
  first.
- **Frozen instruments.** The 33 capsule members under `sources/c4-stage7-sources/C-T2-F/` and `C-T2-U/` match their entries
  in `sources/c4-stage7-sources/SOURCE-DIGESTS.json` (digest and bytes; 0 mismatches). Of these I read only C-T2-U's
  `claw_nm.py`, `out_claw_nm.json` and `err_claw_nm.txt`, and I replayed none. They are seat checks, not evidence. My
  instrument shares no code with them.
- **Brief.** `control/C4-SECOND-READ-BRIEF-SR-C4-5.md` (4,457 bytes, `e92c45fd…8204`) is a capsule member and was verified
  above.
- **Not in capsule.** T2's `chain_scd.py`, which the brief cites at line 138, is not a capsule member. I did not open it (see 5b).

## Statements read

- **SR-C4-5a (EST-7).** Take `q_1, …, q_M ≥ 1` and `P = Π K(q_i)`, ranked by the number of non-bottom coordinates. For every
  `1 ≤ k ≤ M` there is a normalized flow on the covers `L_k → L_{k−1}`. Hence `|∂X|·e_k(q) ≥ |X|·e_{k−1}(q)` for every
  `X ⊆ L_k`, and `max_X(|X| − |∂X|) = max(0, e_k − e_{k−1})`.
  - Sources: SYNTHESIS EST-7 and R-8; C-T2-F's "Remaining obligation" (the recursive flow `α, β, γ`); C-T2-U's "(CD-1) proof"
    (Lemma 1, Lemma 2 with `λ`, Theorem); the T adjudication, R6 and CD-1.
  - **The poset fixed from those sources.** `K(c)` is a bottom `0` below `c` pairwise-incomparable atoms. The brief's guess is
    right.
- **SR-C4-5b.** T2's Theorems C2/C3 (RETURN §8.2–§8.4) are statements about products of chains. T2 applied them as C1's
  discharge (§8.4). The adjudication (T2 item 1) and the synthesis (`## Refuted or narrowed mechanisms`) struck that use.
- **SR-C4-5c.** Is C1's poset exactly the claw product of 5a, and is CD-1 its only missing ingredient?
  - C1 as SR-C3-5c states it: in the live class (the pendant `P_3` arm, `P ⊆ F`, (A4), (H-attach)), the exact sector deletion
    deficit is `max(0, e_{p−1}(q) − e_{p−2}(q))` with `q_i = t_i + 1`.
  - SR-C3-5c graded C1 `conditional` on `|∂X|·e_k(q) ≥ |X|·e_{k−1}(q)`.
- **SR-C4-5d.** Synthesis registration 3, the key `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING`, VERIFIED
  `proved_informal`. The brief asks for three things:
  - the predicate check and alias check;
  - distinction rows against (NM) `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` and against
    `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`;
  - the attribution C-T2-F and C-T2-U jointly, with the T adjudicator.

## Independent re-derivation

**Own instrument.** `scratchpad/c4-sr-SR-C4-5/sr_claw.py` uses the standard library with exact integers and `Fraction`s.
The run printed `RESULT_SHA256 9a77d70c…f08144`. It has six parts:
- **A.** Rank sizes.
- **B.** An exhaustive search over families `X`.
- **C.** Deficits by exact maximum matching.
- **D.** My own normalized flow.
- **E.** The chain side.
- **F.** C1 on trees.

### SR-C4-5a — CD-1, both proofs

**My proof.** It is written independently and then compared with the critics' proofs.
- **Setup.** Let `P = P′ × K(c)` with `N_j := |L_j(P′)| = e_j(q_1..q_{M−1})`, so `E_j := |L_j(P)| = N_j + cN_{j−1}`. Indices
  are integers with zero extension: `N_{−1} = N_{−2} = 0`, and `N_j = 0` for `j ≥ M`.
- **Covers.** The covers from rank `k` to rank `k−1` are exactly three kinds:
  - `(a,0) → (a′,0)` with `a′ ⋖ a` in `P′`;
  - `(b,j) → (b,0)`;
  - `(b,j) → (b′,j)` with `b′ ⋖ b` in `P′`.
- **Inductive hypothesis.** `P′` carries normalized flows `f′_k` at every level, and `N` is positive on `[0, M−1]` and
  log-concave.
- **The flow.** Put mass `f′_k(a,a′)·N_k/E_k` on the first kind, `γ := 1/E_k − N_{k−2}/(N_{k−1}E_{k−1})` on each pair of the
  second kind, and `f′_{k−1}(b,b′)·N_{k−2}/E_{k−1}` on the third kind.
- **Emission.** `(a,0)` emits `1/E_k`. `(b,j)` emits `N_{k−2}/(N_{k−1}E_{k−1}) + γ = 1/E_k`.
- **Absorption.** `(b′,j)` absorbs `N_{k−2}/(N_{k−2}E_{k−1}) = 1/E_{k−1}`. `(a′,0)` absorbs `N_k/(N_{k−1}E_k) + cγ`. Multiplied by
  `N_{k−1}E_kE_{k−1}`, this is `E_{k−1}(N_k + cN_{k−1}) − cN_{k−2}E_k = E_k(E_{k−1} − cN_{k−2}) = E_kN_{k−1}`, which gives
  `1/E_{k−1}`.
- **Nonnegativity.** `γ ≥ 0` holds iff `N_{k−1}E_{k−1} ≥ N_{k−2}E_k`, iff `N_{k−1}² ≥ N_kN_{k−2}`. Every denominator is positive
  because `N_{k−1} > 0` for `1 ≤ k ≤ M` and `q_i ≥ 1`.
- **Log-concavity passes to `E`.** `E_j² − E_{j−1}E_{j+1} = [N_j² − N_{j−1}N_{j+1}] + c[N_jN_{j−1} − N_{j−2}N_{j+1}] + c²[N_{j−1}² − N_{j−2}N_j]`.
  The middle bracket is nonnegative: multiply the two outer LC inequalities and divide by `N_jN_{j−1}` when that is positive;
  when it is zero, `N_{j+1}N_{j−2} = 0` by positivity on an interval. `E` is positive on `[0, M]`.
- **Base case.** `M = 1`: each atom sends `1/q_1` to the bottom.
- **Consequences.** Push `1/e_k` out of every `x ∈ X`; it lands in `∂X`, where each point absorbs at most `1/e_{k−1}`. So
  `|X|/e_k ≤ |∂X|/e_{k−1}`. Then `|X| − |∂X| ≤ |X|(e_k − e_{k−1})/e_k ≤ max(0, e_k − e_{k−1})`. Equality holds at `L_k`, because
  `∂L_k = L_{k−1}` for `1 ≤ k ≤ M` (some coordinate is at bottom and `q_i ≥ 1`), or at `∅`.

**Rulings on the two proofs.**
- **C-T2-F: correct.**
  - Steps 1–7 match the proof above term for term: `α = N_k/E_k`, `β = N_{k−2}/E_{k−1}`, `γ` as above.
  - Its edge cases hold. At `k = M` the `α` term vanishes (`N_M = 0`); at `k = 1`, `β = 0` and `γ = 1/E_1`.
  - Step 6 cites "A7" for the three-term expansion. I re-derived the expansion above, so no step rests on an unseen text.
- **C-T2-U: correct.**
  - Lemma 2's `λ = 1 − p_{k−2}E_k/(p_{k−1}E_{k−1})` gives `λ/E_k = γ` and `(1−λ)·p_{k−1}/E_k` per unit of `P`'s level-`(k−1)`
    flow, which is `β`. The `(x,0)` scaling `p_k/E_k` is `α`.
  - Its absorption identities check by substitution.
  - One sentence in Lemma 1 is imprecise: "if `p_kp_{k−1} = 0` then `p_{k+1} = 0`". The correct form is "then
    `p_{k+1}p_{k−2} = 0`". This is harmless.
- **Same argument?** Yes. The two critiques build **the identical flow**, one product step at a time, by induction on `M`
  carrying log-concavity, in two parametrizations (`α, β, γ` against `λ`).
  - They are independent write-ups: separate seats, separate instruments, and neither cites the other.
  - They are not two different proofs. The record should say "two independently written proofs of one construction".
  - This is the Harper / Hsieh–Kleitman product theorem specialized to claws. Neither proof cites it, and it is not claimed as
    new.

**Instrument (bounded computation, corroboration only).**
- **B, exhaustive over every `X ⊆ L_k`.** This covers all 19 multisets `q` with `M ≤ 3` and `q_i ≤ 3`, at every
  `1 ≤ k ≤ M`: 44 `(q, k)` instances. Coordinate permutations are poset isomorphisms, so multisets suffice.
  - Where `|L_k| ≤ 21`, I enumerated `X` literally; the largest case is `(2,3,3)`, `k = 2`, with `2^21` families.
  - `(3,3,3)`, `k = 2` uses the exact dual over all `Y ⊆ L_1`. Here `X_Y` is the largest `X` with `∂X ⊆ Y`;
    `max_X(|X| − |∂X|) = max_Y(|X_Y| − |Y|)`, and NM holds for all `X` iff it holds for all `X_Y`.
  - `(3,3,3)`, `k = 3` (`2^27` families) uses an exact slice decomposition. The three cover types land in disjoint parts of
    `L_2`, so `|∂X|` is a sum of projections. I cross-checked the decomposition literally on 200,000 families.
  - **Results.**
    - `max_X(|X| − |∂X|) = max(0, e_k − e_{k−1})` on all 44 instances.
    - The minimum Hall slack `e_k|∂X| − e_{k−1}|X|` is exactly 0 on all 44.
    - Where `X` was enumerated (42 instances), the slack minimizers are **exactly** `{∅, L_k}`. No nontrivial family is tight.
    - The deficit maximizer is `L_k` whenever `e_k > e_{k−1}`, and only `∅` when `e_k < e_{k−1}`.
- **C, maximum matching (König).** 75 products, namely every multiset with `M ≤ 4`, `q_i ≤ 4`, plus six spot products; 248
  `(q, k)` instances in all. The matching deficit equals `max(0, e_k − e_{k−1})` on **248/248**.
- **D, my own flow.** Built in `Fraction`s and verified on literal covers (every source emits `1/e_k`, every target absorbs
  `1/e_{k−1}`, and `γ ≥ 0` asserted) on 75 products up to `M = 5`, `q_i ≤ 6`. `e(q)` is positive and log-concave on each.
- **A, rank sizes.** Enumerated layers equal `e_k(q)`. The uniform fixed point holds: `e_j(2^736) = 2^j·C(736, j)` at
  `j ∈ {0, 1, 2, 490, 491, 736}`.

### SR-C4-5b — T2's chain-product discharge

- **T2's poset is chains.** RETURN §8.1 sets C1's layer in "`C_{q_1} × ⋯ × C_{q_M}` … `C_q` the `q`-element chain
  `{0,…,q−1}`". §8.2 defines `rank(x) = Σx_i`, top rank `N = Σ(q_i − 1)`, and covers that raise one coordinate by 1. §8.2's
  verification states that T2's "`e_k(q)`" was cross-checked against `Π_i(1 + y + ⋯ + y^{q_i−1})`, which gives chain rank
  sizes.
  - So T2's `e_k` is **redefined** as chain rank sizes. This is confirmed from T2's own text.
  - I could not check the line number 138 in `chain_scd.py`, because that file is not a capsule member. The critics'
    quotation of line 138 agrees with T2's own §8.2 text.
- **C2/C3 are chain facts and are correct as such** (bounded check, part E). On every chain product with `M ≤ 3`, `q_i ≤ 4`,
  at every rank `1 ≤ k ≤ N`, the exact matching deficit equals `max(0, N_k − N_{k−1})`: 126/126.
- **They do not discharge C1.**
  - The posets differ: `(2,2)` gives claw `1,4,4` against chain `1,2,1`; `(3,4,5)` gives `1,12,47,60` against
    `1,3,6,9,11,11,9,6,3,1`.
  - **The counterexample.** At `q = (2,2)`, `k = 1`, the claw deficit is **3** by exact matching, `max(0, e_1 − e_0) = 3`, and
    T2's chain formula gives **1**.
  - Over the 248 instances of part C, T2's chain formula evaluated at the same `k` disagrees with the true claw deficit on
    **193/248**. I reconstructed the instance set from C-T2-U's written description, not from its code, and the tally agrees.
  - T2's method cannot be repaired to reach claws. A claw product with some `q_i ≥ 2` is not rank-symmetric (`e_M ≠ e_0`),
    so it has no symmetric chain decomposition.
- **One true abstract point, recorded but not load-bearing.** On the correct poset, an additive bound
  `|X| − |∂X| ≤ max(0, e_k − e_{k−1})` for all `X` would suffice for C1's max-over-`X` formula, as C-T2-U notes. T2 never
  proved it on claws.

### SR-C4-5c — C1's poset and missing ingredient

I derived this from `SEMANTIC-CONTRACT.md` §1.2 and the registered E4 key's definitions. I did not take SR-C3-5c's wording on
trust.

- **The live class.** `Q = {r, v}` with a pendant arm `r–s–v` and `N(s) = {r, v}`. `T − N[Q]` consists of `M ≥ 1` stars
  `S_i` (centre `c_i`, `t_i ≥ 1` leaves), each hanging by its centre from exactly one vertex of `N(r) ∖ {s}`. It is exactly
  one vertex because two attachments would close a cycle through `r`. Vertices of `N(r) ∖ {s}` without a star are leaves.
- **`F` is forced.** The leaves of `T` are `v`, the star leaves `P`, and the pendant leaves at `r`. A pendant leaf `u` at `r`
  has `W_u = N(r) ∖ {u} ∋ s ∉ Q`, so (A4) excludes it. With `P ⊆ F` and `v ∈ F`, this forces **`F = P ∪ {v}`**.
- **Sector members.** `B ⊇ Q` excludes `N(r)` and `s`, so `B = Q ∪ ⋃_i (B ∩ S_i)`. Each `B ∩ S_i` is `∅`, `{c_i}`, or a
  nonempty set of leaves of `S_i`.
- **Weight (T2's Proposition 1, re-derived).**
  - `v` is active through `r`.
  - A star leaf `ℓ ∈ B` has `W_ℓ = (leaves of S_i ∖ {ℓ}) ∪ {choke}`, and the choke is not in `B`. So `ℓ` is active iff another
    leaf of `S_i` lies in `B`.
  - Hence `w_F(B) = 1 + Σ_i ℓ_i(B)·[ℓ_i(B) ≥ 2]`.
- **`R*`.** The `Q`-exits `B ∖ {r}` and `B ∖ {v}` each have weight `w_F(B) − 1`. So `R* = {w_F = 1}`: the members that meet each
  star in `∅`, `{c_i}` or a single leaf. At rank `p + 1` these are the members with exactly `k = p − 1` non-bottom coordinates.
  **Under `B ↦ (B ∩ S_i)_i`, `R*_{p+1}` is the layer `L_{p−1}` of `Π K(t_i + 1)`, bottom = `∅`, atoms = `{c_i}` and the `t_i`
  single leaves.** It is not a chain product.
- **`φ` on `R*`.** For `X ⊆ R*`, the two `Q`-exits have weight 0 (`v` is inactive without `r`; singleton coordinates are
  inactive). Each in-sector deletion target `B ∖ {y}` (`y ∉ Q`) lies in `R*_p`, has weight 1, and is exactly a claw lower cover.
  So `φ(X) = |X| − |∂X|`.
- **The reduction to `R*`.** The E4 key's reduction of record is `φ(X ∩ R*) ≥ φ(X)`, from T2's Theorem G1, `proved_informal`,
  SR-C3-5a. I re-checked it in the live case: dropping `B ∉ R*` from `X` loses `w_F(B)` of supply and frees its private
  `Q`-exits, of total weight `2w_F(B) − 2 ≥ w_F(B)`.
- **The ingredients of C1:**
  1. G1 (registered, `proved_informal`);
  2. the weight formula and the identification of `R*_{p+1}` with the claw layer (both elementary, re-derived above);
  3. `∂L_k = L_{k−1}` for attainment;
  4. **CD-1**.
- **Answers.** CD-1 is the only ingredient that is not already registered or elementary. So **C1's poset is exactly the claw
  product of 5a, and CD-1 is its only missing ingredient.** For `k = p − 1 > M`, `R*_{p+1} = ∅` and `e_{p−1} = 0`, so the
  formula gives 0. The composition grade is `proved_informal`, its weakest input.
- **Notation hazard (the root of T2's error).** SR-C3-5c writes C1's layer as "`C_{q_1} × … × C_{q_M}`". The E4 key's scope
  also says "the claw product `C_{t_1+1} × … × C_{t_M+1}`". There `C` denotes the claw, as the stated layer sizes `e_k(q)`
  show, but the letter reads as "chain". The promoted record must write `K(q_i)`.
- **ℕ-subtraction (repair).** At `p = 1` the sector is `{Q}`, of weight 1, with both deletion targets of weight 0. The true
  deficit is **1** (`= e_0 − e_{−1}` with `e_{−1} := 0`). The truncated-ℕ reading `e_{p−1} − e_{p−2} = e_0 − e_0 = 0` is
  wrong there. The record must carry `p ≥ 2`, where `k = p − 1 ≥ 1`, which is the lemma's range and matches the CBstar key's
  `p ≥ 2`. Eligible ranks satisfy `p ≥ x + 2 ≥ 3` anyway.
- **Trees (part F; bounded computation, corroboration only).**
  - **Setup.** 14 heterogeneous CB-pattern trees of order 6–15, including several stars per choke, `t_i = 1` stars, and
    pendant leaves at `r`. Connectivity and acyclicity were checked separately. `F = P ∪ {v}` and `w_F` is literal. The
    sector deletion deficit is `supply − maxflow` (Dinic) at every rank `1 ≤ p < α`: 70 rows.
  - **Results.**
    - The deficit equals `max(0, e_{p−1} − e_{p−2})` with `e_{−1} := 0` on **70/70**; the `p = 1` rows give 1.
    - The weight-one count equals `e_{p−1}(q)` on every row.
    - (WID) `supply − capacity = S(T, p)` with this `F` is asserted on every row.
  - **Eligibility.** These are laboratory sector rows. `F` is not `F_p(T)`, and C1 claims no eligibility. One row, `n = 14`,
    `p = 6`, is eligible (`x = 4`, `α = 9`), with deficit 0. No (HALL) claim is made from any row.

### SR-C4-5d — the key

- **Predicate.** "Heterogeneous claw products have normalized matching" is true as named for every finite claw product with
  all `q_i ≥ 1`. The uniform case is included, and "heterogeneous" means arbitrary `q_i`. "Normalized matching" between
  consecutive ranks is exactly `|∂X|/e_{k−1} ≥ |X|/e_k`, which the statement proves. The flow form is equivalent to it by
  max-flow/min-cut. The name asserts nothing beyond the statement.
- **Alias check** (`alias_check.py`, `label_collision.py`).
  - The full name is not an existing key, not an alias, and matches no `alias_patterns` in either the run-local snapshot
    (448 claims) or the frozen master (434 claims).
  - The struck `E993-R30-CHAIN-PRODUCT-RANK-SHADOW-DEFICIT-BOUND` is absent from both, as it should be.
  - The only token overlap is (NM)'s key and its alias "sector pair-product normalized matching". This is handled by a
    distinction row.
- **Label collisions (finding).**
  - **`CD-1` is already a registered alias**, in the run-local snapshot, of
    `E993-R30-SELF-WITNESSED-STAR-FOREST-SECTOR-POSITIVE-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM`. It is Cycle 3's CD-1, the
    pendant-`P_3` collapse, installed by SR-C3-5.
  - Cycle 4's "CD-1" is a different object.
  - `L2`, which C-T2-U's Cycle 3 label for C1 would suggest, is a registered alias of `E993-R28-PENDANT-PATH-LEAF-DOMINANCE`.
  - Cycle 3's "CD-2" was C1, while Cycle 4's "CD-2" is the type-path conditions.
  - None of `CD-1`, `CD-2`, `L2` or `C1` may be an alias of the new key or of the C1 record. Every registry text that cites
    "CD-1" for the claw lemma must cite the key name instead, or an alias lookup resolves it to the E4 key. This includes
    EST-8's and EST-9's "Dependency: CD-1", which fall under SR-C4-6.
- **Attribution.** C-T2-F and C-T2-U jointly, each Claude Opus 5.5 by its own disclosure (runtime `claude-opus-5-5[1m]`), as
  two independent write-ups of one construction. The T adjudicator verified both. SR-C4-5 re-derived it. It is classical and
  not claimed as new.

## Findings and repairs

1. **5a confirmed; both proofs correct; they are one argument.** C-T2-F's and C-T2-U's proofs are both correct and build the
   same flow (`γ = λ/E_k`; `β/N_{k−1} = (1−λ)/E_k`; `α = p_k/E_k`).
   - **Repair:** the attribution reads "two independently written proofs of one product-step flow construction", not "two
     independent proofs".
   - **Repair:** the statement's face defines `K(c)`, `∂X`, the normalized flow and `M ≥ 1`, and carries the classical
     attribution (Harper; Hsieh–Kleitman, named only; not an input) with `novelty_claimed: false`.
   - C-T2-U's Lemma 1 edge sentence is corrected as above; this is harmless.
2. **Index guards (for the Cycle 5 Lean target G-T-CLAW).**
   - The flow uses `N_{k−2}` and `N_{−1}`. At `k = 1` these must be **0**. A truncated-ℕ index `k − 2 = 0` would silently read
     `N_0 = 1` and break the construction. The formalizer must split `k = 1` or index in ℤ.
   - T's draft `clawProduct_normalizedMatching` guards `k − 1` by `1 ≤ k`, which is correct.
   - `e_k − e_{k−1}` must be taken in ℤ inside `max(0, ·)`. Truncated `e_k ∸ e_{k−1}` agrees with it.
3. **5b confirmed.** C2/C3 are chain-product theorems, correct as such (126/126 bounded), with T2's `e_k` redefined as chain
   rank sizes (T2 §8.1–§8.2).
   - They do not discharge C1: `(2,2)`, `k = 1` gives 3 against 1, and the formula is wrong on 193/248.
   - Do not register `E993-R30-CHAIN-PRODUCT-RANK-SHADOW-DEFICIT-BOUND` or any alias of it on the new key.
   - The "line 138" pointer is unverified here (file outside the capsule); the content is verified from T2's own text.
4. **5c: yes, and yes, with repairs.** C1's poset is exactly `Π K(t_i + 1)` via `B ↦ (B ∩ S_i)_i` on `R* = {w_F = 1}`, and CD-1
   is its only missing ingredient. **C1 promotes `conditional → proved_informal` as a RECORD.**
   - **Repair:** `p ≥ 2`, since the ℕ reading fails at `p = 1`.
   - **Repair:** write `K(q_i)`, not `C_{q_i}`.
   - **Repair:** `F = P ∪ {v}` is forced, so C1 bears on `F_p(T)` only where `F_p(T) = P ∪ {v}`.
   - **Repair:** the proof of record lists its four ingredients.
5. **5d confirmed with repairs.** The name is a predicate, the name alias check is clean, and the attribution is repaired as in
   item 1.
   - **Label rule:** no `CD-1` / `CD-2` / `L2` / `C1` aliases.
   - Two distinction rows and a scope note on (NM) are warranted. (NM)'s scope note says "for heterogeneous star sizes … no
     statement is made"; that stays true of (NM), and the heterogeneous abstract statement now has its own key.
6. **Nothing here touches (HALL), (HALL-COND), the primary aggregate, any eligibility question, or any refuted key.** No cut is
   proposed. No census value is cited as evidence; the synthesis's `syn_claw.py` tally is not in my capsule and is not used.

## Registration text

```text
KEY: E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: Let M ≥ 1 and q_1, …, q_M ≥ 1 be integers. For c ≥ 1 let K(c) be the poset consisting of a bottom element 0 and c pairwise incomparable atoms above it. Let P := K(q_1) × ⋯ × K(q_M) with the product order, ranked by rank(x) := #{i : x_i ≠ 0}, and let L_j be its rank-j layer, so |L_j| = e_j(q), the j-th elementary symmetric function of q_1, …, q_M (e_j(q) = 0 for j < 0 or j > M). A lower cover of x is obtained by resetting one non-bottom coordinate of x to 0; for X ⊆ L_k let ∂X := {y ∈ L_{k−1} : y is a lower cover of some x ∈ X}. Then for every 1 ≤ k ≤ M there is a normalized flow from L_k to L_{k−1}: a nonnegative rational function f on the pairs (x, y) with x ∈ L_k and y a lower cover of x, such that Σ_y f(x, y) = 1/e_k(q) for every x ∈ L_k and Σ_x f(x, y) = 1/e_{k−1}(q) for every y ∈ L_{k−1}. Consequently |∂X|·e_k(q) ≥ |X|·e_{k−1}(q) for every X ⊆ L_k, and max_{X ⊆ L_k} (|X| − |∂X|) = max(0, e_k(q) − e_{k−1}(q)) (integers), attained at X = L_k (since ∂L_k = L_{k−1}) or at X = ∅. Proof of record: induction on M, carrying that e(q) is positive on [0, M] and log-concave. For P = P′ × K(c) with N_j := e_j(q_1..q_{M−1}), E_j := N_j + c·N_{j−1} and integer indices with N_j = 0 for j < 0 or j ≥ M: put f′_k(a, a′)·N_k/E_k on (a,0) → (a′,0); put γ := 1/E_k − N_{k−2}/(N_{k−1}E_{k−1}) on each (b,j) → (b,0); put f′_{k−1}(b, b′)·N_{k−2}/E_{k−1} on (b,j) → (b′,j), where f′ is the inductive flow of P′. Every source emits 1/E_k; every target absorbs 1/E_{k−1} by E_{k−1}(N_k + cN_{k−1}) − cN_{k−2}E_k = E_kN_{k−1}; γ ≥ 0 iff N_{k−1}² ≥ N_kN_{k−2}; log-concavity passes to E by E_j² − E_{j−1}E_{j+1} = [N_j² − N_{j−1}N_{j+1}] + c[N_jN_{j−1} − N_{j−2}N_{j+1}] + c²[N_{j−1}² − N_{j−2}N_j] ≥ 0. Pushing 1/e_k out of each x ∈ X into ∂X gives |X|/e_k ≤ |∂X|/e_{k−1}.
SCOPE: An abstract finite poset lemma: arbitrary (heterogeneous or uniform) q_i ≥ 1, every 1 ≤ k ≤ M; k − 1 in ℕ is guarded by 1 ≤ k; N_{k−2} and N_{k−1} are zero-extended integer-indexed values (at k = 1, N_{−1} = 0; a truncated-ℕ index would read N_0 = 1 and is wrong); e_k − e_{k−1} is taken in ℤ inside max(0, ·). The uniform case q_i ≡ q is T-D-R1 (recorded on the scope of E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING, proved there by biregularity); for heterogeneous q biregularity fails and this key is the statement. Classical: the Harper / Hsieh–Kleitman product theorem for normalized matching, specialized to claws; named only, not an input; the proof of record is self-contained; novelty not claimed. Consumed by the promoted record R30-C1-HETEROGENEOUS-CB-PATTERN-SECTOR-DELETION-DEFICIT-EXACT and, at the grade of its own read, by E1-R (SR-C4-6). Bounded record, not evidence of the statement (SR-C4-5 own instrument): exhaustive over every X ⊆ L_k for every multiset q with M ≤ 3 and q_i ≤ 3 at every k (44 instances; max deficit = max(0, e_k − e_{k−1}) and minimum slack e_k|∂X| − e_{k−1}|X| = 0 on all 44, and on the 42 literally enumerated instances the minimizers are exactly ∅ and L_k); exact-matching deficit on 248 instances (M ≤ 4, q_i ≤ 4, six spot products); the flow above verified exactly on 75 products. No Lean text (the Cycle 5 target G-T-CLAW; the T adjudicator's draft clawProduct_normalizedMatching is not a statement of record).
ATTRIBUTION: Critics C-T2-F (Claude Opus 5.5; the recursive flow α, β, γ) and C-T2-U (Claude Opus 5.5; Lemma 1, Lemma 2 with λ), r30 Cycle 4 Stage 4, jointly: two independently written proofs of one product-step flow construction (γ = λ/E_k); the r30 T adjudicator (both proofs verified in full; the draft Lean statement); isolated second read SR-C4-5 (Claude Opus 5.5; independent re-derivation, index guards, exhaustive and matching checks). Classical source named only: Harper; Hsieh–Kleitman. r30 context: the transport mechanism and active-tag weight in whose sector analysis the lemma is consumed are Codex (GPT-6 Astra/Sol/Luna).
FENCES: A statement about one abstract finite poset; no tree, graph, weight, selector, favorable-leaf, eligibility or transport content. Not (HALL), not (HALL-COND) for any X, not a deletion-only Hall statement on any tree, and not a (CUT). Not E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING and not its graph-side encoding (distinction row R30-HET-CLAW-NM-VS-NM); not E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT (distinction row R30-HET-CLAW-NM-VS-CBSTAR); not the C1 record, which composes this key with the registered G1 reduction. Not T2's chain-product Theorems C2/C3; E993-R30-CHAIN-PRODUCT-RANK-SHADOW-DEFICIT-BOUND is not registered and is not an alias of this key. Not E993-R23-LITERAL-DELETE-ONLY-HALL, and no refuted key is revived. No status transfer to (HALL) E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL, E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG or Erdős #993. The labels CD-1, CD-2, L2 and C1 are not aliases (CD-1 is a registered alias of E993-R30-SELF-WITNESSED-STAR-FOREST-SECTOR-POSITIVE-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM; L2 of E993-R28-PENDANT-PATH-LEAF-DOMINANCE).
ALIASES: heterogeneous claw product normalized matching; claw-product normalized matching lemma
```

```text
RECORD: R30-C1-HETEROGENEOUS-CB-PATTERN-SECTOR-DELETION-DEFICIT-EXACT
CLAIM: Let T be a finite tree containing a pendant P_3 arm r–s–v (v a leaf, N_T(s) = {r, v}) and put Q := {r, v}. Suppose T − N_T[Q] is a disjoint union of M ≥ 1 stars S_1, …, S_M, S_i with centre c_i and t_i ≥ 1 leaves, satisfying (H-attach) (every edge between S_i and N_T(Q) is incident to c_i); then each S_i hangs by c_i from exactly one vertex of N_T(r) ∖ {s}, and every vertex of N_T(r) ∖ {s} carrying no star is a leaf of T (the heterogeneous CB pattern). Let P be the set of star leaves and F a set of leaves of T with P ⊆ F, v ∈ F and (A4) (every u ∈ F ∖ P has W_u := N_T(s_u) ∖ {u} ⊆ Q); these force F = P ∪ {v}. Put q_i := t_i + 1 and let e_j(q) be the j-th elementary symmetric function of q_1, …, q_M (e_j(q) = 0 for j > M). For every p ≥ 2, with S^Q_{p+1} := {B ∈ I_{p+1}(T) : Q ⊆ B}, the literal active-tag weight w_F (SEMANTIC-CONTRACT §1.2), N_D(X) := {B ∖ {y} : B ∈ X, y ∈ B} ⊆ I_p(T) (including the out-of-sector targets B ∖ {r}, B ∖ {v}) and φ(X) := Σ_{B∈X} w_F(B) − Σ_{A∈N_D(X)} w_F(A): max_{X ⊆ S^Q_{p+1}} φ(X) = max(0, e_{p−1}(q) − e_{p−2}(q)) (integers). The maximum is attained at X = ∅ or at X = R*_{p+1} := {B ∈ S^Q_{p+1} : w_F(B) = 1}, the members meeting each star in ∅, {c_i} or a single leaf; under B ↦ (B ∩ S_i)_i, R*_{p+1} is the rank-(p−1) layer of K(q_1) × ⋯ × K(q_M) (K(c) a bottom below c atoms: the bottom is ∅, the atoms are {c_i} and the t_i single leaves). The ℕ-reading at p = 1 is excluded: there the value is 1 = e_0 − e_{−1} with e_{−1} := 0, while truncated e_0 ∸ e_0 = 0. Proof of record: (i) in the sector w_F(B) = 1 + Σ_i ℓ_i(B)·[ℓ_i(B) ≥ 2], ℓ_i(B) the number of leaves of S_i in B (v is active through r; a star leaf is active iff another leaf of its star is in B, its choke lying in N(r)); (ii) the Q-exits B ∖ {r}, B ∖ {v} are private within the sector and have weight w_F(B) − 1 each, so by the reduction of record on E993-R30-SELF-WITNESSED-STAR-FOREST-SECTOR-POSITIVE-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM (T2's Theorem G1) the maximum is attained inside R* = {w_F = 1}; (iii) for X ⊆ R*_{p+1} both Q-exits have weight 0 and every in-sector deletion target is a weight-one member of R*_p and a claw lower cover, so φ(X) = |X| − |∂X|; (iv) E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING at k = p − 1 when 1 ≤ p − 1 ≤ M gives the value with equality at L_{p−1}; for p − 1 > M, R*_{p+1} = ∅ and e_{p−1}(q) = 0. At uniform t on CBstar(d,m,t) (M = dm) it is the formula of E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT. Fences: one source family (the root-plus-arm sector) of the heterogeneous CB pattern; deletion arcs only, and a deletion-only deficit is never a (CUT); not (HALL) and not (HALL-COND) for any X ⊄ S^Q_{p+1}; no eligibility content; it bears on the (HALL) network at (T, p) only where F_p(T) = P ∪ {v}; nothing about S(T,p), the primary aggregate, E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG or Erdős #993; not E993-R23-LITERAL-DELETE-ONLY-HALL. A record row, not a key.
STATUS: proved_informal
PROVENANCE: Promoted conditional → proved_informal at the Cycle 4 close on SR-C4-5 (composition grade = weakest input: the G1 reduction, proved_informal (SR-C3-5a), and E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING, proved_informal (SR-C4-5)). Origin: r30 Cycle 3 critics C-T2-F (its CD-2) and C-T2-U (its L2), on T2's Cycle 3 Proposition 1 and Theorem G1 (T2, Claude Sonnet 5); reduction, exact lemma and conditional grade by SR-C3-5 (statement 5c); poset identification re-derived, p ≥ 2 guard, K(q_i) notation and F = P ∪ {v} added by SR-C4-5 (Claude Opus 5.5). CD-1 of Cycle 4: critics C-T2-F and C-T2-U (Claude Opus 5.5), verified by the r30 T adjudicator. Mechanism context: Codex (GPT-6 Astra/Sol/Luna). Not a discharge by T2's chain-product Theorems C2/C3 (struck). Bounded corroboration, not evidence (SR-C4-5 part F): 70 rows on 14 heterogeneous CB-pattern trees of order 6–15, literal w_F, max-flow deficit equal to the formula on 70/70 (e_{−1} := 0 at p = 1), (WID) asserted with F = P ∪ {v}. No Cycle 3 or Cycle 4 label (CD-1, CD-2, L2, C1) is an alias of this record.
```

```text
DISTINCTION ROW: R30-HET-CLAW-NM-VS-NM
KEY: E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING
TEXT: (NM) is a graph-side, unweighted sector statement: for a finite simple graph G and independent Q with G − N_G[Q] a perfect matching on N edges, the Q-sector layers satisfy k·|X| ≤ 2(N − k + 1)·|∂_Q X|; its abstract content is normalized matching on K(2)^N, proved by biregularity, and its scope note carries T-D-R1 (uniform K(q)^M, biregular) and states that for heterogeneous star sizes no statement is made. The new key is an abstract poset lemma on K(q_1) × ⋯ × K(q_M) with arbitrary q_i ≥ 1, where biregularity fails; it is proved by a product-step normalized flow carrying log-concavity. At q_i ≡ 2 its inequality is (NM)'s abstract content (e_k(2,…,2) = 2^k·C(N,k)); it contains no graph, sector or encoding step, so it does not imply (NM)'s graph-side statement, and (NM) does not imply the heterogeneous case. Not an alias in either direction; no status transfer; (NM)'s statement, grade and fences are unchanged.
```

```text
DISTINCTION ROW: R30-HET-CLAW-NM-VS-CBSTAR
KEY: E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT
TEXT: The CBstar key is a tree-and-sector statement: on the uniform family CBstar(d,m,t) with Q = {r, v} and F = leafSet(T), the exact maximum sector deletion deficit is max(0, C(M,k)(t+1)^k − C(M,k−1)(t+1)^{k−1}), k = p − 1, M = dm, with the (LB) corollary for t ≥ 2; its poset step uses T-D-R1 (uniform, biregular). The new key is the abstract heterogeneous claw-product normalized-matching lemma, with no tree, weight, selector or corollary content. The promoted record R30-C1-HETEROGENEOUS-CB-PATTERN-SECTOR-DELETION-DEFICIT-EXACT composes the new key with the registered G1 reduction to give the heterogeneous-sector formula max(0, e_{p−1}(q) − e_{p−2}(q)), q_i = t_i + 1, which reduces to the CBstar formula at uniform t (e_k(t+1,…,t+1) = C(M,k)(t+1)^k); that record is a generalization of the CBstar formula, not of its (LB) corollary, and it is a record, not a key. Neither the new key nor the record is an alias of the CBstar key; no status transfers in either direction.
```

```text
SCOPE NOTE ON: E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING
TEXT: [r30 C4; SR-C4-5] The heterogeneous abstract analogue of T-D-R1 (arbitrary q_i ≥ 1 on K(q_1) × ⋯ × K(q_M), where the up-degree Σ_{empty i} q_i varies and biregularity fails) is now the separate key E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING (proved_informal; critics C-T2-F and C-T2-U, one product-step flow construction written twice independently; the r30 T adjudicator; SR-C4-5). The sentence "for heterogeneous star sizes … no statement is made" remains true of this key: the heterogeneous statement is abstract, belongs to the new key only, and carries no graph-side encoding. At q_i ≡ 2 the new key's inequality restates this key's abstract content and adds nothing to it. T2's Cycle 4 chain-product Theorems C2/C3 were proposed as filling this key's heterogeneous gap; they concern products of chains, not claws, and are not a scope note here. This key's statement, grade and fences are unchanged; no status transfers.
```

## Verdicts

verdict[SR-C4-5a]: confirmed_with_repairs
verdict[SR-C4-5b]: confirmed
verdict[SR-C4-5c]: confirmed_with_repairs
verdict[SR-C4-5d]: confirmed_with_repairs

- **SR-C4-5a.** CD-1 is correct at `proved_informal`.
  - **C-T2-F's proof: confirmed. C-T2-U's proof: confirmed.** They are the same argument: the identical product-step flow in two
    parametrizations, written independently.
  - Repairs: the attribution wording, and a statement face that defines `K(c)`, `∂X`, the flow and `M ≥ 1` and records the
    zero-extended index guard and the classical attribution.
- **SR-C4-5b.** Confirmed. T2's C2/C3 are chain-product theorems with `e_k` redefined as chain rank sizes (T2 §8.1–§8.2). They
  are correct on chains and do not discharge C1 (`(2,2)`, `k = 1`: 3 against 1; 193/248). The line-138 pointer is unverified
  because the file is outside the capsule.
- **SR-C4-5c.** Yes on both questions. C1's poset is exactly `Π K(t_i + 1)` on `R* = {w_F = 1}`, and CD-1 is its only missing
  ingredient. C1 promotes `conditional → proved_informal` as a RECORD. Repairs: `p ≥ 2` (the ℕ reading fails at `p = 1`),
  `K(q_i)` in place of `C_{q_i}`, `F = P ∪ {v}` stated as forced, and the ingredients listed on the face.
- **SR-C4-5d.** The key is confirmed at `proved_informal`. The name is a predicate and the name alias check is clean.
  Repairs: the attribution wording from 5a, and a rule that `CD-1`, `CD-2`, `L2` and `C1` are never aliases (`CD-1` is already a
  registered alias of the E4 key). It also gets the two distinction rows and the scope note on (NM).

## Artifact inventory

All scratch is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-sr-SR-C4-5/`
(SHA-256):

| File | SHA-256 | Content |
|---|---|---|
| `verify_capsule.py` | `3544c662bec3efb82b35909a92e2a66cce63de8a237114033efbfe4daefc175b` | inner-seal recomputation; all 60 member digests and byte counts |
| `sr_claw.py` | `6fdb92beb15a07591a624822a3b2344fb367c9eb23b5c6dad5340e3f5545f570` | own instrument, parts A–F |
| `sr_claw_output.json` | `856a961aff18a3d82c18546a008b48f40dccc1a9cb9300824ed92680f17f37d2` | output (`RESULT_SHA256 9a77d70c81ef1b26b0c3465e6e3b48d361e0226943f5393f7ea9820b67f08144`) |
| `sr_claw_stderr.txt` | `cafab44574f8c601956861af0ffa348ea2c2f434939d9ddd5eb3a0c6aee97111` | per-case progress log |
| `alias_check.py` | `a70fee1180f44e70c9792798d0924d2b9fe0f9e4cc86e47cb6af919ac2c88001` | name alias check, run-local snapshot and frozen master |
| `alias_check_output.json` | `b05840572429719e376f6e1177b1c828f4fc7c3df9b7fe657422be225724c18b` | output |
| `label_collision.py` | `4925b7dca0ccbeadab50580c11f01d6fb9a5095662245d6addcc7a30392f3b32` | label-collision check (`CD-1`, `CD-2`, `C1`, `L1`, `L2`, …) against both registries' aliases and patterns |
| `label_collision_output.json` | `1eaad39b3b4b4d51d14e14e6cc4a3ce89cc58fb594ea357c02b1d11553ef3190` | output |

**Replay.** Run each of these from the scratch directory:
1. `python3 -B verify_capsule.py`
2. `python3 -B sr_claw.py > sr_claw_output.json 2> sr_claw_stderr.txt` (about 3 s)
3. `python3 -B alias_check.py`
4. `python3 -B label_collision.py`

**Read-boundary disclosures.**
1. At session start the host injected into my context the project `CLAUDE.md` and the user auto-memory index (`MEMORY.md`),
   including run-history lines about r30. I did not open either file and did not act on them. No finding here rests on them.
2. I read the protocol's byte count and text, then the manifest, before verifying the seal, as the charter orders. Every other
   member was read only after the seal and all 60 digests were verified.
3. `grep`/`sed` ran only on individual capsule-member files. There was no recursive search, and no `find`, `grep -r` or `ls -R`
   above my grant.
4. I opened no non-member file except the two VerityOS boot files. T2's `chain_scd.py` (cited by the brief) was not opened.
5. I did not use Lean or `lake`, the network, installs, background jobs or child agents. I wrote only this file and my scratch
   directory. The session's default temporary scratchpad under `/private/tmp` was not used.

Reread before close: done. The headings match the protocol; there is one verdict line per statement; the registration
blocks follow the brief's grammar, and the ALIASES lines contain no `:` or `[`.
