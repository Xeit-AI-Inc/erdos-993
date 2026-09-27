# Second Read

Isolated second read `SR-C2-4`, Cycle 2, run r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`), Erdős #993
(weighted mixed-boundary transport). Date 2026-09-26. Object: the `G_k` family (S7, S8), the selector reduction (S9) and
the proposed `G_k` key with its `T(m,2)` conditional record (synthesis `## Registrations` item 5).

**Boot.** I am operating within VerityOS. I booted by reading, in full, exactly the two files the protocol allows:
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The only subsystem
used is `experiments/`, limited to this read's sealed capsule. The harness put the project `CLAUDE.md` and the user
auto-memory index into my context at session start. I did not open either as a source, nothing below relies on them, and I
wrote no conversation log, because the protocol confines my writes to this file and my scratch directory.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Capsule seal.** `control/c2-second-read/SR-C2-4-PACKET-MANIFEST.json` (stage `cycle-2-second-read-SR-C2-4`, 18 files). I
  removed `seal_sha256` and took the SHA-256 of the canonical JSON (`sort_keys`, separators `(",", ":")`, no trailing
  newline). The result is **`c7659cda20e016c4bd2b8780166f3af68a9a3877e99d6d6755f26e3b11fbeb15`**. It equals the embedded
  value and the value in the dispatch wrapper.
- **Members.** All **18/18** members match their listed SHA-256 and byte counts, with 0 mismatches. I checked them before I
  read anything. The members that bear on this read:

  | member | SHA-256 (prefix) | bytes |
  |---|---|---|
  | `SEMANTIC-CONTRACT.md` | `ee7ca2e2c3647555` | 17018 |
  | `SOLUTION-CONTRACT.md` | `3168e7a15baf7a7b` | 13035 |
  | `control/C2-SECOND-READ-PROTOCOL.md` | `3a2cf76872ef1d6e` | 3338 |
  | `control/C2-SECOND-READ-BRIEF-SR-C2-4.md` | `21e05d6325d5195c` | 5218 |
  | `control/C2-STAGE6-CONTROLLER-FACTS.json` | `ddc0754f3f1c9c31` | 12749 |
  | `control/snapshots/CLAIM-IDENTITY.run-local.c2-stage2.json` | `cb8000c318a9bc5d` | 2650050 |
  | `sources/authority/CLAIM-IDENTITY.json` | `eba20be33070e2cb` | 2624107 |
  | `cycles/cycle-2/stage3/returns/F2/RETURN.md` | `0ee9251107cdef43` | 35964 |
  | `cycles/cycle-2/stage4/critics/F2/T/CRITIQUE.md` | `c860201f814e8d5d` | 28111 |
  | `cycles/cycle-2/stage4/critics/F2/U/CRITIQUE.md` | `38df138d5176b432` | 28971 |
  | `cycles/cycle-2/stage5/adjudicators/F/ADJUDICATION.md` | `335e15e355065f9d` | 44552 |
  | `cycles/cycle-2/stage6/SYNTHESIS.md` | `3d30cc4b8c711451` | 62952 |
  | `second-reads/SR-REACH/SECOND-READ.md` | `3aef12eb6d94b67a` | 39161 |

  The other five members also match: `C2-ALLOCATION.md`, `C2-STAGE1-GATE.md`, `C2-STAGE6-PACKET-MANIFEST.json`,
  `PATH-CHECK-c2-second-read-briefs.json` (0 findings) and `SOURCE-DIGESTS.json`.
- **Statement of record.** The synthesis's `## Exact established results` S7, S8 and S9, and `## Registrations` item 5. The
  origins are F2's return (§A–§D), C-F2-T (F-5 to F-10), C-F2-U (Findings 1–6, Lemma F, Lemma U, Corollary G) and the F
  adjudication. P10 comes from SR-REACH (SR-11, `confirmed`). The (HALL) scope note in the Stage 2 registry snapshot cites
  P10 by label only ("P10–P12, B-b"). P10's wording of record is SR-REACH's SR-11 registration text, which is a capsule
  member, and I compare against that.
- **Read boundary.**
  - I read only the 18 capsule members and the two boot files.
  - The two registries were parsed as JSON: key lookup, a lexical scan and a full-text scan, and the registered
    `alias_patterns` were applied to my proposed texts.
  - I opened no seat, critic, adjudicator or controller scratch and no other return, critique, adjudication or second read.
    I used no network, installed nothing and ran no Lean.
  - Python standard library only, exact integers, `python3 -B` with `sys.dont_write_bytecode = True`. No `__pycache__` was
    written.
- **Disclosure 1.** The harness saved F2's return, which was too large for inline output, to its session tool-results store,
  and I read it from there. That file is a byte copy of the digest-verified capsule member.
- **Disclosure 2.** Before creating my output directory, I ran one non-recursive `ls` of `second-reads/`. It printed
  directory names only (`SR-BUDGET`, `SR-C2-1`, `SR-C2-2`, `SR-INV`, `SR-NET`, `SR-REACH`, `SR-SECTOR`). I opened none of them
  except the capsule member `SR-REACH/SECOND-READ.md`. The listing was not needed and is recorded here.
- **Disclosure 3.** To check that a cleaned-up script reproduced its output byte for byte, I made a temporary copy of my
  own `SR4-SELECTOR.json` in the session scratchpad, which lies outside the run root. `cmp` reported the files identical, and I
  deleted the copy at once.
- No `find`, and no `grep` or `rg` rooted above the capsule members. No background job was started.

## Statements read

- **SR-C2-4a (S7; F2's theorem).**
  - The tree `G_k`: root `0`; leaf `1` on `0`; support `2 ~ 0` with leaves `3, 4`; `k` paths `0–a_i–b_i–c_i`; `n = 3k+5`.
  - Claims:
    - `α(G_k) = 2k+3`;
    - `I(G_k) = (1+y)(1+3y+y²)^{k+1} + y(1+y)²(1+2y)^k`;
    - `x(G_k) ≤ k+1` for every `k ≥ 2`;
    - `(G_k, p = k+3)` is eligible iff `k ≥ 3`.
  - Attribution: F2 (seat). The struck literal "`x(G_k) = k+1` on 305 instances, `k = 0..304`" is replaced by `2 ≤ k ≤ 304`.
- **SR-C2-4b (S8).**
  - **Lemma F:** `Δ_{k+3}(G_k − 3) < 0` and `Δ_{k+3}(G_k − 4) < 0` for every `k ≥ 1`.
  - **Lemma U:** `A ∈ I_p` has an in-arc of (D) ∪ (S) iff `A` is not maximal, or some `u ∈ A` has two non-adjacent
    neighbours whose only neighbour in `A` is `u`.
  - **Corollary G:** for `k ≥ 3`, with `p = k+3` and `F = F_p(G_k)`:
    - the row is eligible;
    - `{3,4} ⊆ F`;
    - `A_k = {0,3,4,b_1,…,b_k}` is the unique target with no in-arc;
    - `w_F(A_k) = 2`;
    - `Σ_{I_p} w_F − Σ_{N(I_{p+1})} w_F = 2` exactly.
  - Attribution: C-F2-U and C-F2-T, with F2's S7 as input.
- **SR-C2-4c (S9; a scope-note sentence, not a key).** A selector-binding eligible row `(T, p, v)` (a leaf `v` with
  `Δ_p(T − v) ≥ 0` at an eligible `p`) forces either `x(T − v) ≥ x(T) + 3`, or a strict descent of `T − v` before `p` with
  `Δ_p(T − v) ≥ 0`. With `> 0`, that is a non-unimodal tree. The bounded record is attached.
- **SR-C2-4d (the key).** `E993-R30-GK-TREE-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO`, VERIFIED
  `proved_informal`, together with the S9 scope-note sentence and the CONDITIONAL `T(m,2)` record.

## Independent re-derivation

**Instrument** (`scratchpad/c2-sr-SR-C2-4/`). I wrote it from SEMANTIC-CONTRACT §1 with erratum R30-E-b, and imported
nobody's code. It has these parts:
- a tree test (`n − 1` edges plus BFS connectivity);
- an iterative forest DP for `i_k(G − D)` on the original carrier;
- `x` taken as the least `k` with `Δ_k < 0`, scanned through rank `α`;
- `F_p` derived from `Δ_p(T − v) < 0` on the original tree at the fixed rank;
- `S` computed separately as `Σ_{v∈F} [Δ_{p−1}(T − {v, s_v}) − Δ_{p−1}(T − N[s_v])]`;
- bitmask enumeration of `I_j`;
- the literal `w_F`: `v ∈ F ∩ B` counts iff `(B ∖ {v}) ∩ W_v ≠ ∅`, with `W_v = N(s_v) ∖ {v}`;
- the literal (D) ∪ (S), where (S) requires exactly `|N(u) ∩ B| = 2` and `u ∉ B`, and every image is asserted to lie in `I_p`;
- exact Dinic max-flow, run mixed and deletion-only.

Every network row asserts, before any other output, that the layer sizes equal the polynomial coefficients, that
`supply − capacity = S` from these independent sides, and that eligibility holds with `F ≠ ∅`.

### SR-C2-4a: `α`, the closed form, and the first-descent bound

- **`α(G_k) = 2k+3`, for every `k ≥ 0`.**
  - `M = {01, 23} ∪ {a_ib_i}` is a matching of size `k+2`.
  - `C = {0, 2} ∪ {b_i}` is a vertex cover of size `k+2`: the edge types `01, 02, 23, 24, 0a_i, a_ib_i, b_ic_i` each meet `C`.
  - `ν ≤ τ` holds in every graph. So `k+2 ≤ ν ≤ τ ≤ k+2`, and Gallai's `α + τ = n` gives `α = 3k+5 − (k+2) = 2k+3`.
  - Bipartiteness is not needed.
  - Checked against the graph (matching validity, cover validity) and against the DP degree for `k = 0..40`.
- **Closed form: conditioning on vertex `0`.**
  - *`0 ∉ A`.* The components of `G_k − 0` are:
    - `{1}`, with polynomial `1+y`;
    - the star `2–{3,4}`, with `1+3y+y²`;
    - `k` paths `a_i–b_i–c_i`, each with `1+3y+y²`.

    This gives `(1+y)(1+3y+y²)^{k+1}`.
  - *`0 ∈ A`.* Then `1`, `2` and every `a_i` are excluded, and what remains is:
    - `{3}` and `{4}` free, with `(1+y)²`;
    - `b_i–c_i` per path, with `1+2y`.

    This gives `y(1+y)²(1+2y)^k`.
  - Both closed forms equal my DP coefficient for coefficient for **`k = 0..60`** (the brief asked for `k ≤ 8`). The
    `I(G_k − 3) = I(G_k − 4)` form is checked the same way.
- **First descent.**
  - `P = (1+y)(1+3y+y²)^{k+1}` is a product of palindromes, hence palindromic of odd degree `2k+3`. So `P_{k+1} = P_{k+2}`
    exactly (checked for `k = 0..60`).
  - With `Q = (1+y)²(1+2y)^k` and `[yQ]_j = q_{j−1}`, we get `Δ_{k+1}(yQ) = q_{k+1} − q_k`.
  - From `q_k = 2^k + k·2^k + C(k,2)·2^{k−2}` and `q_{k+1} = 2^{k+1} + k·2^{k−1}`, cleared of denominators:

    **`8·Δ_{k+1}(I(G_k)) = −2^k·(k² + 3k − 8)`** for every `k ≥ 0`.

    I asserted this as an exact integer identity from the tree DP, not from the closed form, for `k = 0..60`.
  - `k² + 3k − 8` is `−8, −4, 2, 10, …` at `k = 0, 1, 2, 3`, so it is positive iff `k ≥ 2`. Hence **`Δ_{k+1}(G_k) < 0`
    strictly, at rank `k+1` (that is, `i_{k+2} < i_{k+1}`), for every `k ≥ 2`**, and `x(G_k) ≤ k+1`.
  - Boundary `k = 2`: `Δ_3(G_2) = −1`. At `k = 0, 1` the value is `+1`, and the DP gives `x(G_0) = 2` and `x(G_1) = 3`.
    This confirms the strike of the 305-instance literal. `x(G_k) = k+1` holds exactly for `2 ≤ k ≤ 60` (bounded; not
    claimed).
- **The palindromic factor and Newton.** `1 + 3y + y² = (1+φy)(1+ψy)` with `φ + ψ = 3` and `φψ = 1`. Its roots are
  `−ψ ≈ −0.382` and `−φ ≈ −2.618`, both real and negative. F2's Newton-inequality and strict-unimodality paragraph is
  correct, but it is **not load-bearing** for the first-descent bound, which uses only the palindromic plateau and the sign of
  `q_{k+1} − q_k`. (Real-rootedness is load-bearing in Lemma F.)
- **Eligibility iff `k ≥ 3`.**
  - `3(k+3) < 2(2k+3) + 1 = 4k+7` iff `k > 2`.
  - For `k ≥ 3`, `x + 2 ≤ (k+1) + 2 = p`.
  - For `k ≤ 2` the upper inequality fails.
  - Both are in ℕ with no subtraction. DP check: eligible iff `k ≥ 3` for `k = 0..60`. On `G_3`, `G_4` and `G_5` the whole
    window is the single rank `k+3`.

### SR-C2-4b: Lemma F, Lemma U, Corollary G

- **Lemma F: re-derived; both critics' proofs checked.**
  - `I(G_k − 3) = R + yS` with `R = (1+y)(1+2y)M`, `M = (1+3y+y²)^k` and `S = (1+y)(1+2y)^k`. Deleting `3` turns the star
    into the edge `2–4`: `1+2y` when `0 ∉ A`, and `1+y` when `0 ∈ A`.
  - `deg S = k+1`, so `[yS]_{k+3} = [yS]_{k+4} = 0`, and `Δ_{k+3}(G_k − 3) = R_{k+4} − R_{k+3}`.
  - **C-F2-U's form.** `R_{k+3} − R_{k+4} = (M_{k+3}−M_{k+4}) + 3(M_{k+2}−M_{k+3}) + 2(M_{k+1}−M_{k+2})`.
  - **C-F2-T's form.** With `P′ = (1+y)M`, `R_{k+4} − R_{k+3} = (P′_{k+4}−P′_{k+3}) + 2(P′_{k+3}−P′_{k+2})`.
  - Both need only this: `M` is palindromic of degree `2k`, has positive coefficients and is real-rooted. Newton then makes
    it strictly log-concave, and `r_j·r_{2k−1−j} = 1` for `r_j = M_{j+1}/M_j` gives `M_k > M_{k+1} > … > M_{2k} > 0 = M_{2k+1}`.
    Every bracket is therefore `≥ 0`, and the last one is `> 0`:
    - for `k ≥ 2`, by strict decrease;
    - for `k = 1`, because `M_2 = 1 > 0 = M_3`.
  - The automorphism of `G_k` swapping `3` and `4` gives leaf `4`. Both leaves are original degree-one vertices of `G_k`.
  - Checked as exact integers for `k = 1..60`: palindromy, strict decrease past the centre, strict log-concavity, both
    bracket identities, `deg S = k+1`, and `Δ_{k+3}(G_k − 3) = Δ_{k+3}(G_k − 4) < 0` from the DP.
  - **The brief's "non-palindromic" note.** `I(G_k − 3)` is indeed not palindromic, but neither proof needs it to be. Both
    work on the palindromic `M` (or `P′`), after the degree observation removes the `yS` term. There is no gap.
  - Bounded side fact, not claimed: `F_{k+3}(G_k)` is the whole leaf set for `k = 1..20`. Corollary G uses only `{3,4} ⊆ F`.
- **Lemma U: re-derived on every finite simple graph, every `p ≥ 0`.**
  - *(D) in-arc.* `B → A` by (D) means `B = A ∪ {q}` with `q ∉ A` and `B` independent. Such a `B` exists iff some `q` is
    addable, that is, iff `A` is not maximal.
  - *(S) in-arc gives a pair.* Suppose `u ∉ B`, `N(u) ∩ B = {y, z}` and `A = (B ∖ {y,z}) ∪ {u}`. Then:
    - `u ∈ A`, `B = (A ∖ {u}) ∪ {y, z}` and `y, z ∉ A`;
    - `y ≁ z`, because `B` is independent;
    - `y` has no neighbour in `A ∖ {u} ⊆ B`, so `N(y) ∩ A = {u}`, and likewise for `z`.
  - *A pair gives an (S) in-arc.* Given `y ≠ z` non-adjacent with `N(y) ∩ A = N(z) ∩ A = {u}`, note that `y, z ∉ A`, since a
    vertex adjacent to `u ∈ A` cannot lie in the independent `A`. Put `B = (A ∖ {u}) ∪ {y, z}`. Then:
    - `B` is independent;
    - `|B| = p + 1` and `u ∉ B`;
    - `N(u) ∩ B = {y, z}` exactly, because `A ∖ {u}` has no neighbour of `u`;
    - `(B ∖ N(u)) ∪ {u} = A`.
  - **Equivalence with P10's wording** (SR-11). P10 says: "`A` has no in-arc iff (i) `A` is maximal and (ii) no `u ∈ A` has two
    non-adjacent private neighbours (`w ∉ A`, `N(w) ∩ A = {u}`)". Lemma U is its negation, word for word: "a neighbour of `u`
    whose only `A`-neighbour is `u`" is exactly a private neighbour `w ∉ A` with `N(w) ∩ A = {u}`. So Lemma U is **P10
    restated, not a new lemma**.
  - **Exhaustive check (bounded).** On every labelled simple graph with `n ≤ 6` and every `p` (578,153 targets), the general
    form matches the literal in-arc scan with 0 mismatches.
  - **Non-adjacency is load-bearing off trees.** Dropping it mis-predicts 25,670 of those targets. The first case is the
    triangle at `p = 1`, target `{0}`. On trees (and on triangle-free graphs) it is automatic.
- **Uniqueness of the no-in-arc target in `I_{k+3}(G_k)`, `k ≥ 1`: re-proved.** A target with no in-arc is maximal (by (D)),
  so let `A` be a maximal independent `(k+3)`-set with no private pair.
  - **`0 ∈ A`.**
    - `1`, `2` and every `a_i` are excluded.
    - `3` and `4` are forced, since their only neighbour `2` is out.
    - On each path, exactly one of `b_i`, `c_i` is in `A`. If neither were, `c_i` would be addable.

    So `|A| = k+3` automatically. If some `c_j ∈ A`, then `1` (neighbour set `{0}`) and `a_j` (neighbours `0` and `b_j ∉ A`)
    are two non-adjacent private neighbours of `0`, which is an in-arc. So every path contributes `b_i`, and `A = A_k`.
  - **`0 ∉ A`.**
    - `1 ∈ A` is forced.
    - The star contributes `{2}` or `{3,4}`.
    - Each path contributes `{b_i}` or `{a_i, c_i}`. A lone `a_i` or a lone `c_i` is not maximal.

    The size is `k+3`. With `{2}`, exactly one path contributes `{a_i, c_i}`, and `3, 4` are private to `2`. With `{3,4}`,
    every path contributes `{b_i}`, and `a_1, c_1` are private to `b_1` (this uses `k ≥ 1`). Either way there is an in-arc.
  - **`A_k` has none.** `A_k` is independent and dominating. The vertices outside it are `1` (private to `0`), `2` (three
    `A`-neighbours), `a_i` (two) and `c_i` (private to `b_i`). So every member has at most one private neighbour.
  - Hence **`A_k` is the unique member of `I_{k+3}(G_k)` with no in-arc**, for every `k ≥ 1`.
  - Brute force, `G_1..G_6` (31,148 targets): the literal scan and the Lemma U predicate agree on every target, and the
    unreachable set is exactly `[A_k]`.
- **`w_F(A_k) = 2`.** The only leaves in `A_k` are `3` and `4`, since `0` and the `b_i` have degree `≥ 2`. Their witness sets
  `W_3 = {0, 4}` and `W_4 = {0, 3}` both meet `A_k`. So `w_F(A_k) = |{3,4} ∩ F| = 2` by Lemma F.
- **The gap identity (the brief's check).** `N(I_{p+1})` is by definition the set of targets joined to some source, that is,
  the set of targets with at least one in-arc. So `I_p ∖ N(I_{p+1})` is exactly the set of no-in-arc targets, and
  `Σ_{I_p} w_F − Σ_{N(I_{p+1})} w_F = Σ_{A without in-arc} w_F(A)` holds identically, with no side condition. There is no
  ℕ-subtraction issue, because `N(I_{p+1}) ⊆ I_p` and `w_F ≥ 0`. With uniqueness this equals `w_F(A_k) = 2`.
- **What "gap 2" says about (HALL).** By (WID) (`formally_verified`, C1-LA1), (HALL-COND) at `X = I_{p+1}` on `(G_k, k+3)`
  reads `supply ≤ capacity − 2`, which is **equivalent to `S(G_k, k+3) ≤ −2`**. The scalar target is `S ≤ 0`. Since `S` is an
  integer, the Hall instance is strictly stronger by exactly the exclusion of `S ∈ {−1, 0}`. Corollary G proves the
  right-hand side. It proves nothing about whether either inequality holds on the family. "Still holds" is bounded:

  | row | `n` | `α` | `x` | `p` (window) | `\|F\|` / leaves | supply | capacity | `S` | arcs | gap | unreachable (weight) | mixed / deletion-only flow |
  |---|---:|---:|---:|---|---:|---:|---:|---:|---:|---:|---|---|
  | `G_3` | 14 | 9 | 4 | 6 ([6]) | 6 / 6 | 253 | 527 | −274 | 664 | 2 | `{0,3,4,6,9,12}` (2) | 253 / 253 |
  | `G_4` | 17 | 11 | 5 | 7 ([7]) | 7 / 7 | 1542 | 2735 | −1193 | 4466 | 2 | `{0,3,4,6,9,12,15}` (2) | 1542 / 1542 |
  | `G_5` | 20 | 13 | 6 | 8 ([8]) | 8 / 8 | 8875 | 14196 | −5321 | 27850 | 2 | `{0,3,4,6,9,12,15,18}` (2) | 8875 / 8875 |

  Every value matches the brief, both critics and the F adjudication, digit for digit. (Labels: `a_i = 5+3i`,
  `b_i = 6+3i`, `c_i = 7+3i`, `i = 0..k−1`.) Each row asserts `supply − capacity = S` from independent sides. Deletion arcs
  alone saturate on all three.

### SR-C2-4c: the selector reduction

- **The dichotomy, sharpened.** Let `(T, p)` be eligible, so `p ≥ x(T) + 2`, and let `v` be a leaf with `Δ_p(T − v) ≥ 0`. For
  `n ≥ 2`, `T − v` is a tree. `x(T − v) = p` is impossible, because it would mean `Δ_p(T − v) < 0`. So exactly one of the
  following holds:
  - (i) `x(T − v) ≥ p + 1 ≥ x(T) + 3`;
  - (ii) `x(T − v) ≤ p − 1`, that is, a strict descent of `T − v` before `p`, with `Δ_p(T − v) ≥ 0`.
- **What case (ii) means.** In case (ii) with `Δ_p(T − v) > 0`, there is a `k = p ≥ x(T − v)` with `Δ_k > 0`. By
  `E993-INDEPENDENCE-UNIMODAL-IFF-NORECOVERY` (VERIFIED `proved_informal`: weak unimodality iff `Δ_k ≤ 0` for every
  `k ≥ x`), `T − v` would be a tree with a non-unimodal independence sequence, which is the object of
  `E993-EXISTS-COUNTEREXAMPLE` (OPEN). This is hypothetical and transfers no status. The plateau `Δ_p(T − v) = 0` is **not** a
  unimodality violation. The residual non-#993 cases are (i) and the plateau, as synthesis R9 says. There is no ℕ issue:
  `p ≥ x + 2` is used as stated.
- **Why no first-descent inequality closes the selector question.** A first-descent inequality bounds only the least
  descent index `x(T − v)`. Even the strongest bound the data suggest, `x(T − v) ≤ x(T) ≤ p − 2`, excludes case (i) and nothing
  more. Favorability asks for the sign of `Δ_p(T − v)` at a rank at least two steps beyond that descent, and the least
  descent index does not determine that sign. Closing it needs a statement of a different type, persistence: `Δ_j(T − v) < 0`
  for `j ∈ [x(T − v), p]`, or at least at `j = p`. That is a strict no-recovery (strict unimodality) statement for every
  leaf-deleted tree on the lower-region window, the open core of #993. So the brief's route "`x(T − v) ≤ x(T) + 1` plus
  eligibility" is correctly rejected. Both critics and the adjudicator agree, and I agree.
- **Bounded record, own instrument.** Free trees up to isomorphism, generated by leaf extension with a centre-rooted AHU
  canonical form. Counts are asserted equal to A000055 for orders 2–16. Every leaf of every tree is included.

  | order | trees | leaf instances: shift 0 / −1 | eligible rows | leaf checks | non-favorable | strict descent on `[x(T−v), p]` |
  |---:|---:|---|---:|---:|---:|---:|
  | 2–10 | 200 | 712 / 253 | 0 | — | — | — |
  | 11 | 235 | 575 / 758 | 5 | 42 | 0 | 42 |
  | 12 | 551 | 2,025 / 1,340 | 34 | 268 | 0 | 268 |
  | 13 | 1,301 | 6,837 / 1,663 | 163 | 1,211 | 0 | 1,211 |
  | 14 | 3,159 | 11,852 / 10,155 | 313 | 2,248 | 0 | 2,248 |
  | 15 | 7,741 | 28,544 / 28,714 | 528 | 5,160 | 0 | 5,160 |
  | 16 | 19,320 | 122,590 / 28,674 | 2,763 | 26,286 | 0 | 26,286 |

  - The shift `x(T − v) − x(T)` is always `0` or `−1`, never positive, on every leaf of every free tree of orders 2–16. That
    is 173,135 zeros and 71,557 minus-ones.
  - Orders 4–14 give **21,997 / 14,169**, exactly CF6-F3's counts.
  - Orders 11–14 give **515** eligible rows and **3,769** leaf checks, exactly CF6-F3's. There are 3,806 eligible rows at
    orders 11–16. Every leaf is favorable on every one, and every `T − v` descends strictly at every rank from `x(T − v)`
    through `p`.
  - The smallest eligible order is 11 (erratum R30-E-a).
- **Standing of the other bounded inputs.**
  - **F2's 588 isomorphism-class rows (orders 11–37).** Favorability only. This rests on C-F2-T's and C-F2-U's independent
    dedup audits and the F adjudicator's replay. I did not replay it (not a capsule member). F2's Part D reports no shift
    data, so the shift clause must not be attached to these rows.
  - **C-F2-U's rooted exploration to order 16.** Shifts in `{−1, 0}`, counted with multiplicity over rooted labellings. My
    free-tree run to order 16 covers the same trees up to isomorphism.
  - **C-F2-T's 5,446 free trees to order 14.** C-F2-T reports only the maximum shift, 0. My run and CF6-F3 supply the value set
    `{0, −1}`.
- **A fidelity point for synthesis item 4 ("open fidelity question").** SR-REACH's own census table (a capsule member) has a
  column `F = leaf set` with entries **10,061 / 10,061 at order 17 and 37,295 / 37,295 at order 18**. So F2's statement that
  SR-REACH did not rerun the whole-leaf-set check at orders 17–18 is contradicted by SR-REACH's face. The check was run, as a
  column of the P10-path census. Only the order-19 part of the allocation's 195,683 rows (C-F1-T) is outside my capsule.

### SR-C2-4d: the `T(m,2)` conditional record (own instrument)

- **Construction and labels.** `c_i = i−1`, `d_i = m+i−1`, `e_i = 2m+i−2`, `f = 3m−2`, `s = 3m−1`, `ℓ_j = 3m+j−1`.
- **`α(T(m,2)) = 2m+1`.** Matching `{e_ic_i, c_mf, sℓ_1}` and cover `{c_i} ∪ {s}`, each of size `m+1`, checked for `m ≤ 40`.
  The DP `α` agrees for `m ≤ 400`.
- **`T(m,2) − ℓ_1 ≅ T(m,1)`.** The two edge sets are literally identical after renaming `ℓ_2 → ℓ_1`, for every `m ≤ 400`. The
  polynomials are identical too. This is structural and `proved_informal`.
- **Premise (P1).** `x(T(m,2)) ≤ m` holds for every `3 ≤ m ≤ 400`, and fails at `m = 1, 2`. Equality `x = m` holds exactly
  for `3 ≤ m ≤ 18`, which includes the whole eligible range `4 ≤ m ≤ 18`. For `19 ≤ m ≤ 400`, `x < m`: for example
  `x(T(19,2)) = 18`, `x(T(304,2)) = 288` and `x(T(400,2)) = 379`.
- **Premise (P2).** `Δ_{m+2}(T(m,1)) < 0` for every `2 ≤ m ≤ 400`.
- **Eligibility.** `(T(m,2), m+2)` is eligible for every `4 ≤ m ≤ 400` (397 rows).
- **Uniqueness (bounded check of the proved statement).** For `T(2..6, 2)` (4,521 targets), the literal scan equals the
  predicate, and the unique no-in-arc target is `{c_1, …, c_m, ℓ_1, ℓ_2}`.
- **Uniqueness (re-proved).** I re-proved the case analysis for `m ≥ 2`, following C-F2-U's split. `s ∈ A` makes `ℓ_1, ℓ_2`
  private to `s`. Otherwise exactly one vertex of `{d_i, c_m, f}` is added to `{ℓ_1, ℓ_2}` plus one of `c_i, e_i` for each
  `i < m`. The cases then go as follows:
  - `d_i` leaves `f` addable;
  - `f` forces `c_{m−1}`, with the private pair `{e_{m−1}, d_{m−1}}`;
  - `c_m` together with some `e_i` forces `c_{i+1}`, with the private pair `{d_i, e_{i+1}}`, or `{d_{m−1}, f}` when
    `i + 1 = m`.
- **Weight.** `w_F(A) = |{ℓ_1, ℓ_2} ∩ F|`, because `W_{ℓ_1} = {f, ℓ_2}` meets `A`, and so does `W_{ℓ_2}`, and no `c_i` is a
  leaf for `m ≥ 2`. The swap automorphism makes it `0` or `2`.
- **Network rows (bounded).**

  | row | supply / capacity / `S` | `\|F\|` | gap | mixed / deletion-only flow |
  |---|---|---:|---:|---|
  | `T(4,2)/6` | 202 / 454 / −252 | 5 | 2 | 202 / 202 |
  | `T(5,2)/7` | 1173 / 2267 / −1094 | 6 | 2 | 1173 / 1173 |
  | `T(6,2)/8` | 6350 / 11155 / −4805 | 7 | 2 | 6350 / 6350 |

## Findings and repairs

**SR-C2-4a: mathematics confirmed; four wording repairs.**
1. **The ℕ exponent.** The face's `q_k = 2^{k−3}(k²+7k+8)` and `q_{k+1} − q_k = −2^{k−3}(k²+3k−8)` are rational at `k = 2`,
   where `2^{−1}` appears. Read in ℕ, `2^{k−3}` truncates to `2^0` and gives `q_2 = 26 ≠ 13`. Register the cleared identity
   `8·Δ_{k+1}(I(G_k)) = −2^k(k²+3k−8)`, valid for every `k ≥ 0`. It is strict at rank `k+1` exactly when `k ≥ 2`.
2. **Name `G_k` explicitly on the face.** S7's "the explicit tree on `3k+5` vertices" is not a definition.
3. **Mark the Newton paragraph as not load-bearing** for `x ≤ k+1`. It is load-bearing for Lemma F.
4. **Scope of the `T(m,k)` facts.** `α(T(m,k)) = 2m+k−1` holds for `m, k ≥ 1`, and `T(m,2) − ℓ_1 ≅ T(m,1)` for `m ≥ 1`. The
   isomorphism is a critic-level grade rise (C-F2-T F-8; C-F2-U Finding 4), and it belongs to the `T(m,2)` conditional record,
   not to the `G_k` key.

**SR-C2-4b: confirmed; three repairs.**
1. **Lemma U's scope and standing.** State it for every finite simple graph and every `p ≥ 0`. Record it as a re-derivation of
   P10 (SR-11, already confirmed), identical to P10 by negation. It is not a new lemma, and it needs no key or grade of its
   own. The non-adjacency clause must stay: off trees it is load-bearing (25,670 of 578,153 targets on graphs with `n ≤ 6`).
2. **The gap identity is definitional.** It holds with no side condition, since `N(I_{p+1})` is exactly the set of targets
   with an in-arc. The content of Corollary G's last clause is uniqueness plus Lemma F.
3. **What the gap says.** On `(G_k, k+3)`, (HALL-COND) at `X = I_{p+1}` is **equivalent to `S(G_k, k+3) ≤ −2`**, via (WID).
   "Strictly stronger than `S ≤ 0`" means exactly that: it excludes `S ∈ {−1, 0}`. Whether it holds on the family is open. It
   holds on `G_3`, `G_4` and `G_5` (bounded).

   The attribution "two independent proofs of each lemma" is correct:
   - Lemma F: C-F2-U Lemma F and C-F2-T F-6;
   - Lemma U / uniqueness: C-F2-U Lemma U and C-F2-T F-7;
   - the composition: C-F2-U Corollary G and C-F2-T "Resulting statement".

**SR-C2-4c: confirmed; three repairs.**
1. **State the dichotomy exactly:** (i) `x(T − v) ≥ p + 1` (hence `≥ x(T) + 3`); (ii) `x(T − v) ≤ p − 1` with
   `Δ_p(T − v) ≥ 0`. Name the plateau (`= 0`) as not a unimodality violation.
2. **Attach the shift clause `{0, −1}` only to the free-tree runs and the rooted run**, not to F2's 588 rows (favorability
   only). The synthesis bullet "The shifts … are always in `{0, −1}`" is attached to all three records, and should be split.
3. **Record the partial aliases.**
   - `E993-THEOREM-B` (OPEN: `x(T−v) ≥ x(T) − 1` for every tree and leaf): the lower half of the shift record is exactly
     bounded instances of it. The record moves nothing.
   - `E993-PAIR-LEAFDRIFT-01` (OPEN, measured) concerns the first mode, a different statistic.
   - The (ii)-with-`> 0` case is the object of `E993-EXISTS-COUNTEREXAMPLE`, hypothetically only.

   Separately, synthesis item 4's open fidelity question is answered for orders 17–18 by SR-REACH's own table (see above).

**SR-C2-4d: the key name must be repaired; four further repairs.**
1. **The name asserts more than the statement.** Read as a predicate of `k`, "GK-TREE-AT-RANK-K-PLUS-3-ELIGIBLE" claims
   eligibility of `(G_k, k+3)` for every `k`. It is false at `k = 0, 1, 2`, and the statement asserts it only for `k ≥ 3`. Every
   other clause of the name (unique no-in-arc target, active weight two) holds for all `k ≥ 1`. The fix follows the registry's
   `LE`/`GE` convention: **`E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO`**. It is
   a predicate, and the statement satisfies every clause of it. It is not a noun phrase, which was SR-REACH's objection to
   Cycle 1's name.
2. **Alias check (mine).**
   - *Lexical.* The Stage 2 run-local snapshot (438 claims) and the frozen master (434) were scanned for key-name fragments
     (`GK`, `UNREACH`, `IN-ARC`, `NO-IN`, `ACTIVE-WEIGHT`, `WEIGHT-TWO`, `K-PLUS`, `RANK-K`, `ELIGIBLE`, `PRIVATE`,
     `MAXIMAL`, `REACHAB`). The only hit is `NO-IN` in `E993-R25-THIN-TREE-TAU-12-BAND-NO-IN-WINDOW-FAILURE-NO-RECOVERY`,
     which is unrelated ("no in-window failure").
   - *Full text.* I scanned statements, scopes and aliases. `G_k` appears only as an unrelated index in
     `E993-C2-CT-U3-ORDER102-LC-RELAXATION-WITNESS` and `E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF`. `unreachab` appears
     only in the (HALL) scope note. `in-arc`, `maximal independent`, `private neighb`, `3k+5` and `1+3y+y²` do not appear.
   - *Registered patterns.* Applying every claim's `alias_patterns` and aliases to my registration texts gives one hit only:
     the phrase "non-unimodal tree" in the S9 sentence matches `E993-EXISTS-COUNTEREXAMPLE`. The sentence uses it
     hypothetically, and it is fenced below.
   - *Mathematical partial overlaps.*
     - The (HALL) scope note's P11 record carries `G_k`'s unreachability and a bounded eligibility and favorability range.
       The new key supersedes the bounded `G_k` parts, so the P11 record should be updated.
     - P10 (SR-11) sits inside Lemma U.
     - (WID) is used only for the equivalence remark.

   The snapshot predates the Cycle 2 registrations, so the controller should repeat the check against the living registry
   at registration time.
3. **Attribution must add the family's origin and the checks.**
   - r30 Cycle 1 C-F2-T constructed `G_k` and `A_k`. F2 says so, and so does SR-REACH.
   - P10 is F2, C-F2-T and C-F2-U, confirmed by SR-REACH.
   - The F adjudicator verified the result at full scope.
   - SR-C2-4 is this second read.
4. **Grade `proved_informal`.** It is the weakest input's grade: A1–A4, Lemma F and Lemma U are `proved_informal`; (WID) is
   `formally_verified`.
5. **The `T(m,2)` record is CONDITIONAL, not a key.**
   - Premise (P1)'s bounded range is `3 ≤ m ≤ 400`. The brief's "`x = m` exactly for `4 ≤ m ≤ 18`" is true, and my instrument
     also has equality at `m = 3`.
   - Premise (P2) holds on `2 ≤ m ≤ 400`.
   - The conditional grade is right, because both premises are bounded only.

**Fence audit (all statements).**
- `w_F` is literal, and `F_p` is derived, never assumed.
- `x` runs through `α`.
- `supply − capacity = S` is asserted from independent sides on every network row.
- An unreachable target refutes nothing, and a positive gap is not a cut. Every computed row saturates with deletion arcs
  alone.
- The family theorem moves no key's status: (HALL) stays OPEN, and the primary aggregate is untouched.
- No census value enters any proof. The bounded rows only corroborate.
- None of the refuted mechanisms of SOLUTION-CONTRACT §3.2 is used.
- There is no RTree wording, and no closed region is re-proved.
- No controller prior is cited as evidence. CF6-F1, CF6-F2 and CF6-F3 agree with my own counts.

**ℕ-subtraction audit.**
- `p − 1` in `S` is guarded by `p = k+3 ≥ 4`.
- Eligibility involves no subtraction.
- `α = n − τ` gives `3k+5 − (k+2)`, which is non-truncating.
- The gap is `Σ_{I_p} − Σ_{N(I_{p+1})}` with `N ⊆ I_p`, so it is non-truncating. It is cast to ℤ in any Lean form.
- `2^{k−3}` is repaired to the cleared form.
- Coefficients above a polynomial's degree are the integer zero extension (Lemma F at `k = 1`).
- S9 uses `p ≥ x(T) + 2` only.

## Registration text

**Key (SR-C2-4d, with S7 companion content; register verbatim).**

```text
Key: E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO
Status: VERIFIED   Evidence grade: proved_informal   Formal award: none (no Lean text; smallest Lean node N10 exists_transportRel_iff)
Statement: For k >= 0 let G_k be the tree with vertices 0, 1, 2, 3, 4 and a_i, b_i, c_i (1 <= i <= k) and edges 0-1, 0-2,
2-3, 2-4, 0-a_i, a_i-b_i, b_i-c_i (n = 3k+5), and A_k = {0, 3, 4, b_1, ..., b_k}. Then for every k >= 3, with p = k+3 and
F = F_p(G_k) (the fixed original strict selector {leaves v : Delta_p(G_k - v) < 0}):
 (1) (G_k, p) is eligible: x(G_k) + 2 <= p and 3p < 2*alpha(G_k) + 1;
 (2) {3, 4} is a subset of F;
 (3) A_k is the unique independent p-set of G_k with no in-arc of the relation (D) union (S) from I_{p+1}(G_k);
 (4) w_F(A_k) = 2, and sum_{A in I_p} w_F(A) - sum_{A in N(I_{p+1})} w_F(A) = 2 exactly.
Equivalently, by (WID), on these rows (HALL-COND) at X = I_{p+1} is the inequality S(G_k, k+3) <= -2, while the scalar
target is S(G_k, k+3) <= 0.
Companion content (on the face, same grade): alpha(G_k) = 2k+3 for every k >= 0 (matching {01, 23, a_i b_i} and cover
{0, 2, b_i}, both of size k+2; Gallai); I(G_k) = (1+y)(1+3y+y^2)^(k+1) + y(1+y)^2(1+2y)^k and
I(G_k - 3) = I(G_k - 4) = (1+y)(1+2y)(1+3y+y^2)^k + y(1+y)(1+2y)^k for every k >= 0 (conditioning on vertex 0);
8*Delta_{k+1}(I(G_k)) = -2^k (k^2 + 3k - 8) for every k >= 0 (palindromic plateau of (1+y)(1+3y+y^2)^(k+1) at ranks k+1,
k+2 plus the convolution of (1+y)^2(1+2y)^k), hence a strict descent at rank k+1 and x(G_k) <= k+1 for every k >= 2;
(G_k, k+3) is eligible if and only if k >= 3; Delta_{k+3}(G_k - 3) < 0 and Delta_{k+3}(G_k - 4) < 0 for every k >= 1 (the
correction term y(1+y)(1+2y)^k has degree k+2; (1+3y+y^2)^k is palindromic, real-rooted and strictly decreasing past its
centre); A_k is the unique no-in-arc target of I_{k+3}(G_k) for every k >= 1 (P10 / Lemma U case analysis on 0 in A).
Proof inputs: P10 (second-read-confirmed, SR-REACH SR-11): A in I_p has no in-arc iff A is maximal and no u in A has two
non-adjacent private neighbours. The gap identity is definitional (N(I_{p+1}) is the set of targets with an in-arc).
Attribution: r30 Cycle 1 C-F2-T (construction of G_k and A_k; unreachability of A_k); r30 Cycle 2 F2 (Claude Sonnet 5):
alpha(G_k), the closed forms, x(G_k) <= k+1 for k >= 2 and exact eligibility; C-F2-U and C-F2-T (Claude Opus 5.5), two
independent proofs each: Lemma F (favorability of 3 and 4), Lemma U and the uniqueness case analysis, and the composition
(Corollary G); P10: F2 / C-F2-T / C-F2-U, confirmed by SR-REACH; F adjudicator (verification at full scope); SR-C2-4
(isolated second read). The active-tag weight, relation and mechanism: Codex (GPT-6 Astra/Sol/Luna); (WID): C1-LA1;
definitions of record: the first-interior run (Codex), entries 1-18; r26/r24/r25 definition layers.
Bounded corroboration (not proof): G_3/6, G_4/7, G_5/8 have supply/capacity/S 253/527/-274, 1542/2735/-1193,
8875/14196/-5321, gap 2, the single unreachable target A_k of weight 2, and saturate with deletion arcs alone (F2, both
critics, F adjudicator, SR-C2-4); closed forms and identities checked to k = 60 (SR-C2-4).
Fences: a family scope note on E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL, not (HALL); (HALL) stays OPEN; asserts nothing
about the sign of S(G_k, k+3) (S(G_k, k+3) <= -2 is open for general k); an unreachable target refutes nothing and a
positive gap is not a cut; F_{k+3}(G_k) is not asserted to be the whole leaf set; mechanism != aggregate; no status
transfer to the primary aggregate, E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG or
Erdos #993; no RTree wording.
Distinction: not E993-R23-LITERAL-DELETE-ONLY-HALL or any refuted mechanism of SOLUTION-CONTRACT s3.2 (it proposes no
mechanism; it computes the reachable capacity of the registered (D) union (S) network under the active weight).
```

**(HALL) scope-note sentence: the `G_k` family (after the key registers).**

```text
[r30 C2; SR-C2-4] On the explicit family G_k (k >= 3, p = k+3; key
E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO, proved_informal) every row is
eligible, the tags 3 and 4 are favorable, and exactly one target, of active weight 2, has no in-arc; so (HALL-COND) at
X = I_{p+1} reads supply <= capacity - 2, i.e. S(G_k, k+3) <= -2 by (WID), strictly stronger than the scalar target
S <= 0 on infinitely many eligible rows. Whether it holds on the whole family is open; it holds on G_3, G_4, G_5
(bounded; deletion arcs alone saturate). This supersedes the bounded G_k eligibility/favorability range of the P11 record;
T(m, k) remains as recorded there and in the conditional record below. No separating instance is known; nothing here is a
cut.
```

**(HALL) scope-note sentence for S9 (not a key).**

```text
[r30 C2; SR-C2-4] Selector reduction (C-F2-U Finding 6, C-F2-T F-5; proved_informal, elementary; second-read-confirmed by
SR-C2-4): if (T, p) is eligible and a leaf v has Delta_p(T - v) >= 0 (v not in F_p(T)), then either (i) x(T - v) >= p + 1,
hence x(T - v) >= x(T) + 3, or (ii) x(T - v) <= p - 1 and Delta_p(T - v) >= 0, a strict descent of the tree T - v before p
followed by no strict descent at p. In case (ii) with Delta_p(T - v) > 0, T - v fails weak unimodality
(E993-INDEPENDENCE-UNIMODAL-IFF-NORECOVERY), which would be an instance of E993-EXISTS-COUNTEREXAMPLE (OPEN; hypothetical,
no status transfer); the plateau Delta_p(T - v) = 0 is not a unimodality violation. Consequently no first-descent inequality
alone (for example x(T - v) <= x(T) + 1) proves "F_p(T) is the whole leaf set": that needs strict descent of every
leaf-deleted tree at every rank from x(T - v) through p on the lower-region window. The selector therefore stays explicit
in every (HALL) statement. Bounded record (bounded_computation; never proof): on every free tree of orders 2-16 (A000055
counts asserted) and every leaf, x(T - v) - x(T) is 0 or -1, never positive (orders 4-14: 21,997 / 14,169; CF6-F3, SR-C2-4;
C-F2-T, orders <= 14, maximum 0; C-F2-U, rooted trees to order 16 with multiplicity); every leaf is favorable on every
eligible row at orders 11-16 (515 rows to order 14, 3,806 to order 16; SR-C2-4, CF6-F3, C-F2-T), with strict descent of
T - v at every rank from x(T - v) through p on each; and on the 588 isomorphism-class rows (orders 11-37) of F2's gadget
family (favorability only; F2, C-F2-T/C-F2-U dedup, F adjudicator). The shift record's lower half is bounded evidence for
E993-THEOREM-B (OPEN) and moves nothing.
```

**CONDITIONAL record for `T(m, 2)` (a record in the (HALL) scope note, not a key).**

```text
[r30 C2; SR-C2-4] T(m, k): path c_1-d_1-c_2-...-d_{m-1}-c_m-f-s, a leaf e_i on c_i (i < m), k leaves l_1..l_k on s; n = 3m+k;
A = {c_1, ..., c_m, l_1, l_2}, p = m+2 (k = 2).
Proved (proved_informal): alpha(T(m, k)) = 2m + k - 1 for m, k >= 1 (matching {e_i c_i, c_m f, s l_1}, cover {c_i} u {s});
3(m+2) < 2*alpha(T(m,2)) + 1 iff m >= 4; T(m, 2) - l_1 is isomorphic to T(m, 1) (identical edge set after renaming l_2 -> l_1);
for every m >= 2, A is the unique independent (m+2)-set of T(m, 2) with no in-arc of (D) union (S), and
w_F(A) = |{l_1, l_2} intersect F_{m+2}(T(m, 2))|, which is 0 or 2 (swap automorphism), so the gap
sum_{I_p} w_F - sum_{N(I_{p+1})} w_F equals w_F(A).
Conditional (grade: conditional): IF (P1) x(T(m, 2)) <= m and (P2) Delta_{m+2}(T(m, 1)) < 0 for every m >= 4, THEN for every
m >= 4 the row (T(m, 2), m+2) is eligible, l_1, l_2 are in F, and the gap is exactly 2, i.e. (HALL-COND) at X = I_{p+1}
reads S(T(m, 2), m+2) <= -2.
Premises bounded only (bounded_computation): (P1) holds for 3 <= m <= 400 (C-F2-U; SR-C2-4; F2 to 304; F adjudicator
4..80 plus spot values), with x(T(m, 2)) = m exactly for 3 <= m <= 18 (in particular on the eligible range 4 <= m <= 18:
zero slack) and x(T(m, 2)) < m for 19 <= m <= 400 (x(T(19,2)) = 18, x(T(304,2)) = 288, x(T(400,2)) = 379); (P2) holds for
2 <= m <= 400 (C-F2-U; SR-C2-4; F2 to 304). Bounded rows: T(4,2)/6, T(5,2)/7, T(6,2)/8 with supply/capacity/S 202/454/-252,
1173/2267/-1094, 6350/11155/-4805, gap 2, saturating with deletion arcs alone.
Attribution: r30 Cycle 1 C-F2-U (construction of T(m, k)); r30 Cycle 2 F2 (alpha, upper bound, bounded ranges); C-F2-T and
C-F2-U (uniqueness, isomorphism, conditional gap); F adjudicator; SR-C2-4.
Fences: not a key until (P1) and (P2) are proved for every m >= 4 and a predicate-form key is named after an isolated second
read; moves no status; an unreachable target refutes nothing.
```

**Lemma U (no new key; a record of re-derivation under P10).**

```text
[r30 C2; SR-C2-4] Lemma U (C-F2-U; C-F2-T F-7) is P10 (SR-REACH SR-11) by negation, on every finite simple graph and every
p >= 0: A in I_p has an in-arc of (D) union (S) iff A is not maximal or some u in A has two non-adjacent neighbours whose only
neighbour in A is u. No separate key or grade; the non-adjacency clause is load-bearing off trees (bounded: 25,670 of
578,153 targets over all labelled graphs with n <= 6 are mis-predicted without it; 0 with it).
```

## Verdicts

verdict[SR-C2-4a]: confirmed_with_repairs
verdict[SR-C2-4b]: confirmed_with_repairs
verdict[SR-C2-4c]: confirmed_with_repairs
verdict[SR-C2-4d]: confirmed_with_repairs

- **The mathematics is confirmed without change.** That covers `α`, the closed forms, the strict descent at rank `k+1` for
  `k ≥ 2`, exact eligibility, Lemma F, Lemma U = P10, the uniqueness of `A_k`, `w_F(A_k) = 2`, the gap 2, and the selector
  dichotomy.
- **The strongest repair is the key name (4d).** As proposed it asserts eligibility for every `k` and is false at
  `k = 0, 1, 2`. Register it as `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO`.
- **The other repairs:**
  - the cleared ℕ-safe identity `8·Δ_{k+1} = −2^k(k²+3k−8)`;
  - Lemma U recorded as P10, not as a new lemma;
  - the gap stated as "(HALL-COND) at `X = I_{p+1}` ⇔ `S(G_k, k+3) ≤ −2`";
  - the shift clause detached from F2's 588 rows;
  - the family's Cycle 1 origin (C-F2-T) added to the attribution.

## Artifact inventory

- **Scratch root:** `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-sr-SR-C2-4/`.
  Standard library only, exact integers, run with `python3 -B`, and no `__pycache__` written.
- **Replay:** `cd` there and run
  `python3 -B sr4_gk.py; python3 -B sr4_lemmaU.py; python3 -B sr4_selector.py 16; python3 -B sr4_tm2.py 400`.
  The runs take about 1 s, 3 s, 13 s and 52 s. Every JSON is deterministic (no wall-clock or host fields), and the selector
  output was re-generated byte-identically after a cosmetic script edit.

| file | SHA-256 | role |
|---|---|---|
| `sr4_lib.py` | `25e44e1245768a2de3b7b85d979c38e90688f64c65da60ad60a7c62265f18be5` | instrument: tree test, forest DP, `x` through `α`, `F_p`, `S` via `H_v`/`R_v`, bitmask layers, literal `w_F`, literal (D) ∪ (S), Lemma U predicate, Dinic, WID-asserting network row, `G_k`/`T(m,k)` builders |
| `sr4_gk.py` | `92759d6b41c150072463ed0b4481f9df8a3b4f93536df85e7182557779af4532` | `α` (matching/cover), closed forms (`k ≤ 60`), cleared descent identity, eligibility, Lemma F ingredients, Lemma U on `G_1..G_6`, rows `G_3/6`, `G_4/7`, `G_5/8` |
| `SR4-GK.json` | `f217a6642938b7dedf4fffd11fdfc5d43fb95084092e468dacc863dc80881380` | output |
| `sr4_lemmaU.py` | `38458e6708ca99aee57e808fc383a84a7b24751160c0ceff3b290880f1cbe1f8` | Lemma U on all labelled graphs, `n ≤ 6`, every `p` (general and tree-form readings) |
| `SR4-LEMMAU.json` | `726bf6be17c1221ef3d0ad532311c0bdefc40fefc2f94866a1eb8fc68a6f6a5e` | output (578,153 targets; 0 / 25,670 mismatches) |
| `sr4_selector.py` | `b6864a58c169efc35621d396535e473138be415679592f19816f604bbaf55887` | free trees, orders 2–16 (A000055-asserted): shifts, eligible-row favorability, descent persistence |
| `SR4-SELECTOR.json` | `9e7ad164086995ba2cab1ea72c78f0e6821789a818ed65643b03502b8b30fc73` | output |
| `sr4_tm2.py` | `0ba981f02e8283ff2e9006b6371bc23eaf921708d19c1322baeb02a5917a4554` | `T(m,2)`: `α`, isomorphism, (P1)/(P2) to `m = 400`, eligibility, Lemma U on `m = 2..6`, rows `T(4..6,2)` |
| `SR4-TM2.json` | `e0a1fc32394b09046a95bc727b9d4faf342d2dac7068e43bdefa60aa4269c2b0` | output |

- **Deliverable:** `second-reads/SR-C2-4/SECOND-READ.md` (this file only).
- **Not produced or done:**
  - no sealed member was edited;
  - no background job was started;
  - no network, install or Lean was used;
  - nothing was written outside this file and the scratch root, except the transient copy named in Disclosure 3, which is
    deleted.
