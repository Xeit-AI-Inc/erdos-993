# Critique

Critic `C-F2-U` (orientation U, formal / structural) of seat `F2`, route `C1-F-02`, mechanism token
`LS-TOP-ASYMPTOTIC-AND-ENDPOINT-STRESS`, Cycle 1 Stage 4 of r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`).

**Boot.** Operating within VerityOS. Booted by reading EXACTLY `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. No other VerityOS file was read. See the read-boundary disclosures
below: the harness auto-injected the project `CLAUDE.md` and the user's memory index into my context. I did not fetch or use them.
Per the dispatch, I did not write a conversation log. Writes are confined to this file and `scratchpad/c1-crit-F2-U/`.

**Model disclosure.** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- Dispatch file `control/dispatch/c1-stage4/DISPATCH-C-F2-U.md`: SHA-256 `bf5321b61fada10066ce22552d212aabcaf9985fdd200ba1412b8b73f976a65d`,
  which matches the digest I was given.
- **Capsule seal** (`control/c1-critic-capsules/F2-PACKET-MANIFEST.json`), recomputed with sort_keys, separators `(",",":")`, no
  trailing newline, `seal_sha256` removed: `4103f5cf2aa6c72645acd471dcd36c3c67c47dacc6424725d12b8d06cf9b2bab`. **Matches.** All 14
  listed members match their SHA-256 and byte counts.
- Stage 4 dispatch manifest seal `86453c5c1eae81d5c1a8cf4759bcec530ccf1ca6a47c1b693d35dce430a2587b` (recomputed, matches). Stage 3
  manifest seal `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37` (recomputed, matches). Stage 2 seal
  `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc` (recomputed, matches the return's statement and the protocol).
- The return's digest: I replayed it copy-out-first. `scratchpad/c1-F2/*.py` were copied into `scratchpad/c1-crit-F2-U/replay/`, the
  shipped `RESULTS.json` was moved aside, and `python3 -B generate_results.py` was rerun (132 s, foreground). The output is
  **byte-identical** to the shipped file: SHA-256 `9d600d6069c84e6640ade18e58b0829a33360d7312cf0411c8fd9a60e920d85f`, 16286 bytes.
  I cannot replay the return's per-file digest checks of its Stage 2 reads ("script: ad hoc, not retained"). They are not load-bearing.
- **Registry identity.** Route ID `C1-F-02` and mechanism token `LS-TOP-ASYMPTOTIC-AND-ENDPOINT-STRESS` both appear verbatim in the
  return, as allocated. The run registry (frozen `sources/authority/CLAIM-IDENTITY.json`, 491 claims, read by a key filter) has no
  `E993-R31-` key and no key for the θ*-law or for a uniform sector allocation.
- **Read-boundary disclosures (this critic).** (1) One `cat` printed the whole `control/C1-CRITIC-ATTACK-BRIEFS.md`, so the other
  seats' sections passed through my context. I used only the F2 section. Nothing in this critique draws on another section, and my
  closed forms were derived by my own solver. (2) A names-only `ls` of `scratchpad/c1-F2-replay/`, the seat's own replay copy, which
  is named in the return but is not the inventoried directory. Nothing there was opened. (3) The harness injected the project
  `CLAUDE.md` and the user memory index into context. Neither was fetched or used. I ran no search rooted above my grant, used no
  network or installs, ran no process listings and left no background jobs: every computation ran in the foreground to completion.
- **Read-boundary finding against the record (for the controller).** The return's Disclosures section reports that
  `pgrep -fl "python3 -B -c"` "incidentally printed command-line text from two OTHER seats' concurrently running processes (`c1-F3`,
  `c1-T3` — their script names and inline Python source)". The Stage 3 disclosures record transcribes F2 as "none beyond the scoped
  boot", so the transcription **omits** this item, contrary to the r30 rule quoted in that record ("every disclosure item, including
  process listings mentioned in passing"). The event is a pattern-filtered host process listing that exposed sibling command lines, the
  same class as U2's recorded INCIDENT. I found no sign that anything seen was used: `RESULTS.json` and the return contain no
  T3/F3 content, and every F2 object is an independent LP, DP or tree-DP. The record should still be corrected.

## Independent re-derivation

All instruments are my own code (standard library, exact `Fraction`s and big integers), in
`scratchpad/c1-crit-F2-U/own/`. None imports or copies F2's modules.

1. **Template LP from the contract text** (`template.py`, `lp.py`: my own dense two-phase simplex with Bland's rule). The variables and
   rows are exactly those of SEMANTIC-CONTRACT §2: Out ≥ a + λn and In ≤ a₂ + λ₂n for all 45 states, `m a + λK ≥ 1`,
   `m a₂ + λ₂(K−1) ≤ 1`, and `(8−γ)σ(γ) ≤ θγ`, with free a, λ, a₂, λ₂ and minimum θ, where `K = p* − 1`. I also build the **explicit LP
   dual**, solve it, and check primal and dual feasibility with separate exact row checkers.
   - The fixed point `CB(8,95)/508` gives θ* = 96/604265, as recorded.
   - The fresh rows `m = 110, 113` give θ* = 96/809675 and 96/854357 (gate ruling 2 honoured, by both the return and me).
   - The rows m = 107, 200, 500, 1001, 10001, 100001 and 1000001 all give θ* = 288/(200m²+82m+5).
   - Every row has a primal-feasible solution and a dual-feasible solution with equal objective, so these are **certified optima**
     rather than solver outputs.
   - This backs the return's m = 10001 row, which rests on one LP run with no row check or DP in F2's own generator, and extends the
     horizon to m = 1000001.
2. **ρ₁ as an exact rational function of m** (`rho.py`). With `N = 8m−7` and `K = (16m+1)/3`,
   `r(k) = Σ_{j≤7} C(7,j)C(N,k−j)2^{k−j}`. Normalizing by `C(N,K−8)2^{K−8}` (valid for 0 ≤ K−8 and K ≤ N, i.e. m ≥ 3) gives
   `ρ₁ = A(m)/B(m)` with polynomials of degree 8. This agrees exactly with direct big-integer sums and with a literal coefficient
   convolution at m = 95, 107, 110, 113, 200 and 1001, and reproduces the contract fixed point `ρ₁(95) = 1354839571516225/1361543988640524`.
   F2's shipped ρ₁ and margin values at every row equal mine exactly.
3. **Eligibility** (`elig.py`: rooted tree DP at r, with products by Kronecker substitution; x computed through α with terminal
   difference −i_α). My values of n, α, x at m = 95, 107, 110 and 113 equal F2's and the contract's.
4. **Literal laboratory of the per-state reduction** (`literal_lab.py`). This builds the literal tree CB(d,m), F = leafSet, literal
   active-tag weights and the literal (D) ∪ (S) arcs. It places the template with **random** positive rationals pb, pc, σ, and compares
   every literal load with the per-state formulas at (d,m,p) ∈ {(2,2,3), (2,3,4), (3,2,4), (3,3,5), (3,3,6), (4,2,5), (4,2,6)}.
   - There are **0 mismatches** on every sector source outflow (= ΣOut), every in-sector target inflow (= ΣIn), and every switch image
     load (= (d−γ)σ(γ)).
   - Sector weight is 1, switch-image weight is γ with one choke, and each image has exactly d−γ preimages.
   - Every other sector out-arc (delete r, delete v, switch at s) lands on a weight-0 target.
   - F2's own laboratory only counted |sec| and the in-sector layer; it never tested loads.

## Attacks and findings

**F-1 (candidate 2 REFUTED as stated).** `E993-R31-CB8-SECTOR-AFFINE-TIGHT-SET-INVARIANT-IN-M` asserts the non-tight sets "at the
LP-optimum". The optimum is **not unique**, and the tight set F2 reports belongs to the one vertex Bland's rule reached.
- Maximizing each row's slack over the whole optimal face (θ ≤ θ*; `tightface.py`) at m = 107 and at m = 110: only **17 Out rows**
  (n ∈ {1,6,7}) and **14 In rows** (n ∈ {0,5,6}) are tight at every optimum. That is exactly the support of my closed-form dual. F2
  reported 40 and 36.
- Explicit witness (`witness.py`): an optimal solution at m = 107 with θ = θ* whose Out-non-tight set is
  {(0,0),(0,2),(0,3),(0,5),(0,8),(2,2)}, with Out(2,2) − a − 4λ = 12/766193.
- The dependent endpoint remarks are vertex-specific and struck as statements about the LP: "Out constant across every n = 8 state
  (forced equal)" fails at the witness, where (0,8) is not tight, and "In(0,1) is the LARGEST In" is likewise vertex-specific.

**F-2 (candidate 1 struck; the interpretation of the m ≥ 107 threshold is wrong).** `E993-R31-CB8-TOP-SECTOR-TEMPLATE-BOUNDED-BELOW-M107`
lies wholly outside the class (gate ruling 5; SOLUTION-CONTRACT §3.1).
- More importantly, **p* is not eligible at any of its sampled rows.** My exact x gives p* − x = 0 at m = 2, 5, 8, 11, 14, 17 and 20,
  and p* − x = 1 at m = 26, 35, 50, 65, 80 and 83, so x + 2 ≤ p* fails.
- Within residue 2, p* first becomes eligible at m = 86 (x = 458, p* = 460), which agrees with the registered first eligible rank
  `(CB(8,86), 460)` of `E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-…`.
- The return's reading that template feasibility down to m = 5 shows the m ≥ 107 cutoff is "inherited from r30's finite-table
  provenance rather than … a hard failure" is therefore unsupported. At m ≤ 83 the target rank is not eligible at all, so the
  template's feasibility there says nothing about the target. The return did disclose that it did not check eligibility there.
  The inference is struck; the record keeps only this: "the template LP is feasible with θ* = law at those residue-2 values of m, at
  non-eligible ranks."

**F-3 ("affine vs exact" misread; now resolved by the critic).** The return treats `dp_min_out = dp_max_in = 1` as evidence that the
affine optimum equals the combinatorial optimum. It is not.
- At F2's vertex, for every n in 1..8 some state is affine-tight, and `m a + λK = 1`. Every source composition with no empty choke
  (these exist, since K ≥ m) therefore sums to exactly 1, so the DP minimum is forced to equal 1. The In side is the same (n ≤ 7, and
  K−1 ≤ 7m).
- A DP run at an affine optimum cannot detect whether a smaller θ is feasible for the exact system.
- "The affine relaxation is measurably conservative at the boundary states" confuses per-state slack at states outside the extremal
  compositions with a gap in the optimal value. It is struck.
- F-8 settles the question in the opposite direction from the return's hedge, for the whole class.

**F-4 (miscount).** "Checked exactly at 13 in-class rows: 95, 98, 101, 104, 107, 110, 113, 200, 500, 1001, 10001" lists 11 rows, and
only 7 are in the class (107 through 10001). Struck and replaced by "7 in-class rows, plus 4 recorded rows (95 through 104) below
the class".

**F-5 (grade label).** The θ = 0 infeasibility is graded "`proved` for the identity at the checked rows". `proved` is not a contract
grade (SOLUTION-CONTRACT §4). The identity `R_K/R_{K−1} = 2(8m−K+1)/K = (16m+4)/(16m+1) = p*/(p*−1)` holds for **every** m in the
class by one line of algebra, not only at the checked rows. It restates SEMANTIC-CONTRACT §2 and is an alias of the registered
`E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` (VERIFIED, `proved_informal`). There is no new claim, as the return itself says.

**F-6 (unbacked literals, now critic-backed).** "p* − x = 3 at m = 200 and p* − x = 7 at m = 500, independently checked" does not
appear in F2's digest. My `elig.py` confirms both (x = 1065 and x = 2661; parent descent holds at both). They are backed by this
critique, not by the return.

**F-7 (fidelity).** F2 asserts no (WID) and does not derive `F_{p*}`: it carries F = leafSet at the favorability key's grade. Its
shipped numbers are template-level objects (LP, ρ₁, x), so none of them sits downstream of a network identity. **No fidelity strike.**
The return correctly keeps literal-network fidelity out of scope. My laboratory (Independent re-derivation, item 4) supplies the
missing load-level check at laboratory scale. x is computed through α in both F2's code and mine.

**F-8 (CRITIC-DERIVED ADVANCE: the step the return leaves open, attempted and closed at template level; attributed to C-F2-U;
STATED, needs an isolated second read).** Let `L = 200m² + 82m + 5` and `K = p* − 1 = (16m+1)/3`. Define the allocation

- `pb(β,γ) = (75m/2 + c^b_{β,γ})/L` and `pc(β,γ) = (75m/2 + c^c_{β,γ})/L`, with the intercept table below;
- `σ(γ) = 288γ/((8−γ)L)` and `θ = 288/L`;
- `a = −21/(2L)`, `λ = (75m/2 + 15)/L`, `a₂ = (600m + 72)/L`, `λ₂ = −(75m + 15/2)/L`.

The intercept table (β ∖ γ; generated from `closed_forms.json` by script):

| β \ γ | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
|---|---|---|---|---|---|---|---|---|---|
| pb, β=1 | 9/2 | -591/28 | -44 | -2259/40 | -228/5 | -7/4 | 0 | -16035/16 |  |
| pb, β=2 | 39/4 | 73/4 | 1287/40 | 2199/40 | 365/4 | 567/4 | 2379/16 |  |  |
| pb, β=3 | 23/2 | 693/40 | 513/20 | 149/4 | 513/10 | 813/16 |  |  |  |
| pb, β=4 | 99/8 | 669/40 | 89/4 | 567/20 | 2247/80 |  |  |  |  |
| pb, β=5 | 129/10 | 65/4 | 99/5 | 1617/80 |  |  |  |  |  |
| pb, β=6 | 53/4 | 63/4 | 267/16 |  |  |  |  |  |  |
| pb, β=7 | 27/2 | 237/16 |  |  |  |  |  |  |  |
| pb, β=8 | 219/16 |  |  |  |  |  |  |  |  |
| pc, β=0 | — | 9/2 | 849/28 | 107/2 | 531/8 | 561/10 | 53/4 | 27/2 | 16347/16 |
| pc, β=1 | — | -15/28 | -35/4 | -891/40 | -1779/40 | -319/4 | -513/4 | -2067/16 |  |
| pc, β=2 | — | -2 | -297/40 | -303/20 | -103/4 | -189/5 | -501/16 |  |  |
| pc, β=3 | — | -99/40 | -249/40 | -43/4 | -297/20 | -687/80 |  |  |  |
| pc, β=4 | — | -12/5 | -19/4 | -63/10 | -57/80 |  |  |  |  |
| pc, β=5 | — | -7/4 | -9/4 | 45/16 |  |  |  |  |  |
| pc, β=6 | — | 0 | 75/16 |  |  |  |  |  |  |
| pc, β=7 | — | 93/16 |  |  |  |  |  |  |  |

*Statement (L-S)_top^template.* For every `m ≥ 107` with `m ≡ 2 (mod 3)`, this allocation at `p*(m)` satisfies:

- **Nonnegativity.** Every pb and pc numerator is `75m/2 + c ≥ 75m/2 − 16035/16 > 0` for m > 26.725, and σ, θ > 0.
- **Out.** Every sector source sums to at least 1.
- **In.** Every in-sector target sums to at most 1.
- **Switch.** Every Switch row holds with equality: `(8−γ)σ(γ) = θγ`.
- **Residual.** `θ(m) = 288/L ≤ 1 − ρ₁(m)`.

*Proof.* The 90 affine rows are **independent of m**. Out(β,γ) ≥ a + λn is equivalent to
`β c^b + γ c^c + [β=1, γ≥1]·288γ/(8−γ) + 21/2 − 15n ≥ 0`. In(β,γ) ≤ a₂ + λ₂n is equivalent to
`(8−n)(c^b_{β+1,γ} + c^c_{β,γ+1}) ≤ 72 − 15n/2`. All 90 hold, checked exactly (`intercept_check.py`), with 39 Out rows and 36 In rows
tight. Two sample rows by hand:
- Out(1,7): `−16035/16 + 7·(−2067/16) + 2016 + 21/2 − 15·8 = −1906.5 + 1906.5 = 0`.
- In(0,0): `8·(9/2 + 9/2) = 72`.

The aggregate rows are identities: `m a + λK = (−21m/2 + (75m/2+15)(16m+1)/3)/L = L/L = 1` and
`m a₂ + λ₂(K−1) = (600m² + 72m − (75m+15/2)(16m−2)/3)/L = L/L = 1`. Summing the affine rows over the m chokes of any composition of K
(or K−1) gives the literal Out ≥ 1 (or In ≤ 1) for every splitting, including empty chokes and full chokes (β + γ = 8), so no DP is
needed.

For Residual, `(B − A)·L − 288·B` is a degree-10 polynomial whose Taylor coefficients at m = 3 are all nonnegative, and B > 0 for
m ≥ 3; hence `1 − ρ₁ ≥ 288/L` for every real m ≥ 3. In the same way, `1 − ρ₁(m) ≥ 2/(5m)` for every m ≥ 3, and exactly
**`lim m(1 − ρ₁) = 15/32`**, so the **margin slope is `(1 − ρ₁)/θ ~ (125/384)·m ≈ 0.32552·m`**. This is F2's observed "≈0.3256",
now exact and with an explicit bound (F2's open item 3).

A second, independent path, `symbolic.py`, substitutes the closed forms into every primal row as a polynomial in m. Every Out, In,
aggregate and Switch row is an identity or has nonnegative Taylor coefficients from m = 0. Every share's nonnegativity is certified
from m ≤ 5, except pb(1,7), which needs real m ≥ 16035/600 = 26.725; this is the only binding threshold. `crosscheck.py` evaluates the closed forms at 22 residue-2 values of m from 50 to 10⁷+1
(including 116, 119, 3002 and 123458, none of which were solved by the LP) and passes each, primal and dual, through the exact row
checkers. ∎ (at template level)

**F-9 (CRITIC-DERIVED: the θ*-law of r30 is proved for the class; F2's open item 2 is closed; STATED).** For every m ≥ 107 in the
class, the optimum of the affine-separation LP of record, **and** of the exact per-composition template system (Out/In quantified
over all integer splittings: the "exact min-plus/max-plus" system), is exactly `288/(200m² + 82m + 5)`.

*Proof.*
- **Primal.** The primal is F-8's allocation.
- **Dual.** Its values times L are polynomials in m of degree ≤ 2, with support constant in m: 35 rows, including
  `y_AGG_OUT = (1536m+384)/L` and `y_AGG_IN = (1536m+96)/L`. All dual rows are identities or hold for all m ≥ 0, y ≥ 0 for m ≥ 2, and the
  dual objective is `y_AGG_OUT − y_AGG_IN = 288/L` (`symbolic.py`). So the law is the affine LP's optimum. The exact system is looser,
  so its optimum is at most the law.
- **Lower bound for the exact system.** The dual's free columns a and λ force `c* = y_OUT/y_AGG_OUT` to be a fractional source
  composition (Σ = m, Σn = K) supported on n ∈ {1,6,7}; likewise `e* = y_IN/y_AGG_IN` is a fractional target composition supported on
  n ∈ {0,5,6}.
- Splits among states with the same n are free (products of scaled simplices), so it suffices that the n-profiles lie in the
  integer hull. Integer solutions on each profile line form an arithmetic progression, which gives these sufficient conditions:
  `4 ≤ c*₇ ≤ (13m+1)/18 − 5` and `(m−2)/3 + 4 ≤ e*₆ ≤ (16m−2)/18 − 5`.
- Both hold for every real m ≥ 73 (degree-2 polynomial certificates, `hull_symbolic.py`). At m = 107, for example, c*₇ = 23.33
  lies in [4, 74] and e*₆ = 40.91 lies in [35, 95].
- Writing the fractional compositions as convex combinations of literal compositions turns the affine dual into a dual of the exact
  system with the same objective. ∎

Consequences:
- The affine separation is **never** infeasible on the class (the regime question in F2's allocation brief).
- It is **not conservative** at the optimum.
- r30's conjectured θ*-law is proved on the class, for this template only. It is still no hypothesis of anything, and not
  necessary for arbitrary flows.

**F-10 (other checks, all passed).**
- ℕ-subtraction: K, K−1 and d−n are never truncated, and the ρ₁ representation needs m ≥ 3.
- No Newton or Darroch anywhere, in the return or here. F-8 is Darroch-free: the ρ₁ step is exact algebra on the product of linear
  factors that defines r₁.
- The residue class enters through K = (16m+1)/3 being an integer, and through p* = ⌈μ₁⌉ + 2 for the carried E1 key.
- The endpoint `m = 107` is inside every certificate threshold.
- The residue note on `m ≡ 0, 1 (mod 3)` (floor offsets 1/3 and 2/3) is correct, record only.

## Mechanism-equivalence and fence check

- **Mechanism.** The object throughout is the r30 choke-local template: deletion shares pb and pc, the u_i-switch share σ, and the
  E1 residual capacity. It is not a refuted mechanism. It is not the m-independent per-choke certificate (my shares scale with m
  through `(75m/2 + c)/L`), not a compression lemma, and not real-rootedness of any forest polynomial.
- **One rank per tree; class only.** Every claim of mine is stated at `(CB(8,m), p*(m))`, `m ≥ 107`, `m ≡ 2 (mod 3)`. The
  certificate thresholds (26.725, 73, 3) are properties of the proofs, not claims about other rows. F2's below-class candidate is
  struck (F-2).
- **No status transfer.** Nothing here touches (HALL) at full scope, the primary aggregate, or any OPEN key. (L-S)_top^template
  is **not** (H): (H) additionally needs the template-to-network reduction and composition (U2's lemma, STATED at r30's grade; my
  laboratory supports it only at small d and m), E1's criterion (carried, `proved_informal`), E1(i) at p* for every q (carried,
  `proved_informal` modulo Darroch on the r_q), and favorability of every leaf (carried, modulo Darroch/Newton). (E) needs
  (ELIG-top)(a), which is untouched here and `bounded_computation` to 2395.
- **Census discipline.** The fits (from m = 107, 110, 113) were discovery only. The proof is the symbolic verification, which is not
  a sweep.
- **Alias check.** Lexically, no `E993-R31-` key exists. Mathematically, the nearest registered objects are the r30 row key
  `E993-R30-CB-8-M-95-TO-107-…` (finite rows, a full (HALL) certificate, `computer_assisted`: different scope and object) and the
  unregistered θ*-law conjecture text in SEMANTIC-CONTRACT §2, which F-9 proves on the class. Proposed candidates (named as
  predicates; STATED; for synthesis alias re-check):
  1. `E993-R31-CB8-TOP-RANK-SECTOR-TEMPLATE-CLOSED-FORM-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-FOR-EVERY-M-AT-LEAST-107-CONGRUENT-2-MOD-3` (F-8).
  2. `E993-R31-CB8-TOP-RANK-SECTOR-TEMPLATE-AFFINE-AND-EXACT-OPTIMA-EQUAL-288-OVER-200M2-PLUS-82M-PLUS-5-FOR-EVERY-M-AT-LEAST-107-CONGRUENT-2-MOD-3` (F-9).
  3. `E993-R31-CB8-TOP-RANK-E1-ONE-MINUS-RHO1-AT-LEAST-2-OVER-5M-WITH-LIMIT-M-TIMES-ONE-MINUS-RHO1-EQUAL-15-OVER-32` (the Residual input).

  Grade proposal after an isolated second read: `proved_informal`. The proofs are exact rational and polynomial identities and
  inequalities, and all three are formalizable by `norm_num`/`decide`-style checks.

## Certification audit

Struck or narrowed in the return:

- **Candidate 2**, "tight set invariant in m at the LP optimum": **refuted as stated** (F-1). A replacement fact (bounded
  computation at m = 107 and 110): the rows tight at every optimum are the 17 Out and 14 In rows of the dual support. That the
  support is constant in m is a property of my closed-form dual, not of every dual.
- **Candidate 1:** struck (out of class; non-eligible ranks, F-2), together with its inference about the m ≥ 107 cutoff.
- "13 in-class rows": corrected to 7 (F-4).
- The grade label "`proved`": not a contract grade. It is an alias of a registered key (F-5).
- "Evidence that the affine LP's optimum already equals the true combinatorial optimum" and "affine relaxation measurably
  conservative at the boundary states": struck as inferences (F-3). The first is now true by the critic's proof (F-9), not by the
  return's evidence.
- "Out constant across every n = 8 state (forced equal)", "In(0,1) the LARGEST In": vertex-specific, narrowed to "at the vertex F2's
  solver returned".
- "p* − x = 3 at 200, 7 at 500 independently checked": not in the digest. Backed by the critic's `elig.py`.
- The "exact match" at m = 10001: backed by the critic's primal and dual certificate. F2 itself had one LP run and no row check.
- The margin "≈0.3256·m, 2.3% below m/3": correct as a measurement at seven exact points. The limit is exactly 125/384 (critic).

Backed and retained:

- The reproduction of the five recorded θ* values.
- The fresh rows 110 and 113 (exact; the DP check is valid, but it is forced as in F-3).
- θ* at 200, 500 and 1001.
- ρ₁ and the margins at all rows.
- n, α and x at 95, 107, 110 and 113.
- The θ = 0 deficit (as an alias).
- The residue note.
- The small-tree checks (laboratory scale).
- The digest `9d600d60…d85f` (replayed byte-identically).

The return's gate line `LS_top: advanced` is not supported by its own content, which is bounded evidence plus the fresh-row test.
The advance on (L-S)_top in this critique is critic-derived (F-8, F-9).

## Verdict

The return's numbers are correct and reproduce byte for byte. Its two candidate claims do not survive: one is refuted, the other is
out of class and sits at non-eligible ranks. Several interpretive readings are struck, and it proves nothing universal. The critic
closes its three open analytic items (F-8, F-9, and the margin limit) at template level for the whole class. These are STATED,
pending an isolated second read.

verdict: retained_narrowed
headline_resolved: no

`LS_top: advanced`
`ELIG_top: not_advanced`
`cut_candidate: none`

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

1. **Isolated second read** of F-8, F-9 and the ρ₁ bound (candidates 1–3 above). Its inputs are exactly:
   - the intercept table (`own/closed_forms.json`, SHA-256 `0335f7e0…c44`);
   - the 90 m-independent rational inequalities and two aggregate identities (`intercept_check.py`);
   - the nonnegativity threshold 16035/600;
   - the degree-10 Residual polynomial with nonnegative Taylor coefficients at m = 3 (`rho.py`);
   - the degree ≤ 2 dual polynomials and the two integer-hull inequalities (`symbolic.py`, `hull_symbolic.py`).

   The reader should re-derive the ρ₁ normalization independently, since it is the only step with an index convention
   (ρ₁ = r₁(p*−1)/r₁(p*−2), `a₁ = 7`, `b₁ = 8m−7`).
2. **The template-to-network reduction and composition** (U2's lemma). It is the only bridge from F-8 to (L-S)_top in the contract's
   sense ("proved against the literal network or a PROVED quotient"). My laboratory confirms it only at d ≤ 4, m ≤ 3.
3. **(ELIG-top)(a) for every m in the class beyond 2395:** untouched by F2 and by this critique.
4. **The carried Darroch/Newton dependencies** (favorability; E1(i) at p* at every q, not only q = 1) stay at their grades.
5. **Formal route (suggestion).** F-8 and F-9 reduce to finitely many exact rational checks and three low-degree polynomial
   certificates, all natural `norm_num`/`decide` targets for a Stage 7 award on the template layer.
6. **Record correction for the controller:** add F2's `pgrep -fl` sibling-command-line exposure to
   `C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json` (Identity and seal audit).

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-F2-U/` (SHA-256):

- `seals.py` `ed3355c09c0fef011b857f7bec5975f74a5f165d631e77f95fc21d95c66af6a9`: seal and member digest recomputation.
- `replay/`: copy-out of `scratchpad/c1-F2/*.py`, `RESULTS.shipped.json` (the shipped file) and the replayed `RESULTS.json`. Both
  are `9d600d6069c84e6640ade18e58b0829a33360d7312cf0411c8fd9a60e920d85f`.
- `own/lp.py` `0f23c884124a843956414be9c513f23ae538eaf1e068e29dc0f21fa79489e42f`: exact two-phase simplex.
- `own/template.py` `bb3ebf2f48758f6481f7e289c7de1815f3ca68af3354531a6615ef257e4c1a0f`: the contract template, its dual, exact checkers.
- `own/run_lp.py` `429f03b4668e2a1215db141794d0fbbceb7e3d7b49e1f763a46e3f1a77764425`, with outputs
  `own/lp_out_95.json` `1996ba53a5b0c508ae37538ffb5c16c3a8769d8be79edc28de10f746b28e0526` and
  `own/lp_out_107_110_113_200_500_1001_10001_100001_1000001.json` `8bebcc2b17df1f4ef455e8ffbbfc05e4373d6b82bc6bd1c9a7d839523223be4b`.
- `own/poly.py` `44652b4ff8d3bbacbd3f7758ac2b748e1130bc7a113200e8859cb59b9fc33381`: exact polynomial arithmetic, Taylor-shift certificate.
- `own/fit.py` `24822a05d6ae9a44916eb48cc8bba1e1ab14b23c15c01a01436c0aa8841b41dc`: discovery fit, writing `own/closed_forms.json`
  `0335f7e087804301d36fcbd4b34eec6493def4c5c8b13a415419c9324891c28c`.
- `own/symbolic.py` `7b6f089d9d825680163398a887150dad3a5374004d757cbac127294e651dcbca` with output `own/symbolic_report.json`
  `acd9dc878e93c7359709695f39bc8a1b36c5349e050a3303946652b5a2015662`: primal, dual and nonnegativity polynomial certificates.
- `own/intercept_check.py` `bd24467419f47d7683d7f435a81fb06342c8a26271a3daae9002a4d987e77095` with output `own/intercept_check.out`
  `92b2c1f7a417e142ea9f2a1029d3ff9d76cc595656c5207bb779a7669619c200`: the m-independent reduction (second path). The table
  in F-8 is `own/intercepts.md` `a322ed6215b148628f7828e2c7fd086f063975565a385c1c6165a92f6614fdb9`.
- `own/crosscheck.py` `edfe6692652ac8c07deaf74a2fc416d60039b908308db4cac1cdd4e0a48be558`: closed forms evaluated at 22 residue-2 values
  of m (50 to 10⁷+1), through exact checkers.
- `own/rho.py` `4795bde392d59a6edcdedb2bf439b65c61d3cb1631594cceeb22bed5491472a6` with output `own/rho.out`
  `9be453e1a5084c754c84d4ed3aa06e1234dec9eaff9630e9ba4398d5776e3099`: ρ₁ rational form, Residual certificate, limit 15/32.
- `own/hull.py` `c523344e25c534b65f4a6489b66379e9dbf3ed8e019b47b06543b47973edb611` and `own/hull_symbolic.py`
  `1db973601e6c65a732fd6af0852469ac34ee3cc40738a16f1aa8a9acdfb38542`, with output `own/hull_symbolic.out`
  `767fcd285d7165586f090595022bff47deb803189ce373fcb029e08e2c7e2ad9`: integer-hull certificates (F-9).
- `own/tightface.py` `750a06a6f2ef3695fa9b839fb3265ebbc69a24e88f635ddcea83f700b126c480` with outputs `own/tightface_107.out`
  `3c798f28e525d4648619644a79287cbdfdb530fbd509a8810d5288f62a849ec1` and `own/tightface_110.out`
  `65d56a2018a6b53618087b199fa58dd3e54541d890206984d519ff72ff753b38`; `own/witness.py`
  `cc7d585d7b1b189522d561b51238280a179dff1aa6c489a192a7e223d85e7cb0` with output `own/witness.out`
  `f359099e25516e845683381297494bcfd99d8268cfa4e7c2685248eec52fa773`: F-1.
- `own/elig.py` `04e43ece4c6c640557d18c834d010205b72bc12f06ce76678a08f5297d7b2f84` with output `own/elig.out`
  `fade4ac843172d670dc2af907ff1e6074720ff2b5f0433b69b1b6ea6f1a93c44`: x through α. Its trailing "check sum" field is a meaningless
  diagnostic; ignore it.
- `own/literal_lab.py` `218c636b9b375ecaa355e0cca55ccb06b0dc3c1dc8da29376e69464cc4c68dfc` with output `own/literal_lab.out`
  `1266980ecd71b7bff174133aeff9eff5f0143ce60b076112fe536a4f3539ae2c`: literal per-state reduction laboratory.
- `own/critic_summary.py` `1a2ae33c7e750a6c03569412c32635236ad6d7fc29f901d14a4930dcb339e428` with output `own/CRITIC-RESULTS.json`:
  canonical, SHA-256 `3c57a9596a41fa1511f390e2e5cea2e3dd5409e2c5ad7cdf794cc1ed6b657e34`, 1287 bytes. Replay: `cd` into `own/`, then
  `python3 -B critic_summary.py`.

No background jobs were started; every computation ran in the foreground to completion, so nothing needed to be killed.
