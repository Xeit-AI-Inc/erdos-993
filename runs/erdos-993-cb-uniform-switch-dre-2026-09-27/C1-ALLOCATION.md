# Cycle 1 Allocation — r31 (a parameter-uniform switch-using Hall certificate on CB(8,m) at the top sector-deficient rank)

Controller: Claude Opus 5.5, 2026-09-27. Topology 9/18/3/1 (Ashton's instruction; `AUTHORIZATION.md` §3). Routes are chartered
Claude Sonnet 5, **high** effort. Binding with `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C1-STAGE1-GATE.md` and
`control/C1-WORKER-COMMON-BRIEF.md`.

**The target (frozen).** For every `m ≥ 107`, `m ≡ 2 (mod 3)`, `T = CB(8,m)`, `p* = (16m+4)/3`: (E) `p*` eligible with the actual first
descent; (H) the literal active-tag deletion/two-for-one network has (HALL) at `p*` with `F = F_{p*}(T)`. ONE rank per tree. The two
missing lemmas: **(L-S)_top** (a uniform residual-capacity sector allocation) and **(ELIG-top)(a)** (`i_{p*−1} < i_{p*−2}`). The carried
inputs: the favorability key and the E1 threshold key (`proved_informal` modulo Darroch/Newton on products of linear factors), the
criterion key (`proved_informal`), the r30 row keys (`computer_assisted`; the class's first member `m = 107` is certified there).

## Routes (route ID — mechanism fingerprint token; each return must contain both verbatim)

| Seat | Route ID | Mechanism token | Orientation |
|---|---|---|---|
| T1 | `C1-T-01` | `LS-TOP-CLOSED-FORMS-FROM-EXACT-TABLES` | T (prove) |
| T2 | `C1-T-02` | `LS-TOP-SLACK-ALLOCATION-WITH-EXPLICIT-ERROR-BOUNDS` | T (prove) |
| T3 | `C1-T-03` | `ELIG-TOP-BLOCK-MIXTURE-PARENT-DESCENT` | T (prove) |
| F1 | `C1-F-01` | `LITERAL-NETWORK-FIDELITY-AND-SHARED-CAPACITY-AT-FRESH-ROWS` | F (falsify) |
| F2 | `C1-F-02` | `LS-TOP-ASYMPTOTIC-AND-ENDPOINT-STRESS` | F (falsify) |
| F3 | `C1-F-03` | `ELIG-TOP-DESCENT-ADVERSARY` | F (falsify) |
| U1 | `C1-U-01` | `LEAN-CB-DEFINITION-LAYER` | U (formal / structural) |
| U2 | `C1-U-02` | `SECTOR-CERTIFICATE-COMPOSITION-REDUCTION` | U (formal / structural) |
| U3 | `C1-U-03` | `ELIG-TOP-INTEGER-DESCENT-FORMAL-ROUTE` | U (formal / structural) |

### T1 — `C1-T-01 LS-TOP-CLOSED-FORMS-FROM-EXACT-TABLES`

Load-bearing obligation: closed forms in `m` for the per-state allocation on the residue-2 class, and a proof that they satisfy every
constraint for all `m ≥ 107`. Steps, in order: (1) reproduce the five recorded `d = 8` residue-2 tables (`m = 95, 98, 101, 104, 107`;
`sources/r30/instruments/c6/C-T2-U/own/CERT-TABLES.json`, `…/C-T2-F/crit_cert_tables.json`, `crit_extend_{a,b}.json`) with your own exact
solver of the template (`SEMANTIC-CONTRACT.md` §2; the frozen `inherited/localflow.py` is a reference, and your own implementation is
required); compute fresh tables at `m = 110, 113, 116` and more as needed; (2) fit exact rational closed forms for `pb(β,γ)`, `pc(β,γ)`,
`σ(γ)`, `θ(m)` and the separation parameters — a proposal, not a claim; (3) **test the proposal at the FRESH rows `m = 110` and `113` with
an independent exact verifier of the per-state constraints (Out/In by exact min/max over all splittings of `K`, `K − 1` among the `m`
chokes; Switch; Residual) BEFORE any universal argument** — if a proposed formula fails there, say so and refit; (4) prove, for all
`m ≥ 107` in the class, that the closed forms are nonnegative and satisfy Out, In, Switch and Residual — the last needs an explicit
LOWER bound on `1 − ρ_1(m)` (`ρ_1` is a coefficient ratio of `(1+y)^7(1+2y)^{8m−7}` — a product of linear factors; derive its exact
form); any "large `m`" step carries an explicit `M_0` and remainder. Do not assume the LP optimum or the `θ*` law is necessary.

### T2 — `C1-T-02 LS-TOP-SLACK-ALLOCATION-WITH-EXPLICIT-ERROR-BOUNDS`

Load-bearing obligation: a feasible allocation that is NOT the LP optimum but is simple enough to prove uniformly — e.g. deletion
probabilities depending only on the leg type and the choke's leg count, a switch share with explicit slack, `θ(m)` chosen with room
below `1 − ρ_1(m)` — with every constraint proved by explicit estimates (binomial/hypergeometric ratios with explicit bounds, no
asymptotic "≈" without a remainder). Deliver: the allocation; the exact constraint system it must satisfy at `p*(m)`; the proof with
explicit `M_0`; an exact verification at `m = 107, 110, 113` and at the smallest `m` your bounds cover; and the explicit residual
capacity bound `θ(m) ≤ 1 − ρ_1(m)`. If the simple allocation provably fails (a state where no choice of your parameters works),
report the obstruction exactly — that is a template failure, not a cut.

### T3 — `C1-T-03 ELIG-TOP-BLOCK-MIXTURE-PARENT-DESCENT`

Load-bearing obligation: (ELIG-top)(a) `i_{p*−1}(CB(8,m)) < i_{p*−2}(CB(8,m))` for every `m ≥ 107`, `m ≡ 2 (mod 3)`, and the composition
(E) = (a) + `3p* < 2α + 1`. Use the block decomposition (`SEMANTIC-CONTRACT.md` §2): each block `C(m,j)(1+2x)x^j(1+x)^{8j}(1+2x)^{8(m−j)}` is a
monomial times a product of linear factors, so Newton/Darroch apply to EACH BLOCK (state the hypotheses at every use); the tail term
`x(1+x)(1+2x)^{8m}` likewise. Blocks with mean far above `p* − 2` ascend there; the argument must show the descending blocks' mass
dominates, with the binomial weights `C(m,j)` controlled EXPLICITLY (e.g. the ratio of consecutive block contributions at the two
coefficients, a tail bound on `j`), an explicit `M_0`, and the range `107 ≤ m < M_0` handled by exact integer computation (your own
generator) — or a proof valid for every `m`. The struck r30 argument applied Darroch to `I` itself; never do that. The bounded record
to `m = 2395` is a prior, not evidence.

### F1 — `C1-F-01 LITERAL-NETWORK-FIDELITY-AND-SHARED-CAPACITY-AT-FRESH-ROWS`

Load-bearing obligation: the adversarial audit of the COMPOSITION on the actual network at the fresh rows `m = 110, 113` (with
`m = 107` as the control row of record). Build exact instruments that (i) assert (WID) from independent sides and DERIVE `F_{p*}`;
(ii) compute the exact total loads of the E1 flow plus a sector allocation (the r30 template's exact LP optimum at that row — computed
by your own solver — or T1/T2's proposals if you can obtain them only from the sealed record: you cannot read sibling returns, so use
the template) on EVERY target class: in-sector targets, sector switch images (load `ρ_1γ` from E1 plus the sector switch load),
`r`-free targets with one choke not reached by a sector switch, targets with two or more chokes, weight-zero targets; (iii) run a
sampled literal laboratory on the actual tree (sources of every choke-state class; every switch image and its `8 − γ` preimages;
in-sector targets and their preimages) confirming the per-state reduction; (iv) attack shared-capacity competition: is any target
loaded by BOTH E1 and the sector beyond its capacity? Search structured source families for a deficient cut at the fresh rows; if the
template fails at a row, say whether the network still has Hall there (a different allocation) — template failure is not a cut.

### F2 — `C1-F-02 LS-TOP-ASYMPTOTIC-AND-ENDPOINT-STRESS`

Load-bearing obligation: stress the template across the class. Exact template LPs (your own solver) at sampled `m` (107 … as large as
exact arithmetic allows in the foreground; report the horizon), the observed `θ*(m)` against `288/(200m² + 82m + 5)`, the margin
`(1 − ρ_1)/θ*` and its growth, which constraints are tight and how the tight set moves with `m`; endpoint states (`γ ∈ {0, 1, 7, 8}`,
`β ∈ {0, 1}`, `β + γ = 8`); whether the AFFINE separation (sufficient) ever becomes infeasible while the exact min-plus/max-plus
constraint system stays feasible; why the residue classes `m ≡ 0, 1 (mod 3)` differ at `⌊(16m+4)/3⌋` (record only). Deliver the regime
map a uniform proof must respect, and any `m` where the template fails, with the failing constraint exactly.

### F3 — `C1-F-03 ELIG-TOP-DESCENT-ADVERSARY`

Load-bearing obligation: the adversarial side of (E). (i) An exact sweep of `i_{p*−1} < i_{p*−2}` for `m ≡ 2 (mod 3)` beyond the record
`2395`, as far as a fast exact method allows in the foreground (report horizon, method, margin trend); (ii) confirm that `x` computed
through `α` satisfies `x ≤ p* − 2` exactly on your range and report `p* − x`; (iii) test, numerically at their sharp points, the block
inequalities a proof would need (which blocks ascend, which descend at `p* − 2`, the ratio of descending to ascending mass), and try to
break any natural sufficient inequality; (iv) check E1's condition (i) at `p*` exactly (Darroch-free) at sampled `m` and every `q`, and
favorability of both leaf classes at `p*` exactly at sampled `m`. Distinguish parent descent (a sufficient condition) from first descent.

### U1 — `C1-U-01 LEAN-CB-DEFINITION-LAYER`

Load-bearing obligation: the CB(8,m) definition layer in Lean, compiled sorry-free in scratch against the carried definitions of record
(seed from the pattern of r30's spider award C6-LA2 — its frozen directory under `sources/r30/lean/` whose name ends in
`c6-la2-spider-tree-weighted-hall-rank-k-plus-3`; its `spiderOneTwoThrees` tree layer is the template; carry C1-LA1/C4-LA1 entries from their `Snippets/` byte-identically): `cbEdge`,
`cbGraph m : SimpleGraph (Fin (17*m+3))` with a proposed frozen labelling, the decidability instance, `IsTree`, `α = 9m + 1`
(`indepNum` equality, both directions), the leaf classification `leafSet = {v} ∪ C`, and the witness sets `W_v = {r}`,
`W_{c_ij} = {u_i}`. Only as needed for the terminal of `SOLUTION-CONTRACT.md` §2; say which pieces the terminal consumes.

### U2 — `C1-U-02 SECTOR-CERTIFICATE-COMPOSITION-REDUCTION`

Load-bearing obligation: prove, at statement level on the face, that for `T = CB(8,m)` at rank `p` with every leaf in `F`, E1's
criterion at every `q`, and a per-state sector allocation satisfying Out, In, Switch and Residual, the combined flow is a saturating flow
of the LITERAL network — every source class and every target class accounted, the per-state reduction (the certificate's Out/In/switch
loads are exactly the literal network's restricted to the sector) written out, the scaling step named. The result reduces (H) exactly
to (L-S)_top ∧ E1(i) at `p*` ∧ favorability; state it as a lemma with its exact hypotheses (a candidate `E993-R31-` key). Then draft its
Lean statement over the carried definitions (the per-state inequalities as hypotheses) and compile what you can sorry-free in scratch.

### U3 — `C1-U-03 ELIG-TOP-INTEGER-DESCENT-FORMAL-ROUTE`

Load-bearing obligation: a Darroch-free INTEGER route to the coefficient facts the target needs — (ELIG-top)(a) and E1's condition (i)
at `p*` — in a form a Lean award can carry: explicit binomial sums, Pascal-type identities, integer inequalities (the r30 C5-LA1 award's
binomial-row chain and integer closing step; Codex's formally verified binomial-block and relative-margin mechanisms under
`sources/heterogeneous-closure/lean/` are the templates to study). Deliver an informal integer proof of at least one of the two facts
for every `m` in the class (or the exact obstruction), and compile the finite-parameter-free lemmas you can sorry-free in scratch.

## Shared rules

1. Every route cites the Stage 2 seal, verifies the sources it uses against `sources/SOURCE-DIGESTS.json`, and writes the gate lines
   of `control/C1-STAGE1-GATE.md` ruling 6.
2. Every instrument asserts (WID) from independent sides and derives `F_{p*}` before reporting anything about a network.
3. Darroch/Newton only on real-rooted inputs; say so at every use.
4. Explicit `M_0` and remainders for every asymptotic step; finite ranges by exact certificates, named.
5. Template failure ≠ cut; a cut must be eligible, exact, and independently checked.
6. New claims are `E993-R31-` candidates, alias-checked lexically and mathematically against `sources/authority/CLAIM-IDENTITY.json`.
