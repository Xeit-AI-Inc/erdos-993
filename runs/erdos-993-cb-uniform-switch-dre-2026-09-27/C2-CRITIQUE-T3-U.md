# Critique

Critic `C-T3-U` (Cycle 2, r31; orientation U, formal/structural) of seat T3's return, route `C2-T-03`, mechanism token
`MARK-CLONE-CRITERION-FLOW-EXPLICIT-AT-TOP-RANK` (orientation T). Run root
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27`.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file outside this run root. Subsystems
loaded: the constitution and the startup protocol only. The controller owns conversation logging for this run; I wrote no
conversation log.

**Read-boundary disclosures.** (1) The harness put the project `CLAUDE.md` and the user memory index in my context
automatically. I opened neither with a tool and used neither. (2) At the end of the run I checked for stray jobs with
`pgrep -lf "lean|lake|python3"`. That was a pattern-scoped listing, not a literal-PID check. Its output showed the command
line of another seat's live process: the opening lines of critic C-U2-F's script, `scratchpad/c2-crit-U2-F/py/cb_struct.py`
(a docstring naming its checks). I did not open that file and used nothing from it. My instruments and findings were already
final and hashed when the listing ran. The right check was the one I also made: I started no background job. (3) The
following reads were all inside the grant or the PATH-CHECK allowed roots. I ran non-recursive `ls` and `grep -r` inside
`sources/`; `ls -la` on `scratchpad/c2-T3/`, whose inventoried artifacts the protocol lets me replay; `which lake lean`,
`ls ~/.elan/bin`, and `ls /Users/ashtonsperry/.local/share/verityos/lean/` to locate the pinned toolchain; and a Lean build
that reads the shared Mathlib packages through a manual symlink. (4) I read the full registry entries of the homogeneous and
the heterogeneous criterion keys in `sources/authority/CLAIM-IDENTITY.json`, and the frozen Cycle 1 run-local registry
snapshot and close under `sources/c1-results/` (all Stage 2 sources). Every check of arc values and loads below is against
the HOMOGENEOUS key's text. The heterogeneous key is cited once only, to note that my independently derived totals match its
printed ones. (5) No network, no installs, no `/tmp`. No `lake update` or `lake clean`. I killed no process, because I never
backgrounded any job. I did not open DISPATCH-T3; I checked its digest only against the sealed Stage 3 manifest entry.

## Identity and seal audit

- Dispatch `control/dispatch/c2-stage4/DISPATCH-C-T3-U.md`: SHA-256 `61593db1…2b8`, **match**.
- Capsule `control/c2-critic-capsules/T3-PACKET-MANIFEST.json`: I recomputed the inner seal as SHA-256 of the canonical JSON
  without `seal_sha256` (sort_keys, `(",", ":")`, no trailing newline). It is
  **`cf5decbd68d1ebcb977e9608c3ea97cd4e86c8b6e320240c3b311dcc46bedc9b`, match**. All 14 listed files match in bytes and
  SHA-256.
- The other seals, each recomputed the same way:
  - Stage 2 `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`: match.
  - Stage 3 `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5`: match.
  - Stage 4 dispatch `af5d13510a82108cb7e584d0909f5f1fee4055d0f2a6448e9dde08411a2145bb`: match.
- Return `cycles/cycle-2/stage3/returns/T3/RETURN.md`: `3d042554…1c8d`, matching the capsule and the Stage 3 manifest.
- Every digest the return lists matches the manifests:
  - DISPATCH-T3 `498c26e3…`.
  - SR-2 `417800f6…` and SR-3 `4009f457…`.
  - The C1-LA3 `Main.lean` (`c0605e12…`) and the C1-LA2 `Main.lean` (`a906ec17…`); I also rehashed both files.
  - All four artifacts in `scratchpad/c2-T3/` (`845e1f4c…`, `62ba09ed…`, `f753e438…`, `9badd2f5…`).
- **Replays**, copied out first into `scratchpad/c2-crit-T3-U/replay/`, both **byte-identical**:
  - `t3_twobinom.py` reproduces `t3_twobinom.out.json` (`62ba09ed…`), 5.7 s.
  - `t3_alias.py` reproduces the stdout of record (`9badd2f5…`).
- **Registry keys touched:**
  - The homogeneous criterion key `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (VERIFIED,
    `proved_informal`), its note CD-2 `[r30 C4; SR-C4-6]`, and the `[r31 C1; SR-2]` note.
  - `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` (`proved_informal`; the r31
    note gives the Darroch-free strict instance at `p*`).
  - `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`.
  - `E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107`
    (VERIFIED `proved_informal` in the frozen c1-close run-local snapshot).
  - `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`, through its companion
    `exists_saturatingFlow_of_weightedHall` (hypothesis `WeightedHall G F p`).
  - The return proposes no new key, and neither does this critique (see the mechanism section).

## Independent re-derivation

**(R1) Why the class load is `ρ_q`. Own derivation, an exact generating-function identity.**

For an `r`-free set, the arm `{s, v}` contributes `(1+2y)` and a closed choke contributes `(1+2y)^d`. An open choke `i`
(`u_i` present, so every `b_ij` is absent) contributes `y(1+y)^d`, and its present private leaves are exactly the active tags.
Weighting by `w_F` (with `F ⊇ C`) and marking one open choke's tag count gives the total weight at size `k` of the `r`-free
sets with exactly `q` open chokes:

`W_q(k) = d·q·C(m,q)·r_q(k−q−1)`, where `a_q = qd−1` and `b_q = d(m−q)+1`.

So `Σ supply / Σ capacity` inside class `q` is exactly `ρ_q = r_q(p−q)/r_q(p−q−1)`. A deletion arc that removes no choke keeps
the class, which makes `ρ_q·w_F(A)` the only uniform load a class-preserving flow can have. Literal check (`crit_literal.py`):
the identity holds on every class, at both layers, at all 76 `(d, m, p)` rows of six trees: CB(8,1), CB(3,3), CB(2,4),
CB(6,2), CB(1,7), CB(4,3).

**(R2) The explicit arc values. Critic-derived; T3 did not supply them.**

I derived these from the homogeneous key's proof of record: the clone split, `P_q = B_1^{a_q} × Λ^{b_q}`, biregular covers,
and a type-symmetric transport. Fix a source `B ∈ I_{p+1}` with `r ∉ B`, `q = q(B) ≥ 1` open chokes and `w = w_F(B) ≥ 1`. Put:

- `j = p − q`, `α = w − 1`, `β = j − α` (the number of present vertices on closed legs and on the arm).
- `S_α = N_q(α, j)` and `T_α = N_q(α, j−1)`.
- `G_α = ρ_q·Σ_{α'<α} T_{α'} − Σ_{α'<α} S_{α'}` and `H_α = Σ_{α'≤α} S_{α'} − ρ_q·Σ_{α'<α} T_{α'}`.

Then:

- `f(B, B∖{z}) = G_α / S_α` when `z` is an active tag (a private leaf at an open choke). The `α` clones other than `z` each
  send `G_α/(α S_α)`.
- `f(B, B∖{z}) = w·H_α / (β·S_α)` when `z` is on a closed leg or on the arm (`s` or `v`). All `w` clones use the arc.
- `f(B, B∖{z}) = 0` when `z` is a choke.
- `f(B, ·) = 0` for every source with `r ∈ B`, and for every source with `q = 0` or `w = 0`.

**The arc values depend only on `(q, w_F(B))`**, not on the detailed choke states. Proof:

- **Out.** There are `w` tag arcs, each carrying `G_α/S_α`, and `β` ternary arcs carrying `w·H_α/(β S_α)` in total. The sum
  is `w(G_α + H_α)/S_α = w`, because `G_α + H_α = S_α` by telescoping.
- **In.** Take a target clone `(A, x)` of type `α'`. It has `a_q − α'` Boolean up-covers and `2(b_q − β')` ternary up-covers.
  Counting arcs between types two ways gives `S_{α'+1}(α'+1) = T_{α'}(a_q − α')` and `S_{α'}β = T_{α'}·2(b_q − β')`. So the
  clone receives `(G_{α'+1} + H_{α'})/T_{α'} = ρ_q`, and `A` receives `ρ_q·w_F(A)`.
- **Degenerate cases.** `G_0 = 0`. `H_α = 0` when `β = 0` (then `H_j = r(j) − ρ_q r(j−1) = 0`). `G_{a+1} = 0`.
- **Other targets.** Deleting a choke carries 0, and no deletion from an `r`-free source contains `r`. So targets with
  `r ∈ A` or `q(A) = 0` receive 0.
- **Nonnegativity** is exactly `G ≥ 0`, which is (ii-1), and `H ≥ 0`, which is (ii-2).

**Validation, `bounded_computation`:**

- **Literal networks** (`crit_literal.py`). For each tree:
  - connected with `n − 1` edges;
  - leaves found by degree;
  - `x` computed through `α`;
  - `F_p` derived as `Δ_p(T − v) < 0` on the original tree;
  - (WID) asserted before anything else, with supply − capacity equal to `S(T,p) = Σ_{v∈F_p}[q_v(p) − q_v(p−1)]`, where
    `q_v` comes from separate forest-DP counts of `H_v` and `R_v`. It holds at all 76 rows.

  At all 27 rows where the criterion holds, the explicit `f` covers 3,388,984 arcs. There are 0 negative values and
  0 non-deletion arcs. Row sums equal `w_F(B)` on every non-sector source, with 0 mismatches. Column sums equal `ρ_q·w_F(A)`
  on every `r`-free target with `q ≥ 1` and 0 on every other target, with 0 mismatches. On every switch image (one choke,
  `v` present, `1 ≤ γ ≤ d−1`) the load is exactly `ρ_1·γ`: 0 mismatches over 189,138 switch images at 16 rows. `C ⊆ F_p`
  held at every tested criterion row.
- **Type level on the class.** This check goes through the key's clone quotient (`proved_informal`), not through the literal
  network, which has `n = 17m + 3`. At `d = 8` and `m ∈ {95, 107, 110, 113, 116, 119, 137}` (`crit_typepath.py`), which
  covers the fresh rows 116 and 119 of gate ruling 9 and the controls 107, 110 and 113:
  - condition (i) is strict at every `q`;
  - the gap identity holds;
  - `G, H ≥ 0` with exact out- and in-balance at every `q ∈ [1, m]` and every `α`;
  - `argmax_q ρ_q = 1`;
  - the `ρ_1` fixed points of record at 95, 107 and 110 are reproduced exactly;
  - the smallest normalized ternary total `H_α/S_α` over `β ≥ 1` is `1.29×10⁻³` at `m = 107` and `1.01×10⁻³` at `m = 137`,
    all positive.

**(R3) The type-path inequalities (ii-1) and (ii-2).** I checked T3's proof of (ii-1) line by line. It is correct. The
zero-case sentence is loose but true: when a factor vanishes, the larger-index factor also lies outside the support. I also
**proved (ii-2)**, the half T3 left cited:

1. Use `Σ_{α'} S_{α'} = r(j)` and `Σ_{α'} T_{α'} = r(j−1)`. Then (ii-2) is equivalent to
   `r(j)·Σ_{α'≥α} T_{α'} ≥ r(j−1)·Σ_{α'>α} S_{α'}`.
2. Reindex by the ternary count `β` (`β = k − α'`). Put `S'_β = C(a, j−β)g(β)` and `T'_β = C(a, j−1−β)g(β)`, with
   `g(β) = C(b,β)2^β`. The inequality becomes `r(j)·Σ_{β≤γ₀} T'_β ≥ r(j−1)·Σ_{β≤γ₀} S'_β`, with `γ₀ = j − α − 1`. This is the
   shape of (ii-1) with the roles of the two factors swapped.
3. For `β_x < β_y`, cancel `g(β_x)g(β_y)`; if either vanishes, both sides are 0. The claim `S'_x T'_y ≤ S'_y T'_x` then reads
   `h(u)h(u'−1) ≤ h(u')h(u−1)`, with `h = C(a,·)` (log-concave, no internal zeros) and `u = j − β_x > u' = j − β_y`.
4. Summing over `x ≤ γ₀ < y` gives `Sc'·r(j−1) − r(j)·Tc' ≤ 0`, which is the claim.

This is the "same argument in the ternary count" that CD-2 records, now written out. T3's negative attempt failed only because
it did not pass to the complement before reindexing. Exact grid check (own code): 615,040 `α`-checks over `a, b ∈ [0,30]` and
every integer `j ∈ [−2, a+b+2]`, with 0 failures of (ii-1), 0 of (ii-2), and 0 type-path balance failures.

**(R4) Condition (i).** I re-derived the gap identity `6(p*−q−1) − (3a_q + 4b_q) = 2q + 1` by hand and checked it
numerically at seven rows. The Lean statement `cb8_E1_conditionI_topRank` in C1-LA3 has exactly the two coefficients T3's
`cb8_rho` uses as its numerator and denominator. That alignment is a real strength: `ρ_q < 1` follows once the denominator is
shown positive by `twoBinomCoeff_pos`.

## Attacks and findings

**F1. Load-bearing obligation not met: T3 gives no explicit arc values.**

The allocation asked for "the arc values (as functions of the source's choke states)". §1 of the return restates the
criterion key's CONCLUSION specialised to `(8, m, p*)`: an existential `f` with the key's row and column sums. The Lean main
theorem is that same existential with a `sorry` body. The construction itself is left as "the key's own transport, not
re-derived", so the statement contains no arc values at all.

The fence T3 invokes (ruling 13, "no re-proving the closed") does not forbid writing the key's construction explicitly. The
allocation required it. The gap is closed by the critic in (R2).

**F2. Lean hypothesis defect: nonnegativity is missing.**

I elaborated T3's skeleton verbatim against a byte-identical copy of the C1-LA2 project (`lake build` then `lake env lean`).
**It is well-typed.** Its only warning is "declaration uses `sorry`", on `cb8_markCloneCriterion_flow_topRank`. The
corollary's proof term (`obtain … ; hload A hA hAr (by omega); rwa [hAq] at hA1`) goes through.

The problem is the shape. `∃ f : … → ℚ` is constrained only by `0 < f X A → (arc facts)`. Negative values are unconstrained
and allowed anywhere, including at non-arcs. That makes the hypothesis strictly weaker than the key's conclusion ("a
nonnegative rational function f on the deletion arcs"). U2 needs `0 ≤ f` and `f ≠ 0 → arc` to sum the flow over a family `X`
into `WeightedHall`, which is the hypothesis of `exists_saturatingFlow_of_weightedHall`. So the skeleton does **not** encode
conjunct 4: it covers only non-sector sources, and weight-0 classes are correctly zero. But in its current form it is **not
sufficient** for U2's composition.

Repair: `CriticE1Explicit.lean` elaborates, with one `sorry` warning in the theorem body. It names the flow (`cb8E1Arc`,
the R2 closed form, with integer ranks so no ℕ-truncation can pass falsely), adds `∀ B A, 0 ≤ f B A` and `f B A ≠ 0 → arc`,
and states the row, column and zero clauses. The `sorry` is the proof only; no hypothesis encodes the conclusion.

**F3. The corollary is unusable as a hypothesis.** `cb8_switchImage_criterionLoad` produces a fresh `∃ f` for each target
`A`. A composition needs one `f` serving every target at once, so U2 should consume the main statement (repaired as in F2)
directly. Minor.

**F4. A grade literal is overstated.** §2.1 and §6 grade condition (i) at `(8, m, p*)` "formally_verified". But
`cb8_E1_conditionI_topRank` is companion (E1i) of the C1-LA3 award. The frozen Cycle 1 close (`CYCLE-CLOSE.md` line 27)
records "companions (G) and (E1i) compiled, ungraded", and SOLUTION-CONTRACT §4 says a companion lemma carries no certificate
of its own. The registered grade of condition (i) at `p*` is `proved_informal`: the `[r31 C1; SR-2]` note, Darroch- and
Newton-free, strict form. Struck; see the certification audit.

**F5. An ℕ-guard arithmetic slip, harmless.** §2.1 item 5 says that `(16m+4)/3 − q − 1 ≥ 0` "needs `q ≤ (13m+1)/3`". The
correct condition is `q ≤ (16m+1)/3`. The expression `(13m+1)/3` is SR-2's LOWER bound on `t`, since `t ≥ p* − m − 1`. The
conclusion stands because `q ≤ m`.

**F6. Fidelity failure in Part C.** The toy literal network CB(8,1)/7 sets `F = set(leafset)` "assumed ... not asserted" and
hard-codes the leaf list. It also never asserts (WID). Under the protocol's fidelity-first rule, Part C's numbers are struck
as T3's evidence. My own instrument restores them: at CB(8,1)/7 the derived `F_7` equals the leaf set, (WID) holds with
`S = −336`, and supply 2184, capacity 2520 and 5184 sources / 8332 targets are reproduced. In any case Part C was a max-flow
existence check, not a test of the criterion loads.

**F7. The fresh-row test was not run.** Gate ruling 9 moved the fresh rows to `m = 116, 119`. T3 tested only 110, with 107 as
a control. The allocation's "test the explicit flow at m = 110 exactly on the literal network (loads per target class, both
sides)" was not done: Part B checks only the arithmetic of `r_q` and `ρ_q`. I ran the per-class, both-sides test on literal
networks, and on the class through the clone quotient at 107, 110, 113, 116, 119 and 137 (R2). Nothing failed.

**Target-class census for the E1 flow.** At rank `p*`, `F_{p*} ⊇ C`:

| Target class | Load from E1 | Status |
|---|---|---|
| In-sector (`r, v ∈ A`) | 0 | exact |
| `r ∈ A`, `v ∉ A` (weight 0) | 0 | exact |
| `r`-free, `q = 0` (weight 0) | 0 | exact |
| `u_i`-switch images (`q = 1`, `v ∈ A`, `1 ≤ γ ≤ 7`) | `ρ_1·γ` | exact |
| Other one-choke targets (`s` or empty arm, or `γ = 8`; never switch images) | `ρ_1·w ≤ w` | within capacity |
| Two or more chokes | `ρ_q·w ≤ w` | within capacity |

Here `γ` is the number of private leaves present at the image's single open choke. All of them are active through `u_i`, and
this equals the sector source's `c`-leg count at that choke.

The only doubly-fed class that comes from E1 is the switch images, and their residual is `(1 − ρ_1)γ`. Sector deletions
keep `r`, so E1 and the sector compete for capacity only there. This agrees with T3's §1.

## Mechanism-equivalence and fence check

- **Mechanism.** T3's statement and my explicit `f` are both the homogeneous criterion key's flow at `(8, m, p*)`. Nothing new
  is claimed as a mechanism. The explicit arc formula is the key's own proof of record made explicit. Registering it as a new
  `E993-R31-` key would be a mathematical ALIAS of the criterion key, so I recommend a scope note on that key instead: "explicit
  arc values depending only on `(q, w_F(B))`; (ii-2) written out", with an isolated second read first.
- **What is not relied on.** The key is sufficient, not necessary, and I use it no other way. The distinction rows (per-leaf
  down-map injectivity, R19 unit transport, R23 literal delete-only Hall) are not revived. The deletion-only conclusion is
  kept to non-sector families at `p*`.
- **Scope.** One rank per tree (`p*`), class `m ≥ 107`, `m ≡ 2 (mod 3)`, `d = 8`, for the class claims. The small-tree
  literal runs (other `d`, `m`, `p`) test the key's per-`(d, m, p)` statement, are labelled `bounded_computation`, and support
  no class claim.
- **Darroch/Newton.** Not used anywhere. The only polynomials touched are `r_q`, `C(a,·)` and `C(b,·)2^·`. No status transfers
  to (HALL), the aggregate, TREE, FOREST, TRANSFER or #993. Census values are never proof; the `θ*` law is not used.
- **Ruling 11.** T3 names the homogeneous key. "E1-R" appears once, as a label to avoid, and "coefficient descent" does not
  appear.
- **Alias check.** T3's alias check ran against the 491-claim authority only, not the run-local or concurrent-494 registries
  required by allocation shared rule 6. This is moot because no key is proposed.

## Certification audit

| Literal | Status |
|---|---|
| "formally_verified" for condition (i) (§2.1, §6, the ELIG/HALL prose) | **Struck.** It is a compiled, ungraded companion of C1-LA3. The registered grade is `proved_informal` (SR-2 note). |
| "compiled scratch, no grade" for the §4 skeleton, alongside "not built" | **Struck as T3's claim**, because it contradicts itself. The critic elaborated it: well-typed, exactly one `sorry` (log `t3skeleton.log`). |
| "HALL_formal: advanced" | **Not backed.** No formal object was produced, and the skeleton is `sorry`-bodied and too weak (F2). |
| Part C (2184 / 2520, "saturating") | **Struck** as T3's evidence (F6). The values are restored by the critic's instrument. |
| "0 failures", 75,645 triples; `ρ_1` at 110 and 107 | **Backed**: byte-identical replay, and my independent values match. |
| "ρ_1 = max_q ρ_q" | **Backed at the tested rows only** (`bounded_computation`): T3's 110, my seven rows. Not needed by the corollary. |
| Every artifact digest and every seal the return cites | **Backed.** |
| "U2's obligation is now fully specified at its input boundary" (Remaining obligation 3) | **Struck**, because of F2. |

## Verdict

T3's mathematics is correct where it is asserted:

- the specialised load statement (sources exactly saturated, `ρ_q·w_F` on `r`-free targets with `q ≥ 1`, 0 elsewhere,
  `ρ_1·γ` on switch images, with `γ` the image's present private leaves);
- the proof of (ii-1);
- condition (i) through the gap `2q + 1`.

What is narrowed:

- no explicit arc values (F1), which the critic supplies;
- the Lean hypothesis lacks nonnegativity (F2), which the critic repairs and elaborates;
- the condition (i) grade is overstated (F4);
- Part C fails fidelity (F6);
- the fresh rows were not run (F7), which the critic runs.

I judge the explicit-flow statement complete at grade `proved_informal`, conditional on `F_{p*} ⊇ C` (the favorability key,
`proved_informal` modulo Darroch/Newton). Its inputs are the criterion key and CD-2, with (ii-2) now also proved on the face by
the critic. That conclusion is STATED and needs an isolated second read.

verdict: retained_narrowed
headline_resolved: no

ELIG_formal: not_advanced
HALL_formal: not_advanced
FAV_darroch_free: not_advanced
cut_candidate: none

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

1. **Formalize `cb8E1Arc_spec_topRank`** (critic scratch `CriticE1Explicit.lean`, statement elaborated, proof `sorry`) over
   `cbGraph m`. The nodes it needs:
   - (a) the clone bijection `{B r-free, Q(B) = Q, x ∈ B} ↔ P_q` at rank `|B| − q − 1`;
   - (b) the two biregular double counts;
   - (c) CD-2's two inequalities as `Finset.sum` statements over `polyCoeffZ`-style terms (both halves now have written
     proofs);
   - (d) `ρ_q ≤ 1` from companion (E1i) of C1-LA3 plus `twoBinomCoeff_pos`;
   - (e) the zero clauses.

   U2 should consume the repaired shape (nonnegative, named `f`), never T3's `∃ f` without `0 ≤ f`.
2. **Isolated second read** of R2 (the explicit arc values and their proof) and R3 (the proof of (ii-2)) before any
   registration, as scope notes on the homogeneous criterion key, not as new keys.
3. **Favorability is untouched** and is the only Darroch/Newton dependency on this statement (T1/T2). The E1 part needs only
   `C ⊆ F_{p*}` (T2's private leaves). The arm leaf matters only to the sector.

## Artifact inventory

Scratch: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-T3-U/`.
All computation used `python3 -B`, standard library only, exact integers and Fractions. Everything ran in the foreground;
no background job was started and nothing was killed.

| File | SHA-256 | Role |
|---|---|---|
| `crit_typepath.py` | `8c696eb42bd0bf0be00806719cbc64304c5790c13bd4399ca58d703dc411c718` | type-path totals, balance and nonnegativity at the seven `d = 8` rows; (ii-1)/(ii-2) grid |
| `crit_typepath.out.json` | `ca4cba13bb267efc4784b9c6fca02a6e76917c9851ec7da8929a1d3cf3e4276a` | its output (35 s) |
| `crit_literal.py` | `9540aab54c0b1be862ae907d96eebb9e54a8a58e130d1f80a4d79e9ceb984922` | literal trees, derived `F_p`, (WID), class identity, explicit `f` arc by arc |
| `crit_literal.out.json` | `0b19e204d0bf8bc56f7b763a31242f8585049a4d9168d079d8bd017331184d3e` | its output (99 s) |
| `lean/LeanProject/LeanProof/T3Skeleton.lean` | `497556d9c37d820b0340f5bbbca34c8a48e79e0654f8a80e1d3b81accef91f4e` | T3's §4 block verbatim plus `import LeanProof.Main` |
| `lean/t3skeleton.log` | `141a170c79d2532d6bcece113bf5321b57cb9594bd4ae57dbb573d774ea81668` | one warning: `sorry` at `cb8_markCloneCriterion_flow_topRank` |
| `lean/LeanProject/LeanProof/CriticE1Explicit.lean` | `958716ba27446848f63ab6b8582051dc723dc7e2bd3c5b2a51ed6f1dddea860f` | repaired explicit hypothesis (critic scratch, no grade) |
| `lean/critic_explicit.log` | `ba41340502cb18fd8105f5a7f39967bc2f0d826c2af6c4bebf8c675cad3d99f6` | one warning: `sorry` in the theorem body |
| `lean/LeanProject/LeanProof/Main.lean` | `a906ec179d52c2548ca7026d8c9de532577100308444af2e722db3fd963b5f3f` | byte-identical copy of the C1-LA2 project; `.lake/packages` symlinked to the pinned shared Mathlib (v4.32.2 / `905b9581…`) |
| `replay/t3_twobinom.py`, `replay/t3_alias.py` | as cited in the return | replay copies; outputs byte-identical (`62ba09ed…`, `9badd2f5…`) |
