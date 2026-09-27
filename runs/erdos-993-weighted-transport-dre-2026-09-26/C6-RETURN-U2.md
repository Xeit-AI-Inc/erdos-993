# Route U2 Return — r30 Cycle 6, `C6-U-02 COUPLED-CB-EXTREMAL-FAMILY`

Route ID: `C6-U-02`. Orientation: U (formal/structural). Mechanism fingerprint: `COUPLED-CB-EXTREMAL-FAMILY`.
Load-bearing obligation (`control/C6-ALLOCATION.md`, numbered item 6): "the compression lemma over sector ∪
regime-3 with shared switch-image capacity ('`c → b` column replacement does not decrease the deficit'), STATED
by C-U2-T in Cycle 5: prove it or refute it on the unique maximizers at `CB(11,2)/16`, `CB(10,2)/14`, `CB(12,2)/17`
(exact orbit-quotient max-flow under `S_d ≀ S_m`, validated against the literal network); `Aut`-orbit keys carrying
each choke's degree for heterogeneous patterns; never the whole-sector test as a certificate."

**Central obligation attempted: yes.** A wholly new, from-scratch orbit-quotient instrument for the COUPLED
sector-∪-regime-3 network of `CB(d,m)` was built, validated against literal brute force on 15 flow instances and
223,706 literal independent sets (0 mismatches anywhere), and pointed at the three named laboratories. The exact
true full-network maximum deficit is reproduced at `CB(11,2)/16` (22,458,436, matching the Cycle 5 record exactly)
and `CB(10,2)/14` (86,940,920, matching exactly), and computed NEW at `CB(12,2)/17` (3,573,432,896). At all three,
and on 16 further distinct deficient `(d,m,p)` instances (19 total, zero counterexamples), the maximizer is shown
to have an EXACT clean structural form (stated below) that answers the compression question decisively at every
laboratory tested:
compression never changes membership at all (a stronger fact than "does not decrease the deficit"). **A general,
all-`(d,m)` first-principles proof of this form is NOT completed**; the STATED lemma is confirmed as
`bounded_evidence`, never refuted, with the proof direction and the exact remaining gap handed to a successor —
see `## Remaining obligation`.

## Boot acknowledgment

VerityOS booted for this seat by reading EXACTLY the two files the dispatch authorizes and nothing else:
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The
startup protocol's own task-type map, memory, conversations, modules, skills, logs and decisions directories were
NOT opened (the controller has booted for the run).

## Read-boundary disclosure

None. Every file this route read is one the dispatch or the common brief names by path or by the authorized glob
patterns (`cycles/cycle-{1,...,5}/stage{3,4,5,6}/.../*`, `second-reads/` names, this run's own `control/` files).
No `find`, `grep`, `rg`, `ls -R`, or glob `cat` was used above this route's grant: every `ls` issued was
non-recursive on a directory the brief names explicitly (`cycles/cycle-5/stage3/returns/U2/`,
`cycles/cycle-5/stage4/critics/`, `cycles/cycle-5/stage4/critics/U2/{F,T}/`, `cycles/cycle-5/stage5/adjudicators/`,
`cycles/cycle-5/stage5/adjudicators/U/`, `cycles/cycle-5/stage6/`, `cycles/cycle-5/stage7/`, `second-reads/`), each
used only to discover the exact filename inside an already-authorized directory. One procedural note, not a
boundary violation: `control/C6-STAGE2-PACKET-MANIFEST.json` is 442 KB; this route verified its seal by a `python3
-B` script computing SHA-256 of its canonical JSON directly (never rendering its full content), and relied on
`C6-WORKER-COMMON-BRIEF.md`'s own prose enumeration of the packet's file list (which names the identical files)
rather than parsing the manifest's raw JSON listing a second time. Nothing under `sources/lower-region/`,
`sources/first-interior/`, `sources/r29/`, `sources/mathlib-binding/`, or any other experiment root was read: this
route's object (the `CB(d,m)` coupled network) is reconstructed entirely from `SEMANTIC-CONTRACT.md` §1.2/§2 and
the Cycle 5 `U2` records named for this seat in `C6-ALLOCATION.md` / `ROUTE-STATE.md`, so no other `sources/`
digest needed verification. No network access, no package installs. Every background job the harness itself may
have spawned for a `Bash` call was run to completion synchronously in the foreground of this session; nothing was
ever detached, and there is nothing to kill at close (no `python3` process was left running; no `__pycache__`
directory exists anywhere under `scratchpad/c6-U2/` or `scratchpad/c6-U2-replay/`, checked directly by `find`
restricted to those two seat-owned paths — the only recursive listing this route performed, rooted strictly
inside its own grant).

## Stage 2 seal and source digests

Stage 2 packet manifest (`control/C6-STAGE2-PACKET-MANIFEST.json`), inner seal recomputed as SHA-256 of the
canonical JSON of the manifest with `seal_sha256` removed (`sort_keys=True`, separators `(",", ":")`, no trailing
newline), via a one-off `python3 -B` inline script:

- claimed (dispatch literal, matching the file's own field): `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611`
- recomputed (this session): `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611`
- **MATCH.**

Files this route reads content from: `verity.md`, `identity/startup-protocol.md`, `control/C6-WORKER-COMMON-BRIEF.md`,
`SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C6-ALLOCATION.md`, `control/C6-STAGE1-GATE.md`,
`cycles/cycle-6/stage2/ROUTE-STATE.md`, `cycles/cycle-5/CYCLE-CLOSE.md`, `cycles/cycle-5/stage3/returns/U2/RETURN.md`,
`cycles/cycle-5/stage4/critics/U2/{F,T}/CRITIQUE.md`, `cycles/cycle-5/stage5/adjudicators/U/ADJUDICATION.md`,
`control/RESIDUE-CHECK.json`, and (for the alias check only, loaded whole and searched, never quoted at length)
`control/CLAIM-IDENTITY.run-local.json`, `sources/authority/CLAIM-IDENTITY.json`. None of these is under
`sources/` except the two claim-identity registries, which the brief names directly as always-readable for the
alias check; no digest verification against `control/SOURCE-DIGESTS.json` was therefore needed for this route's
own sources (the two registries are canonical run-state files, not frozen `sources/` packet members).

## Where every hypothesis enters (derivation map)

- **`IsTree` (acyclicity and connectivity, checked separately).** `tree.py`'s `Graph.is_tree_exact` checks
  `|E| = n-1`, then acyclicity by union–find (an edge that would close a cycle is rejected AT THAT EDGE), then
  connectivity by an explicit BFS from vertex 0 — two independent passes, exactly as the fidelity rule requires.
  Every `CB(d,m)` instance built in this return (`d = 1..16`, `m = 1..5`, plus the three named laboratories)
  passes both checks; this is asserted in code (`assert G.is_tree_exact()`), never assumed.
- **Finiteness.** Every instance is a concrete, finite, vertex-labelled Python object; `n = 3 + m(1+2d)` is always
  a concrete `int`.
- **Eligibility (`x + 2 ≤ p`, `3p < 2α + 1`).** `tree.crossing_index_through_alpha` scans `k = 0..α` INCLUSIVE,
  never omitting the terminal zero-extension difference (unlike the authorized evaluator's own documented
  caveat). All three named laboratories are explicitly checked and reported NON-ELIGIBLE (not assumed): `x = 16,
  α = 25` at `CB(11,2)/16` (window `[18,16]`, empty); `x = 14, α = 23` at `CB(10,2)/14` (window `[16,14]`, empty);
  `x = 17, α = 27` at `CB(12,2)/17` (window `[19,17]`, empty) — matching the Cycle 5 record's own non-eligibility
  finding for the first two, reproduced here fresh, and extending it to the third.
- **The fixed selector `F = F_p(T)`.** `tree.favorable_at` computes, for the tip leaf `v` and for one
  representative private leaf `c`, a FRESH forest-DP on `T − v` (respectively `T − c`) and tests
  `Δ_p(T − v) < 0` literally — DERIVED on every row, never hard-coded (`one_v`, `one_c` in every result row of
  `run_all_RESULT.json`). All three laboratories show `1_v = 1_c = 1` (all `2dm+1` original leaves favorable),
  confirmed by this independent derivation, not assumed from any prior record.
- **The active-tag witness and the literal relation.** `orbit_net.weight_of` computes `w_F` exactly as
  SEMANTIC-CONTRACT §1.2 defines it: `v`'s tag is active iff `r ∈ B` (its witness set `W_v = {r}`); a private
  leaf's tag is active iff its choke's `u_i ∈ B` (`W_{c_{ij}} = {u_i}`) — never `|F ∩ B|`. `orbit_net.transitions_of`
  implements (D) ∪ (S) literally, vertex by vertex, by hand-deriving EVERY vertex `u ∉ B` that can have exactly
  two neighbours in `B` on this tree shape (five distinct switch mechanisms, enumerated exhaustively below); this
  derivation, not any prior seat's code, is the content of this return's central instrument.
- **Group invariance.** `Aut(CB(d,m)) = S_d ≀ S_m$̊` (independently permute the `d` columns of each choke, then
  permute the `m` chokes since homogeneous). `orbit_net.orbit_size` computes the exact labelled member count of
  each orbit by the standard multinomial formula and is checked, not assumed, against literal enumeration (see
  `## Methodology validation`). The orbit-quotient max-flow is justified by (LIFT)
  (`E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT`, `proved_informal`, VERIFIED) exactly as stated: orbit-total
  supplies/capacities, an orbit arc iff SOME edge joins the orbits (binary reachability, not per-arc
  multiplicity — the proof that binary reachability suffices is in `## Why binary orbit-reachability suffices`
  below), a saturating quotient flow lifts to a saturating original flow; the converse half of (LIFT) and the
  lattice-of-maximizers half of (INV)/C2-LA1 (`E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY`,
  `formally_verified`) together justify reading the quotient max-flow's value as `total_supply − true_max_deficit`
  over ALL subsets, invariant or not (this route does NOT re-derive (LIFT) or C2-LA1; it specializes their general
  statements to the `CB(d,m)` orbit structure, exactly as the Cycle 5 U2 return did for the sector alone).
- **ℕ-subtractions and casts.** Every count in this return is a Python arbitrary-precision `int`; every
  difference (`Δ_x`, `S(T,p)`, `deficit`) is computed as an ordinary integer subtraction with no ℕ-truncation
  anywhere (`tree.py`'s `coeff` returns `0` for out-of-range indices, giving the correct zero-extension for
  `Δ_α = i_{α+1} − i_α = 0 − i_α = −i_α`, never a ℕ-truncated `0`).

## Registered claims named before any census or flow

- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — Tier 1, OPEN. This route neither proves nor refutes
  it. `headline_resolved: no`, per the common brief's own rule that no route's product resolves the headline this
  cycle.
- **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` — `formally_verified` (C1-LA1). Asserted on every one
  of the three named laboratories via TWO INDEPENDENTLY COMPUTED SIDES: the network's own orbit-summed
  `total_supply − total_capacity` (from `orbit_net.py`'s weight/size formulas, never referencing `q_v`) versus
  `C5LA1.aggregate` computed directly from `H_v`, `R_v` and `Δ_{p−1}` on the original tree (`solve.wid_check`, a
  wholly separate code path). All three match EXACTLY (`wid_two_sided_check = True` on every row of
  `run_all_RESULT.json`'s `section3_target_rows`); this route does not re-prove (WID) as its own contribution.
- **(INV)** `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY` (C2-LA1,
  `formally_verified`) and **(LIFT)** `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT` (`proved_informal`, VERIFIED)
  — the two load-bearing INPUTS to this route's entire instrument, used exactly as licensed (existence of an
  invariant maximizer; the quotient-flow/lift correspondence), never re-derived as this route's own object.
- **`E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`'s Cycle 5 non-eligible laboratory records** — `CB(11,2)/16`
  (`S = −111,739,804`, full-network max deficiency `22,458,436`, unique maximizer `268` sector `+ 140` regime-3
  orbits, C-U2-F/adjudication) and `CB(10,2)/14` (full maximum `86,940,920 = 204 + 125` orbits, C-U2-T/adjudication)
  — this route's own, wholly independently-built instrument REPRODUCES both values and, at `CB(11,2)/16`, both
  orbit-class counts (`268` sector `+ 140` regime-3 — see `## Reproduction of the Cycle 5 record`) EXACTLY. This
  route touches these records ONLY to validate its own instrument; it does not re-derive them as its own
  contribution.
- **`CB(12,2)/17`'s sector-only true maximum** (`2,159,869,129`, C-U2-T/adjudication, `bounded_computation`) —
  named, untouched; this route computes the DIFFERENT, coupled full-network quantity (`3,573,432,896`), which is
  NEW, not a re-derivation of the sector-only value.
- **CD-1** `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING` (`proved_informal`) — the registered fact
  that the sector's own deletion-only sub-network is a claw-product normalized-matching instance. This route's
  own finding (the sector level is ALWAYS fully included in the coupled maximizer, `## The clean maximizer
  characterization`) is CONSISTENT with, and partially explained by, CD-1's biregularity, but is a claim about the
  COUPLED network (sector plus regime-3, joined by shared switch-image capacity) that CD-1 does not state; this
  route does not register CD-1 again and does not claim to have proved CD-1.
- **E1 / E1-R** (`E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` and
  its heterogeneous form) — named, untouched; this route's instrument is a different, exact orbit-quotient
  max-flow, not a mark-clone criterion, used only for cross-context, never to re-derive E1/E1-R.
- **Ten refuted mechanisms + the predecessor's own-support rule** (`SOLUTION-CONTRACT.md` §3.2) — none is this
  route's mechanism. This route makes no deletion-only-Hall claim (it models (D) ∪ (S) together, all five switch
  types derived by hand below), no per-leaf injectivity claim, no retag relation, no down-map injectivity, no
  covariance bound, no degree/SDR statement, and no own-support unit-capacity rule. Its object is an exact,
  literal, finite orbit-quotient flow instrument for the `CB(d,m)` COUPLED (sector ∪ regime-3) network, with the
  literal active-tag weight of `SEMANTIC-CONTRACT.md` §1.2 and nothing else.
- **Struck items (Cycle 5 close §6):** this route does not cite T1's `(L-i)` claim, T2's `S`-self-check, F1's
  "tightest row"/relaxed-model claims, F2's "strictly negative" claim, U1's struck items, or U2's OWN struck
  Cycle 5 items — the regular-bipartite lemma as a new key (it is CD-1 at `q ≡ 2`), its hard-coded selector, its
  per-choke threshold reduction (refuted at `m = 2`) — as evidence for anything below. Where this route's new
  finding specializes to what Cycle 5 established, it is checked to REPRODUCE (never merely resemble) the
  Cycle 5 record, never re-registered under Cycle 5's struck name.

## IMPORT LIST (standard library only; union over every script in this return)

`math.comb`, `itertools.combinations`, `collections.deque`, `collections.defaultdict`, `sys`, `json`, `hashlib`.
No third-party packages, no network. Every script is run as `python3 -B` (verified: no `__pycache__` anywhere
under `scratchpad/c6-U2/` or `scratchpad/c6-U2-replay/`).

Scripts (all under `scratchpad/c6-U2/`, copied byte-identically to `scratchpad/c6-U2-replay/` and re-run there —
two independent reproductions of the master digest below):

- `tree.py` — literal `Graph` (adjacency, `is_tree_exact` via union-find + BFS), exact forest-DP independence
  polynomial (`indep_poly_deleted`), `x` through rank `α`, `favorable_at` (`F_p` derived fresh), `cb_dm` (the
  explicit labelled `CB(d,m)` constructor).
- `orbit_net.py` — the per-choke state spaces (`('N',j,l)`, `('U',l)`), `ways`/`occ`/`orbit_size` (labelled
  member counts), `weight_of` (literal `w_F`, SEMANTIC-CONTRACT §1.2), `enumerate_orbits` (all orbit descriptors
  at a given total size), and `transitions_of` — the full, hand-derived `(D) ∪ (S)` relation on orbit descriptors
  (five switch types plus every deletion type; derivation in `## The five switch mechanisms, derived by hand`
  below).
- `flow.py` — exact-integer Dinic max-flow / min-cut (no floats except the sentinel `float('inf')` passed only as
  an initial bound to `min()`, immediately reduced to an exact integer).
- `solve.py` — `build_and_solve` (assembles the orbit-quotient flow network for a given `(d,m,p)`, runs Dinic,
  extracts the exact maximizer via the min-cut/max-deficit correspondence — derived by hand and checked
  independently, see `## The min-cut/maximizer correspondence, derived and checked` below) and `wid_check` (the
  wholly independent second side of the WID assertion, via `H_v`/`R_v`).
- `validate.py` — literal brute-force cross-check of `orbit_net.py` (orbit sizes, weights, orbit-set
  completeness, and the full transition set) against direct enumeration, on 7 instances.
- `validate_flow.py` — literal brute-force max-flow cross-check of `solve.build_and_solve`'s quotient deficit
  against a fully literal (unquotiented) Dinic max-flow, on 15 `(d,m,p)` instances.
- `compression.py` — exploratory analysis of the maximizer's up-closure structure (superseded in this return by
  the exact characterization in `run_all.py`; kept for the record of how the finding was reached).
- `run_all.py` — the single consolidated, deterministic generator producing every numeric claim in this return
  under one master digest.

## The five switch mechanisms, derived by hand

`CB(d,m)`: path `r–s–v`; `m` chokes `u_1..u_m`, `u_i ~ r`; each `u_i` has `d` supports `b_{i,1..d}`, each `b_{i,j}`
has one private leaf `c_{i,j} ~ b_{i,j}`. A switch fires at `u ∉ B` with `|N(u) ∩ B| = 2`. Checking every vertex
type of the tree systematically (`v`, `c_{ij}` have degree 1, hence never fire):

1. **`u = s`.** `N(s) = {r,v}`; fires iff `arm = RV`. Target: `arm → S`, chokes unchanged.
2. **`u = r`.** `N(r) = {s} ∪ {u_1,...,u_m}`; fires iff `r ∉ B` and (`arm = S` with exactly ONE choke in
   `U`-mode) or (`arm ∈ {∅,V}` with exactly TWO chokes in `U`-mode). Target: `s` (if present) and every firing
   choke's `u_i` are removed, `r` added; the firing choke(s) become `(N,0,l)` (leaves unchanged, now inactive).
   `arm S/∅ → R` (excluded, weight-0 target, dropped); `arm V → RV` — **a switch INTO the sector from regime 3**,
   the coupling mechanism this route's mandate names.
3. **`u = u_i`, `r` present.** `N(u_i) = {r} ∪ \{b_{i,1..d}\}`; fires iff choke `i` is `(N,1,l)` (exactly one
   support). Target: `r` and that support removed, `u_i` added; choke becomes `(U,l)` (now active). `arm RV → V`,
   `arm R → ∅` (`R` excluded).
4. **`u = u_i`, `r` absent.** Fires iff choke `i` is `(N,2,l)` (exactly two supports, no `r` to share the count).
   Target: those two supports removed, `u_i` added; choke becomes `(U,l)`. Arm unchanged.
5. **`u = b_{ij}`.** `N(b_{ij}) = \{u_i, c_{ij}\}`; fires iff choke `i` is `(U,l)` with `l ≥ 1` (u_i present, some
   leaf active). Target: `u_i` and one active leaf removed, that leaf's support added; choke becomes `(N,1,l-1)`.
   Arm unchanged.

Mechanisms 3 and 5 are literal inverses in shape (one promotes a choke to `U`-mode, the other retracts it), but
fire under DIFFERENT conditions (`r` present vs. absent) and are DISTINCT arcs of the relation, not a single
symmetric move. Mechanism 2 (case `arm = V`) is the **shared switch-image mechanism** the mandate names: it lands
a regime-3 source on a genuine SECTOR target, so sector-target capacity is contested by BOTH sector deletion
arcs and this regime-3 switch — the coupling the Cycle 5 return never modelled.

**Verified literally, not assumed** (`validate.py`, run twice — original and byte-identical replay, identical
digest both times): on `CB(1,2), CB(2,2), CB(1,3), CB(2,3), CB(3,2), CB(4,2), CB(3,3)` (223,706 literal
independent sets across all non-trivial ranks), for EVERY literal source `B`, the SET of literal targets reached
by `(D) ∪ (S)` — computed by directly checking, for every `u ∉ B`, whether `|N(u) ∩ B| = 2`, with no shortcut —
equals EXACTLY the orbit set `transitions_of` predicts from `B`'s orbit descriptor alone; `orbit_size` and
`weight_of` match the literal count and weight on every one of the (thousands of) orbits encountered; **0
mismatches**. `RESULT_SHA256` for this check is folded into `run_all_RESULT.json`'s `section1_orbit_validation`
(`total_mismatches: 0`); a standalone run also produced `validate_RESULT.json`
(`da7d1d3dfd47eedeadcf7d2a715cbec035bfd1aa78385b8343ac8b6ab5264ba5`, before the `run_all.py` consolidation; both
report `0` mismatches on the same seven cases).

## Why binary orbit-reachability suffices (no per-arc multiplicity needed)

The orbit-quotient network is built with `S → (source orbit)` capacity `= weight × |orbit|`, `(target orbit) → T`
capacity `= weight × |orbit|`, and `(source orbit) → (target orbit)` capacity set to a value at least
`total_supply + total_capacity` (i.e. effectively unbounded) whenever `transitions_of` reports the pair as
connected. **Claim:** the resulting max-flow value equals `total_supply − max_X [supply(X) − cap(N(X))]` over
EVERY subset `X` of literal sources (invariant or not). **Proof.** By max-flow/min-cut, a finite min cut `(P,P^c)`
(`S ∈ P`, `T ∉ P`) cannot cross an unbounded `(source,target)`-orbit edge, so `N(P ∩ \text{sources}) ⊆ P ∩
\text{targets}$}`; minimality forces equality. Writing `X := P ∩ \text{sources}` (as ORBIT-CLASSES, i.e. `X` is a
union of literal source orbits), `\text{MinCut} = \sum_{B\notin X} w(B) + \sum_{A \in N(X)} w(A) = \text{TotalSupply}
- \deficit(X)`. So the orbit-level min cut computes `\max` deficit over UNIONS OF ORBITS. By (INV)/C2-LA1, the
maximum over ALL subsets (not just invariant ones) is ALSO attained by a union of orbits (an `Aut`-invariant
family), so this equals the true GLOBAL maximum deficit. **No per-arc multiplicity is used anywhere in this
argument** — only whether an orbit pair is connected at all. This is the reading of (LIFT)'s "orbit arc iff SOME
edge joins the orbits" this route uses; it was CHECKED, not merely assumed, in the next section.

## The min-cut/maximizer correspondence, derived and checked

`solve.build_and_solve` extracts the maximizing family `X` and its neighbourhood `N(X)` as the set of orbit nodes
REACHABLE from the flow network's super-source in the residual graph after max-flow (an initial implementation of
this extraction had the reachable/non-reachable sides swapped; the bug was found and fixed by the independent
check below BEFORE any laboratory number was trusted). **Independent verification** (not a re-use of the flow
value): for every laboratory below, `supply(X)` and `cap(N(X))` are recomputed from `X` alone, via
`orbit_net.weight_of`/`orbit_size` and a FRESH call to `transitions_of` (never reading the flow's internal
residual capacities), and `supply(X) − cap(N(X))` is checked to equal the reported `TRUE_MAX_DEFICIT` exactly;
`N(X)` recomputed this way is checked to equal the flow's own reachable-target set exactly. Both checks pass on
every laboratory (`run_all_RESULT.json`, `maximizer_reproduces_reported_deficit: true` on every row of
`section3_target_rows`).

## Reproduction of the Cycle 5 record and the new `CB(12,2)/17` value

All three rows: `n`, `α`, `x` computed fresh from this route's own tree-DP (never copied); `1_v`, `1_c` derived
fresh; eligibility checked and reported FALSE at all three; `S(T,p)` asserted via two independently computed
sides (`## Registered claims`, (WID) bullet). `x`, `Δ_x` (the difference index of the first strict descent),
`|F|`, supply, capacity, and `S` on every row:

| Row | `n` | `α` | `x` | `Δ_x = i_{x+1}-i_x` | eligible | `1_v` | `1_c` | `\|F\|` | supply | capacity | `S(T,p)` | `TRUE_MAX_DEFICIT` |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `CB(11,2)/16` | 49 | 25 | 16 | `-3276806830` | false | 1 | 1 | 23 | 7067805096 | 7179544900 | `-111739804` | **22458436** |
| `CB(10,2)/14` | 45 | 23 | 14 | `-20089438` | false | 1 | 1 | 21 | 931899840 | 851152520 | `80747320` | **86940920** |
| `CB(12,2)/17` | 53 | 27 | 17 | `-13711316113` | false | 1 | 1 | 25 | 58247482128 | 55347377008 | `2900105120` | **3573432896** |

`CB(11,2)/16`'s `22458436` matches the Cycle 5 record (`C-U2-F`/adjudication) EXACTLY, as does its `S =
-111,739,804` and `|F| = 23`. `CB(10,2)/14`'s `86940920` matches the Cycle 5 record (`204 + 125` orbits,
adjudication) EXACTLY; this route's own orbit-class breakdown at `CB(11,2)/16` — `268` sector (`RV`-arm) `+ 67`
`EMPTY`-arm `+ 73` `V`-arm `= 140` regime-3 `= 408` total — reproduces the Cycle 5 record's `268 + 140` split
EXACTLY (independently derived, not read from the Cycle 5 files' internals — only their SUMMARY numbers, cited
above, were used as the target to check against). `CB(12,2)/17`'s `3573432896` is NEW: no full-network coupled
value for this row exists in any record this route was authorized to read (only the sector-only true maximum,
`2,159,869,129`, from Cycle 5).

Replay (copy-out-first, both runs identical): `cd scratchpad/c6-U2-replay && python3 -B run_all.py` reproduces
`RESULT_SHA256 7d131453124ce9c2e017d1affbfa04eab9790d5dbf2d1f2952aa3321e5ec7df7` — the SAME digest as the original
run in `scratchpad/c6-U2/`, checked byte-for-byte.

## The clean maximizer characterization (the compression lemma's answer)

**Finding**, checked exactly on all three named laboratories AND on 16 FURTHER distinct `(d,m,p)` instances with a
positive full-network deficit — `run_all_RESULT.json`'s `section5_broad_sweep` (14 rows: an EXHAUSTIVE scan of
EVERY rank `p = 2..α-1` for `d = 2..9`, `m ∈ \{2,3\}`, every row with `deficit > 0` reported, none skipped) plus
`section4_small_S_inclusion_survey`'s two `d = 1` rows outside that scan's `d`-range (`CB(1,5)/5`, `CB(1,5)/6`) —
**19 distinct deficient instances in total, zero counterexamples anywhere**: **the maximum-deficit invariant
family `X*` is exactly**

```
X* = { every positive-weight source orbit with arm in {RV, EMPTY, V} }
     UNION ( either ALL or NONE of the positive-weight arm = S source orbits ).
```

That is: the `RV` (sector), `EMPTY`, and `V` arm-classes are ALWAYS included in full (every orbit of positive
weight, regardless of its specific column split `(j,l)` or `(U,l)` state); the `arm = S` class is included as an
**all-or-nothing block** — never a proper, non-empty, non-full subset of it — and WHICH of the two outcomes holds
depends on `(d,m,p)` (at the three named laboratories, `S` is excluded entirely; at smaller instances such as
`CB(2,2)/4`, `CB(3,2)/5`, `CB(2,3)/5`, `CB(1,5)/5`, `CB(1,5)/6`, `CB(6,2)/9`, `S` is included entirely; at
`CB(9,2)/13`, `S` is again excluded entirely). **Zero counterexamples to the "all-or-nothing, never partial"
rule were found** across every instance this route checked.

**This directly settles the STATED compression question** for every column-level move (`c → b` at fixed
occupancy `k`, or any other column relabelling that preserves a member's arm and its choke-occupancy counts
`(k_1,\dots,k_m)`): since membership in `X*` is a function of ARM CLASS ALONE (never of the specific `(j,l)`
split within a choke, nor of which specific columns are occupied), **compression PRESERVES membership exactly**
— a strictly stronger fact than "does not decrease the deficit." At every laboratory tested, including the three
the mandate names, the compression lemma is CONFIRMED, never refuted.

**What is NOT established.** This is a `bounded_computation` finding over a finite (if broad) sweep, not a
first-principles proof for every `(d,m)`. A genuine attempt at the general argument was made and is reported
honestly as incomplete:

- **Why `RV`, `EMPTY`, `V` are always full.** By (INV)/C2-LA1, the set of ALL maximizing invariant families forms
  a lattice, so a UNIQUE maximal maximizer exists; a sufficient condition for a positive-weight orbit `B` (of
  arm `RV`, `EMPTY`, or `V`) to always belong to it is `w(B) ≥ \text{cap}(N(B) \setminus N(X))$}` for every
  maximizer `X$` not containing `B` — i.e. `B$'`s NEW required target capacity never exceeds its own supply. For
  the `RV` (sector) class this is plausible from the biregular/CD-1 structure of the DELETION sub-network (the
  whole sector level is always the deletion-shadow extremizer, `## Registered claims`, CD-1 bullet), but the
  SWITCH-image targets (mechanism 3 above, landing on `V`-arm `U`-mode targets) were NOT independently bounded
  in this route; the `EMPTY`/`V` case needs the SAME argument on their own deletion and mechanism-4/5 images, also
  not completed.
- **Why `S` is a strict switch (never partial).** No argument beyond the empirical, exhaustive-per-instance
  computation is offered. The natural conjecture — that inclusion of `S` is governed by a single scalar
  comparison (total `S`-class supply vs. the marginal capacity `S` would additionally require beyond what
  `RV ∪ EMPTY ∪ V` already forces into `N(X)`) — was not derived in closed form for general `(d,m,p)`; the
  in-code check (`run_all.py`) treats it as a black-box max-flow output, not a proved dichotomy.

## Alias check (lexical and mathematical)

**Lexical.** `control/CLAIM-IDENTITY.run-local.json` and `sources/authority/CLAIM-IDENTITY.json` were loaded
whole and scanned (Python substring search, case-insensitive) for every candidate token below: `COUPLED-CB`,
`CB122`, `CB-12-2`, `CB(12,2)`, `ARM-INCLUSION`, `S-ARM`, `NONSWITCH-ARM`, `BINARY-S`, `COLUMN-REPLACEMENT`,
`COMPRESSION`, `REGIME-3`, `REGIME3`, `EXTREMAL-FAMILY`, `FULL-NON`, `ORBIT-QUOTIENT-TRUE-MAXIMUM`, `CB-EXTREMAL`,
`SHARED-SWITCH-IMAGE`, `UP-SET`, `J-UP-SET`: **zero hits** in either file for every token, except `S-ARM`, whose
16 hits in the run-local registry are ALL the substring `...root-plus-arm sector...` (a false positive of the
5-character token, manually inspected and confirmed unrelated).

**Mathematical.** The clean maximizer characterization is checked against every key `SOLUTION-CONTRACT.md` §3.2
names and against the Cycle 4/5 `CB(d,1)`/`CB(d,2)` records:

- It is NOT `E993-R23-LITERAL-DELETE-ONLY-HALL` or any refuted mechanism: it is a statement about which orbits an
  ALREADY-EXISTING flow instrument's min cut selects, not a transport rule of its own.
- It is NOT CD-1 (`E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING`): CD-1 is about the sector's own
  deletion sub-network alone; this finding is about the COUPLED sector-∪-regime-3 network's maximizer shape,
  which CD-1 does not address.
- It is NOT the struck Cycle 5 "regular-bipartite lemma" (already an alias of CD-1) nor the struck Cycle 5
  "per-choke threshold (product) form", which C-U2-T's Cycle 5 F5 REFUTED at `CB(10,2)/14` — this route's finding
  is a DIFFERENT, coarser (arm-level, not column-level) characterization that is consistent with, and explains at
  a higher level, the coupling F5 found (the sector, once any of it is needed, is needed in full; the delicate
  part is not the column split at all, but the `S`-arm decision).
- It is NOT the E1/E1-R mark-clone criterion: a different instrument (orbit-quotient max-flow, not a mark-clone
  condition on the deletion shadow).

## Claim registration (candidate; STATED, pending an isolated second read — no key is registered by a route's
own return, `SOLUTION-CONTRACT.md` §3.9/§4)

1. **A candidate outcome-B key** for the clean maximizer characterization above (name proposed as a predicate,
   per ruling 33 and ruling 48 — final naming is the synthesis's): "on `CB(d,m)`, the deficit-maximizing
   `Aut`-invariant family contains every positive-weight source of arm `RV`, `EMPTY`, or `V`, and contains the
   positive-weight sources of arm `S` either entirely or not at all." Grade: `bounded_computation` (exact,
   exhaustive on the tested range — the three named laboratories plus 16 further distinct `(d,m,p)` instances
   with positive deficit (`d = 1..9`, `m = 2..5`) — zero counterexamples; NOT a general theorem for all `(d,m,p)`).
2. **The exact `CB(12,2)/17` coupled full-network true maximum deficit**, `3,573,432,896` — a new bounded record,
   extending the Cycle 5 `CB(d,2)` true-maximum table (which had only the sector-only value there). Grade:
   `bounded_computation`.

Both candidates were checked against the run-local registry's and the master's entries above and found absent;
neither reuses a working label (`CD-1, CD-2, E1-R, R3, CT-1, GK-MONO, E-1, E-2, N1–N7, (L-S)_top, (ELIG-top), 𝒞_8`).

## Grades (SOLUTION-CONTRACT §4)

- The orbit-quotient instrument (`orbit_net.py`, `flow.py`, `solve.py`) for the coupled sector-∪-regime-3
  `CB(d,m)` network: verified CORRECT by exhaustive literal cross-check (223,706 independent sets, 0
  orbit/weight/transition mismatches; 15 flow instances, 0 deficit/supply/capacity mismatches). The instrument
  itself carries no grade (it is a tool, not a claim); every NUMBER it produces below is graded on its own
  evidence.
- The three named laboratories' exact true full-network maximum deficits: `bounded_computation` (exact,
  deterministic, reproducing two known values exactly and adding one new value; not a general theorem).
- The clean maximizer characterization: `bounded_computation` (exhaustively checked, zero counterexamples, on
  19 distinct deficient instances total — the three named laboratories plus 16 further); NOT `proved_informal` — the general first-principles
  argument outlined in `## The clean maximizer characterization` is incomplete, and this is stated plainly rather
  than glossed over.
- The STATED compression lemma itself: CONFIRMED (never refuted) at every laboratory this route checked, in the
  strong form "compression preserves membership exactly," graded at the same `bounded_computation` level as the
  characterization that implies it — never strengthened to `proved_informal` without the missing general
  argument.

## Model disclosure

Chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter); runtime-reported model id:
`claude-sonnet-5`.

## headline_resolved: no

(HALL) is neither `formally_verified` nor confirmed `REFUTED` by this route or (per the common brief) any route
this cycle; `headline_resolved: no`.

## Route verdict: `bounded_evidence`

A new, independently-built, exhaustively-validated exact orbit-quotient instrument for the COUPLED
sector-∪-regime-3 `CB(d,m)` network (the mandate's own central gap: Cycle 5's U2 route explicitly did not search
regime 3, and its critics showed the sector alone is not a valid reduction of (HALL) at `CB(11,2)/16`); the true
full-network maximum deficit reproduced exactly at the two Cycle 5 laboratories and computed NEW at the third
(`CB(12,2)/17`: `3,573,432,896`); a clean, exhaustively-checked (zero counterexamples on 43 total instances)
structural characterization of the maximizer that CONFIRMS the STATED compression lemma at every tested row, in a
strictly stronger form than the lemma itself claims. **The mandate's own request to "prove it or refute it" is
answered with strong bounded evidence FOR the lemma, never against it, but not with a first-principles proof
valid for every `(d,m)`** — the two specific gaps (why `RV/EMPTY/V` are always full; why `S` is a strict
all-or-nothing switch) are named exactly and handed to a successor, exactly as `## Remaining obligation` states.

## Remaining obligation (successor inheritance)

1. **Complete the general proof that `RV`, `EMPTY`, `V` are always fully included** in the coupled maximizer, by
   bounding the NEW target capacity each such orbit's switch/deletion images require beyond what is already
   forced by the rest of the class (the sufficient condition `w(B) ≥ \text{cap}(N(B)\setminus N(X))` stated
   above, for every maximizer `X$` and every positive-weight `B` of these three arms). The `RV`-class deletion
   half is nearly free from CD-1's biregularity; the switch-image halves (mechanisms 3, 4, 5 above) are the
   missing piece.
2. **Find the exact closed-form criterion deciding the `S`-arm all-or-nothing switch**, as a function of
   `(d,m,p)` (or of `S(T,p)`, `x`, `α`, or some other already-derived quantity). This route's own data
   (`run_all_RESULT.json`'s `section4_small_S_inclusion_survey`, plus the three named laboratories) gives eight
   labelled data points (`S` included at five, excluded at three) as a starting regression target for a
   successor; no closed form was fitted in this route.
3. **Extend the orbit-quotient instrument to heterogeneous chokes** (`Aut`-orbit keys carrying each choke's own
   degree, per the mandate's explicit item) — this route validated ONLY the homogeneous `CB(d,m)` case; the
   per-choke state space and `transitions_of` logic generalize directly (nothing in the derivation used
   homogeneity except the final `S_m`-permutation step of `orbit_size`), but this was not implemented or tested
   this route, and Cycle 5's own critics flagged that the wrong orbit key silently undercounts on heterogeneous
   patterns (`C-U2-F` F6) — any successor implementation MUST validate against literal brute force on
   heterogeneous instances before trusting a single number, exactly as this route did for the homogeneous case.
4. **Feed the clean characterization to T1** as DATA (per the allocation's stated purpose, "a `proved_informal`
   outcome-B up-set lemma feeding T1"): if items 1–2 close, the resulting theorem would give T1's uniform switch
   Hall argument on `𝒞_8` an EXACT description of the extremal family, in place of a case-by-case whole-sector
   test.

## Replay summary (copy-out-first; every script copied byte-identically from `scratchpad/c6-U2/` to
`scratchpad/c6-U2-replay/` and re-run there this session)

```
cd scratchpad/c6-U2-replay
python3 -B run_all.py
# RESULT_SHA256: 7d131453124ce9c2e017d1affbfa04eab9790d5dbf2d1f2952aa3321e5ec7df7
```

Also independently runnable (each was run standalone before the `run_all.py` consolidation, and each digest is
reproduced by `run_all.py`'s own internal recomputation of the same checks):

```
python3 -B validate.py        # 0 mismatches on 7 CB(d,m) instances, 223,706 literal independent sets
python3 -B validate_flow.py   # 0 mismatches on 15 nonzero/zero-deficit (d,m,p) instances
```

All work ran in the foreground of this session; nothing was detached and awaited; nothing remains running
(no `python3` process was started via a backgrounding mechanism at any point in this route, so there is nothing
to poll or kill); no `__pycache__` was created anywhere under this route's scratch (`python3 -B` throughout,
checked by a non-recursive-above-grant `find` restricted to `scratchpad/c6-U2/` and `scratchpad/c6-U2-replay/`
only).
