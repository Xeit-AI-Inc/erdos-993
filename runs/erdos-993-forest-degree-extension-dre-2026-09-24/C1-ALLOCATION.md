# Cycle 1 Route Allocation — r27 (audit and formalize the finite forest degree/extension inequality)

Controller: Claude Fable 5.1, 2026-09-24. Topology 9 routes / 18 critics / 3 adjudicators / 1 synthesis;
routes Claude Sonnet 5 xhigh, critics Claude Opus 5 medium, adjudicators/synthesis/Stage 7 Claude Opus 5
high (`AUTHORIZATION.md`). The objects: the degree lemma (DL), the extension inequality (EX), the linear
bound (LB) and its consequences (R5), (XR), the K1-addition composition (K1), and the external-source audit
(`SEMANTIC-CONTRACT.md` §2–3; `SOLUTION-CONTRACT.md` §1–2). The external paper and Lean source are inputs
under AUDIT; nothing external is a theorem of record until proved in-run.

| Seat | Route | Object |
|---|---|---|
| `T1` | `C1-T-01 DEGREE-LEMMA-POLYNOMIAL-INDUCTION-PROOF` | (DL) by the paper's two-potential induction, statement-level, Lean-ready |
| `T2` | `C1-T-02 DEGREE-LEMMA-ALTERNATIVE-PROOF` | (DL) by a different mechanism (or the sharpest obstruction to one) |
| `T3` | `C1-T-03 EXTENSION-DOUBLE-COUNT-AND-CONSEQUENCES` | the double count, (EX), (LB), (R5), (XR) with every edge case and the ℕ/ℤ bridge |
| `F1` | `C1-F-01 DEGREE-EXTENSION-FALSIFICATION-CENSUS` | falsify (DL)/(EX) on every forest to order ≥ 14 and adversarial families; certify acyclicity is load-bearing |
| `F2` | `C1-F-02 EXTERNAL-LEAN-SLICE-AUDIT` | statement fidelity, dependency graph, static scan, toolchain and license of the external finite slice |
| `F3` | `C1-F-03 RANK5-RESIDUE-AND-K1-ADDITION-RECONSTRUCTION` | the r25 lineage: exact claims, evidence, the strongest valid composition and its grade |
| `U1` | `C1-U-01 LEAN-ARCHITECTURE-AND-CONTRACTS` | contracts, definition layer (`indepDegreeSum`, `firstDescent`), DAG, skeleton |
| `U2` | `C1-U-02 LEAN-DEGREE-LEMMA-CORE` | the polynomial/potential machinery for (DL) in Lean, sorry-free as far as it goes |
| `U3` | `C1-U-03 LEAN-EXTENSION-COUNT-AND-CONSEQUENCES` | the double count, (EX) from (DL) as a hypothesis, (LB), (R5), (XR) — sorry-free |

## Standing state entering Cycle 1

Master registry 370 identities (`sources/authority/`); public `main` `0b4bbdb`. The G1 definitions of record
and the formal `(k+1)²` bound are `sources/r25/c4-forest-descent-order-bound/` (award
`E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP`). The rank-5 lineage of record: `E993-R25-RANK5-CEILING-SHARPENED-TO-25`
(informal, residue orders 22–25 with ≥ 3 branch vertices), `E993-R25-RANK5-TWO-BRANCH-EXACTNESS-ORDERS-22-29`
(complete census), `E993-R25-SECOND-ORDER-TWO-SIDED-CEILING` (`Δ_4 < 0 ⇒ n ≤ 19`, `Δ_5 < 0 ⇒ n ≤ 29`),
`E993-R25-KADDITION-CLOSURE-X-LE-4` (with the order-≤21 census of 8,355,831 classes,
`sources/r25/records/C4-RETURN-T4.md` §7 and `sources/r25/c4-T4-census/`), `E993-R25-HUNTER-SPANNING-TREE-INEQUALITY`.
r26's inheritance (`sources/r26/`) is orthogonal (trees, the top-rank aggregate). The external source
(`sources/external/`) is frozen: the paper HTML and §8 text; the finite Lean slice; the packet's static scan.

## Mechanism fingerprints and load-bearing obligations

1. **T1 `DEGREE-LEMMA-POLYNOMIAL-INDUCTION-PROOF`.** Prove (DL) from scratch following the paper's route:
   for a tree `T` rooted at `r`, `D_T(x) = Σ_{J∈I(T)} (2|J| − Σ_{v∈J} d_T(v) − 2·1[r∈J]) x^{|J|}` and the
   companion `E_T`; prove the recurrences (8.4)–(8.5) when the root has child subtrees (or the
   one-child-at-a-time form the external formalization uses: with `S'` and `T` joined by the single edge
   `r ~ s`, `D_{S'∪T} = D_{S'}A + A'D_T + x(E_{S'}B + B'E_T) + 2xB(A'−B')`,
   `E_{S'∪T} = E_{S'}P + A'D_T + xB(A'−B')` — derive it yourself; the external comments are not evidence);
   show every term is coefficientwise nonnegative; pass to forests by summing over components; extract the
   `x^k` coefficient to get `2k·i_k − D_k − 2·#(J containing a root) ≥ 0`. Statement-level claim ledger;
   every hypothesis (acyclicity, finiteness, rootedness) named where it enters; every ℕ-subtraction and
   cast audited; the empty forest and `k > α` handled. Deliver `INFORMAL-PROOF.draft.md`. Debt: the
   smallest unproved step.
2. **T2 `DEGREE-LEMMA-ALTERNATIVE-PROOF`.** Attempt a proof of (DL) by a DIFFERENT mechanism than the
   polynomial induction — e.g. an injection/charging argument (orient each tree away from a root; each
   vertex has at most one parent; charge `Σ_{v∈J} deg(v) = Σ_{v∈J} (#children(v) + [v non-root])` against
   independent sets via leaf deletion or a bijection `I_k(T) × {edge incidences} → …`), a leaf-deletion
   induction on `(D_k, i_k)` jointly, or the root-corrected form `Σ_J (2|J| − Σ deg − 2·1[r∈J]) ≥ 0` by an
   explicit sign-reversing involution. If a second proof closes, it is the second derivation the record
   wants; if it does not, deliver the sharpest obstruction (where the naive charging fails: give the tree
   and `k`), and check whether (DL) holds on arbitrary bipartite graphs, on unicyclic graphs, on all graphs
   with average degree ≤ 2 (find the smallest failures — these fence the hypothesis).
3. **T3 `EXTENSION-DOUBLE-COUNT-AND-CONSEQUENCES`.** Prove exactly, in the G1 definitions: the double count
   `(k+1)·i_{k+1} = Σ_{J∈I_k} e(J)`; `e(J) ≥ n − k − Σ_{v∈J} deg(v)` (state precisely when equality holds);
   (EX) from (DL) in the subtraction-free form and the `ℤ` form and their equivalence; (LB) with `i_k > 0`
   from `Δ_k < 0`, including `k = 0`, the empty forest, `k > α`; (R5) `n ≥ 21 ⇒ Δ_5 ≥ 0`; (XR) with the
   `4r − 4` truncation audit and the `d ≤ 2r − 4` restatement; the comparison with the formal `(k+1)²`
   award (which is stronger where; equality at `k = 1`); the r25 forest-target live region after (XR) —
   state exactly which `(d, r)` cells of the r25 record survive, without any no-recovery wording.
   Fixed points first (`SEMANTIC-CONTRACT.md` §4).
4. **F1 `DEGREE-EXTENSION-FALSIFICATION-CENSUS`.** Own instrument (stdlib; own forest enumerator by
   canonical form, all component counts; validated against the free-forest counts 1, 1, 2, 3, 6, 10, 20, 37,
   76, 153, 329, 710, 1601, 3658, 8599 for orders 0–14 and against brute force at small orders): on every
   forest to order ≥ 14 and every `k ≤ α`, compute `D_k`, `i_k`, `e(J)` sums, and check (DL), the double
   count, `e(J) ≥ n − k − Σ deg` per `J`, (EX), (LB), (R5), (XR); record the tight cases of (DL) (`D_k =
   2k·i_k`) and of (EX); then adversarial families to order ≥ 60 (stars, double stars, spiders, caterpillars,
   brooms, paths, disjoint unions with isolated vertices and `K₂`s, `T_m`-like combs); then NON-forests
   (unicyclic graphs, cycles `C_n`, complete bipartite `K_{a,b}`, `K_n`) to find the smallest failures of
   (DL) and (EX) — certifying that acyclicity is load-bearing and stating what the bipartite case does.
   Null results are bounded evidence and say so.
5. **F2 `EXTERNAL-LEAN-SLICE-AUDIT`.** Read the frozen external finite slice (`sources/external/lean-source/`)
   and the paper §8 (`sources/external/paper/section8-extracted.txt`): (a) the dependency graph of
   `sum_degOn_le` and `prefix_ratio` (which modules, which declarations; confirm nothing from CLT/Fourier/
   HardCore/Curvature/RootMoments/MeanRange/Transfer is imported by the slice); (b) statement fidelity —
   translate `icoeff G S k`, `degOn G S v`, `numExtensions`, `indepFinsets` to the run's definitions
   (`indepCount`, `G.degree`, `e(J)`) on `S = univ`, and state exactly what `sum_degOn_le` and `prefix_ratio`
   assert (their `IsAcyclic` hypothesis; their `S`-relative degree `degOn`; any `[DecidableRel]` or
   `Fintype` assumptions); check against the paper's (8.3) and (8.8); (c) a static scan of the eight files
   for `sorry`/`admit`/`axiom`/`native_decide`/`unsafe`/`decide` (report every hit with context; the packet's
   scan found none — verify); (d) the toolchain and Mathlib pins vs. the run's (4.29.1 vs 4.32.2; the two
   Mathlib revisions) and which Mathlib names the slice uses that may have changed; (e) LICENSE status
   (none in the audit copy; state what that implies — Gate ruling 3); (f) which of their intermediate
   statements a local re-proof would need (a translated lemma list with sizes). No building of the external
   project; no `elan`; nothing copied into any Lean project.
6. **F3 `RANK5-RESIDUE-AND-K1-ADDITION-RECONSTRUCTION`.** From the frozen r25 records (`sources/r25/records/`,
   `sources/r25/c4-T4-census/`) and registry statements: reconstruct EXACTLY (a) the K1-addition target and
   its NR1 reduction (`Δ_j(G ⊔ K₁) = i_{j+1}(G) − i_{j−1}(G)`; what the closure at rank `x` needs);
   (b) the `x ≤ 4` closure's dependency DAG (second-order ceiling, Hunter, the census) and each input's grade;
   (c) the rank-5 lineage (ceilings 36 → 29 → 25, the two-branch exactness census, the residue orders 22–25
   with ≥ 3 branch vertices) — what each claim states and on what evidence; (d) the order-≤21 census: what
   it certified (both populations), its instruments, whether it was replayed (by whom), and whether it can be
   replayed in-run in the foreground (attempt orders ≤ 16 at least with your own enumerator; report the
   horizon attained and the class counts, e.g. 208,587 to order 17); (e) the strongest valid composition
   after (R5): `x(G) = 5 ⇒ n ≤ 20 ⇒` covered by the census — closure `x(G) ≤ 5`; state its grade as the
   weakest input's and what would be needed for `x ≤ 6` (`n ≤ 24` vs the census horizon 21); (f) the scope
   notes each r25 key should carry after this run (drafted). No status transfer to any no-recovery claim.
7. **U1 `LEAN-ARCHITECTURE-AND-CONTRACTS`.** Draft the Stage 7 theorem contract(s) for the §2 statements in
   the C5-LA1/r25 contract schema (`sources/r25/c4-forest-descent-order-bound/THEOREM-CONTRACT.yaml` is the
   model); build a scratch project (`scratchpad/c1-U1/LeanProject` seeded byte-identically from
   `sources/r25/c4-forest-descent-order-bound/LeanProject/{lakefile.toml,lake-manifest.json,lean-toolchain,LeanProof.lean}`;
   bind the shared Mathlib by MANUAL SYMLINK `.lake/packages → /Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages`
   — nothing copied; then `lake build` in the foreground; never `lake update`/`lake clean`) carrying the
   G1 definitions byte-identically as a module and a `Main.lean` with the definition layer
   (`indepDegreeSum`, `firstDescent` with its existence proof, the extension count `e(J)`), the five target
   statements as declarations (`sorry` where open, with a SORRY LEDGER), and any lemma you can close
   (e.g. `firstDescent` well-defined; `Δ_k < 0 → 0 < i_k`; `i_0 = 1`; `i_k = 0` for `k > n`). `#print axioms`
   on every sorry-free declaration; digests of every Lean file.
8. **U2 `LEAN-DEGREE-LEMMA-CORE`.** In a scratch project set up as U1's (`scratchpad/c1-U2`), compile the
   machinery for (DL) IN YOUR OWN WORDS (Gate ruling 3: no external Lean text): a vertex-weighted
   independence polynomial (or its coefficient family) on a `Finset` of vertices, nonnegativity closed under
   sum/product, root conditioning (`Z_S = Z_{S∖r} + x·Z_{S∖N[r]}`), multiplicativity over separated vertex sets,
   the single-edge join and the two recurrences, and — as far as you get — the simultaneous induction giving
   nonnegativity of `D_T` and `E_T` for a tree; report which nodes are sorry-free with `#print axioms`, which
   are `sorry`, and the exact obstacle at each open node. This is the Stage 7 long pole; every compiled
   fragment shortens it.
9. **U3 `LEAN-EXTENSION-COUNT-AND-CONSEQUENCES`.** In a scratch project set up as U1's (`scratchpad/c1-U3`),
   compile SORRY-FREE on the G1 definitions: (a) the extension count `e(J)` and the double count
   `(k+1)·i_{k+1} = Σ_{J ∈ I_k} e(J)` (bijection between pairs `(J, v)` with `v ∈ V ∖ N[J]` and pairs
   `(J', u)` with `J' ∈ I_{k+1}`, `u ∈ J'`); (b) `e(J) ≥ n − k − Σ_{v∈J} deg(v)` (in `ℤ`, or the
   subtraction-free `e(J) + k + Σ deg ≥ n`); (c) (EX) from (DL) taken as a HYPOTHESIS (state the hypothesis
   exactly as the §2 `forest_degree_lemma` statement so it composes); (d) (LB) from (EX) with `Δ_k < 0 → 0 <
   i_k`; (e) (R5) and (XR) from (LB), with `firstDescent` defined as in U1 (coordinate the definition text
   through the contract: identical statement, since you cannot read U1). `#print axioms` per declaration.

## Read grants

Every route reads the sealed Stage 2 packet (`control/C1-STAGE2-PACKET-MANIFEST.json`) and nothing outside
it except Mathlib sources under the shared project (API meaning) and the two VerityOS boot files. External
Lean text is READ ONLY (Gate ruling 3): never copied into a project, never quoted beyond a declaration's
statement line for audit. Lean-building seats bind by manual symlink as in item 7.

## Stage 3 admission rule

As r26: route ID and mechanism token; boot acknowledgment naming exactly the two boot reads; the Stage 2
seal; one typed route verdict; exactly one `headline_resolved: yes|no` line (the headline is (DL)+(EX)
FORMALLY VERIFIED with (LB)/(R5) checked; no route can produce it — `no`); `## Remaining obligation` as
successor inheritance; IMPORT LIST; model disclosure ("chartered sonnet/xhigh; transport-resolved model
sonnet (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on
dispatch-record authority").
