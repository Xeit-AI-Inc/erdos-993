# Critique

Critic `C-F3-T`: r31 Cycle 4 Stage 4, cross-orientation critic of orientation T (prove), assigned to seat F3's return (route `C4-F-03`,
mechanism `FROZEN-TEXT-LEAN-SEMANTICS-FALSIFIER`, orientation F).

**Boot.** I am operating within VerityOS. This was a restricted boot: I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then my dispatch
(`control/dispatch/c4-stage4/DISPATCH-C-F3-T.md`; SHA-256 `6506051a55a16f3235d4c4571ea909235a0a2240de089af647ba9a0939d963b4`,
recomputed with `shasum -a 256` before I read it, and it matched). I read no other VerityOS file outside the run root. I wrote no
conversation log. My only writes are this file and the scratch files under `scratchpad/c4-crit-F3-T/`.

**Read-boundary disclosures.**
1. I printed `control/C4-CRITIC-ATTACK-BRIEFS.md` from line 45 to the end of the file. That output included the U1, U2 and U3
   sections as well as my own F3 section. Those sections hold controller pointers, not findings. I did not act on them, and nothing
   below depends on them.
2. The return inventories its replay driver at `scratchpad/c4-F3-replay/run_all.py`, which is outside the literal
   `scratchpad/c4-F3/` prefix named in the dispatch. I listed that directory without recursion and copied its files out before
   running anything. Every other file in it is byte-identical to the `c4-F3/` copies.
3. I also read these Stage 2 members, which the protocol and common brief authorize: `control/C4-FROZEN-STATEMENTS.lean`,
   `control/C4-WORKER-COMMON-BRIEF.md`, `sources/c4-base/LeanProject/LeanProof/{ChokeState,E1FlowConstruction}.lean` in full, and
   `sources/c4-base/LeanProject/LeanProof/Main.lean` in part (the definition list; lines 60–115, 225–360, 430–495, 1705–1945 and
   2393–2420; one targeted `grep` for C2-LA3 at line 13189). Every `grep` I ran targeted one named, granted file. The only `ls`
   calls I ran were non-recursive listings of the two F3 scratch directories, my own scratch directory and the deliverable path.
4. The harness put this project's `CLAUDE.md`, the user auto-memory index and the user's e-mail into my context. I did not open,
   cite or act on them. The dispatch's restricted boot and single-deliverable rule take precedence.
5. The protocol lists a "Stage 3 read-boundary disclosures record" as a capsule member. My capsule does not list it, so I did not
   read it. I did not read any sibling return, any critique (a `U/` directory exists beside mine and was not opened), any
   adjudication, any other experiment root, or the network.

## Identity and seal audit

- **Capsule seal:** `F3-PACKET-MANIFEST.json` recomputes to `6e5f0786ebb510cba7d5387fce0713bf8ffd27cbc63ff6e6ae84ce3a7d4ce126`
  (canonical JSON without `seal_sha256`; sort_keys; separators `(",", ":")`; no trailing newline). This matches the value in my
  dispatch. All 16 listed members match both the listed SHA-256 and the listed byte count.
- **Stage 2 seal:** `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387`, recomputed and matching.
- **Stage 3 seal:** `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e`, recomputed and matching. The Stage 3
  manifest lists `cycles/cycle-4/stage3/returns/F3/RETURN.md` at `2fe57c3fc84c58bdfdba2b1df5fbf7d1e7725436c1a6c47998a6347a84bc5ce6`,
  22,480 bytes. This equals the capsule entry and the file on disk.
- **Stage 4 dispatch seal:** `040448e1cdf94fa8a669364b4cdcbcc01bbd8f65a02eba056eb0f9856200e023`, recomputed and matching.
- **Frozen texts:** `control/C4-FROZEN-STATEMENTS.lean` is `0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1`. It is
  byte-identical to `sources/c4-base/LeanProject/LeanProof/Statements.lean` and matches gate ruling 23 and the Stage 2 manifest.
  The companion `.md` is `6aa6dfe5…a54b`. The return cites three base digests and one C1-LA1 digest: `Main.lean`
  `385af1bf…2ea3f`, `E1FlowConstruction.lean` `d26e702b…2aab8`, `ChokeState.lean` `64a101ef…d3bb`, and C1-LA1 `Main.lean`
  `f0578ed7…b78e`. All four match the Stage 2 manifest.
- **The return's artifact inventory:** all nine listed SHA-256 values match the files, rehashed after copy-out. The eight files in
  `c4-F3/` are byte-identical to their `c4-F3-replay/` copies.
- **Route identity:** the return carries the route ID `C4-F-03` and the mechanism token `FROZEN-TEXT-LEAN-SEMANTICS-FALSIFIER`
  verbatim, and its attacked nodes (N1, N5, N6, N7) match `control/C4-ALLOCATION.md`.
- **Claim identity:** the return proposes no `E993-R31-` key. The registered keys it names (the E1 criterion, threshold,
  favorability and CB-row keys) are cited, not re-proved. Its alias check (lexical and mathematical) is adequate for a route that
  proposes nothing. This critique also proposes no key.

## Independent re-derivation

**The instrument.** I wrote my own instrument, `scratchpad/c4-crit-F3-T/crit_core.py`, with helper scripts `crit_small.py`,
`crit_rows.py` and `crit_m0.py`. I wrote it from the frozen Lean text and the base definitions, and it imports no F3 code.

- Vertex sets are integer bitmasks over `Fin (17m+3)`.
- `cbVertex` reduces labels mod `17m+3`, as the Lean definition does.
- `leafSet` is `IsGraphLeaf` (exactly one neighbour). `support` and `tagWitnesses` are read off the adjacency.
- `activeWeight`, `cbOpenChokeCount`, `chokeBeta`, `chokeGamma`, `transportRel`, `cb8GSec` (including the guard
  `IsSectorSource ∧ B ∈ I_{p*+1} ∧ transportRel`), `cb8R1`, `cb8R`/`cb8Rho` (ℤ-indexed, with `x/0 = 0`) and the C1-LA1 tables
  (entries 80–89) are transcribed directly.
- ℕ-subtraction is truncated.

Checks on the instrument itself:

- **Graph builder.** The builder equals a literal evaluation of the frozen `cbEdge` disjunction with `fromRel` symmetrization
  (`u ≠ v`) over every ordered pair, for `m = 0, 1, 2, 3`.
- **Two `transportRel` implementations.** I use a fast version that is exactly equivalent to the definition. This is not an
  approximation: (D) holds iff `A ⊆ B` and `|B∖A| = 1`, and (S) forces `A∖B = {u}`. It agrees with the literal definition
  (`∃ q ∈ B, A = B.erase q` ∨ `∃ u ∉ B, |N(u)∩B| = 2 ∧ A = insert u (B∖N(u))`) on 2,273,131 pairs, with 0 mismatches.
- **Preimage enumerator.** It is complete by construction: deletion preimages `A ∪ {x}`, plus switch preimages
  `(A∖{u}) ∪ T` with `T ⊆ N(u)`, `|T| = 2`, each re-checked through `transportRel`. Checked against brute force (the image map of
  every independent set), it agrees on **all 33,573 independent targets of `CB(8,1)`, with 0 mismatches**. This is the check the
  return claims but does not ship (see Certification audit).

**Results.** Each is exact and deterministic. The digests are in the Artifact inventory.

| Object | Coverage | Result |
|---|---|---|
| N1 companion `cbOpenChokeCount_le` | all 2^20 finsets, `m = 1` | 0 failures |
| N1 B1 `cb8_rFree_deletionClasses` | all 20,451 `r`-free independent sets, `m = 1`; random sets of random size and `q`, `m = 2, 3, 4` (378–383 each) and rows 107/158/161/164 (40 each) | 0 failures |
| N1 B2 `cb8_rFree_insertionClasses` | same sets as B1, with the full up-cover scan | 0 failures |
| N1 B3 `cb8_nonChokeInsert_weight` | **exhaustive at `m = 1`: every finset `A` and every admissible `z`, 9,437,184 pairs** (the return sampled 126,418); random at `m = 2, 3, 4` and the four class rows | 0 failures |
| N1 B3 at `m = 0` | exhaustive | **fails** at `A = {r}, z = v` (weight goes 0 → 2; statement predicts 0 + 1) and at `A = {r, s}, z = v`: `hm : 0 < m` is load-bearing for B3 as well as N6 |
| N6 `cb8_activeWeight_leafSet_eq` | all 2^20 finsets, `m = 1`; 3,000 random finsets (not necessarily independent) at `m = 2, 3, 4`; 300 at each class row | 0 failures; at `m = 0` it fails at `{r, v}` and `{r, s, v}` (agrees with the return) |
| N5 census and inflow (both parts) | **exhaustive at `m = 1`** (70 part-1 cases, 126 part-2 cases); random targets with **randomized structure** (random open choke, random `γ = 0..8`, random leg states and fill) at `m = 2, 3, 4` (280–360 part-1 and 198–240 part-2 cases each) and at 107/158/161/164 (54 + 36 per row); the part-2 cases include `q ≥ 2` with `v`, without `v` and with `s`, and `q = 1` without `v` (with and without `s`) | 0 failures; the inflow is summed over **all** independent `(p*+1)`-preimages, not only the sector ones |
| N7 companion `cb8Rho_one_eq_cb8R1_ratio` | **every class row `107 ≤ m ≤ 1000`, `m ≡ 2 (mod 3)`** (298 rows) | exact equality at every row |
| C1-LA1 Switch, Residual and the per-target capacity inequality `ρ_1γ + (8−γ)σ(γ) ≤ γ`, `γ = 1..7` | same 298 rows | 0 failures (bounded; the universal statement is carried formally by C1-LA1, see below) |
| `ρ_q < 1` for every `1 ≤ q ≤ m` | `m = 158, 161, 164` | 0 failures |

**Fixed points (SEMANTIC-CONTRACT §5).** I reproduced these with a literal tree DP of the independence polynomial on the adjacency
(no closed form used), before reporting any table:

- `CB(8,107)/572`: `n = 1822`, `α = 964`, `x = 570`.
- `CB(8,95)/508`: `n = 1618`, `α = 856`, `x = 506`. `ρ_1 = 1354839571516225/1361543988640524` from `cb8R1`.
  `σ(1..3) = 96/4229855, 32/604265, 288/3021325`. `R_K/R_{K−1} = 508/507`.
- `cb8Theta(107) = 96/766193` and `cb8Theta(95) = 96/604265`. These equal the record's `θ*` values, but that is the template's
  closed form evaluated at those rows. It is not an independent solve of the LP; the `θ*` law stays a conjecture.
- Difference index, stated in words: `x` is the least `k` with `i_{k+1} − i_k < 0`, computed in ℤ with counts zero above `α`.
- Control values from this single instrument (bounded, and not a claim of this critique): `m = 158` gives `x = 842 = p* − 2`,
  `m = 161` gives `x = 857 = p* − 3` (the structural row, consistent with gate ruling 27), and `m = 164` gives `x = 873`.
  `3p* < 2α + 1` at all three rows.

**Instrument sides.** Every identity above is evaluated on its left and right sides by one instrument (mine), which is how an
identity is tested. It is not "two instruments". The genuinely separate cross-checks are:

- fast `transportRel` against the literal `transportRel`;
- the preimage enumerator against a brute-force image map;
- my implementation against F3's, through the replay.

The two implementations share no code and agree on every object both reached. (WID) does not arise, because neither the return
nor this critique evaluates any aggregate `S`.

**Replay of the return.** I copied the files out, then ran `python3 -B run_all.py` in `scratchpad/c4-crit-F3-T/replay-drv/`. It
prints `MASTER_DIGEST_SHA256: 4ad0c6f428c8371eb4ba3088216083f8ed95201b927878b47e9437129e7476fe`, and `python3 -B tree_check.py`
prints `digest: 3527a38bda398c1d62f7b775d55b05dfcbd7d06fda6ddede804fc76e67de44bd`. Both match the return's lines 247–248 exactly.
The replayed counts are:

- N1: B1 20,451, B2 20,451, B3 126,418 checks, 0 failures.
- N6: 1,048,576 checks, 0 failures.
- N5: rows 107 and 158, 0 failures.
- N7 companion and switch capacity: 15 rows, all true.
- Probe: 7 `(m, q)` cases, all 0.
- Mutants: M1 262,144 failures out of 1,048,576; M5 7/7.

## Attacks and findings

**F-1: the claimed cross-validation of the transport evaluator does not exist in the shipped artifacts.** This answers the attack
brief's question. The return (Method item 5) says `exact_transport.py` was "cross-validated against an independently-written direct
definitional evaluator (`transport_targets` in `falsify_cb8.py`) on ALL 33,573 independent sets of CB(8,1): 0 mismatches". In fact:

- `transport_targets` is defined but never called by any shipped script.
- `run_all.py` contains no cross-validation step.
- The only check is the `__main__` smoke test of `exact_transport.py`. It compares ONE rank-6 target (8 preimages) and ONE rank-7
  source (7 images), and it compares them against that module's own opposite-direction function, not the "independent
  evaluator".

So the evaluator was not shown to be independent, and the 33,573 figure is unbacked. The finding is struck (see Certification
audit). The mathematics is unaffected. My own enumerator passes the full cross-check (33,573 targets, 0 mismatches), and F3's
N5 values agree with mine at 107 and 158.

**F-2: the N7 "case-split probe" states a false structural conclusion.** The return (Census) says the probe "confirms … that no
sector source's literal arc ever lands on an r-free, v-free target". That is false. Take any sector source `B` (`r, v ∈ B`;
`s ∉ B`). Then `N(s) ∩ B = {r, v}` has size 2, so the **switch at `s`** is a literal (S) arc onto `A = (B ∖ {r, v}) ∪ {s}`,
which is `r`-free and `v`-free. My witness at `m = 107` is a random sector source in `I_{573}`
(`B_labels_sha256 = 8a1811677577027dab71ec2e4cb5246b08f263f170f8679f2cf3d6dcb48e12e3`): `transportRel` holds, `A` has `r = 0`,
`v = 0`, `s = 1`, `q = 0`, weight 0, and `cb8GSec = 0`. My sector-image census finds exactly this class, 4 arcs per sample of 4
sources at every class row. F3's probe could not see it because every probe target was built from chokes and supports only, never
`s`.

The consequence for the frozen texts is **nil**:

- `cb8GSec` has no `s` summand, and N4's `cb8GSec_zero_classes` names the switch at `s`.
- N7 covers every `r`-free target by `(q(A), v ∈ A)` through `hSw.2` and `hZero.2` (proof below).

The consequence for the return is that the claim is struck and replaced by the true statement. Every image of a sector source is
one of these:

- in-sector (`r, v ∈ A`: a leg deletion);
- a one-choke switch image with `v` (`r ∉ A`, `v ∈ A`, `q = 1`);
- a zero-valued arc: the deletion of `r` (`q = 0`, weight 0), the deletion of `v` (weight 0), the switch at `s` (weight 0), or a
  choke switch in state `(1, 0)`.

This holds on every image of 30 sampled sources at `m = 2, 3, 4` and 4 at each class row. More importantly, it is proved
structurally in the next section (P-N7).

**F-3: the N5 mutation control does not test the N5 checker.** Mutant M5 compares `(8−γ)·σ(γ)` with `(7−γ)·σ(γ)` as bare
arithmetic. The mutated expression never enters `test_n5_full.py`, so "7/7 failures" shows only that `σ(γ) ≠ 0` for
`γ = 1..7`. "Detector has teeth" is unbacked for N5. M1 (N6 without the `[v, r]` term) is a genuine checker mutation.

**F-4: N5 coverage is narrower than stated.** The preimage sets are exact, but the targets are 13 per row, 26 in all. The return
says "13 class-row cases", which undercounts. All targets share one padding pattern (supports of other chokes, taken in index
order). No target contains `s` or a `c`-leg of a closed choke, and there are no two-choke targets without `v`. My randomized
targets cover all of these, and the `m = 1` layer is covered exhaustively. No failure appears.

**F-5: `hm : 0 < m` is also load-bearing for N1 B3.** The return reports this only for N6. At `m = 0`, `leafSet = {r, v}` and
`W_r = {v}`, so inserting `v` into `{r}` activates both `v` and `r`, and the weight jumps by 2. The frozen B3 carries `hm`, so the
text is correct. The finding confirms the hypothesis is needed rather than vacuous.

**F-6: the fixed-point claim has no generator.** The return says the §5 fixed points (including `α = 964`, `ρ_1(95)`, `σ(1..3)`)
were "reproduced independently and exactly". No shipped script computes `α`, anything at `m = 95`, or `ρ_1(95)`. The "`θ*`"
values can only have been `cb8Theta` evaluated: the template's closed form, not the LP optimum. That is circular as a
reproduction of `θ*`, and it is not independent. My tree DP reproduces the values the return names (and `x`, which it did not
compute) — see Independent re-derivation.

**F-7: timeline.** The return says the class-row N5 tests were written after the ~08:55 resumption, but
`scratchpad/c4-F3/test_n5_full.py` has mtime 08:54. The most likely reading is "run after resumption". There is no numeric
consequence, because the replay reproduces the output digest. Recorded, not struck.

**No counterexample found.** No attack on the exact scopes of N1 (four declarations), N5 (two), N6 or the N7 companion found a
counterexample. I checked:

- Lean conventions: labels wrapping mod `17m+3` (no wrap for `i < m`, `j < 8`), ℕ-truncation in `8(m−1)+1`, `(16m+4)/3 − 1` and
  `(16m+1)/3 − 1` (all safe for `m ≥ 107`), `x/0` in `cb8Rho` (the denominators are positive).
- The `γ ∈ {0, 8}` boundary of N5. At `γ = 0`, `cb8Sigma m 0 = cb8CGamma 0 · θ = 0` through the table's wildcard `| _ => 0`, which
  agrees with the definitional guard `1 ≤ γ`. At `γ = 8`, the factor `8 − 8 = 0` and there are no preimages.

The same holds for N7 itself (see P-N7). Because N7 is an implication, instance falsification cannot reach it, so I proved it.

## Mechanism-equivalence and fence check

- **One rank, class only.** All class-row work is at `p* = (16m+4)/3` with `m ≡ 2 (mod 3)`. The small-`m` work (`m = 0..4`)
  tests rank-free frozen statements (N1, N5, N6, which carry no class hypothesis) at their own scope. It claims nothing about
  (HALL) at other ranks or rows.
- **No refuted mechanism.** Nothing here uses real-rootedness, Newton or Darroch, the all-families compression lemma, CHAR at
  `m = 1`, or an `m`-independent per-choke certificate.
- **Census discipline.** The sweeps (298 rows for the N7 arithmetic; random class-row targets) are `bounded_computation`. The
  universal content of the N7 arithmetic comes from C1-LA1's formally verified terminal (entry 111: Switch
  `(8−γ)σ(γ) ≤ θγ` for `1 ≤ γ ≤ 7`, and Residual `θ ≤ 1 − r1(K)/r1(K−1)`), not from the sweep. The `θ*` law is never a
  hypothesis.
- **No status transfer.** Nothing here touches (HALL), the primary aggregate or Tier 1 grades, and the headline stays unresolved.
- **The return's mechanism.** A second Python transcription of the frozen texts under Lean conventions is a legitimate falsifier
  of the frozen texts. It is not a proof, and the return correctly grades itself `bounded_evidence`.

**Critic-derived advance (attributed to C-F3-T; stated at review stage; requires an isolated second read before any
registration).** These are informal proofs of the nine frozen declarations the return attacked. They close the return's open item
2 (the case-split completeness sweep over `q = 1..m`) by proof instead of by sweep. Notation: `r, s, v = 0, 1, 2`,
`u_i = 3+17i`, `b_ij = u_i+1+2j`, `c_ij = u_i+2+2j`.

- **P-leaves (for `m ≥ 1`).** Degrees: `r` has degree `1+m ≥ 2`, `s` 2, `v` 1, `u_i` 9, `b_ij` 2, `c_ij` 1. So
  `leafSet = {v} ∪ {c_ij}`, `W_v = N(s)∖{v} = {r}` and `W_{c_ij} = N(b_ij)∖{c_ij} = {u_i}`. Hence `v` is active in `B` iff
  `v, r ∈ B`, and `c_ij` is active iff `c_ij, u_i ∈ B`.
- **P-N6.** P-leaves applies to any finset `B`, so
  `activeWeight(leafSet, B) = [v, r ∈ B] + Σ_{i<m} [u_i ∈ B]·#{j : c_ij ∈ B}`. At `m = 0` the vertex `r` is a leaf, and the
  statement fails at `{r, v}`.
- **P-N1c.** A filter of `range m` has card at most `m`.
- **P-B1.** Take `B` independent and `r ∉ B`.
  - Chokes are not leaves, and `i ↦ u_i` is injective on `range m`. This gives clauses 1–3.
  - `v` is inactive (`r ∉ B`), and each active `c_ij` needs `u_i ∈ B`, so `w ≤ 8q`.
  - The remaining vertices lie among `{s, v}` (at most one, since `s ~ v`) and one of `{b_ij, c_ij}` per leg of each closed choke
    (`b ~ c`). An open choke contributes nothing: its `b`'s are blocked (`u ~ b`) and its `c`'s are active. So
    `ℓ ≤ 1 + 8(m−q)`.
- **P-B2.** Take `A` independent and `r ∉ A`.
  - Boolean insertions are exactly `c_ij` with `u_i ∈ A`, `c_ij ∉ A`. There are `8q − Σ_open γ_i = 8q − w` of them (`v` is never
    active, because `r` is not inserted).
  - Ternary insertions:
    - Each empty leg of a closed choke admits two insertions (`b` or `c`, both non-active).
    - A non-empty closed leg admits none, and adds 1 to `ℓ'`.
    - An open choke admits none and adds 0 to `ℓ'`.
    - The arm admits two insertions (`s` or `v`) when empty; otherwise it admits none and adds 1 to `ℓ'`.
  - Adding up: `16(m−q) + 16q + 2 = 16m+2`.
- **P-B3.** Take `z ∉ A`, `z ≠ r`, `z` not a choke. Then `q` is unchanged. For a leaf `x ∈ A`, `W_x ∈ {{r}, {u_i}}` does not
  contain `z`, so `x`'s status is unchanged. The new element `z` contributes exactly the indicator. This uses `m ≥ 1`.
- **P-N5 (any `m`, any rank `p`).**
  - *Census.* Let `A ∈ I_p` with `v ∈ A`, `q(A) = 1`, `u_i ∈ A`, and let `B` be a sector source in `I_{p+1}` with
    `transportRel B A`.
    - (D) is impossible: `u_i ∈ A ⊆ B` would contradict `r ∈ B` and `r ~ u_i`.
    - So (S) holds with `A∖B = {u_i}`. Since `r ∈ B`, `|N(u_i) ∩ B| = 2` means `N(u_i) ∩ B = {r, b_ij}`, and therefore
      `B = (A∖{u_i}) ∪ {r, b_ij}`. Independence forces `c_ij ∉ A`.
    - Conversely, each such `B_j` is independent. Here `s ∉ A` (because `v ∈ A`), no other choke is in `A`, and `b_ij, r ∉ A`.
      Each `B_j` has card `p+1` and is carried to `A` by the switch at `u_i`.
    - The map `j ↦ B_j` is injective, so there are `8 − γ` preimages. `β_i(B_j) = 1` and `γ_i(B_j) = γ_i(A)`.
  - *Inflow.* For each `B_j`, the set `B_j∖A = {r, b_ij}` has card 2, so no deletion summand fires. `A∖B_j = {u_i}` fires only at
    index `i`, with value `[γ ≥ 1]·σ(γ)`. The sum is `(8−γ)σ(γ)`, since `σ(0) = 0` by the wildcard.
  - *Zeros.* Suppose `q(A) ≥ 2`, or `q(A) = 1` and `v ∉ A`. (D) is impossible because a choke of `A` would lie in `B ∋ r`. Under
    (S), every choke of `A` lies in `A∖B = {u}`, so `q = 1` and `u` is that choke; but then `v ∈ B∖N(u) ⊆ A`, a contradiction.
    Every summand is therefore 0, by the guard of `cb8GSec`.
- **P-N7c (`m ≥ 1`, `m ≡ 2 (mod 3)`).** `cb8R1 m k = [X^k](1+X)^7(1+2X)^{8m−7} = cb8R 7 (8(m−1)+1) k` for `k ∈ ℕ` (the terms have
  `t ≤ min(7, k)`, so `k − t` is safe). `3 | 16m+4` gives `(16m+1)/3 = p* − 1`, and `((p*−1 : ℕ) : ℤ) − 1 = p* − 2 = K − 1` in ℕ
  (`p* ≥ 2`). Both sides are therefore the same ratio of the same coefficients.
- **P-N7 (the composition, from its own hypotheses plus the carried facts it is allowed).** The carried facts are C2-LA3
  (`favorableLeaves (cbGraph m) p* = leafSet`, base line 13189), C1-LA1 entry 111 (Switch, Residual), `cb8Rho_lt_one_topRank`,
  and P-N7c. Let `g = f + h`, with `f = cb8E1Arc` and `h = cb8GSec`.
  - (1) `g ≥ 0`, by `hE1.1` and `hSec.1`.
  - (2) Off `transportRel`: `h = 0` by `hSec.2`. A nonzero `f` forces `A = B.erase x` by `hE1.2`, which is (D).
  - (3) Out, for `B ∈ I_{p+1}`:
    - If `r ∉ B`, the row of `f` equals `w_F(B)` (`hE1.3`) and `h ≥ 0`.
    - If `r, v ∈ B`, there are no chokes (independence), so `w(B) = 1` by `hW` and C2-LA3, and `1 ≤ Σh` by `hOut`.
    - If `r ∈ B` and `v ∉ B`, then `w(B) = 0`.
  - (4) In, for `A ∈ I_p`:
    - (a) `r, v ∈ A`: `Σf = 0` (`hE1.5`), `Σh ≤ 1 = w(A)` (`hIn`, `hW`).
    - (b) `r ∈ A`, `v ∉ A`: `w = 0`, `Σf = 0`, `h = 0` (`hZero.2`).
    - (c) `r ∉ A`, `q = 0`: `Σf = 0` (`hE1.5`), `w = 0` by `hW`, `h = 0` (`hZero.2`).
    - (d) `r ∉ A`, `q = 1`, `v ∈ A`: `Σf = ρ_1·γ`. Clause 4's `8·q−1` and `8(m−q)+1` at `q = 1` are the companion's syntax.
      `w = γ = chokeGamma m A i` (`hW`), and `Σh = (8−γ)σ(γ)` (`hSw.1`).
      - At `γ = 0` both sides are 0.
      - At `γ = 8`, `8ρ_1 ≤ 8` since `ρ_1 < 1`.
      - For `1 ≤ γ ≤ 7`, the total is `ρ_1γ + (8−γ)σ(γ) ≤ ρ_1γ + θγ ≤ ρ_1γ + (1−ρ_1)γ = γ`, by Switch, then Residual with P-N7c.
    - (e) `r ∉ A`, `q = 1`, `v ∉ A`: `Σh = 0` (`hSw.2`) and `ρ_1 w ≤ w`.
    - (f) `r ∉ A`, `q ≥ 2`: `Σh = 0` (`hSw.2`). `q ≤ m` (P-N1c), and `ρ_q < 1` for `1 ≤ q ≤ m` (`cb8Rho_lt_one_topRank`), so
      `ρ_q w ≤ w`.

  The case split (a)–(f) partitions `I_p` by `(r ∈ A, v ∈ A, q(A))`, so there is no uncovered target class. This is the proof of
  the completeness the return probed at 7 instances. The switch-at-`s` images of F-2 fall in (c) or (e)/(f).

  Dependency note: `cb8Rho_lt_one_topRank` is a compiled declaration of the base's `E1FlowConstruction.lean`, a scratch copy
  derived from C1-LA3 entry 131. It is not itself a governed award. Stage 7 must carry it from a governed source or re-prove it.

## Certification audit

These certification literals in the return are **struck** as unbacked by shipped evidence:

1. "Cross-validated … on ALL 33,573 independent sets of CB(8,1): 0 mismatches" (Method item 5) and the matching "independently
   written evaluator" language. No shipped code performs this check (F-1). The narrowed truth: a smoke test of one target and one
   source against the same module. The full check was performed by this critic, not the seat.
2. "0 mismatches / 46,754 checks" (Instrument sides, N1 row). No shipped output prints 46,754. The replay gives B1 20,451, B2
   20,451 and B3 126,418.
3. "Fixed points … reproduced independently and exactly" (Census). No generator ships, and the `θ*` "reproduction" is
   `cb8Theta`, the template's closed form (F-6).
4. "No sector source's literal arc ever lands on an r-free, v-free target" (Census, N7 probe). False, because of the switch at `s`
   (F-2).
5. N5 "detector has teeth" (mutation M5). M5 does not exercise the checker (F-3).

These literals are **narrowed**:

- "13 class-row cases" means 13 per row, 26 in all, sampled at the target level.
- "two independent instruments" in the N1 and N6 rows means one instrument evaluating both sides of an identity.

These literals are **backed**:

- The nine artifact digests.
- The two replay digests (`4ad0c6f4…76fe`, `3527a38b…44bd`), both reproduced exactly.
- The tree check at `m = 0, 1, 2, 107, 158`.
- The 33,573 and 20,451 counts, which are the independent-set counts of `CB(8,1)` and `3·G(1)` respectively, confirmed by my
  enumeration.
- N6 at 1,048,576 checks.
- The N7 companion at 15 rows (I extended it to 298).
- "0 counterexamples", which I confirmed independently.

**Admission defect adjudication (F3: `DIGEST_LITERAL_UNMATCHED` ×2, values `3527a38b…44bd` and `4ad0c6f4…76fe`).** Both are
stdout digests printed by the replay commands, not file digests. Replayed copy-out-first, they reproduce byte for byte. The defect
is resolved: the literals are backed, and nothing is struck on their account.

No `formally_verified` token appears on the seat's own work. The return claims `compiled` nothing, so no build log is owed; it
correctly states `FROZEN_NODES_CLOSED: none`. On gate ruling 29, the return writes its difference index textually ("not
applicable"). Its row claims are coefficient-ratio identities whose indices (`K = (16m+1)/3`, `K − 1`; `p* − 1`, `p* − 2`) are fixed
in the frozen statement text. No row claim is rejected on this ground.

## Verdict

The return's central result survives independent re-derivation with a stronger instrument: exact, non-sampled checks find no
counterexample to N1, N5, N6 or the N7 companion at the scopes tested, and the frozen texts behave correctly under Lean conventions.
Its grade (`bounded_evidence`) is correct. However, five certification literals are unbacked or false, including the headline
"independent evaluator" cross-validation and a false structural claim in the N7 probe. They are struck, and the claim is retained
at narrowed wording.

My informal proofs (P-N1c, P-B1, P-B2, P-B3, P-N5, P-N6, P-N7c, P-N7) indicate that the mathematics of all nine attacked
declarations is complete. I state that in prose, as a critic-derived candidate at grade `proved_informal`, pending an isolated
second read. P-N7 is conditional on the carried C1-LA1, C2-LA3 and `cb8Rho_lt_one_topRank`.

verdict: retained_narrowed
headline_resolved: no

COND4_formal: no
E1_formal: no
TERMINAL_integration: no
cut_candidate: no
FROZEN_NODES_CLOSED: none

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

What a successor inherits:

1. **Lean proofs of the frozen texts, byte for byte.** None exist from this seat or from me. That covers N1 (`cbOpenChokeCount_le`
   and B1–B3; owned by T1/U1), N5 (both; T3), N6 (U2), and the N7 companion and composition (U2). Each needs a sorry-free proof on
   the Cycle 4 base with axioms `propext`, `Classical.choice`, `Quot.sound` only, reported on `FROZEN_NODES_CLOSED`. The informal
   proofs P-leaves through P-N7 above are the route map.
2. **An isolated second read** of P-N5 and P-N7, the two that carry the case analysis, before any of them is registered.
3. **A governed source for `cb8Rho_lt_one_topRank`**, which P-N7 depends on. It is currently compiled scratch in the base.
   Stage 7 must carry it from a governed award or re-prove it.
4. **Wording corrections.** The struck literals (Certification audit 1–5) should not be cited by any Stage 5–7 record. F3's
   `exact_transport.py` may be reused only with the full cross-check that my `crit_small.py` performs (33,573 targets, 0
   mismatches).
5. **No cut and no template failure** is carried forward from this return or this critique.

## Artifact inventory

All paths are relative to the run root. Everything was generated with `python3 -B`, standard library only (`fractions`, `math`,
`itertools`, `json`, `hashlib`, `random`, `sys`), with no wall-clock, PID or host fields in hashed outputs.

| Path | SHA-256 | Role |
|---|---|---|
| `scratchpad/c4-crit-F3-T/crit_core.py` | `0471867dd823eaa147b66ebbcd042a4bee567cbeb14edd3b55abafb06cec1df0` | independent bitmask instrument (graph, weights, `transportRel` fast and literal, preimages, `cb8GSec`, C1-LA1 tables, `cb8R1`/`cb8R`/`cb8Rho`) |
| `scratchpad/c4-crit-F3-T/crit_small.py` | `077ccb3e4e2b1869e281f54e75478fd1b268cabf7f3e7d74c28baeaa38488ae0` | exhaustive `m = 1` layer (N6, N1 B1/B2/B3, companion, preimage cross-check, N5) |
| `scratchpad/c4-crit-F3-T/crit_small.out` | `9fad9ae59e81d8a520466879f1b141fefae6515c90f56c0485db18216d26dc24` | output; printed digest `b658cccd7777845ab3d7da62104121f18dbc9218be34196a97327f3801e2ea5b` (identical under the literal and the fast `transportRel`) |
| `scratchpad/c4-crit-F3-T/crit_rows.py` | `d18fd47f9f5aab97d80411faf11f43baba2785a1e3b053ae050f5a89f171b5f7` | fixed points (tree DP), N7 arithmetic on 298 rows, randomized N1/N5/N6, sector-image census, switch-at-`s` witness, fast/literal cross-check |
| `scratchpad/c4-crit-F3-T/crit_rows.out` | `41c9cfd4544be6cc0a3279021960901909323eaf1d40250b07307315a87e39ac` | output; printed digest `04e01767816c1bc1b7a37405f116a926d39567e9f1c9947c181809a9759af6ef` |
| `scratchpad/c4-crit-F3-T/crit_m0.py` | `686915a67be928f79369903896eceeaba8828615506d8e4c727f9199f26b3d3d` | the `m = 0` boundary (N1 B3, N6) |
| `scratchpad/c4-crit-F3-T/crit_m0.out` | `a60223413053d6964a8094d374fb24b005a8e4a7b5f3c26261f581f02846e102` | output; printed digest `421fa795b7901b6303482eb8ba5a098a6a45df9e8b790f0ca6abdb2276bb3f76` |
| `scratchpad/c4-crit-F3-T/replay-src/` | the eight F3 files, hashes equal to the return's inventory | copy-out of `scratchpad/c4-F3/` |
| `scratchpad/c4-crit-F3-T/replay-drv/` | the nine F3 replay files (`run_all.py` `7521f1a3…2c41`) | copy-out of `scratchpad/c4-F3-replay/` |
| `scratchpad/c4-crit-F3-T/replay-drv/run_all.out` | `aa23967e4e1870f57e14e93c448f81ddc5bf80a9e15c12f47fca4b975ad82fba` | replay output; `MASTER_DIGEST_SHA256: 4ad0c6f4…76fe` |
| `scratchpad/c4-crit-F3-T/replay-drv/tree_check.out` | `34054758e4d7c058f6e8f3690d56c205de52c4633a1f6434e39fb2cb161345c6` | replay output; `digest: 3527a38b…44bd` |

To replay, run `cd <run root>/scratchpad/c4-crit-F3-T && python3 -B crit_small.py && python3 -B crit_rows.py && python3 -B crit_m0.py`.

**Background jobs.** I started two, `crit_small.py` (PID 15458) and `crit_rows.py` (PIDs 17234 and 22206; the first run failed
with a JSON key-type error and was rerun). I polled each by literal PID only, and all three had exited before this file was
written. I never ran a full process listing, used the network or installed a package. I made no Lean or `lake` invocation.
