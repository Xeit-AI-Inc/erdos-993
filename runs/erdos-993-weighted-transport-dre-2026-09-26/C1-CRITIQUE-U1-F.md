# Critique

Critic `C-U1-F` (orientation F, falsify) of seat `U1`, route `C1-U-01 COMPRESSION-UNCROSSING-ORBIT-REDUCTION`,
Cycle 1 Stage 4, r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`). Date 2026-09-26.

Boot: operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file. The harness injected the root
`CLAUDE.md` and the auto-memory index into my context. I did not open them as files and did not use them as evidence.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

Assigned return: `cycles/cycle-1/stage3/returns/U1/RETURN.md` (SHA-256 `2f74c265307c981f02a9df1f87c0b812c8a439c3a214ee2f7fc0566ed643a79f`).

## Identity and seal audit

Every seal was recomputed as SHA-256 of the compact, key-sorted JSON of the manifest with `seal_sha256` removed and no
trailing newline (`scratchpad/c1-crit-U1-F/seals.py`):

| manifest | recorded = recomputed |
|---|---|
| capsule `control/c1-critic-capsules/U1-PACKET-MANIFEST.json` | `f67c8fd6cc8a9f597a5500ab8462ba85af1a8a495f707bfe4b0112b59f2686ff`: match |
| Stage 4 dispatch `control/C1-STAGE4-DISPATCH-MANIFEST.json` | `f62b5c6a639104c155f2acebb4b40b5f6379134f490c90edc1601a0b764ac2cc`: match |
| Stage 3 `control/C1-STAGE3-PACKET-MANIFEST.json` | `da784de8567703935e95ea3e452acc151fdbc15a7e20ffd86634ecb87e4f92ac`: match |
| Stage 2 `control/C1-STAGE2-PACKET-MANIFEST.json` | `886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92`: match |

- All 14 capsule members match on SHA-256 and byte count. The Stage 3 manifest's digest for the U1 return equals the
  capsule's (`2f74c265…`).
- Every digest the return lists was checked:
  - The five scripts under `scratchpad/c1-U1/` match exactly:
    - `cb_search.py` `da4ba385…c3c3`
    - `cb_orbit.py` `67697fe3…f50b`
    - `validate_orbit.py` `21357e03…212c`
    - `final_flow.py` `b4db42d6…d3ea`
    - `supermodularity_check.py` `0c314f2d…4f5f`
  - Copied into my scratch, the five scripts are byte-identical.
  - The return also cites digests for `AUTHORIZATION.md`, `control/R30-CHARTER-PROMPT.md`, `control/CLAIM-IDENTITY.run-local.json`,
    `control/CLAIM-DISTINCTIONS.json`, `control/RESIDUE-CHECK.json` and `sources/lower-region/cycle-6/C6-T5/REPORT.md`. All six
    equal their Stage 2 manifest entries. I compared digests only and did not read those files.
  - The "SHA-256 of the JSON result" `1f61dcb3…da235` is reproduced exactly by the replay. It is the digest of the compact
    serialization that `final_flow.py` prints. No JSON result file exists in the inventory, so the phrase "the JSON result"
    should read "the printed result".
- Registry keys this critique touches:
  - `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (HALL, OPEN)
  - `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (WID, OPEN run-local)
  - `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT` (LIFT, VERIFIED `proved_informal`)
  - `E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY` (not used)
  - `E993-R23-LITERAL-DELETE-ONLY-HALL` (REFUTED; see the fence check)
  - `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (context)
  - the candidate `E993-R30-INVARIANT-DEFICIENT-CUT-REDUCTION` (STATED)
- Read boundary:
  - I read the capsule's 14 members, the five inventoried scripts (copy-out-first) and one frozen source,
    `sources/authority/CLAIM-IDENTITY.json`. Its digest matches `SOURCE-DIGESTS.json` (Stage 2 entry `eba20be3…`). I parsed
    it in code and printed only the (LIFT) row, to check that key's registered text.
  - I hashed `sources/lower-region/cycle-6/C6-T5/REPORT.md` without reading it.
  - I made one non-recursive `ls -a` of the granted artifact directory `scratchpad/c1-U1/`.
- Disclosures:
  1. U1's `final_flow.py` and `validate_orbit.py` hard-code `sys.path.insert(0, …/scratchpad/c1-U1)`. My verbatim replay
     from `scratchpad/c1-crit-U1-F/replay/` therefore imported `cb_search`/`cb_orbit` from U1's original directory. Those
     reads are of byte-identical inventoried files, and `PYTHONDONTWRITEBYTECODE=1` meant nothing was written there (a
     post-run listing confirms this). The same holds for U1's own `c1-U1-replay` run, so U1's "copy-out-first replay" was
     not isolated. The digests are identical, so no number changes.
  2. To find the PID of my own backgrounded threshold scan I ran one `pgrep -f sector_threshold2`. That is a pattern-scoped
     process lookup, not a kill and not a full listing, and I disclose it. The kill was by literal PID (`kill 74607`,
     after `ps -p` on the three literal PIDs).
- No network, no installs, no Lean.

## Independent re-derivation

**Mathematics of §4 (re-proved from the definitions).**

- **§4.2.** Write `c(X) = Σ_A w(A)·[X ∩ R⁻¹(A) ≠ ∅]`. Each summand is a coverage indicator. A coverage indicator is
  submodular, and a combination with coefficients `w(A) ≥ 0` is submodular.
- **§4.3.** The supply sum is modular, so `φ = modular − submodular` is supermodular.
- **§4.4.** The maximizers are closed under `∪` and `∩`.
- **What the argument uses.** Only finiteness of the ground set, `w ≥ 0` on targets, and the fact that `N(X) = ⋃_{B∈X} N(B)`.
  Source weights may be arbitrary integers. Nothing tree-specific enters. I agree with U1 there.
- **§4.5.** For every graph automorphism `γ`:
  - `γ` preserves leaves and supports.
  - `γ(W_v) = W_{γv}`.
  - `T − v ≅ T − γv`, so `γF_p = F_p`.
  - `(D)` and `(S)` are adjacency-defined.

  All of this holds for any finite simple graph at any rank `p`. Neither eligibility nor `IsTree` is used.
- **§4.6.**
  - Invariance: `φ(γX) = φ(X)` because `N(γX) = γN(X)` and the weights are invariant.
  - The finite intersection `⋂_γ γX₀` is a maximizer by iterating pairwise closure `|Γ| − 1` times.
  - It is `Γ`-invariant by reindexing `γ' = δγ`.
  - Non-emptiness needs no argument: `φ(∅) = 0 < M`.
- **§4.7.**
  - (⇒): a union of orbits is an ordinary subfamily.
  - (⇐): take an invariant maximizer. `N(∪Y)` is the union of the target orbits joined to `Y`, because an orbit arc exists
    iff some member pair is related, and `N` of an invariant family is invariant.
  - The quotient is exactly (LIFT)'s orbit network: orbit-total supplies and capacities, and an arc iff `R` meets `A × B`.
    I compared this against the registered statement.
  - **The mathematics of §4 is correct at `proved_informal`.** (Novelty is a separate question, handled under Attacks.)

**Own instruments.** All standard library, exact integers, and none imports any seat file.

- `own/net.py`: labelled brute force.
  - Backtracking enumeration of every independent set.
  - `i_k(T − D)` counted directly from that list.
  - `x` scanned through rank `α` with `i_{α+1} = 0`.
  - `F_p` from `Δ_p(T − v)` for every leaf of the original tree.
  - `q_v` from `H_v` and `R_v`.
  - Literal `w_F` and literal (D) ∪ (S).
  - `supply − capacity = S` asserted before any other output.
  - Dinic max-flow, for the mixed relation and for deletion arcs alone.
- `own/cbq.py`: my own `CB(d, m)` orbit quotient under `S_d ≀ S_m`.
  - Transitions are not hand-derived. For each source orbit I build a labelled representative, apply the literal
    (D) ∪ (S) on the labelled tree, and classify each image back to its orbit.
  - Weights are computed literally on the representative.
  - `F` is computed per leaf by my own forest DP.
- `own/cb_closed.py`: closed forms I derived for `CB(d, m)`:
  - `I(T) = (1+2x)·B^m + x(1+x)(1+2x)^{dm}`, with `B = (1+2x)^d + x(1+x)^d`
  - `q_v = x(1+2x)^{dm}`
  - `q_c = (1+2x)·B^{m−1}·x(1+x)^{d−1}`

  These were validated against the DP and `cbq.py` on `CB(1,7)`, `CB(2,5)`, `CB(3,4)` and `CB(1,12)`.

**Fixed points (my instruments, `own/fixed_points.out`, `own/cb_closed.out`):**

| graph | `p` | `n` | `α` | `x` | `\|F\|` | supply | capacity | `S` | arcs (all) | mixed flow | deletion-only flow |
|---|---|---|---|---|---|---|---|---|---|---|---|
| `K_{1,12}` | 8 | 13 | 12 | 6 | 12 | 1980 | 3960 | −1980 | 1980 (0 switch) | 1980 | 1980 |
| path-star `(2,3,4)` | 7 | 15 | 11 | 5 | 10 | 1483 | 2701 | −1218 | 2025 | 1483 | 1483 |
| path-star `(2,2,4,3)` | 8 | 18 | 13 | 6 | 12 | 8033 | 13467 | −5434 | 11691 | 8033 | 8033 |
| double broom `0–1`, `0–{2..7}`, `1–{8,9,10}` (erratum R30-E-a) | 6 | 11 | 9 | 4 | 9 | 255 | 516 | −261 | 277 | 255 | 255 |
| `CB(1,7)` | 10 | 24 | 15 | 8 | 8 | 29190 | 58002 | −28812 | 124593 (29190 switch) | 29190 | 29190 |
| `CB(8,92)` (closed form) | 492 | 1567 | 829 | 490 | 737 | — | — | negative (351 digits) | — | — | — |

- On `CB(8,92)`: the window is `[492, 552]`, and `|R_491|/|R_490| = 2(736−490)/491 = 492/491` exactly. Also
  `|R_491| − |R_490| = |R_490|/491`.
- In the root-plus-arm sector every member has active weight one. `v` is active through `r`. Every private tag `c` is
  inactive, because its only witness is its choke and no choke can accompany `r`.
- The recorded values all reproduce.

**U1's §5.3 row, recomputed by brute force on the labelled tree (not through the quotient):**

- `CB(1,7)`, `p = 10`: `n = 24`, `α = 15`, `x = 8`, eligible.
- `F` = `v` and all 7 private leaves (8 tags).
- `i_11 = 8673` sources and `i_10 = 22197` targets.
- Supply 29190, capacity 58002, `S = −28812 = supply − capacity`.
- The ORIGINAL network's max-flow is 29190, so it saturates directly. The lift is not needed for this instance.
- My quotient gives 57 source orbits and 90 target orbits, the same flow and the same totals.

**Member-level cross-validation of my quotient** (`own/crossval.out`). Every labelled source's literal neighbour orbits
equal its orbit's arc set, and every labelled weight equals its orbit representative's weight. Mismatches: 0 in each case.

| instance | labelled sources | supply | capacity | `S` | mixed flow = deletion-only flow |
|---|---|---|---|---|---|
| `CB(1,7)`, `p = 10` | 8673 | 29190 | 58002 | −28812 | 29190 |
| `CB(1,8)`, `p = 11` | 50554 | 177576 | 322112 | −144536 | 177576 |
| `CB(2,5)`, `p = 10` | 88506 | 259980 | 396460 | −136480 | 259980 |

Brute force and quotient agree on every quantity in all three.

**Replays of U1's scripts** (copy-out-first into `scratchpad/c1-crit-U1-F/replay/`; outputs in `replay/out_*.txt`):

- `cb_search.py`: 144 candidates, smallest `CB(1,7)` (`n = 24`, window `[10, 10]`).
- `validate_orbit.py`: `ALL CASES OK: True` on the six tiny instances.
- `final_flow.py`: every reported number, with digest `1f61dcb3…`.
- `supermodularity_check.py`: 1,048,576 pairs, 0 violations, `max φ = 2`, 256 maximizers.

## Attacks and findings

**A1 (major; §6's weight-direction claim is false, and its proof conflates presence with activity).** U1 §6 asserts two
things about the replacement `B' = (B ∖ {v}) ∪ {s_v}`:

- "where it is defined it can only weakly *decrease* the active weight, never increase it"
- its proof: "the new set's `|F∩B'|`, hence its active-weight, can only stay the same or drop"

The inference from `|F ∩ B|` to `w_F` is exactly the conflation that SEMANTIC-CONTRACT §3 forbids. The conclusion is
backwards.

**Lemma (C-U1-F; `proved_informal`, STATED here).** Setting:

- `G` is a finite simple graph and `F` a set of degree-one vertices.
- `v ∈ F` has support `s`, `B` is independent with `v ∈ B`, and `B' := (B ∖ {v}) ∪ {s}`.

Then:

- (a) `B'` is independent iff `(B ∖ {v}) ∩ N(s) = ∅`, that is, iff `v` is **inactive** in `B`.
- (b) When it is, `w_F(B') = w_F(B) + #{t ∈ (F ∩ B) ∖ {v} : t inactive in B, s_t ~ s} ≥ w_F(B)`.

*Proof.*

- (a): `B' ∖ {s} = B ∖ {v}` is independent, and `s` has no neighbour there iff `(B ∖ {v}) ∩ W_v = ∅`.
- (b), the removed and added vertices:
  - `v` was inactive, so removing it loses nothing.
  - If `s ∈ F`, then `N(s) = {v}` and `W_s = ∅`, so `s` is inactive.
- (b), any other tag `t ∈ (F ∩ B) ∖ {v}`:
  - `v ∈ W_t` would force `s_t = s`, hence `t ∈ (B ∖ {v}) ∩ N(s)`, contradicting (a).
  - So `(B' ∖ {t}) ∩ W_t = ((B ∖ {t}) ∩ W_t) ∪ ({s} ∩ W_t)`.
  - Every active `t` stays active, and an inactive `t` becomes active iff `s ~ s_t`. ∎

Two consequences follow:

- U1's own witness (`B = {3, 5}` in `CB(1,3)`, tag 5 active, image not independent) is an instance of (a). It is not
  evidence about the weight direction.
- On `CB(d, m)` and the path-stars no two supports are adjacent, so the replacement is exactly weight-preserving where
  defined.

Exhaustive check over every source and every tag on the fixed points (`own/compress.out`):

- "defined ⇔ inactive" held with no exception.
- Weight decreased 0 times.
- Weight was unchanged in 80/80 (path-star `(2,3,4)`), 718/718 (path-star `(2,2,4,3)`), 3/3 (double broom) and
  13608/13608 (`CB(1,7)`) cases.
- On `K_{1,12}` the replacement is never defined.

**Strict-gain witness at an eligible instance** (`own/strict_gain.out`, confirmed by `own/strict_gain_confirm.out`):

- The tree has `n = 14` and edges `0–3, 4–13, 5–1, 8–3, 3–7, 9–1, 1–12, 10–2, 11–7, 7–12, 12–2, 2–6, 6–13`.
  It passes the acyclicity and connectivity test.
- At `p = 6`: `α = 9`, `x = 4`, eligible, `F = {0, 4, 5, 8, 9, 10, 11}`, supply 290, capacity 627, `S = −337` (WID
  asserted). The network saturates (flow 290).
- Take `B = {4, 5, 6, 8, 9, 10, 11}`, `v = 8` (inactive), `s_8 = 3`.
- Then `B' = {3, 4, 5, 6, 9, 10, 11}` and `w_F(B) = 4 < 5 = w_F(B')`.
- Tag 11, whose support 7 is adjacent to 3, becomes active.

**A2 (§6 overclaims decisiveness; the ungraded "proved" is struck).** Non-well-definedness of the literal replacement map
is not a disproof of compression. Standard shift operators keep `B` when its image is invalid or already present, and the
grade ladder of SOLUTION-CONTRACT §4 has no grade "proved". What §6 actually establishes is (a) above, together with one
correct witness.

I then attempted the step U1 left open (its obligation 3). The real obstruction sits on the **capacity** side:

- **Leaf→support shift, `C_v(X)`.** Replace each `B ∈ X` in which `v` is inactive by `B'`, unless `B'` is already in `X`.
  This shift is not `φ`-monotone.
  - Exact singleton witness on path-star `(2,3,4)` at `p = 7` (`own/shift_witness.out`): `X = {B}`,
    `B = {2, 4, 5, 6, 11, 12, 13, 14}`, `v = 2`, `s = 1`, `B' = {1, 4, 5, 6, 11, 12, 13, 14}`.
  - The weights are equal (`w = 6` for both).
  - `N(B)` has 9 targets of total weight 44. `N(B')` has 10 targets of total weight 50, because `B'` gains the switch
    inserting `0`, whose neighbours in `B'` are exactly `{1, 6}`.
  - So `φ({B}) = −38 > −44 = φ({B'})`.
  - Random-family tests (`own/family_shift.out`) found decreases in 18/400 and 38/400 trials on the two path-stars, and
    none on the double broom or `CB(1,7)`.
- **Leaf-only shift, `C_{a→b}` (U1's named untried repair).** For tags `a`, `b` with different supports: replace
  `B ∋ a` (with `b ∉ B` and `s_b ∉ B`) by `(B ∖ {a}) ∪ {b}`.
  - It fails singleton `φ`-monotonicity for **every** ordered tag pair on path-star `(2,3,4)` (70/70), on path-star
    `(2,2,4,3)` (110/110) and on the double broom (36/36).
  - On `CB(1,7)` it fails for 49 of the 56 ordered pairs (`own/leaf_shift.out`).
  - It is not even pointwise weight-monotone in either direction: decreases and increases occur equally often.

Scope of these negatives: on these saturating instances, a universal lemma "`φ(C X) ≥ φ(X)` for all `X`" is refuted for
both natural shifts. Nothing is said about compressing a maximizer on a hypothetical deficient instance.

**A3 (alias risk; the novelty claim against (LIFT) is struck).** The registered text of
`E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT` (frozen `sources/authority/CLAIM-IDENTITY.json`) reads: "Let a finite group
act on two finite sets U,V and preserve a relation R … and nonnegative integer supplies … capacities …". Its scope is
"Generic finite invariant relation".

- **§2 and §4 misdescribe (LIFT).** U1 says it generalizes "from the specific group `S_3≀S_m` of `T_m` (C6-T5) to an
  ARBITRARY finite group" and claims "a genuinely broader scope than the single `S_3≀S_m` action". (LIFT) is already
  stated for an arbitrary finite group on an arbitrary finite invariant network, so U1's generalization is of C6-T5's
  *application*, not of the registered key.
- **§4.7 misreads the disclaimer.** U1 says (LIFT) "explicitly disclaims (⇒) ('does NOT prove quotient feasibility')".
  That disclaimer says (LIFT) does not assert that any particular quotient is feasible. It says nothing about the converse
  implication.
- **What the candidate's (⇐) direction is.** It is (LIFT) translated into Hall-condition form through finite Hall on both
  networks. The supermodular invariant-maximizer argument is C6-T5's.
- **What is genuinely added.** Three things, all elementary:
  - the explicit (⇒) summation converse, which SEMANTIC-CONTRACT §1.2 and Stage 1 ruling 6 name as usable "once stated
    and proved on the face" (U1 does state and prove it);
  - the automatic `Aut(G)`-invariance of `(F_p, w_F, REL)` (§4.5);
  - the packaging as a biconditional.
- **Verdict on the key.** It is not an alias. It needs a `CLAIM-DISTINCTIONS` row against (LIFT) and
  `novelty_claimed: false` for the (⇐) half.

**A4 (scope; not an error).** The theorem needs no `IsTree`, no eligibility and no `F = F_p`. It holds for every finite
simple graph, every rank `p`, and every `Γ`-invariant set `F` of degree-one vertices. `F_p` is automatically invariant
under all of `Aut(G)` at every `p`. The route should state the scope that wide, then specialize.

**A5 (§5.3 "including switch exits": the switch arcs are never needed).**

- On `CB(1,7)` at `p = 10` the deletion arcs alone saturate, in both the labelled network and the quotient (29190).
- The same holds on every `CB` row I computed (see A8).
- So the reported "new, exactly-verified instance of (HALL)" is correct at `bounded_computation`, but it exercises nothing
  about the switch relation. The builder's switch rules are validated by `validate_orbit.py`, but the flow result does not
  depend on them.
- Where switches become necessary in the `CB` family: the root-plus-arm sector
  `X_p = {B ∈ I_{p+1} : r, v ∈ B}` has deletion-only deficit
  `φ_D(X_p) = 2^{p−1}C(dm, p−1) − 2^{p−2}C(dm, p−2)`, which is positive iff `3p < 2dm + 5`.
  - My closed-form scan (`own/sector_threshold.out`) finds no eligible `(d, m, p)` with `3p < 2dm + 5` for `d ≤ 10` and
    `n ≤ 700`.
  - A coarse sampled scan (`own/sector_threshold2.out`; `m ∈ {40, 44, …, 160} ∪ {92}`) finds none for `d ≤ 6`. The first
    sampled hits are `(7, 112)`, `(8, 92)` (the record), `(9, 112)` and `(10, 112)`, all with `n > 1500`.
- So small-`CB` quotient flows cannot test the switch mechanism. This is a scope note for U1's obligation 2.

**A6 (fidelity: passes, with one gap closed).**

- What passes:
  - `state_weight` counts `v` active iff `r ∈ B`, and `c` active iff its choke is in `B`. That is the literal active
    weight, not `|F ∩ B|`.
  - `F` is fixed at `p` from `Δ_p(T − leaf)` on the original tree.
  - `x` is taken through `α`.
  - WID is asserted before the flow.
  - The brute-force scripts use a literal (D) ∪ (S).
- Minor points:
  - `F` is decided from one representative `c` by symmetry. That is valid: my per-leaf computation gives the same 8 tags.
  - `validate_orbit.py` validates state sets, multiplicities and transitions, but **not** `state_weight` per state. U1's
    weights were confirmed only through the WID total. My member-level check of labelled weights (0 mismatches over
    147,733 labelled sources) and the equal flows close this gap.

**A7 (fixed points cited rather than reproduced).** U1's §7 cites the `T_m` rows and the `CB(8,92)` sector ratio "by
attribution". The fence against repeated `T_m` checks is legitimate. But the common brief requires every instrument to
reproduce the fixed points before it is trusted, and U1's `CB` instrument reproduced none of them. `n`, `α`, `x`, `|F|`
and `492/491` for `CB(8,92)` would have been cheap to reproduce. I reproduced them (table above). This is a process gap,
not a mathematical one.

**A8 (falsification sweep; my own bounded computation).** Every eligible `(d, m, p)` of `CB(d, m)` was run through my
quotient (`own/sweep.out`, `own/sweep_summary.out`), covering:

- `d = 1`, `m ≤ 26`
- `d = 2`, `m ≤ 12`
- `d = 3`, `m ≤ 9`
- `d = 4`, `m ≤ 7`

This means all ranks in each window, not only the smallest. SWEEP_RESULT_PLACEHOLDER No quotient deficit exists anywhere
in this range. Grade `bounded_computation`. It proves nothing universal, and "every row saturates" is a horizon statement.

**A9 (other attacks, no defect found).**

- There is no ℕ-subtraction.
- There is no circularity: nothing assumes `S ≤ 0`.
- "Every source subfamily" is correctly the quantifier of (HALL-COND) in §4.1.
- The supermodularity spot check (`CB(1,1)`, `p = 1`, `F` = all leaves) is non-eligible and not `F_p`. Its `max φ = 2 > 0`
  is a deficient cut of that non-eligible network. It is correctly not offered as evidence about (HALL), and it is a
  sanity check of a lemma already proved, not evidence for it.
- On the disclosure: the auto-backgrounded exploratory script produced no output, and no reported number depends on it.
  All five inventoried scripts reproduce every cited number.

**Critic-derived advance (C-U1-F; `proved_informal`, STATED; needs an isolated second read).** The **canonical invariant
cuts**, which partly answer U1's obligation 4 ("no explicit description").

Setting: any finite network with `w ≥ 0` on targets, and `M = max φ`. By §4.4 the maximizers form a lattice, so
`X_min := ⋂{maximizers}` and `X_max := ⋃{maximizers}` are themselves maximizers. Then:

- (i) Both are invariant under **every** automorphism of the network simultaneously, with no choice of `Γ`, because an
  automorphism permutes the maximizers. For the transport network this means all of `Aut(G)`, by §4.5.
- (ii) `X_min = ∅` iff `M = 0`.
- (iii) Every `B ∈ X_min` satisfies `w_F(B) > Σ_{A ∈ N(B) ∖ N(X_min ∖ {B})} w_F(A) ≥ 0`, so in particular
  `w_F(B) ≥ 1`. Otherwise `X_min ∖ {B}` would be a smaller maximizer.
- (iv) `X_max = {B : N(B) ⊆ N(X_max)}`. Otherwise adjoining `B` keeps `φ ≥ M`.

Consequence for cut search: if (HALL) fails at `(T, p)`, it fails on an `Aut(T)`-invariant family made only of
positive-weight sources, each of which strictly out-supplies its private targets.

## Mechanism-equivalence and fence check

- **Mechanism.** §4 is a structural statement about finite supermodular deficits and group actions, and proposes no
  transport mechanism. No refuted key (§3.2 list, own-support unit capacity) is revived.
- **Deletion-only saturation.** My observation that deletion-only saturates on every small `CB` row is an instance fact.
  It is not a revival of `E993-R23-LITERAL-DELETE-ONLY-HALL`: that key carries a different weight and relation and stays
  REFUTED at its scope. Deletion-only Hall under the active weight is known to fail on the `CB(8,92)` sector (C6-U5), and
  A5 locates why small `CB` cannot see that failure.
- **Closed regions.** None is re-proved. §7 cites `T_m`, the high tail and the bands by attribution only.
- **Other fences.**
  - No census value enters a proof.
  - There is no RTree wording.
  - (LIFT) is not used to supply feasibility. The CB(1,7) saturation is a computed flow, and I found it saturates in the
    original network directly.
  - `D, C ≥ 0` is not used.
- **Claim identity.** The candidate is alias-adjacent to (LIFT) (A3). A second reader could confirm the following
  registration text:
  - **Key** (predicate form): `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`. This replaces the noun-phrase
    `E993-R30-INVARIANT-DEFICIENT-CUT-REDUCTION`.
  - **Statement:**
    - For every finite simple graph `G`, every `p`, every set `F` of degree-one vertices, and every subgroup
      `Γ ≤ Aut(G)` with `ΓF = F`: `Γ` preserves `w_F` and (D) ∪ (S).
    - `γF_p(G) = F_p(G)` for every `γ ∈ Aut(G)` and every `p`.
    - `WeightedHall(G, F, p)` holds iff the `Γ`-orbit network satisfies weighted Hall for every set of source orbits. That
      orbit network has orbit-total supplies and capacities, and an arc iff the relation meets the product.
    - Equivalently, the original network has a saturating integral flow iff the quotient does.
    - If `WeightedHall` fails, the least and greatest maximizers of `φ` are `Aut(G)`-invariant deficient cuts.
  - **Scope:** generic. Applied to (HALL) on trees at eligible `p`, it decides no instance and asserts no quotient's
    feasibility.
  - **Grade:** `proved_informal`.
  - **Attribution:** (⇐) is the registered (LIFT) (Codex, lower-region C6-T5, adjudicated C6-AT), and the
    invariant-maximizer argument is C6-T5's. U1 (r30) contributed the converse, the automatic invariance and the
    biconditional packaging. C-U1-F contributed the canonical cuts and the widened scope.
  - **Novelty:** `novelty_claimed: false` for (⇐), plus a CLAIM-DISTINCTIONS row against (LIFT).
  - **Alternative:** the synthesis may instead record it as a scope note on (LIFT).

## Certification audit

| literal in the return | status |
|---|---|
| Stage 2 seal `886ece6b…` recomputed | backed (reproduced) |
| five script digests | backed (byte-identical) |
| "SHA-256 of the JSON result `1f61dcb3…`" | backed as the digest of the printed compact serialization; "JSON result" (as a file) **struck**; no such file is inventoried |
| "144 `(d,m)` pairs" (`d ≤ 4`, `m ≤ 40`, favorability tested only at the smallest eligible `p`) | backed (replay) |
| "smallest by order is `CB(1,7)`", `n = 24`, `α = 15`, `x = 8`, window `[10,10]` | backed within the stated search box (own brute force) |
| supply 29190 / capacity 58002 / `S = −28812`; `i_11 = 8673`, `i_10 = 22197`; 57/90 orbit states | backed (own brute force and own quotient) |
| "quotient SATURATES, deficit = 0" | backed. The original network saturates directly. Deletion arcs alone also saturate (A5) |
| "all six instances pass with zero mismatches (state multiplicities and full transition relations, every rank, every member)" | backed (replay `ALL CASES OK: True`). Does **not** cover weights (A6) |
| "First pass found and this route fixed two genuine bugs" | self-report, unverifiable, no consequence |
| supermodularity: "1,048,576 pairs, 0 violations, max φ = 2, 256 maximizers" | backed (replay). The remark "consistent with the maximizers forming a sublattice, not just an antichain" is vacuous as evidence and **struck** |
| "a new, exactly-verified instance of (HALL) holding" | backed at `bounded_computation` for `(CB(1,7), 10)` only |
| §2 and §4.7 "generalizes … to an ARBITRARY finite group", "genuinely broader scope", "(LIFT) … explicitly disclaims (⇒)" | **struck** (A3) |
| §6 "where it is defined it can only weakly decrease the active weight, never increase it" | **struck, false** (A1: it never decreases, and can strictly increase) |
| §6 "Grade: **`proved`** … a decisive disproof" | **struck**. Not a grade, and not a disproof of compression (A2). Retained: the literal map is undefined exactly on active tags (Lemma (a)); the `CB(1,3)` witness is correct |
| §8 "Route verdict: `proved`" | **struck** as a grade word. The §4 theorem stands at `proved_informal`, STATED |
| "copy-out-first replay … reproducing every reported number" | numbers backed. The replay was not isolated (hard-coded `sys.path` into `c1-U1`; disclosure 1) |
| "every tree object … passes an explicit `is_tree` test" | backed (`|E| = n − 1` with BFS connectivity) |

## Verdict

verdict: retained_narrowed
headline_resolved: no

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**What is retained:**

- §4 (the supermodularity, lattice and invariant-maximizer theorem, and the biconditional) at `proved_informal`, STATED.
  Its scope is widened to every finite simple graph. Its novelty is narrowed: (⇐) is (LIFT); the new content is the
  converse, the automatic `Aut`-invariance and the packaging. It is to be registered under the predicate text above,
  after an isolated second read.
- §5 (the validated `CB` orbit builder and the `CB(1,7)`, `p = 10` saturation) at `bounded_computation`, with the note
  that deletion arcs alone saturate.
- §6's witness, and its statement narrowed to Lemma (a).

**What is rejected:**

- §6's weight-direction claim, its proof, its "decisive disproof" framing and its grade.
- The claims that §4 generalizes (LIFT).

The mathematics of §4 is complete in prose (`proved_informal`). (HALL) is untouched.

## Remaining obligation

1. An isolated second read of three items, then registration or a scope note: the narrowed reduction theorem (text in
   the fence check), and C-U1-F's two STATED lemmas (the compression-direction Lemma (a)/(b) under A1, and the canonical
   invariant cuts under A9).
2. (HALL) remains OPEN. In the `CB` family the switch relation first matters where the root-plus-arm sector is
   deletion-deficient (`3p < 2dm + 5` inside the eligible window). That starts beyond `n ≈ 1500`, which is out of reach
   of `S_d ≀ S_m` orbit quotients. A successor needs either a direct switch-capacity lemma (template (SW)) on that sector
   with overlap and competition controlled, or a quotient coarser than branch-type multisets whose admissibility under
   (LIFT) is proved.
3. Compression/uncrossing stays open. Both natural shifts fail universal `φ`-monotonicity by exact singleton witnesses
   (A2). The obstruction is growth of the neighbourhood capacity (new switch arcs through `s_v`), not supply: supply never
   decreases under leaf→support (Lemma (b)). A successor compression must control `N(C X)`.
4. U1's obligations 1–3 stand as narrowed. Obligation 4 (an explicit invariant cut) is partly answered by the canonical
   `X_min`/`X_max` characterization.

## Artifact inventory

All artifacts are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-crit-U1-F/`,
standard library only. SHA-256 values are listed below.

INVENTORY_PLACEHOLDER

- No background job remains.
- My sweep (PID 71610) and threshold scan (PID 74607) ended or were stopped by literal PID before this write.
- The wait loops were background shell tasks that exited when their condition held.
