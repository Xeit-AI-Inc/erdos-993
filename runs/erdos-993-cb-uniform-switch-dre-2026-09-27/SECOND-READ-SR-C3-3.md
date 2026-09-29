# Second Read

Isolated second read `SR-C3-3`, r31 Cycle 3 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`; Erdős #993, CB(8,m) at
`p* = (16m+4)/3`, class `m ≥ 107`, `m ≡ 2 (mod 3)`). Subject: the literal E1 function on `cbGraph m`, the exact weight formula,
and the iff statements behind the Tier 1 status map. Written 2026-09-28, 07:00–07:35 EDT by the clock.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I read the startup protocol through line 150, which covers the boot
sequence and steps 1–7. Subsystems loaded: those two files only. I did not follow the task-type map into memory, logs, skills,
decisions, operations or conversations. The controller owns conversation logging for this run, and I wrote no conversation log.

## Identity and seal audit

**Governing files, checked before reading.**

| Object | Recomputed SHA-256 | Status |
|---|---|---|
| Protocol `control/C3-SECOND-READ-PROTOCOL.md` | `1eb6aa33f05fef770cbd571e1f39fa5ea9a5329e4c5f05dd5d961764c40753cc` | MATCH (dispatch value) |
| Brief `control/C3-SECOND-READ-BRIEF-SR-C3-3.md` | `09d052337fb39a52ee6fc24aa631d8d77dd4206953fae1366a9debe52f191e7e` | MATCH (dispatch value) |
| **Capsule seal** of `control/c3-second-read/SR-C3-3-PACKET-MANIFEST.json`: SHA-256 of compact, key-sorted JSON of the manifest minus `seal_sha256`, separators `(",",":")`, no trailing newline | **`66027245841a69769311ac35b029b0e4fa72d2eedec6c615d7a5f86e1fb0d8dd`** | MATCH (the manifest's own field and the dispatch value; identical with and without `ensure_ascii`) |
| Manifest file SHA-256 | `dcc4ffaab3c11a08f199fca91f42d426bdcddf72b01e4c36dbc064ddb4eab4fb` | recorded |
| All 543 listed members (bytes and SHA-256) | recomputed | **543/543 MATCH**, 0 missing |

**Frozen-source digest indexes.**
- Every capsule member that also appears in a `SOURCE-DIGESTS.json` equals that index's value:
  - `sources/c3-stage7-sources/`: 215/215;
  - `sources/c1-results/`: 230/230;
  - `sources/`: 65/65;
  - `sources/concurrent/`: 1/1.
- Mismatches: 0.
- I checked each frozen instrument I read against its index before reading it.
- I also byte-compared copies that should be identical, and each pair matched:
  - the adjudicator's `CritU1T.lean`, `CritU1F.lean`, `MergeU1T.lean`, `CritU2T.lean`, `CritU2F.lean`, `CritU3T.lean` and
    `CritU3F.lean` against the critics' files;
  - `critic_tail.lean` as the exact tail of `CriticU3T.lean`.

**Registries.**
- The run-local snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c3-stage2.json` has 497 claims, as the brief says.
- The frozen master `sources/authority/CLAIM-IDENTITY.json` has 491.
- The concurrent master `sources/concurrent/master-510-2026-09-28/CLAIM-IDENTITY.json` has 510.
- I did not use the lexical pre-screen `control/C1-CONTROLLER-ALIAS-PRESCREEN.json`. It is not a capsule member, and it is not my
  verdict.

**Read-boundary and process disclosures.**
1. The harness put the project `CLAUDE.md`, the user memory index and the user's e-mail into my context before my first tool call. I
   did not open them or act on them. The brief's single-file write rule supersedes the logging instruction in `CLAUDE.md`.
2. **Display artifacts.**
   - Two early shell calls used an `echo =====` separator, and zsh `=`-expansion made them exit 1. The effect was cosmetic: both
     files were displayed, and I re-displayed the brief on its own.
   - The tool display truncated the middle of `verity.md`, and I re-read that section with `sed`.
   - One display of the brief plus the manifest exceeded the inline limit. The harness saved it to its own tool-output cache outside
     the run root. I did not open that cached copy; I parsed the manifest with Python from the run root instead.
3. **Searches and listings.** Every `grep`/`sed` named a single capsule file:
   - `SYNTHESIS.md`;
   - U1's `Main.lean`;
   - C-U1-T's `Merge.lean`;
   - U3's merged `Main.lean`;
   - `CriticU3T.lean`;
   - `CriticU2F.lean`.

   I ran no `find`, `rg`, `ls -R` or glob `cat`, and no directory listing outside my own scratch. The only listing was one `ls -1` of
   `scratchpad/c3-sr-SR-C3-3/`. I ran one `mkdir -p` for the scratch directory and one for `second-reads/SR-C3-3/`.
4. **What I did not read.** No sibling second read, no file outside the capsule, no `sources/c2-stage7-sources/` file (not a capsule
   member), and no Mathlib source.
5. **No execution outside Python.** No network, no installs, no `lake`/`lean` (the brief forbids them), no child agents. Python ran
   standard library only, with `python3 -B`, exact integers and `Fraction`, in the foreground.
6. **No background jobs.** None was started, none was running at the final write, and nothing was killed.

## Statements read

Statement of record: `cycles/cycle-3/stage6/SYNTHESIS.md`:
- `## Exact established results`: Y-6, Y-9 and R-8;
- `## Registrations`: G-2 (Y-6 part), G-3 (weight-formula part), G-4 (status map and reserved name);
- `## Refuted or narrowed mechanisms`, `## Reconciliation` R-9 and R-10.

Origins read:
- U2's return and `E1FlowConstruction.lean`, and U2's carried `Main.lean`: entries 1–26 and the definitions of record.
- C-U2-T and C-U2-F, with their Lean files.
- U3's return, and entries 580, 582, 606, 607 and 608 of U3's merged `Main.lean`.
- C-U3-T and C-U3-F, with `CriticU3T.lean` and C-U3-F's `rebuild/LeanProof/Critic.lean`.
- U1's `Main.lean`: its three rational-flow declarations.
- C-U1-T and C-U1-F, with `Critic.lean`, `CriticF.lean` and the `cb8_topRank_of_ratFlow` block of `Merge.lean`.
- The U adjudication; the adjudicator's `AdjU3.lean` and `AdjU3T.lean`; the recorded compile logs of the critics and the adjudicator.
- The contracts, `C3-STAGE6-CONTROLLER-FACTS.json` and `C3-STAGE5-CONTROLLER-FACTS-U.json`. I read these as facts, never authority.

- **SR-C3-3a (the literal E1 function; Y-6; G-2 in part).** At `p*`, with `F = favorableLeaves (cbGraph m) p*`, U2's
  `cb8E1Arc m p* F` on `cbGraph m`:
  - is exactly the explicit arc values: tag deletion `g_α/S_α`, closed-leg/arm deletion `w·h_α/(ℓ·S_α)`, choke deletion 0;
  - its guards (`j ≥ 1`) and Lean's `x/0 = 0` are harmless on the class;
  - it satisfies clauses (1) nonnegativity, (3) rows and (4) columns on the class.

  Clauses (2) and (5) are compiled. `hZeroChoke` holds outright (both U2 critics).
- **SR-C3-3b (the exact weight formula and entry 608; Y-9, R-8; G-3 in part).** The formula is
  `w(B) = [v, r ∈ B] + Σ_i [u_i ∈ B]·#{j : c_ij ∈ B}`. Entry 608 is `cb8_activeWeight_leafSet_zero_iff`: for `0 < m` and any
  `B`, `w_leafSet(B) = 0 ↔ ¬(v ∈ B ∧ r ∈ B) ∧ ∀ i < m, u_i ∈ B → ∀ j < 8, c_ij ∉ B`.
- **SR-C3-3c (the iff statements for G-4).** Three things:
  - U1's hypothesis ⟺ conjunct 4 (C-U1-T, C-U1-F);
  - U3's entry 607 is `rfl`-equal to C2-LA1's `AdjU.cb8_topRank_of_flow`;
  - C-U3-F's terminal from weighted Hall at `leafSet`.

  The status map for the Tier 1 key's scope note: conjunct 4 is the only open formal node; the five rational-flow interfaces are
  equivalent to it, not reductions; and the reserved-name rule R31-N-22.

## Independent re-derivation

Notation, following the criterion key:
- `q := |B ∩ {u_1..u_m}|`, `a := 8q − 1`, `b := 8(m − q) + 1`, `j := p* − q`;
- `N(α,k) := C(a,α)C(b,k−α)2^{k−α}`, zero outside `0 ≤ α ≤ a`, `0 ≤ k−α ≤ b`;
- `S_α := N(α,j)`, `T_α := N(α,j−1)`, `r(k) := Σ_α N(α,k)`, `ρ := r(j)/r(j−1)`;
- `G_α := ρ·Σ_{t<α}T_t − Σ_{t<α}S_t` and `H_α := Σ_{t≤α}S_t − ρ·Σ_{t<α}T_t`.

These are U2's `cb8N`, `cb8G` and `cb8H` verbatim.

**SR-C3-3a.**

**1. The definition, read against the record.** For `B ∈ I_{p+1}` with `r ∉ B`, and `z ∈ B`, U2's `cb8E1Val m p F B z` is:
- 0 if `w = 0`, `q = 0` or `z` is a choke;
- `G_α / N(α,j)` if `z ∈ F` and `(B ∖ {z})` meets `tagWitnesses z`;
- `w·H_α / ((j−α)·N(α,j))` otherwise.

Here `α = w − 1` and `j = (p:ℤ) − q`. `cb8E1Arc` sums this over `B ∖ A`, under the guard `B ∈ I_{p+1} ∧ r ∉ B ∧ A ⊆ B ∧ |B∖A| = 1`,
and is 0 otherwise.

The Boolean test is literally the filter predicate of `activeWeight`, entry 16. With `W_{c_ij} = {u_i}` and `W_v = {r}` (C1-LA2
entries 69–70), the tests read as follows for `r ∉ B`:
- a `z` passes the Boolean test exactly when it is a present private leaf at a present choke;
- `v` fails the test, because its witness `r` is absent;
- a `c_ij` at a closed choke fails it, and so does every non-leaf.

So the three branches are exactly the three rows of the explicit table of the criterion key's `[r31 C2; SR-C2-2]` note:
- **tag deletion:** `g_α/S_α`;
- **deletion of any other non-choke vertex:** `w·h_α/((j−α)·S_α)`;
- **choke deletion:** 0.

One notation point: the brief's `ℓ` is the source-side count `j − α`, not the target-side `ℓ' = j − 1 − α` of Y-1.

**2. Literal counts on `cbGraph m`.** I derived these from `cbEdge`, with `F ⊇ C`.
- **(B1)** An `r`-free `B ∈ I_{p+1}` consists of three kinds of vertex:
  - its `q` chokes;
  - its `w` active tags;
  - `ℓ := p + 1 − q − w = j − α` further vertices. These are `b_ij` or `c_ij` at chokes not in `B` (at most one per leg, since
    `b_ij ~ c_ij`), and `s` or `v` (at most one, since `s ~ v`). No `b_ij` at an open choke can be present, because `b_ij ~ u_i`.

  Hence `α ≤ 8q − 1 = a` and `0 ≤ ℓ ≤ 8(m − q) + 1 = b`, so `S_α > 0`.
- **(B2)** An `r`-free `A ∈ I_p` with `q ≥ 1` and `w_F(A) = α + 1` has these independent insertions `z`, with `z ≠ r`:
  - `8q − w = a − α` absent private leaves at present chokes;
  - `2(b − ℓ')` vertices in empty closed legs or an empty arm, where `ℓ' = p − q − w = j − 1 − α`. Each empty leg admits `b_ij`
    (its neighbour `u_i` is absent) or `c_ij`; the empty arm admits `s` (since `r, v ∉ A`) or `v`;
  - chokes `u_k` at closed chokes with no `b_kj` present. These have value 0.
- **(B3)** A non-choke insertion keeps `q`. It raises `w` by one exactly for the first kind: an inserted leg `c_kj` at a closed choke
  has an absent witness `u_k`, and an inserted `v` has an absent witness `r`.

**3. Algebra.**
- **Rows.** `G_α + H_α = S_α` by definition, so `B` sends `w·G_α/S_α + ℓ·w·H_α/(ℓ·S_α) = w` whenever `ℓ ≥ 1`. If `ℓ = 0`, then
  `α = j` and the ternary branch is never evaluated. Out then needs `H_j = 0`: we have `H_j = r(j) − ρ·r(j−1) = 0`, because
  `S_t = 0` for `t > j` and `T_t = 0` for `t ≥ j`. This uses the expansion `r(k) = [y^k](1+y)^a(1+2y)^b`, the Cauchy product,
  which identifies `cb8R` with the type totals, together with `r(j−1) > 0`.
- **Columns.** From `(α+1)S_{α+1} = (a−α)T_α` and `(j−α)S_α = 2(b−ℓ')T_α` (binomial absorption), the inflow is
  `(a−α)G_{α+1}/S_{α+1} + 2(b−ℓ')(α+1)H_α/((j−α)S_α) = (α+1)(G_{α+1}+H_α)/T_α = (α+1)ρ`, since `G_{α+1} + H_α = ρT_α`.
  - In the degenerate cases the vanishing counts kill the undefined terms: `a = α` gives a `(a−α)` factor of 0, and `b = ℓ'` gives
    `H_α = 0`.
  - For `w_F(A) = 0`, every Boolean insertion lands on a type-0 source with value `G_0/S_0 = 0`, and every other insertion carries
    0. So In `= 0 = ρ·0`.
  - `T_α > 0` for every realized target type (`α ≤ a`, `0 ≤ ℓ' ≤ b`).
- **Signs.** These need no condition (i). For `α ≤ α'`, `S_α/T_α = 2(b − j + 1 + α)/(j − α)` is nondecreasing on the joint
  support. `T`'s support lies at most one step left of `S`'s, so in extended form the increments `ρT_t − S_t` change sign at most
  once, from + to −. They sum to 0 by the expansion, so every prefix `G_α ≥ 0`.
  - Similarly `S_t/T_{t−1} = (a−t+1)/t` is nonincreasing, so the increments `S_t − ρT_{t−1}` of `H` change sign once, from + to −,
    and sum to 0. So `H_α ≥ 0`.
  - No Darroch, no Newton and no real-rootedness enter. This is C-U2-F's single-crossing argument. The criterion key's
    `[r30 C4; SR-C4-6]` note gives the same two inequalities by pairwise log-concavity.
- **Target-side zeros (clause (5)).** If `r ∈ A`, every `B ⊇ A` contains `r`, and the guard fires. If `q(A) = 0`, a nonzero arc
  would need a non-choke `z`, which leaves `q(B) = 0` and fires the `q = 0` branch.

**4. Lean conventions on the class.**
- `p* − q ≥ p* − m = (13m+4)/3 ≥ 465`, and `j − 1 ≤ p* − 2 < 8m = a + b`. So `r(j−1) > 0` (entry 14's positivity), and `cb8Rho`
  never divides by 0.
- The ℤ index `(p:ℤ) − q` equals the cast ℕ subtraction `((p* − q : ℕ) : ℤ)` of clause (4), because `q ≤ m < p*`.
- The ℕ subtractions `8q − 1`, `m − q` and `w − 1` are evaluated only on the nonzero branch, where `q ≥ 1`, `q ≤ m` (a filter
  over `range m`) and `w ≥ 1`.
- `cb8N`'s guard is the zero extension.
- The Boolean denominator `S_α` is positive at every realized source type.
- The ternary denominator `(j−α)S_α` vanishes only when `ℓ = 0`, and then no arc evaluates it.
- So `x/0 = 0` is never used on an arc of the class.

`F = favorableLeaves (cbGraph m) p* = leafSet (cbGraph m)` is the C2-LA3 terminal, formal at graph level.

**5. Instruments (my own; bounded; never proof).**
- **`sr3_literal.py`.** This transcribes U2's function under Lean conventions: `cb8R` by explicit polynomial multiplication (not the
  `N`-sum), guarded `cb8N`, `x/0 = 0`, and truncated ℕ. A separate code path computes the contract's explicit table: `ρ` as a ratio
  of type totals, `w` from the exact formula, and branches from labels.
  - **Trees and ranks.** Literal `CB(8,1)` at every rank; `CB(8,2)` at ranks 0–4, 17 and 18; `CB(2,1..3)`, `CB(3,2)`, `CB(3,3)`
    and `CB(4,2)` at every rank. That is 71 (tree, rank) pairs.
  - **Enumeration.** Every independent set was enumerated, and each layer count matched a forest DP.
  - **Fidelity first.** (WID) `supply − capacity = Σ_{v∈F}[Δ_{p−1}(T−H_v) − Δ_{p−1}(T−R_v)]` was asserted from independent sides at
    all 71 pairs, for `F = leafSet` and for the derived strict selector `F_p` (index `i_{p+1}(T−v) < i_p(T−v)`, ruling 16).
  - **Results with `F = leafSet`:**

    | Check | Result |
    |---|---|
    | Arcs equal to the independent table | 2,580,830, **0 mismatches** |
    | Negative arcs | **0** |
    | Support (clause 2) violations | **0** |
    | Out exact | 462,572 sources |
    | Out failures | **138, every one at `j = p − q = 0`** (the source of `p` chokes plus one tag; X-8 is undefined there) |
    | In exact | 104,780 targets, 0 failures |
    | Clause (5) zero | 1,007,542 targets, 0 failures |
    | `hZeroChoke` | 345,166 sources, 0 failures |

  - **Derived-selector controls.** These are trivial on these small trees: `F_p = ∅` or `{v}`.
- **`sr3_control_F.py`.** This is a synthetic control with `F = leafSet ∖ {c_00}`, which is not a registered object. On `CB(8,1)`,
  `CB(2,2)` and `CB(3,2)`, Out fails at `j ≥ 1` and In fails. So `F ⊇ C`, supplied at `p*` by C2-LA3, is load-bearing, as C-U2-T
  A3 said.
- **`sr3_classrows.py`.** Rows 107 and 110 are controls; 137, 146 and 152 are fresh for this read (the Cycle 4 gate rows named by the
  synthesis). Everything is at `p*`.
  - **Part A**, at every `q ∈ [1,m]`:
    - `r_q(j)` and `r_q(j−1)` were computed three ways: the type sum; the `(1+y)+y` expansion; and explicit polynomial products at
      `q ∈ {1, m/2, m}`. 0 mismatches.
    - `ρ_q < 1`, and `argmax_q ρ_q = 1`.
    - `j_min = (13m+4)/3`: 465, 478, 595, 634, 660.
    - `G_α, H_α ≥ 0` for every `α ∈ [0, 8q]`, and `G + H = S`.
    - Out exact at 166,308 realizable source types, 267 of them with `ℓ = 0`.
    - In exact at 166,448 realizable target types, with the literal counts `a − α` and `2(b − ℓ')`.
    - 0 failures.
  - **Part B**, on the literal `cbGraph m`:
    - I sampled 300 `r`-free targets of size `p*` and 300 sources of size `p* + 1`, including `q = 1`, `q = m`, `w = 0` and `ℓ = 0`
      extremes.
    - Independence and weights were computed from the literal adjacency. The incremental weight was cross-checked against the full
      Lean `activeWeight` on the first 400 insertions of each row.
    - Every up-cover and down-cover was enumerated literally.
    - Result: In `= ρ_q·w` exact, Out `= w` exact, and the per-class counts exact. 0 failures.
- **Fixed points.**
  - `ρ_1(CB(8,95)/508) = 1354839571516225/1361543988640524`, which matches §5.
  - `CB(8,107)`: `n = 1822`, `p* = 572`, `9m + 1 = 964`.
  - `ρ_1(107) = 5150844596024699/5173467627355748`, which equals the synthesis value. It is confirmed, not of record.

**SR-C3-3b.**

**Proof of the formula.** For `m ≥ 1`, `leafSet(cbGraph m) = {v} ∪ C`:
- `r` has degree `m + 1 ≥ 2`;
- `s` and each `b_ij` have degree 2;
- each `u_i` has degree 9;
- `v` and each `c_ij` have degree 1.

This is C1-LA2 entry 60.

The original support of `v` is `s`, with `N(s) = {r, v}`. The original support of `c_ij` is `b_ij`, with `N(b_ij) = {u_i, c_ij}`. So
`W_v = {r}` and `W_{c_ij} = {u_i}` (entries 69 and 70).

`activeWeight` counts `t ∈ F ∩ B` with `(B ∖ {t}) ∩ W_t ≠ ∅`. This is equivalent to `B ∩ W_t ≠ ∅`, because `t ∉ W_t`. Each tag is
its own vertex. Hence, for every finset `B`:

`w_leafSet(B) = [v ∈ B ∧ r ∈ B] + Σ_{i<m} [u_i ∈ B]·#{j < 8 : c_ij ∈ B}`

The general form for `F ⊆ leafSet` is:

`w_F(B) = [v ∈ F][v, r ∈ B] + Σ_i [u_i ∈ B]·#{j : c_ij ∈ B ∩ F}`

Entry 608 is the zero case: a sum of nonnegative terms vanishes iff each term does. The Lean text of 608 matches this reading
label by label: `cbVertex m 2 = v`, `0 = r`, `3+17i = u_i`, `3+17i+2+2j = c_ij`. Its proof uses exactly entries 60, 69 and 70, and
reads soundly.

**The `0 < m` hypothesis.** It is load-bearing for the formula, not for 608's truth:
- at `m = 0`, `r` is a leaf with witness `v`, and `w({r, v}) = 2`, so the formula fails;
- 608's iff still holds at `m = 0`;
- 608 needs `0 < m` only because its proof route goes through entry 60.

**Instrument (`sr3_weight.py`).** This compares the literal Lean `activeWeight` at `leafSet` with the formula and with 608's right
side, on **arbitrary** finsets:

| Tree | Finsets checked | How |
|---|---|---|
| `CB(8,1)` | all 1,048,576 | exhaustive |
| `CB(2,1)`, `CB(2,2)`, `CB(3,2)`, `CB(2,3)`, `CB(4,2)` | every finset | exhaustive, generic-`d` analogue |
| `CB(8,2)`, `CB(8,3)`, `CB(8,5)`, `CB(8,107)`, `CB(8,152)` | 356,000 in total | random |

- Across 3,903,392 finsets with `m ≥ 1`: **0 formula mismatches and 0 iff mismatches.**
- Control `m = 0`: the formula fails on 2 of 8 finsets, and the iff holds on 8 of 8.

The U adjudicator's claim that the formula subsumes 608, both `hZeroChoke` versions, "sector members have weight 1" and "switch images
have weight γ" is correct. Each of these is a direct corollary.

**SR-C3-3c.**

I did not run Lean (the brief forbids it). I re-read every statement and proof term below. I checked by hand that each proof is a
valid argument and that each statement means what the status map says. The compile records I cite are the critics' and the U
adjudicator's own logs, which are frozen capsule members. They report exit 0 and axioms `[propext, Classical.choice, Quot.sound]`.
They are seat records, not my evidence.

1. **U1's hypothesis ⟺ conjunct 4.**
   - **The generic lemma.** C-U1-T's `ratFlow_iff_saturatingFlow` (generic `G`, `F`, `p`) states: (∃ `g : Finset V → Finset V → ℚ`
     with `0 ≤ g`, positive only on `(I_{p+1} × I_p) ∩ transportRel`, `Σ_A g B A = w(B)` over `univ` on `I_{p+1}`, and
     `Σ_B g B A ≤ w(A)` over `univ` on `I_p`) ⟺ `∃ f, IsSaturatingFlow G F p f`. This bundle is exactly U1's
     `cb8_conjunct4_of_ratFlow` hypothesis.
     - Forward: C-U1-T's `ratHall_ge`, then r30's `exists_saturatingFlow_of_weightedHall`.
     - Backward: cast `f` to ℚ and move the layer sums to `univ` by the support clause. The proof reads correctly.
   - **The CB instance.** C-U1-F's `critic_cb8_ratFlow_iff_conjunct4 (m)` is the same iff at `cbGraph m`, `p*`,
     `favorableLeaves (cbGraph m) p*`. Its converse is `critic_ratFlow_of_saturatingFlow`. Its statement has no class hypothesis,
     which is correct, because the lemma is generic.
   - **Confirmed:** an interface, not a reduction.
2. **U3's entry 607 ≡ C2-LA1's face companion.** I compared entry 607 with merged entry 580, `AdjU.cb8_topRank_of_flow`.
   - Binders: `(m) (hm : 107 ≤ m) (hmod/hres : m % 3 = 2) (hH : ∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m)
     ((16*m+4)/3)) ((16*m+4)/3) f)`.
   - The binder names differ (`hmod` vs `hres`) and the proof terms differ (`.2.2.1` of the C2-LA1 terminal vs
     `AdjU.cb8_crossingIndex_add_two_le`). The statements are otherwise token-identical.
   - The printed `#check` types in C-U3-T's `axioms.log`, C-U3-F's `critic.log` and the adjudicator's `u3/lean.log` are identical.
   - Three `example : @cb8_topRank_eligible_and_weightedHall = @AdjU.cb8_topRank_of_flow := rfl` witnesses are recorded as compiled.
     By proof irrelevance, that `rfl` succeeds exactly when the two types are definitionally equal. **Confirmed.**
3. **C-U3-F's terminal from weighted Hall at `leafSet`.**
   - **(C)** `terminal_of_leafSet_weightedHall (m) (107 ≤ m) (m % 3 = 2) (hW : WeightedHall (cbGraph m) (leafSet (cbGraph m)) p*)`
     ⇒ the four-conjunct body. The proof has three steps:
     - rewrite `favorableLeaves = leafSet` (C2-LA3, entry 606);
     - apply r30's Hall⇒flow companion (carried byte-identically; the Snippet digest is recorded);
     - apply entry 607.

     It is an implication, and it is sound.
   - **(D)** is the same with an integral flow at `leafSet`.
   - **(B)** `terminal_iff_conjunct4` is sound.
   - **The converse of (C)** is C-U3-T's `critU3T_cb8_conjunct4_iff_weightedHall_leafSet`, compiled. Its proof is the C2-LA3 rewrite
     plus r30's `weightedHall_iff_exists_saturatingFlow`. So (C)'s hypothesis is equivalent to conjunct 4.
   - **Finding.** (B), (C) and (D) all call entry 607 by its reserved name. Once 607 is dropped (R-10), they no longer elaborate. They
     must be re-pointed to `AdjU.cb8_topRank_of_flow`, which is a one-token change because the two are `rfl`-identical.
4. **The five interfaces, and which direction is compiled.**
   - **(i) Cycle 2 U2 `weightedHall_of_ratFlow_bound`** (Out-`≥`, layer sums, support `¬transportRel ⇒ 0`).
     - I read it only in C-U1-F's reproduction, which C-U1-F declares verbatim. The Cycle 2 source is not in my capsule.
     - Forward direction compiled.
   - **(ii) U1's `weightedHall_of_ratFlow`** (Out-`=`).
     - Compiled iff (item 1).
   - **(iii) C-U1-T CA-2 `cb8_topRank_of_ratFlow`** (Out-`≥`, derived selector, conjunct 2 discharged from the C2-LA1 terminal). I read
     the statement and proof in `Merge.lean`.
     - Forward direction compiled.
   - **(iv) C-U3-T CA-2 `critU3T_cb8_topRank_of_ratFlow_leafSet`** (Out-`≥`, `leafSet`; `hnn` and `hsupp` restricted to layers).
     - Forward direction compiled.
   - **(v) C-U3-F (C)/(D).**
     - Equivalent through C-U3-T CA-1, which is a compiled iff.

   For the three Out-`≥` forms (i), (iii) and (iv), the converse is conjunct 4 ⇒ bundle. It is the ℕ→ℚ cast of a saturating flow: a
   row equality is a row `≥`, and the support clause gives `¬transportRel ⇒ 0`. This is immediate, and it is compiled for the
   equality form (C-U1-F `critic_ratFlow_of_saturatingFlow`). It is **not** compiled as a stated iff for the Out-`≥` forms. So
   "equivalent by compiled iff lemmas" (R-9) is exact for (ii), for (v) and for terminal ⇔ conjunct 4. For (i), (iii) and (iv) it is
   exact only as compiled-forward plus a one-line converse. The substance ("interfaces, not reductions") stands.
5. **Status map.**
   - Conjuncts 1–3 are formally verified: the C2-LA1 terminal (merged entry 582). It also carries (ELIG-top)(a).
   - Graph-level favorability is formally verified: C2-LA3 (merged entry 606). It is registered as the `[r31 C2; C2-LA3]` clause on
     the favorability key.
   - Conjunct 4 is the only open formal node.
   - The Tier 1 key's current scope still says "the graph-level link for the private leaves is not formally verified". That sentence
     predates C2-LA3's close and must be superseded on the note (Findings, F-6).

**Alias and key audit (`sr3_alias.py`).**
- The three keys the registrations touch exist in the run-local snapshot with exact spelling, status `VERIFIED` and
  `evidence_grade: proved_informal`:
  - the criterion key `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`;
  - the composition key;
  - the Tier 1 key.
- The criterion key is also in both masters with the same status.
- Neither master holds any `E993-R31-` key, so there is no collision and no master key that aliases an r31 key.
- A regex screen of all three registries found **0** hits for each pattern family:
  - E1-arc or literal-E1-function identities;
  - weight-formula or zero-weight identities;
  - rational-flow, conjunct-4 or terminal-conditional identities.
- U3's two proposed names are absent from all three registries.
- No new key name is proposed, by the synthesis or by me.
- The weight formula is distinct from `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`, which is a layer-sum identity on every graph,
  not a per-set formula.
- The criterion key's certificate already cites an **r30** "SR-C3-3". My tags are therefore run-qualified, `[r31 C3; SR-C3-3]`.

## Findings and repairs

- **F-1 (3a, wording; repair).** Y-6 lists clause (5) as "zero on `r ∈ B`, no open choke". In U2's file, clause (5) is **target-side**:
  zero inflow into every `A ∈ I_{p*}` with `r ∈ A` or `q(A) = 0`. The source-side zero on `r ∈ B` belongs to clause (2), through the
  guard. The registration text below states both correctly.
- **F-2 (3a, notation; repair).** In the brief's value `w·h_α/(ℓ·S_α)`, `ℓ` means the source count `j − α`. Y-1 uses `ℓ := j − 1 − α`
  for targets. The registration text writes `(j − α)` explicitly.
- **F-3 (3a, hypotheses made explicit; repair).** Four hypotheses are load-bearing:
  - `j ≥ 1`. It holds on the class as `j ≥ (13m+4)/3 ≥ 465`. At `j = 0` the literal Out fails: 138 of 138 failing sources, off every
    class.
  - `r_q(j−1) > 0`.
  - The expansion `Σ_α N = r_q`, for Out at `ℓ = 0` and for identifying `cb8Rho` with the type ratio.
  - `F ⊇ C`. My synthetic control shows Out and In both fail without it. At `p*` it is supplied formally by C2-LA3.

  "Lean's `x/0 = 0` is harmless" is made precise: no arc of the class evaluates a zero denominator.
- **F-4 (3a).** The two `hZeroChoke` discharges are correct and duplicate each other:
  - C-U2-T `cb_activeWeight_eq_zero_of_no_open_choke` and `cb8_hZeroChoke`, for every `F ⊆ leafSet`;
  - C-U2-F `cb8_activeWeight_eq_zero_of_no_open_choke`, at `favorableLeaves … p` for any `p`.

  Carry one. C-U2-T's is the more general. Both are corollaries of the exact weight formula.
- **F-5 (3b; precision, no repair of the synthesis statement).** `0 < m` is load-bearing for the formula, not for 608's truth. C-U3-T's
  reason "(at `m = 0`, `r` is itself a leaf)" explains the formula; for 608, `hm` is a proof-route hypothesis. On the composition
  key's class, `m ≥ 107`, so the formula holds there as stated.
- **F-6 (3c; repair).** The status-map note must supersede the stale Tier 1 scope sentence "the graph-level link for the private leaves
  is not formally verified". C2-LA3 is formally verified and registered as the `[r31 C2; C2-LA3]` clause.
- **F-7 (3c; narrowed).** R-9's "Every copy is equivalent to conjunct 4 by compiled iff lemmas" is exact for:
  - U1's equality form;
  - Hall at `leafSet`;
  - terminal ⇔ conjunct 4.

  For the three Out-`≥` copies, only the forward direction is compiled; the converse is the one-line cast. The note says so.
- **F-8 (3c; freeze hygiene).** C-U3-F's (B), (C) and (D) reference entry 607 by the reserved name. U3's merged project, the
  recommended carry base, contains 607. Dropping 607 (R-10) breaks those critic declarations. Before any carry, re-point them to
  `AdjU.cb8_topRank_of_flow`, or use C-U3-T's CA-2 and CA-1, which already cite the companion.

  The reserved-name rule is sharpened as follows:
  - any namespace;
  - binders exactly `(m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2)`;
  - type exactly the §2 body;
  - checked by name search before `close`.
- **F-9 (3c; boundary).** I read Cycle 2 U2's `weightedHall_of_ratFlow_bound` only as reproduced in C-U1-F's `CriticF.lean`, whose
  comment says it is verbatim. The Cycle 2 source is not a capsule member, so the verbatim claim is unverified by me. Nothing in the
  status map depends on it beyond naming it as one of the five copies.
- **No cut, no template failure, no refutation.** Fences hold for all three statements:
  - one rank, the class only;
  - no status transfer;
  - no Darroch or Newton;
  - no `θ*` law;
  - no census used as proof;
  - no cutoff `M_0`;
  - no refuted mechanism revived.

## Registration text

The following are for the controller to register verbatim.
- G-2 also carries SR-C3-1's items (Y-1, Y-14). G-3 also carries SR-C3-2's items. G-4 may also carry Lemma HX, which is SR-C3-4's.
- The texts below cover only this read's statements.
- No new key is proposed.

```text
SCOPE NOTE ON: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL
TEXT: [r31 C3; SR-C3-3] Fidelity of the literal Lean arc function (proved_informal; no new key; this key's statement, grade and fences are unchanged). At d = 8, for every integer m >= 107 with m ≡ 2 (mod 3) and the single rank p* = (16m + 4)/3, put F := favorableLeaves (cbGraph m) p*, which equals leafSet (cbGraph m) by the formal graph-level clause [r31 C2; C2-LA3] on E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3, so C ⊆ F. The rational-valued scratch function f := E993Transport.cb8E1Arc m p* F (r31 Cycle 3; compiled, no grade), read with Lean's conventions (truncated ℕ subtraction, the ℤ-indexed coefficient polyCoeffZ, x/0 = 0, the zero-extension guard of cb8N), is exactly the flow written on this key's [r31 C2; SR-C2-2] note: for B ∈ I_{p*+1}(T) with r ∉ B, q := |B ∩ {u_1..u_m}| >= 1, w := w_F(B) >= 1 and z ∈ B, f(B, B ∖ {z}) = g_α/S_α when z is a present private leaf at a choke in B, f(B, B ∖ {z}) = w·h_α/((j − α)·S_α) when z is any other non-choke vertex of B (j − α = p* + 1 − q − w is the number of such vertices, the ℓ of that note), and f(B, B ∖ {z}) = 0 when z is a choke; f(B, A) = 0 on every pair that is not such a deletion (B ∉ I_{p*+1}(T), r ∈ B, or A not of the form B ∖ {z}) and on every r-free source with q = 0 or w = 0. Consequently, on the whole class: (1) f(B, A) >= 0 for all B, A; (2) f(B, A) ≠ 0 implies B ∈ I_{p*+1}(T), A ∈ I_{p*}(T), r ∉ B and A = B ∖ {x} for some x ∈ B; (3) Σ_{A ∈ I_{p*}(T)} f(B, A) = w_F(B) for every B ∈ I_{p*+1}(T) with r ∉ B (both sides vanish when q(B) = 0); (4) Σ_{B ∈ I_{p*+1}(T)} f(B, A) = ρ_q·w_F(A), with ρ_q = cb8Rho(8q − 1, 8(m − q) + 1, p* − q) = r_q(p* − q)/r_q(p* − q − 1), for every A ∈ I_{p*}(T) with r ∉ A and q := q(A) >= 1; (5) Σ_{B ∈ I_{p*+1}(T)} f(B, A) = 0 for every A ∈ I_{p*}(T) with r ∈ A or q(A) = 0 (a target-side clause; the source-side zero on r ∈ B is part of (2)). Lean's conventions are harmless on the class: j := p* − q >= (13m + 4)/3 >= 465 and j − 1 < 8m = a + b, so r_q(j − 1) > 0 and cb8Rho never divides by zero, and the ℤ index p* − q of cb8E1Val equals the cast ℕ subtraction of (4) because q <= m < p*; 8q − 1, m − q and w − 1 are evaluated only where q >= 1, q <= m and w >= 1; at every realized source type cb8N(α, j) = S_α > 0 (α = w − 1 <= 8q − 1 and 0 <= j − α <= 8(m − q) + 1), and the ternary denominator (j − α)·S_α vanishes only for a source with no non-choke inactive vertex, where no arc evaluates it, so x/0 = 0 is never used on an arc. Proof: the proof of this key's [r31 C2; SR-C2-2] note, together with the literal facts on cbGraph m that its clone correspondence encodes: (B1) since W_{c_ij} = {u_i} and W_v = {r}, the vertices of an r-free B are its q chokes, its w active tags (the present c_ij with u_i ∈ B) and j − α others (b_ij or c_ij at chokes not in B, at most one per leg, and at most one of s, v), and the value's branch test is literally activeWeight's filter predicate; (B2) an r-free A ∈ I_{p*}(T) with q >= 1 and w_F(A) = α + 1 has exactly a − α independent insertions of an absent private leaf at a choke in A, exactly 2(b − (j − 1 − α)) independent insertions of b_ij or c_ij at an empty leg of a choke not in A or of s or v at an empty arm, and otherwise only choke insertions (value 0) or r (excluded by the guard); (B3) a non-choke insertion keeps q and raises w by one exactly at the first kind; a target with w_F(A) = 0 receives 0 = ρ_q·0 because g_0 = 0; and the expansion Σ_α N_q(α, k) = [y^k](1 + y)^{8q−1}(1 + 2y)^{8(m−q)+1} (Cauchy product), which makes cb8Rho the ratio of type totals and gives h_j = 0 for Out at j − α = 0. Clause (1) needs only this key's [r30 C4; SR-C4-6] note, or the single-crossing argument (the increments ρ_q·T_α − S_α and S_α − ρ_q·T_{α−1} each change sign at most once, from + to −, and sum to 0); condition (i) is not an input of (1)–(5) and enters only at the capacity step ρ_q <= 1. Boundaries: j >= 1 is load-bearing (at j = 0, i.e. q = p, which never occurs on the class, the literal Out identity fails for f: the source consisting of p chokes and one active tag sends 0); C ⊆ F is load-bearing (with one private leaf removed from F, the literal Out and In identities of f fail on small CB trees). The formal proofs of (1), (3) and (4) for f are open; the compiled pieces — clauses (2) and (5) (U2), the outright discharge of hZeroChoke (r ∉ B and q(B) = 0 imply w_F(B) = 0), made twice (C-U2-T for every F ⊆ leafSet (cbGraph m); C-U2-F at favorableLeaves (cbGraph m) p for every p; both for 0 < m; one is to be carried), and the Out algebra g_α + h_α = S_α (C-U2-T) — are scratch and carry no grade. Grade of this note: proved_informal; no Darroch, no Newton, no asymptotic step, no cutoff M_0, no census value. Scope: this rank and class only, d = 8; nothing is asserted at any other rank, at m ≡ 0 or 1 (mod 3), at m < 107, or for d ≠ 8. Not (HALL) and not a restricted-scope (HALL) theorem: sector families are outside this key; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL and E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE stay OPEN; TREE, FOREST, TRANSFER and Erdős #993 are untouched; no status transfers. Bounded support, not proof: record R31-C3-SR-C3-3-LITERAL-E1-FUNCTION-CHECKS. Attribution: U2 (r31 Cycle 3, Claude Sonnet 5; the literal functions cb8E1Val and cb8E1Arc and the compiled clauses (2) and (5)); C-U2-T and C-U2-F (r31 Cycle 3, Claude Opus 5.5; the fidelity derivations, the j = 0 finding, the two hZeroChoke discharges, the Out algebra, and the decomposition into literal counts and the expansion); the r31 Cycle 3 U adjudicator (Claude Opus 5.5; the replays and the ruling that fidelity of this function is new content); the r31 Cycle 3 synthesis (Claude Opus 5.5); isolated second read SR-C3-3 (r31 Cycle 3, Claude Opus 5.5; own literal and class-row instruments, the target-side reading of (5), the load-bearing j >= 1 and C ⊆ F); the arc values: as on this key's [r31 C2; SR-C2-2] note; this key and its criterion: r30, as registered on this key; the transport network, the active-tag weight, the relation (D) ∪ (S) and (HALL): Codex (GPT-6 Astra/Sol/Luna), the lower-region run. This note changes neither this key's statement, grade nor fences.
```

```text
SCOPE NOTE ON: E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107
TEXT: [r31 C3; SR-C3-3] The exact active-tag weight on CB(8,m), the input of this key's target case split (proved_informal; no new key; this key's statement, hypotheses, grade and fences are unchanged). On this key's class (m >= 107, m ≡ 2 (mod 3)), for EVERY finset B of vertices of cbGraph m (independence not required), with the labels of record r = 0, s = 1, v = 2, u_i = 3 + 17i, b_ij = u_i + 1 + 2j, c_ij = u_i + 2 + 2j (i < m, j < 8): activeWeight (cbGraph m) (leafSet (cbGraph m)) B = [v ∈ B and r ∈ B] + Σ_{i < m} [u_i ∈ B]·#{j < 8 : c_ij ∈ B}; for a tag set F ⊆ leafSet (cbGraph m) the same count reads [v ∈ F][v ∈ B and r ∈ B] + Σ_i [u_i ∈ B]·#{j : c_ij ∈ B ∩ F}. Proof: leafSet (cbGraph m) = {v} ∪ C (r has degree m + 1 >= 2, s and every b_ij degree 2, every u_i degree 9); the original support of v is s with N(s) = {r, v} and that of c_ij is b_ij with N(b_ij) = {u_i, c_ij}, so W_v = {r} and W_{c_ij} = {u_i} (formally verified structure of r31 award C1-LA2); a tag t ∈ F ∩ B counts iff (B ∖ {t}) meets W_t, i.e. iff B meets W_t because t ∉ W_t; distinct leaves are distinct tags. At p*, F_{p*}(T) = leafSet(T) (hypothesis (a); formal at graph level by the [r31 C2; C2-LA3] clause on E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3), so w_{F_{p*}} is given by the formula. Corollaries used by the [r31 C2; SR-C2-3] case split: every sector source and every in-sector target has weight 1; an r-free set has weight equal to the number of its present private leaves at its present chokes, hence weight 0 when it contains no choke; the u_i-switch image of a sector source at state (1, γ) has weight γ; and a set has weight 0 iff not (v ∈ B and r ∈ B) and no present choke has a present private leaf — the compiled scratch declaration E993Transport.cb8_activeWeight_leafSet_zero_iff (U3; 0 < m, arbitrary B; no grade), transported to favorableLeaves (cbGraph m) p* on the class by C-U3-F's compiled scratch activeWeight_favorable_zero_iff (no grade). The argument uses only m >= 1, and m >= 1 is load-bearing for the formula (at m = 0 the root is itself a leaf with witness v and {r, v} has weight 2), not for the zero iff; nothing is claimed off this key's class. The formula itself is not compiled. Grade proved_informal (elementary; no Darroch, Newton, asymptotic step, M_0 or census value). No flow, rank or eligibility is asserted by this note. U3's proposed zero-weight key is not registered: one fact, one record, and its content is this note. Distinct from E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY (a layer-sum identity on every finite simple graph), which this note neither restates nor extends. Bounded support, not proof: record R31-C3-SR-C3-3-CB-WEIGHT-FORMULA-CHECKS. Attribution: C-U3-F (r31 Cycle 3, Claude Opus 5.5; the exact formula, first stated, and the transport of the zero iff to the selector); U3 (r31 Cycle 3, Claude Sonnet 5; the zero-weight iff, compiled); C-U2-T and C-U2-F (r31 Cycle 3, Claude Opus 5.5; the r-free no-choke zero, compiled); the r31 Cycle 3 U adjudicator (Claude Opus 5.5; the exact-weight-form ruling and its instrument); the r31 Cycle 3 synthesis (Claude Opus 5.5); isolated second read SR-C3-3 (r31 Cycle 3, Claude Opus 5.5; the proof as written, the F ⊆ leafSet form, the role of m >= 1, exhaustive checks); the leaf set and tag witnesses of cbGraph m: r31 award C1-LA2; the active-tag weight and the CB family: Codex (GPT-6 Astra/Sol/Luna), the lower-region run, and r30, as registered. Fences: this key's fences apply unchanged; one rank per tree, the class only; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL, E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, governed beta and Erdős #993 stay OPEN, with no status transfer.
```

```text
SCOPE NOTE ON: E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL
TEXT: [r31 C3; SR-C3-3] Formal status map of the SOLUTION-CONTRACT §2 terminal on cbGraph m, and the reserved terminal name (no grade change: this key stays proved_informal and is not decisive). On the class and at p* = (16m + 4)/3: conjuncts 1–3 (cbGraph m is a tree; C5LA1.crossingIndex (cbGraph m) + 2 <= p*; 3p* < 2·indepNum + 1) are formally_verified by r31 award C2-LA1, and favorableLeaves (cbGraph m) p* = leafSet (cbGraph m) is formally_verified at graph level by r31 award C2-LA3 (the [r31 C2; C2-LA3] clause on E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3); this supersedes, for the formal record only, this scope's earlier sentence that the graph-level link for the private leaves is not formally verified, and it changes neither this key's grade nor the grade of hypothesis (a) in its informal proof. Conjunct 4, ∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) p*) p* f, is the only formal node that is open. The following compiled scratch declarations (no grade; kernel-checked in critic or adjudicator scratch with axioms propext, Classical.choice and Quot.sound, in no governed award) are interfaces to conjunct 4, not reductions of it: (i) the whole terminal ⇔ conjunct 4 on the class (C-U3-F terminal_iff_conjunct4; the r31 Cycle 3 U adjudicator's adjU_terminal_iff_conjunct4); (ii) conjunct 4 ⇔ WeightedHall (cbGraph m) (leafSet (cbGraph m)) p* (C-U3-T critU3T_cb8_conjunct4_iff_weightedHall_leafSet), whose forward uses are C-U3-F's terminal_of_leafSet_weightedHall and terminal_of_leafSet_flow; (iii) conjunct 4 ⇔ the existence of a nonnegative rational g, positive only on layer pairs in transportRel, with exact row sums w_F and column sums <= w_F (U1's hypothesis; C-U1-T ratFlow_iff_saturatingFlow, generic, and C-U1-F critic_cb8_ratFlow_iff_conjunct4 on cbGraph m); (iv) the Out-≥ forms — nonnegative g with g = 0 off transportRel, layer row sums >= w_F and layer column sums <= w_F — of r31 Cycle 2 seat U2 (weightedHall_of_ratFlow_bound, generic), of C-U1-T (cb8_topRank_of_ratFlow, at the derived selector, conjunct 2 discharged by the C2-LA1 terminal) and of C-U3-T (critU3T_cb8_topRank_of_ratFlow_leafSet, tag set leafSet): for these the compiled direction is g ⇒ conjunct 4 (hence the terminal), and the converse is the cast of a saturating flow to the rationals, which is compiled only for the equality form of (iii). Each of the five is therefore logically equivalent to conjunct 4, and all its mathematical difficulty is conjunct 4's. U1's conditional terminal is conditional on its own conjunct 2 and on (iii); U3's cb8_topRank_eligible_and_weightedHall (its hypothesis is literally conjunct 4) is rfl-identical to the kernel-checked face companion E993Transport.AdjU.cb8_topRank_of_flow of r31 award C2-LA1 (identity kernel-checked three times: C-U3-T, C-U3-F, the U adjudicator), an alias and not a contribution. No key, award, scope note or gate line rests on any of these as a reduction; an award that needs the interface carries the Out-≥ form, once. Reserved name (controller ruling R31-N-22): the declaration name cb8_topRank_eligible_and_weightedHall, in any namespace, is reserved for the unconditional Tier 1 terminal, whose binders are exactly (m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2) and whose type is exactly the four-conjunct SOLUTION-CONTRACT §2 body; no declaration of that name with any further hypothesis may exist in a project that a Stage 7 award freezes, and every Stage 7 fidelity review searches the frozen project for the name before close. U3's merged six-award project contains such a declaration (its entry 607) and must drop it before any freeze; C-U3-F's terminal_iff_conjunct4, terminal_of_leafSet_weightedHall and terminal_of_leafSet_flow call it by that name and must be re-pointed to E993Transport.AdjU.cb8_topRank_of_flow (rfl-identical) before any carry. The formal status of this key is unchanged: not formally_verified, not decisive (SOLUTION-CONTRACT §5). Fences: this key's fences apply unchanged; one rank per tree, the class only; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL, E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, governed beta and Erdős #993 stay OPEN, with no status transfer; no Darroch or Newton. Attribution: the equivalences: C-U1-T and C-U1-F (r31 Cycle 3, Claude Opus 5.5), C-U3-T and C-U3-F (r31 Cycle 3, Claude Opus 5.5), the r31 Cycle 3 U adjudicator (Claude Opus 5.5); the rational-flow interface of record: r31 Cycle 2 seat U2 (Claude Sonnet 5); U1 and U3 (r31 Cycle 3, Claude Sonnet 5; the alias declarations); the face companion: r31 award C2-LA1, as on its face; the reserved name: the r31 controller (Claude Opus 5.5; ruling R31-N-22) and SOLUTION-CONTRACT §2; the status map: the r31 Cycle 3 synthesis (Claude Opus 5.5) and isolated second read SR-C3-3 (r31 Cycle 3, Claude Opus 5.5; the compiled-direction precision, the superseded sentence, the freeze-hygiene finding); the Hall ⇒ flow step: the kernel-checked companion exists_saturatingFlow_of_weightedHall on the face of E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE. This note changes neither this key's statement, grade nor fences.
```

```text
RECORD: R31-C3-SR-C3-3-LITERAL-E1-FUNCTION-CHECKS
CLAIM: Own-instrument checks of U2's literal E1 function cb8E1Val/cb8E1Arc, transcribed with Lean's conventions (cb8R by explicit polynomial multiplication, guarded cb8N, x/0 = 0, truncated ℕ), tag set leafSet. (a) Literal small trees CB(8,1) at every rank, CB(8,2) at ranks 0–4, 17, 18, and CB(2,1), CB(2,2), CB(2,3), CB(3,2), CB(3,3), CB(4,2) at every rank (71 tree-rank pairs; every independent set enumerated and matched to a forest-DP count; (WID) asserted from independent sides first at every pair, for leafSet and for the derived strict selector): 2,580,830 arc values equal the contract's explicit table computed independently, 0 mismatches; 0 negative arcs; 0 support violations; Out exact at 462,572 r-free sources and failing at exactly 138 sources, all with j = p − q = 0; In exact at 104,780 targets; zero inflow at 1,007,542 targets with r ∈ A or q(A) = 0; hZeroChoke at 345,166 sources, 0 failures; control with F = leafSet minus one private leaf: Out (j >= 1) and In fail. (b) Class rows m = 107, 110 (controls) and 137, 146, 152 (fresh for this read) at p* = (16m + 4)/3: at every q ∈ [1, m], r_q computed three ways (type sum, the (1+y)+y expansion, explicit polynomial product at three q per row), 0 mismatches; ρ_q < 1; argmax ρ_q = 1; min_q (p* − q) = (13m + 4)/3; g_α, h_α >= 0 for every α ∈ [0, 8q]; Out exact at 166,308 realizable source types (267 with no closed-leg or arm vertex); In exact at 166,448 realizable target types; on the literal cbGraph m, 300 sampled targets (In exact, insertion-class counts exact) and 300 sampled sources (Out exact), 0 failures. Fixed points: ρ_1(CB(8,95)) at rank 508 = 1354839571516225/1361543988640524; CB(8,107): n = 1822, p* = 572; ρ_1(CB(8,107)) at rank 572 = 5150844596024699/5173467627355748.
STATUS: bounded_computation
PROVENANCE: isolated second read SR-C3-3 (r31 Cycle 3, Claude Opus 5.5); scratchpad/c3-sr-SR-C3-3/sr3_common.py, sr3_literal.py (payload 879212d17bc560f9f8b16479dfc00f39bcea66ede3fca3f8eb77539a3629d9ed), sr3_control_F.py (payload 1c47da291696aada872b065ace71659d82d333fed4440e603cdf54049d8545e1), sr3_classrows.py 107 110 137 146 152 (payload bcef597ae1fdf3141c6bad5548105444b85c36696c29fde7fea9c6b763174fa5); corroboration only, never evidence of the universal statement.
```

```text
RECORD: R31-C3-SR-C3-3-CB-WEIGHT-FORMULA-CHECKS
CLAIM: The literal Lean activeWeight at tag set leafSet against the exact formula [v ∈ B and r ∈ B] + Σ_i [u_i ∈ B]·#{j : c_ij ∈ B} and against the right side of the zero-weight iff, on arbitrary finsets B: CB(8,1) all 1,048,576 finsets; CB(2,1), CB(2,2), CB(3,2), CB(2,3), CB(4,2) all finsets (generic-leg analogue); CB(8,2), CB(8,3), CB(8,5), CB(8,107), CB(8,152) 356,000 random finsets; in total 3,903,392 finsets with m >= 1: 0 formula mismatches, 0 iff mismatches. Control m = 0: the formula fails on 2 of 8 finsets and the zero iff holds on all 8.
STATUS: bounded_computation
PROVENANCE: isolated second read SR-C3-3 (r31 Cycle 3, Claude Opus 5.5); scratchpad/c3-sr-SR-C3-3/sr3_weight.py (payload de690d48e8c5473d79728456504fc665de9fb19dd71fef9abde84ffd23e9698e); corroboration only, never evidence of the universal statement.
```

## Verdicts

verdict[SR-C3-3a]: confirmed_with_repairs
verdict[SR-C3-3b]: confirmed
verdict[SR-C3-3c]: confirmed_with_repairs

- **SR-C3-3a.** The literal function is exactly the explicit arc table, and clauses (1)–(5) hold on the class. The repairs are:
  - F-1: clause (5) is target-side;
  - F-2: `ℓ = j − α`;
  - F-3: the load-bearing `j ≥ 1`, `r_q(j−1) > 0`, the expansion and `F ⊇ C` are stated, and `x/0` is made precise;
  - F-4: the duplicate discharges are deduplicated.
- **SR-C3-3b.** The formula and entry 608 are exact as stated. F-5 is a precision note carried in the registration text.
- **SR-C3-3c.** The equivalences hold; they are interfaces, not reductions, and conjunct 4 is the only open formal node. The repairs
  are:
  - F-6: the stale Tier 1 sentence is superseded;
  - F-7: the compiled direction of the Out-`≥` copies is made precise;
  - F-8: the reserved name is sharpened, and C-U3-F's interfaces must be re-pointed off entry 607.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Artifact inventory

Scratch root: `scratchpad/c3-sr-SR-C3-3/` (under the run root).
- Python 3 standard library only: `fractions`, `math.comb`, `json`, `hashlib`, `random`, `re`, `os`, `sys`.
- Exact integers and `Fraction`, `python3 -B`, foreground.

| Path | SHA-256 | Role |
|---|---|---|
| `scratchpad/c3-sr-SR-C3-3/sr3_common.py` | `c25bdc7fee45d3c9593fb3315262c4b5966b33f080ba51a9011e88a1feab9391` | Shared layer: literal CB(d,m) from `cbEdge`, the Lean-literal leaf set, witnesses and `activeWeight`, the Lean transcription of U2's functions, the independent X-8 table and the forest DP |
| `scratchpad/c3-sr-SR-C3-3/sr3_literal.py` | `ad5a5ae57f5293a2da269774e0cec6619c18927beebb5219d3788452527bfab5` | Instrument 1: literal small trees, every arc, (WID) first |
| `scratchpad/c3-sr-SR-C3-3/sr3_literal.out.json` | `13b0ba57947a6e2c7312518d16daffbb5161e3784f528fef34c28ef789d5aa40` (payload `879212d17bc560f9f8b16479dfc00f39bcea66ede3fca3f8eb77539a3629d9ed`) | 71 (tree, rank) pairs, about 38 s |
| `scratchpad/c3-sr-SR-C3-3/sr3_control_F.py` | `5eae1779d9752ce9eee815dc7f43a96b89d5d0dba40ce36db276c1d4827714ce` | Control: `F = leafSet ∖ {c_00}` |
| `scratchpad/c3-sr-SR-C3-3/sr3_control_F.out.json` | `1b4a2e7d4fa216bb5c8df96eb2212ddf6c4ce7404b6aa6e477c49b2cac30d825` (payload `1c47da291696aada872b065ace71659d82d333fed4440e603cdf54049d8545e1`) | Out/In fail without `F ⊇ C` |
| `scratchpad/c3-sr-SR-C3-3/sr3_classrows.py` | `cd5fbd8675eaf6ff2af542df65848d29ff559b3aaaa6dd21b373098ca3f608b6` | Instrument 2: class rows, quotient level (every `q`, `α`) and literal sampled sets on `cbGraph m`; fixed points |
| `scratchpad/c3-sr-SR-C3-3/sr3_classrows.out.json` | `de74b94def94097e421fabc09c1c9027c14fcc4ca33fce6de34dd58b8216ecc9` (payload `bcef597ae1fdf3141c6bad5548105444b85c36696c29fde7fea9c6b763174fa5`) | Rows 107, 110, 137, 146, 152; about 72 s |
| `scratchpad/c3-sr-SR-C3-3/sr3_weight.py` | `16804a888b37ddf4eebcdc8bb7c3fc673f5f742fce1a4c2455e0d491648320fc` | Instrument 3: the exact weight formula and 608's iff on arbitrary finsets; `m = 0` control |
| `scratchpad/c3-sr-SR-C3-3/sr3_weight.out.json` | `44556a6f3b7719c9fd0c26daf4aa23705a162b3ba66a81a52269c66134c5311e` (payload `de690d48e8c5473d79728456504fc665de9fb19dd71fef9abde84ffd23e9698e`) | 3,903,400 finsets; about 8 s |
| `scratchpad/c3-sr-SR-C3-3/sr3_alias.py` | `02fa1522cda3fae7d6e0c0a682866244883c9f8ac051ddfa95d72ca4370561b9` | Instrument 4: registry lookups and alias screen (497 / 491 / 510) |
| `scratchpad/c3-sr-SR-C3-3/sr3_alias.out.json` | `453e2e6d19686bcf59a6ee45e47c1ce520e4924a27c17967de8c7e117625861f` (payload `b7743c94729c486580284615878b8760d1f8cf88d53feb46b7eacd0e70fba014`) | Key spellings and grades; 0 alias hits |
| `second-reads/SR-C3-3/SECOND-READ.md` | (this file) | The deliverable |

**Replay.** From `scratchpad/c3-sr-SR-C3-3/`, run:

```
python3 -B sr3_literal.py
python3 -B sr3_control_F.py
python3 -B sr3_classrows.py 107 110 137 146 152
python3 -B sr3_weight.py
python3 -B sr3_alias.py
```

The seal and member-digest checks were one-off Python commands run from the run root. The rule is the protocol's: compact, key-sorted
JSON of the manifest minus `seal_sha256`.

- No Lean was run. Every Lean fact above is a statement I read, with compile status cited from the critics' and the U adjudicator's
  frozen logs.
- No background job was started, and none was running at the final write.
- No sealed member was edited.
- I reread this file before close.
