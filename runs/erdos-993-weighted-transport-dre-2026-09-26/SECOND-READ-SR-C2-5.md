# Second Read

Isolated second read `SR-C2-5`, Cycle 2 of r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`; Erdős #993, weighted
mixed-boundary transport). Subject: the equitable-partition flow lift (S11), its class-union Hall converse, the bounded records
around it, and the `X_max` finding (S12). Date 2026-09-26.

**Boot.** I am operating within VerityOS. For the boot I read exactly the two files the protocol authorizes:
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I loaded no other
VerityOS subsystem (no memory, conversations, modules, skills, logs or decisions), and I wrote no conversation log: the protocol
confines my writes to this file and my scratch directory.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Capsule.** `control/c2-second-read/SR-C2-5-PACKET-MANIFEST.json` (stage `cycle-2-second-read-SR-C2-5`, run id
  `erdos-993-math-dre-20260926-r30-weighted-transport`, 19 files). I recomputed the inner seal before reading any member: SHA-256
  of the canonical JSON of the manifest without `seal_sha256` (`sort_keys`, separators `(",", ":")`, no trailing newline) is
  **`5d494d3c34240d93665b47aaca3db107a4e33f0d8a95191d6a3681717a131c72`**. It equals the stored value and the wrapper's value.
- **Members: 19/19 match on SHA-256 and byte count** (`file_count` 19 = listed files):

  | member | SHA-256 (prefix) | bytes |
  |---|---|---|
  | `SEMANTIC-CONTRACT.md` | `ee7ca2e2c3647555` | 17018 |
  | `SOLUTION-CONTRACT.md` | `3168e7a15baf7a7b` | 13035 |
  | `control/C2-ALLOCATION.md` | `0eb59050edcba5e6` | 12823 |
  | `control/C2-SECOND-READ-BRIEF-SR-C2-5.md` | `904e3aac8eff9f84` | 5909 |
  | `control/C2-SECOND-READ-PROTOCOL.md` | `3a2cf76872ef1d6e` | 3338 |
  | `control/C2-STAGE1-GATE.md` | `7d196f5361b52063` | 5052 |
  | `control/C2-STAGE6-CONTROLLER-FACTS.json` | `ddc0754f3f1c9c31` | 12749 |
  | `control/C2-STAGE6-PACKET-MANIFEST.json` | `ee05d0fe10ebe162` | 6416 |
  | `control/PATH-CHECK-c2-second-read-briefs.json` (0 findings) | `660215f265351100` | 527 |
  | `control/SOURCE-DIGESTS.json` | `e82494df3e282ba9` | 232777 |
  | `control/snapshots/CLAIM-IDENTITY.run-local.c2-stage2.json` (438 claims) | `cb8000c318a9bc5d` | 2650050 |
  | `cycles/cycle-2/stage3/returns/U2/RETURN.md` | `3acbdd0a768bc37d` | 40000 |
  | `cycles/cycle-2/stage4/critics/U1/F/CRITIQUE.md` | `b4e761930705cad9` | 20370 |
  | `cycles/cycle-2/stage4/critics/U1/T/CRITIQUE.md` | `920221ad9c75bfe1` | 23485 |
  | `cycles/cycle-2/stage4/critics/U2/F/CRITIQUE.md` | `321e758b84c99a05` | 27500 |
  | `cycles/cycle-2/stage4/critics/U2/T/CRITIQUE.md` | `a31afe91d9d80bee` | 28442 |
  | `cycles/cycle-2/stage5/adjudicators/U/ADJUDICATION.md` | `b7b55430adb12399` | 46783 |
  | `cycles/cycle-2/stage6/SYNTHESIS.md` | `3d30cc4b8c71451a` | 62952 |
  | `sources/authority/CLAIM-IDENTITY.json` (434 claims) | `eba20be33070e2cb` | 2624107 |

  Instrument: `scratchpad/c2-sr-SR-C2-5/` is my own; the seal check was run inline (`python3`, standard library) before any
  member was opened, and its script text is reproduced in the artifact inventory.
- **Nested manifests.** `control/C2-STAGE6-PACKET-MANIFEST.json` is a member; I did not open members it lists beyond my own
  capsule. I did not recompute nested seals; nothing below depends on them.
- **Read-boundary disclosures (this seat).**
  1. The harness placed the project `CLAUDE.md` and the user auto-memory index in my context at session start. I did not open
     either as a source, nothing below relies on them, and I wrote no conversation log (the protocol confines writes).
  2. `SYNTHESIS.md` lines 340–end and U2's `RETURN.md` were too large for inline display; the harness saved byte copies to
     session tool-result files outside the run root, and I read those copies. They are the same digest-verified members.
  3. I located passages in capsule members with `grep -n` rooted at those member files only (the U adjudication, the two U1
     critiques, the synthesis headings). No `find`/`grep`/`rg` was rooted above a capsule member.
  4. To confirm that the output directory's parent existed I ran one non-recursive `ls` of `second-reads/`. It printed six
     directory names (`SR-BUDGET`, `SR-C2-1`, `SR-INV`, `SR-NET`, `SR-REACH`, `SR-SECTOR`); I read nothing under them.
  5. I parsed the two registry members with `json` for the (LIFT)/(INV) statements and the alias check.
  6. One foreground run (`cb_rows.py 1 9 12`) exceeded the 600 s tool limit and the harness moved it to the background (task
     `bymqudh2j`). I identified its PIDs with `lsof -t` on that task's own output file (58854 = the wrapping shell, 58856 = the
     Python process), confirmed them with `ps -p 58854,58856`, and polled by literal PID only. After about 37 minutes I traced the slowness to my own equitability checker (it rebuilt the class
     set per element, a quadratic cost). I killed PID 58856 by literal PID (`kill 58856`) and confirmed that both 58856 and 58854
     were gone. The harness reported the task as failed with exit 143 (SIGTERM); it produced no output. I then fixed the checker
     (the class sets are now hoisted out of the loop, which does not change the logic) and reran every instrument in the foreground
     on the final code. Each output file is byte-identical to its pre-fix run where one existed. `CB(1,9)/12` now takes 23 s
     without flows and 49 s with flows. A monitor (task `bq3v0205u`) polled literal PID 58856 with `ps -p` and ended when it exited.
  7. I read no other return, critique, adjudication, second read, dispatch, scratch directory, experiment root or external
     source. No network, no installs, no Lean, no `lake`. Python standard library and exact integers / `Fraction` only.
- **Controller facts** (`C2-STAGE6-CONTROLLER-FACTS.json`) are a member; I did not use any controller fact as evidence (protocol
  duty 4). Every number below is from my own instrument.

## Statements read

Statement of record: `cycles/cycle-2/stage6/SYNTHESIS.md`, `## Exact established results` S11 and S12, `## Registrations` item 6
and item 8 (the `X_max` strike record), and the C2-LA1 witness ruling (R4). Origins read: U2's RETURN (Candidate 1 with its
proof; Candidate 2), C-U2-T (C1, C2, C3, finding 8), C-U2-F (A1 strengthening, A2, A3), the U adjudication (U2 table;
reconciliation items 1, 3, 5, 6; E2–E4), C-U1-F F-1 and C-U1-T finding 2. Registry: `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT`
(master and run-local snapshot; the snapshot adds the r30 C1 scope note) and `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`
(run-local snapshot), exact statements and scopes.

- **SR-C2-5a (S11, the lift, iff).** Finite `S`, `T`, `R ⊆ S × T`, supply on `S`, capacity on `T`; partitions `π_S`, `π_T` with
  weights constant on classes and two-sided local regularity (`r(C_s, C_t)` arcs from each `u ∈ C_s` into `C_t`; `r′(C_s, C_t)`
  arcs into each `t ∈ C_t` from `C_s`); quotient with class totals and an arc iff `r > 0`. Claim: a saturating integral flow
  exists in the original iff one exists in the quotient; no group needed.
- **SR-C2-5b (class-union Hall).** For a union `X` of source classes, `N(X)` is the union of the joined target classes; (HALL-COND)
  for every `X` ⇔ Hall on class unions ⇔ quotient Hall; a quotient deficit is an original class-union deficit of the same size.
  Framing: S11 generalizes (LIFT) and contains (INV)'s quotient clause as its orbit special case.
- **SR-C2-5c (bounded records).** The `C4 ⊔ C6` toy; coarsest-equitable against orbit counts on `CB(1,7)/10`, `CB(1,8)/11`,
  `CB(1,9)/12` (brief: "11, 13, 15 classes against 147, 224, 324 source orbits"); equality with orbits on tested `d ≥ 2` rows;
  Candidate 2's narrowed A/B witness on `CB(5,2)`; `CB(1,7)/10` supply 29,190, capacity 58,002, `S = −28,812`, saturating.
- **SR-C2-5d (S12).** For any finite simple graph, any `p`, any tag set `F` of degree-one vertices, `X_max` contains every source
  `B` with `F ∩ B = ∅`, "so `X_max` is never the all-positive witness"; `X_min` has only positive-weight members and is equally
  deficient; the `P_3 ⊔ K_{6,3,3,3}` numbers at `p = 4`; consistency with the registered (INV) text.
- **SR-C2-5e (the key).** `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT`, VERIFIED `proved_informal`, statement = S11; attribution;
  alias check; predicate check; distinction row; (LIFT) scope note.

## Independent re-derivation

All proofs below are my own, written from the frozen definitions (`SEMANTIC-CONTRACT.md` §1.2) and the registry statements; the
instruments are mine (`scratchpad/c2-sr-SR-C2-5/`, standard library, exact integers, `Fraction` for spreads, run with
`python3 -B`). They share no code with any seat, critic or adjudicator; I did not open any seat instrument.

### 5a. The lift (iff)

*Setting.* `S`, `T` finite; `R ⊆ S × T`; `s : S → ℕ`, `c : T → ℕ`. Partitions `π_S`, `π_T` into nonempty classes with `s`
constant on each `C_s ∈ π_S` and `c` constant on each `C_t ∈ π_T`, and two-sided local regularity: for every class pair there are
naturals `r(C_s, C_t)`, `r′(C_s, C_t)` with `|R(u) ∩ C_t| = r(C_s, C_t)` for every `u ∈ C_s` and `|R⁻¹(t) ∩ C_s| = r′(C_s, C_t)` for
every `t ∈ C_t`. Counting the arcs of `R ∩ (C_s × C_t)` from both sides gives **`|C_s|·r = |C_t|·r′`** — a consequence, not a
hypothesis — and hence (classes nonempty) `r > 0 ⇔ r′ > 0 ⇔ R ∩ (C_s × C_t) ≠ ∅`. Quotient: source supply `|C_s|·s(C_s)`, target
capacity `|C_t|·c(C_t)`, an uncapacitated arc `C_s → C_t` iff `r(C_s, C_t) > 0`. A saturating flow on either network: nonnegative,
supported on arcs, every row sum equal to the supply, every column sum at most the capacity.

*(⇒), summation.* Given an original saturating integral `f`, put `Φ(C_s, C_t) := Σ_{u∈C_s, t∈C_t} f(u, t)` (natural). If
`Φ(C_s, C_t) > 0` some `f(u, t) > 0` with `(u, t) ∈ R`, so `R` meets `C_s × C_t` and the quotient arc exists. Row:
`Σ_{C_t} Φ(C_s, C_t) = Σ_{u ∈ C_s} Σ_t f(u, t) = Σ_{u∈C_s} s(u) = |C_s|·s(C_s)`. Column: `Σ_{C_s} Φ(C_s, C_t) = Σ_{t∈C_t} Σ_u f(u, t) ≤
Σ_{t ∈ C_t} c(t) = |C_t|·c(C_t)`. *Hypotheses used:* constancy of `s`, `c` on classes (only to write the totals as `|C|·w`; with
totals as the quotient weights nothing else is used). Regularity is not used.

*(⇐), uniform spread.* Given a saturating quotient flow `Φ` (integral or even real), define on every `(u, t) ∈ R` with
`u ∈ C_s`, `t ∈ C_t`: `f(u, t) := Φ(C_s, C_t) / (|C_s|·r(C_s, C_t))`. This is well defined: `(u, t) ∈ R` forces `r ≥ 1`. Where
`Φ(C_s, C_t) > 0` the quotient arc exists, so `r > 0` and the mass is placed on arcs of `R`; where `r = 0` there are no arcs and
`Φ = 0` by the quotient arc rule, so no mass is lost.
- Row at `u ∈ C_s`: `u` has exactly `r(C_s, C_t)` arcs into `C_t` (**source-side regularity**), so
  `Σ_t f(u, t) = Σ_{C_t} r·Φ(C_s, C_t)/(|C_s| r) = Σ_{C_t} Φ(C_s, C_t)/|C_s| = |C_s| s(C_s)/|C_s| = s(C_s) = s(u)` (**quotient row
  equality**, **constancy of `s` on `C_s`**). Exact equality.
- Column at `t ∈ C_t`: `t` has exactly `r′(C_s, C_t)` arcs from `C_s` (**target-side regularity**), so
  `Σ_u f(u, t) = Σ_{C_s} r′·Φ(C_s, C_t)/(|C_s| r) = Σ_{C_s} Φ(C_s, C_t)/|C_t|` (**double count** `|C_s| r = |C_t| r′`)
  `≤ |C_t| c(C_t)/|C_t| = c(t)` (**quotient column bound**, **constancy of `c` on `C_t`**).

So `f` is a nonnegative rational point of `P := {f ∈ ℝ^R : f ≥ 0, Σ_t f(u, t) = s(u) ∀u, Σ_u f(u, t) ≤ c(t) ∀t}`.
*Integrality.* `P` is nonempty, bounded (`0 ≤ f(u, t) ≤ s(u)`; **finiteness** of `S`, `T`) and pointed (`f ≥ 0`), so it has a
vertex. Its constraint matrix is the vertex–arc incidence matrix of the bipartite graph `(S ⊔ T, R)` stacked with identity rows;
bipartite incidence matrices are totally unimodular and appending identity rows preserves total unimodularity; the right-hand
side (`s`, `c`, `0`) is **integral**, so every vertex is integral (Hoffman–Kruskal). An integral vertex is an integral saturating
flow. (Equivalently: the network `source → u (cap s(u)) → t (cap ∞) → sink (cap c(t))` has a real flow of value `Σ s`, so its
integral max-flow has value `Σ s`, which saturates every source arc.) ∎

*No group.* No automorphism, group action or invariance enters either direction; only the class data `(s, c, r, r′)`. No
ℕ-subtraction occurs anywhere (the only differences are in the Hall discussion, taken in ℤ). Integrality of `Φ` is not needed for
(⇐); nonnegativity of `s`, `c` is not needed for the bare iff (with a negative weight both sides are infeasible), but it is needed
in 5b and is the registered setting of (LIFT) and (INV), so the statement of record should say `ℕ` (repair R-a1).

*Instrument.* `toy_and_lift.py`: 3,000 seeded random equitable instances (1–3 classes per side, class sizes 1–3, weights 0–3,
biregular circulant blocks), each with the partition verified equitable by explicit per-element counts: original saturation ⇔
quotient saturation ⇔ brute-force Hall over **every** `X` ⇔ brute-force quotient Hall ⇔ Hall on every class union, on all 3,000
(963 saturating); the double count held on every class pair. `cb_rows.py`: on `CB(1,7)/10`, `CB(1,8)/11` and `CB(1,9)/12` the
quotient of the coarsest equitable partition has an integral saturating flow (29,190; 177,576; 1,039,752), and its uniform
spread, computed per arc in `Fraction`, has every row sum **exactly** equal to the source weight and every column sum at most the
target weight.

### 5b. Class-union Hall and the framing

*The neighbourhood identity.* Let `X_Q` be a set of source classes and `X := ⋃ X_Q`. Then
`N(X) = ⋃{C_t : r(C_s, C_t) > 0 for some C_s ∈ X_Q}`.
- ⊆: `t ∈ N(X)` has an in-arc from some `u ∈ C_s ⊆ X`; then `u` has ≥ 1 arc into `t`'s class `C_t`, so `r(C_s, C_t) ≥ 1`
  (source-side regularity makes `r` the common count; even without it, `R` meets `C_s × C_t`).
- ⊇: `r(C_s, C_t) > 0` gives `r′(C_s, C_t) = |C_s| r/|C_t| > 0`, and **target-side regularity** makes every `t ∈ C_t` have
  `r′ ≥ 1` in-arcs from `C_s ⊆ X`.

Hence, in ℤ, `Σ_X s − Σ_{N(X)} c = Σ_{C_s ∈ X_Q} |C_s| s(C_s) − Σ_{C_t ∈ N_Q(X_Q)} |C_t| c(C_t)`: the original deficit of every class
union equals the quotient deficit of the corresponding source-class set, **exactly**. (Only the target-side half of regularity
and constancy of weights are used here; the source-side half is used in 5a.)

*The chain* (weights in ℕ): (HALL-COND) for every `X ⊆ S` ⇒ for every class union (specialization) ⇒ quotient Hall (the identity)
⇒ an integral saturating quotient flow (finite capacitated Hall / max-flow–min-cut on the quotient: `|C|·w`-clone expansion and
Hall's marriage theorem, or integral max-flow; **nonnegative integer** weights enter here) ⇒ an integral saturating original flow
(5a, ⇐) ⇒ (HALL-COND) for every `X` (`Σ_X s = Σ_{B∈X} Σ_A f(B, A) ≤ Σ_{A∈N(X)} Σ_B f(B, A) ≤ Σ_{N(X)} c`). The three conditions
are equivalent, and each is equivalent to the existence of a saturating integral flow on either network. **A quotient deficit
`δ > 0` on `X_Q` is an exhibited original deficient cut `(X = ⋃X_Q, N(X) = ⋃N_Q(X_Q), both sums)` with the same `δ`** — no group,
no supermodularity — which is the ruling-16 prerequisite for using an equitable-quotient deficit as a cut. With a negative
capacity the chain fails (a zero-supply source and an isolated target of capacity −1 satisfy (HALL-COND) for every `X`, yet no flow
exists), so the `ℕ` hypothesis is load-bearing for the Hall form (repair R-b1).

*Instrument.* I checked every nonempty union of source classes of the coarsest equitable partition: 31 on `CB(1,7)/10`, 63 on
`CB(1,8)/11` and 127 on `CB(1,9)/12`. On each union, `N(X)` computed literally from (D) ∪ (S) equals the union of the joined
target classes, and the original and quotient deficits agree exactly. The maximum class-union deficits are −2,415, −2,352 and
−14,616, so no union is deficient, which is consistent with saturation. On four non-eligible `d ≥ 2` mechanism rows the identity held on all singletons, all pairs and 2,000 seeded random unions. In the
3,000 random instances the identity held for every class union.

*Orbit partitions are equitable (proof).* Let a finite group `Γ` act on `S` and on `T` with `(gu, gt) ∈ R ⇔ (u, t) ∈ R` and
`s(gu) = s(u)`, `c(gt) = c(t)`. For a target orbit `O′` and `g ∈ Γ`, `t ↦ gt` maps `R(u) ∩ O′` bijectively onto `R(gu) ∩ O′`
(`O′` is `Γ`-stable, `R` is preserved, the inverse is `g⁻¹`), so `|R(u) ∩ O′|` is constant on the orbit of `u`; symmetrically on
targets; and the weights are constant on orbits. So the orbit partition is equitable, and its S11 quotient (orbit totals; an arc
iff `R` meets `O × O′`) is exactly the orbit network of the registered (LIFT) and of (INV)(ii)(c). Checked on 3,000 random
group-invariant relations (`toy_and_lift.py`) and on the toy.

*Ruling on the framing.* U2's "not (LIFT) … a different task" is **wrong**; the critics and the U adjudicator are right.
- **(LIFT)** (registered text: a finite group preserving `R`, `s`, `c`; orbit totals; arc iff `R` meets `A × B`; a saturating
  integral quotient flow lifts to a saturating integral original flow) **is exactly S11's (⇐) direction restricted to orbit
  partitions.** The generalization is **strict**: the `C4 ⊔ C6` toy's two-class partition is equitable but is not the orbit
  partition of any group preserving the relation (the relation's full side-respecting automorphism group, computed by brute force,
  has 24 elements and four orbits), and on the eligible `CB(1,m)` rows the coarsest equitable partition is strictly coarser than
  the `Aut(T)`-orbit partition (5c).
- **(INV)**: at the orbit partition of `Γ`, S11's three-way equivalence "(HALL-COND) for every `X` ⇔ Hall on class unions ⇔ quotient
  Hall", with its flow form, **is (INV) part (ii) `(a) ⇔ (b) ⇔ (c)`** (unions of `Γ`-orbits are exactly the `Γ`-invariant
  families). So S11 contains all of (INV)(ii) — the quotient clause and the invariant-family clause — as its orbit special case.
  S11 does **not** contain (INV)(i) (supermodularity of `φ`; the lattice of maximizers; `X_min`, `X_max`; positivity of `X_min`'s
  members; `X_max = {B : N(B) ⊆ N(X_max)}`) or (INV)(iii) (the `Aut(G)`-admissibility of the r30 network: `I_j`, (D) ∪ (S), `w_F`
  and `F_p(G)` equivariant). Applying S11 to the r30 network with `Aut(G)`-orbits needs (iii) as an input. S11 also does not give
  C2-LA1's content: a quotient deficit yields an invariant deficient class union, but not one with only positive-weight members
  and not the canonical `X_min`. The alias is therefore **partial, on the orbit sub-case**, in both directions of registration.

### 5c. The bounded records (own instrument)

`cb_rows.py` builds `CB(d, m)` literally (path `r–s–v`; `m` chokes `u_i ~ r`; `d` supports `b_ij ~ u_i`; private leaf
`c_ij ~ b_ij`), tests acyclicity (union-find) and connectivity (BFS) separately, computes `i_k(T − D)` on the original carrier by
a generic memoized independent-set count (no CB structure), `x` through rank `α` including the terminal difference, eligibility
(`x + 2 ≤ p`, `3p < 2α + 1`; window top `⌊2α/3⌋`), `F_p` from `Δ_p(T − v) < 0` for every leaf on the original tree, `S` on the
q-side (`q_v(j) = i_j(T − {v, s_v}) − i_j(T − N[s_v])`), enumerates `I_p`, `I_{p+1}` and asserts their sizes against the polynomial,
builds (D) ∪ (S) literally (each switch target's independence and size asserted), computes `w_F` by the literal active test
(`(B ∖ {v}) ∩ W_v ≠ ∅`), asserts `supply − capacity = S` **and** the layer identities `supply = Σ_F q_v(p)`,
`capacity = Σ_F q_v(p − 1)`, then runs colour refinement from (side, weight) with an explicit per-element equitability check,
computes `Aut(T)`-orbits from canonical forms of the vertex-coloured tree rooted at its centre (a coloured isomorphism `T → T` is an
automorphism; no `S_d ≀ S_m` assumption), checks that the orbit partition refines the refinement partition, and (flows mode) runs
Dinic max-flow on the mixed and the deletion-only networks.

| row | n | α | x | eligible | `\|F_p\|` | `i_p` / `i_{p+1}` | supply | capacity | S (q-side) | WID | mixed / deletion-only flow | orbits (src + tgt) | coarsest equitable (src + tgt) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| CB(1,7)/10 | 24 | 15 | 8 | yes (window [10,10]) | 8 = all leaves | 22,197 / 8,673 | 29,190 | 58,002 | −28,812 | total + layer | 29,190 / 29,190 (saturating) | 57 + 90 = 147 | 5 + 6 = 11 |
| CB(1,8)/11 | 27 | 17 | 9 | yes ([11,11]) | 9 = all leaves | 115,528 / 50,554 | 177,576 | 322,112 | −144,536 | total + layer | 177,576 / 177,576 (saturating) | 90 + 134 = 224 | 6 + 7 = 13 |
| CB(1,9)/12 | 30 | 19 | 10 | yes ([12,12]) | 10 = all leaves | 592,626 / 283,290 | 1,039,752 | 1,759,392 | −719,640 | total + layer | 1,039,752 / 1,039,752 (saturating) | 134 + 190 = 324 | 7 + 8 = 15 |

- On the three `d = 1` rows every source and every target has positive weight, so the full network is the flow-relevant network;
  the refinement partition is explicitly equitable with constant weights, and the `Aut(T)`-orbit partition refines it strictly.
  Arc counts at `CB(1,7)/10`: 124,593 mixed, 95,403 deletion.
- **The brief's "147, 224, 324 source orbits" is a mislabel:** these are the orbit classes of the whole network (sources plus
  targets), to be compared with 11, 13, 15 classes of the whole network. The per-side figures are in the table (for `CB(1,7)/10`,
  5 source classes against 57 source orbits). The synthesis's R5 (5 + 6 against 57 + 90) is correct.
- On `CB(1,7)/10`, `CB(1,8)/11` and `CB(1,9)/12`, the quotient of the refinement partition has an integral saturating flow, and
  its `Fraction` spread is an exact fractional saturating original flow (5a). This applies the lift to eligible networks with a
  partition that is not an orbit partition. Every union of source classes (31, 63 and 127 of them) satisfies the class-union
  identity, and none is deficient. Switch arcs are not load-bearing on any of the three rows.
- **`d ≥ 2`, own replay on four non-eligible mechanism rows and the eligible `CB(2,5)/10`** (`F_p` = all leaves on each; WID
  asserted on each; mixed = deletion-only flow = supply on the four small rows; `CB(2,5)/10` without flows: `n = 28`, `α = 16`,
  `x = 8`, 88,506 sources, 185,256 targets, 1,317,906 mixed arcs, supply 259,980, capacity 396,460, `S = −136,480`):

  | row | x | orbits full (src/tgt) | refinement full | orbits positive (src/tgt) | refinement positive |
  |---|---|---|---|---|---|
  | CB(2,2)/5 | 4 | 15 / 42 | 15 / **39** | 15 / 24 | 15 / 24 |
  | CB(3,2)/6 | 5 | 65 / 91 | 65 / 91 | 35 / 45 | 35 / 45 |
  | CB(2,3)/6 | 5 | 101 / 140 | 101 / 140 | 71 / 82 | 71 / 82 |
  | CB(2,3)/7 | 5 | 40 / 101 | 40 / **98** | 40 / 71 | 40 / 71 |
  | CB(2,5)/10 (eligible) | 8 | 432 / 644 | 432 / 644 | 369 / 503 | 369 / 503 |

  So "equals the orbit partition on the tested `d ≥ 2` rows" is right **on the positive-weight (flow-relevant) network**; on the full
  network the refinement can be coarser, by merging zero-weight targets only (54 vs 57 at `CB(2,2)/5`, 138 vs 141 at `CB(2,3)/7`,
  agreeing with C-U2-F; `merge_check.py`: on both rows the merges are two target classes absorbing three extra orbits, every
  merged target has weight 0, and no source class merges). On the eligible `CB(2,5)/10` the refinement equals the orbit partition on both the full network
  (432 + 644 = 1,076) and the positive-weight network (369 + 503 = 872), agreeing with C-U2-F and C-U2-T. Untested at `d ≥ 6`.
- **Toy** (`toy_and_lift.py`): `C4 ⊔ C6` with sides respected; every vertex has degree 2; the relation's side-respecting
  automorphism group (brute force over all side-respecting bijections) has order 24 and orbits `{a1,a2}`, `{c1,c2,c3}` (sources),
  `{b1,b2}`, `{d1,d2,d3}` (targets); the two-class partition is equitable with `r = r′ = 2` (colour refinement also returns 1 + 1
  classes); it is strictly coarser than the orbit partition and hence than the orbit partition of every relation-preserving group
  (any such group is a subgroup of that automorphism group); with unit weights the spread is `f ≡ 1/2` with every row and column
  sum exactly 1, and the integral max-flow is 5 (a perfect matching). Confirmed.
- **Candidate 2's narrowed witness** (`cand2_witness.py`, `CB(5,2)`, `p = 7`; `n = 25`, `α = 13`, `x = 8`: **not eligible**).
  Configurations A (arm 1: 2 supports + 3 leaves; arm 2: 2 supports + 1 leaf) and B (2 + 2 in each arm), `r, s, v` and both chokes
  absent: both independent 8-sets. With U2's stipulated tag set `F` = all 11 leaves: `w(A) = w(B) = 0` (their leaves' chokes are
  absent, so every tag present is inactive — they are weight 0 but **not** tag-free), eight deletion targets of weight 0 each, and
  exactly two switch arcs each, with target weights `{1, 3}` for A and `{2, 2}` for B — reproduced. With the strict selector at
  this rank, `F_7 = {v}` only, and all four switch targets have weight 0. **Implication.** Zero-supply sources and zero-capacity
  targets can be deleted without changing saturating-flow existence or (HALL-COND) for any `X` (for `X` let `X⁺` be its
  positive members: `Σ_X w = Σ_{X⁺} w` and `N(X⁺) ⊆ N(X)`, so Hall at `X⁺` in the reduced network implies Hall at `X`; the converse is
  immediate since zero targets contribute 0; flows never use either). A lift therefore needs equitability only on the
  positive-weight network, where A and B do not exist: the witness constrains nothing about lift granularity. Measured on this
  network: removing zero-weight nodes leaves the maximum flow (34,644 with `F` = all leaves; 8,064 with `F_7`) and the maximum
  deficit (12,296; 5,376 = `S`) unchanged. The narrowed statement survives only as "the marginal-totals partition of the full
  `CB(5,2)/7` network with `F` = all leaves is not equitable" (`bounded_computation`); "54 branch types is the minimal
  granularity" is struck (refuted at `d = 1` by the table above, and irrelevant to lifting).

### 5d. `X_max`, `X_min` and the C2-LA1 witness

Write `φ(X) := Σ_{B∈X} w_F(B) − Σ_{A∈N(X)} w_F(A)` in ℤ over `X ⊆ I_{p+1}`; maximizers exist (finite domain containing `∅`,
`φ(∅) = 0`); `X_min` := intersection and `X_max` := union of all maximizers (both maximizers by (INV)(i)).

- **Tag-free sources lie in `X_max`.** Let `F` be any set of degree-one vertices, `p ∈ ℕ`, `B ∈ I_{p+1}` with `F ∩ B = ∅`. Then
  `w_F(B) = 0` (no tag present). Every target of `B` is tag-free: a deletion target is a subset of `B`; a switch target is
  `(B ∖ N(u)) ∪ {u}` with `|N(u) ∩ B| = 2`, and a degree-one vertex has only one neighbour, so `u ∉ F`. So every target of `B` has
  weight 0. For a maximizer `X`, `φ(X ∪ {B}) = φ(X) + w(B) − Σ_{A ∈ N(B) ∖ N(X)} w(A) = φ(X)`, so `X ∪ {B}` is a maximizer and
  `B ∈ X_max`. Holds for every graph, every `p`, every `F`, whatever the sign of `max φ`. (More generally: any weight-0 source all
  of whose targets outside `N(X_max)` have weight 0 lies in `X_max`.)
- **`X_min` is all-positive and equally deficient.** If `B ∈ X_min` had `w(B) = 0`, then `φ(X_min ∖ {B}) ≥ φ(X_min)` (supply
  unchanged, `N` shrinks weakly, weights ≥ 0), so `X_min ∖ {B}` is a maximizer not containing `B`, contradicting
  `X_min ⊆` every maximizer. `φ(X_min) = φ(X_max) = max φ`, and `¬(HALL-COND)` ⇔ `max φ > 0`, so both are deficient then.
- **But "so `X_max` is never the all-positive witness" is false as stated.** The first half only puts a weight-0 member into
  `X_max` when a tag-free `(p+1)`-independent set exists, i.e. `α(G − F) ≥ p + 1`. Counterexample (a tree): `P_6`
  (`1–2–3–4–5–6`) at `p = 2` with `F = F_2(P_6) = {1, 6}` (both leaves; `Δ_2(P_5) = 1 − 6 < 0`). `I_3 = {135, 136, 146, 246}`, each of
  weight 1 (the tag 1 is active via 3, the tag 6 via 4); supply 4; `I_2` has 10 sets, two of weight 1 (`13`, `46`); capacity 2;
  `max φ = 2 > 0`, so Hall fails, and `X_max = X_min = I_3`, all positive. The row is not eligible (`α = 3`, `x = 2`); it refutes
  the unqualified "never". Found by my search (`xmax_check.py`, part 3) and checked by hand above. Repair R-d1: "`X_max` contains
  every tag-free source; hence whenever `α(G − F) ≥ p + 1`, `X_max` has a weight-0 member and is not the all-positive witness. The
  all-positive deficient witness in every case is `X_min`."
- **Registry consistency.** The registered (INV) never claims positivity for `X_max`. Part (i) claims positivity only for `X_min`
  ("every `B ∈ X_min` satisfies `s(B) > Σ_{A ∈ N(B) ∖ N(X_min ∖ {B})} c(A) ≥ 0`"), and records `X_max = {B : N(B) ⊆ N(X_max)}`;
  part (iii) concludes that `X_min` is a nonempty invariant deficient family with every member of weight ≥ 1. S12 is consistent with
  (i): for tag-free `B ∈ X_max`, `N(B) ⊆ N(X_max)` holds trivially, and the characterization held on every random instance below.
  **S12 is a correction to U1's Cycle 2 plan (remaining-obligation item 5, "take `X := canonMax`"), not to the registry.**
- **Instrument** (`xmax_check.py`). Part 1, `P_3 ⊔ K_{6,3,3,3}` at `p = 4` (not a tree; `α = 8`, `x = 3`, not eligible): leaves
  `{0, 2}`, `F_4 = {0, 2}` from the strict selector; 74 sources, 108 targets, 393 arcs; supply 46, capacity 48, `S = −2` (q-side;
  WID total and layer); max-flow 36; `max φ = 10`. `X_min` and `X_max` computed from their **definitions** by forced/excluded
  max-closure runs (`B ∈ X_min` iff `max_{X ∌ B} φ < max φ`; `B ∈ X_max` iff `max_{X ∋ B} φ = max φ`): `|X_min| = 20`, none of
  weight 0, all of the form `{0, 2}` ∪ three of the six-part; `|X_max| = 71`, 51 of weight 0 (every weight-0 source of the graph,
  of which 21 are tag-free and the other 30 carry an inactive tag); `φ(X_min) = φ(X_max) = 10`. All brief numbers confirmed.
  Part 2: 16,618 random instances (graphs on 4–9 vertices, `p ≤ 3`, `F` = the strict selector and, separately, all degree-one
  vertices, `|I_{p+1}| ≤ 14`), maximizers enumerated over **every** `X`: tag-free sources ⊆ `X_max` always; `X_min` all-positive
  always; `X_max = {B : N(B) ⊆ N(X_max)}` always; the max-closure route equals brute force always. 3,928 of them violate Hall.
  Part 3: the `P_6` instance above.

### 5e. The key

- **Alias check** (`alias_check.py`, against the master registry, 434 claims, and the run-local snapshot, 438 claims): no exact
  key collision; no alias collision; no `alias_patterns` regex matches the key name. The only pattern hit is (INV)'s
  `orbit.quotient.*hall` on statement wording that describes the orbit special case — the documented partial alias. Lexical
  neighbours: `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT` (the orbit special case of the (⇐) direction; a partial mathematical
  alias), `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` (part (ii) is the orbit special case of the Hall form); the eight
  G1/C3 `…-LIFT` keys (recovery/connector lifts of forests — unrelated) and the two `…-PARTITION` keys (clique partitions and
  vertex-cover partitions of one graph — unrelated).
- **Predicate check.** `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT` names the property "flows lift through equitable partitions",
  which the statement proves (its ⇐ direction), and asserts nothing beyond it: no feasibility, no Hall instance, no tree fact. It
  under-describes (the Hall converse is not in the name), which is allowed. The name stands.
- The grade `proved_informal` is justified: a complete elementary proof, re-derived here, with no computational step and no
  imported unproved input (total unimodularity of bipartite incidence matrices and finite max-flow/Hall are standard).

## Findings and repairs

- **R-a1 (5a, statement).** State the weights as nonnegative integers (`ℕ`), as U2's own statement, (LIFT) and (INV) do; the
  synthesis's "integer supplies and capacities" is too wide for the Hall half. State `|C_s|·r = |C_t|·r′` and `r > 0 ⇔ r′ > 0` as
  consequences of the two-sided regularity, not hypotheses; the quotient arc "iff `r > 0`" is the same as (LIFT)'s "iff `R` meets
  `C_s × C_t`". Optional strengthening, true and on the face of the proof: the quotient flow in (⇐) may be fractional.
- **R-b1 (5b).** The Hall chain needs `ℕ` weights (counterexample with a negative capacity above). The identity itself uses only
  target-side regularity and constant weights.
- **R-b2 (framing).** Decided: S11 strictly generalizes (LIFT) ((LIFT) = S11's (⇐) on orbit partitions) and contains **all of
  (INV)(ii)** (not only the quotient clause) as its orbit special case; it contains neither (INV)(i), nor (INV)(iii), nor C2-LA1's
  positive-witness content. U2's "not (LIFT)" is struck; C-U2-F's wording correction ("not the orbit partition of any automorphism
  group", not "not unions of orbits") is adopted.
- **R-c1 (5c).** "147, 224, 324 source orbits" → "147, 224, 324 orbit classes of the whole network (sources + targets)"; per side
  57 + 90, 90 + 134, 134 + 190 (coarsest equitable 5 + 6, 6 + 7, 7 + 8). "Equals the orbit partition on the tested `d ≥ 2` rows" → "on the positive-weight network of the
  tested `d ≥ 2` rows; on the full network zero-weight targets may merge (CB(2,2)/5: 54 vs 57; CB(2,3)/7: 138 vs 141)". "Strictly
  coarser than orbits" on the CB rows means the `Aut(T)`-orbit partition; whether the refinement partition is the orbit partition
  of some larger group of network automorphisms is not decided (and does not matter to the lift, which needs no group).
- **R-c2 (5c, Candidate 2).** The A/B witness is weight-0 (not tag-free: inactive tags), uses the stipulated `F` = all leaves at
  the non-eligible `CB(5,2)/7` (strict selector `F_7 = {v}`), and lies off the flow-relevant network. Record it only as the narrowed
  `bounded_computation` statement; the headline stays struck.
- **R-d1 (5d, S12).** Add the qualifier: `X_max` contains every tag-free source (all graphs, all `p`, all tag sets); **hence, whenever
  a tag-free `(p+1)`-independent set exists, `X_max` is not all-positive**. The unqualified "never" is refuted by `P_6` at `p = 2`.
  The C2-LA1 ruling is **confirmed**: a universal theorem needs a witness that is all-positive in every instance, and only `X_min`
  is (by proof); `X_max` fails on `P_3 ⊔ K_{6,3,3,3}` at `p = 4` and wherever tag-free sources exist under ¬Hall (e.g. any
  failure at `CB(8,92)/492`, whose 736 supports give tag-free `(p+1)`-sets).
- **R-d2 (5d, attribution).** The general "tag-free ⊆ `X_max`" statement is C-U1-F's (F-1); C-U1-T's finding 2 states the weaker
  "every weight-0 source whose positive-weight targets already lie in `N(X_max)`" and the `P_3 ⊔ K_{6,3,3,3}` / `P_3 ⊔ K_{4,2}` data.
  Both are correct; attribute S12 to C-U1-F (statement) and C-U1-T (instance data), verified by the U adjudicator.
- **Fences checked.** The lift decides no instance of (HALL), supplies no quotient feasibility (orbit or equitable), and exhibits
  no cut; it is a reduction. Nothing here is a (CUT). No RTree wording. No refuted key of `SOLUTION-CONTRACT.md` §3.2 is revived
  (no deletion-only or Delete/Retag relation, no Hall assertion on a tree relation). No closed region is re-proved. The primary
  aggregate is untouched; no status transfers across a fence; no controller or census value is cited as evidence.

## Registration text

**1. The key** (register verbatim after this read; status VERIFIED, grade `proved_informal`, no formal award):

```text
claim_key: E993-R30-EQUITABLE-PARTITION-FLOW-LIFT
status: VERIFIED
evidence_grade: proved_informal
formal_award: false
statement: Let S, T be finite sets, R ⊆ S × T, s : S → ℕ and c : T → ℕ. Let π_S, π_T be partitions of S, T into nonempty
  classes such that s is constant on every class of π_S, c is constant on every class of π_T, and (two-sided local regularity)
  for every C_s ∈ π_S and C_t ∈ π_T there are r(C_s,C_t), r′(C_s,C_t) ∈ ℕ with |R(u) ∩ C_t| = r(C_s,C_t) for every u ∈ C_s and
  |R⁻¹(t) ∩ C_s| = r′(C_s,C_t) for every t ∈ C_t (then |C_s|·r = |C_t|·r′, and r > 0 ⇔ r′ > 0 ⇔ R meets C_s × C_t). The quotient
  network has source supply |C_s|·s(C_s) at each C_s, target capacity |C_t|·c(C_t) at each C_t, and an uncapacitated arc
  C_s → C_t exactly when r(C_s,C_t) > 0. (a) Lift: the original network has an integral flow supported on R that meets every
  supply s(u) exactly and respects every capacity c(t) if and only if the quotient network has an integral flow with the same
  properties; for the direction quotient ⇒ original, the uniform spread f(u,t) = Φ(C_s,C_t)/(|C_s|·r(C_s,C_t)) of any (even
  fractional) saturating quotient flow Φ is a fractional saturating original flow, and total unimodularity of the bipartite
  incidence matrix (equivalently integral max-flow) gives an integral one. (b) Class-union Hall: for every set X_Q of source
  classes, N(⋃X_Q) is exactly the union of the target classes C_t with r(C_s,C_t) > 0 for some C_s ∈ X_Q, so
  Σ_{⋃X_Q} s − Σ_{N(⋃X_Q)} c = Σ_{C_s∈X_Q} |C_s| s(C_s) − Σ_{C_t∈N_Q(X_Q)} |C_t| c(C_t); consequently the following are equivalent:
  Σ_X s ≤ Σ_{N(X)} c for every X ⊆ S; the same for every union X of source classes; the same inequality on the quotient for every
  set of source classes; and a quotient deficit on X_Q is an original deficient cut on ⋃X_Q with neighbourhood ⋃N_Q(X_Q) and the
  same deficit. No group is required. The orbit partition of any finite group acting on S and T and preserving R, s and c is
  equitable, and its quotient is the orbit network; on it, (a)'s quotient ⇒ original direction is
  E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT and (b) is part (ii) of E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL.
scope: Any finite bipartite relation with nonnegative integer supplies and capacities, constant on the classes of a two-sided
  locally regular (equitable) partition; no group, graph, tree, eligibility or selector hypothesis. A reduction, not a feasibility
  result: it decides no instance of E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL (OPEN), asserts the feasibility of no quotient
  (orbit or equitable), exhibits no deficient cut, and is not a restricted-scope (HALL) theorem. Strictly generalizes the lifting
  direction of E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT (equitable partitions need not be orbit partitions of any
  relation-preserving group: C4 ⊔ C6 two-class witness; on the eligible CB(1,7)/10, CB(1,8)/11, CB(1,9)/12 networks the coarsest
  equitable partition has 11, 13, 15 classes against 147, 224, 324 Aut(T)-orbit classes of the whole network). Contains
  E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL part (ii) as its orbit special case; does not contain that key's part (i)
  (supermodularity, X_min/X_max, positivity) or part (iii) (Aut(G)-admissibility of the r30 network), which an orbit application to
  the r30 network needs as input, and does not contain E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY
  (a class-union deficit need not have only positive-weight members). Nonnegativity of the weights is load-bearing for (b).
  Bounded computations cited in support (the CB(1,m) coarsening, the lifts on CB(1,7)/10, CB(1,8)/11 and CB(1,9)/12, the coarsest equitable
  partition equalling the Aut(T)-orbit partition on the positive-weight networks of the tested d ≥ 2 rows) are
  bounded_computation, are not evidence for the proof, and say nothing about CB(8,86)/460, CB(8,89)/476 or CB(8,92)/492. Ordinary
  graphs only where graphs appear; no governed RTree assertion (bridge E993-G1-ORDINARY-RTREE-TRANSPORT OPEN). Not a transport
  mechanism; revives no refuted key (SOLUTION-CONTRACT §3.2). E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE is untouched.
certificate: cycles/cycle-2/stage3/returns/U2/RETURN.md (Candidate 1 and its proof); critiques C-U2-T (C1, C2, finding 8) and
  C-U2-F (A1 strengthening, A2, A3); U adjudication (E2, E3; reconciliation items 3, 5, 6); Stage 6 synthesis S11 and registration
  6; isolated second read SR-C2-5 (confirmed_with_repairs; repairs R-a1, R-b1, R-b2, R-c1). No formal award.
attribution: r30 Cycle 2 U2 (Claude Sonnet 5): the equitable-partition lift (a) and its proof. Critics C-U2-T and C-U2-F (Claude
  Opus 5.5), jointly and independently: the class-union Hall converse (b) and the corrected framing (generalizes (LIFT); (INV)(ii) as
  the orbit special case). r30 U adjudicator (Claude Opus 5.5): verification. Isolated second read SR-C2-5 (Claude Opus 5.5): the
  nonnegativity repair and the containment ruling. Codex (GPT-6 Astra/Sol/Luna), lower-region run C6-T5, adjudicated C6-AT: (LIFT),
  the orbit special case of (a). r30 Cycle 1 U1 and critics C-U1-T, C-U1-F: (INV), whose part (ii) is the orbit special case of (b).
aliases: ["equitable-partition flow lift", "equitable quotient flow lift", "class-union Hall for equitable partitions"]
alias_patterns: ["equitable.*(partition|quotient).*(lift|hall)"]
novelty_claimed: limited — a standard LP-averaging argument; new as the hypothesis weakening from group orbits to equitable
  partitions, with the class-union deficit identity, written and second-read on an r30 face.
registration_reason: r30 Cycle 2 (synthesis registration 6; isolated second read SR-C2-5).
```

**2. Claim-distinction rows** (`control/CLAIM-DISTINCTIONS.json`):

```text
{"claim": "E993-R30-EQUITABLE-PARTITION-FLOW-LIFT",
 "related": "E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT",
 "relation": "strict_generalization; partial_mathematical_alias_on_orbit_subcase",
 "text": "(LIFT) is exactly part (a)'s quotient ⇒ original direction restricted to the orbit partition of a finite group
  preserving R, s and c (orbit partitions are equitable; the orbit network is the equitable quotient). The new key needs no group:
  only weights constant on classes and two-sided local regularity. Strict: the C4 ⊔ C6 two-class partition is equitable and is not
  the orbit partition of any relation-preserving group. Neither key asserts feasibility of any quotient.",
 "source": "SR-C2-5"}
{"claim": "E993-R30-EQUITABLE-PARTITION-FLOW-LIFT",
 "related": "E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL",
 "relation": "contains_part_ii_as_orbit_special_case; partial_mathematical_alias_on_orbit_subcase",
 "text": "At the orbit partition of Γ, part (b) of the new key (Hall for every X ⇔ Hall on class unions ⇔ quotient Hall, with the
  flow form) is (INV) part (ii) (a) ⇔ (b) ⇔ (c). The new key does not contain (INV) part (i) (supermodularity of φ, the maximizer
  lattice, X_min, X_max, positivity of X_min's members) or part (iii) (Aut(G)-admissibility of the r30 active-weight two-for-one
  network, Aut(G)-invariance of F_p(G)); applying the new key to the r30 network with Aut(G)-orbits uses (iii) as input.",
 "source": "SR-C2-5"}
{"claim": "E993-R30-EQUITABLE-PARTITION-FLOW-LIFT",
 "related": "E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY",
 "relation": "distinct",
 "text": "A quotient deficit yields an invariant deficient class union, not a family whose every member has positive weight and
  not the canonical X_min; the positive invariant witness is that key's content (via (INV)(i)), not this one's.",
 "source": "SR-C2-5"}
```

**3. Scope-note sentence on (LIFT)** (`E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT`; status and grade unchanged):

```text
[r30 C2] (second read SR-C2-5) This is the orbit-partition special case of E993-R30-EQUITABLE-PARTITION-FLOW-LIFT: the orbit
partition of any finite group preserving R, s and c is equitable and its orbit network is that key's quotient, so this lift is
that key's quotient ⇒ original direction restricted to orbit partitions; the generalization needs no group. Status and grade
unchanged; no quotient's feasibility is asserted.
```

**4. Scope-note sentence on (INV)** (`E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`; status and grade unchanged; the
synthesis's own (INV) note may carry it):

```text
[r30 C2] (second read SR-C2-5) Part (ii) is the orbit special case of E993-R30-EQUITABLE-PARTITION-FLOW-LIFT (b); parts (i) and
(iii) are not contained in that key. The positive invariant deficient witness of part (iii) is X_min; X_max contains every
tag-free source and so is not all-positive whenever a tag-free (p+1)-independent set exists. Status and grade unchanged.
```

**5. Strike/correction record for S12** (cycle record or `control/CLAIM-DISTINCTIONS.json`; no key changes status):

```text
S12 (r30 Cycle 2; C-U1-F F-1 for the statement, C-U1-T finding 2 for the instance data; verified by the U adjudicator; second
read SR-C2-5, confirmed_with_repairs). For every finite simple graph G, every p ∈ ℕ and every set F of degree-one vertices,
X_max (the union of all maximizers of φ(X) = Σ_X w_F − Σ_{N(X)} w_F over X ⊆ I_{p+1}) contains every B ∈ I_{p+1} with
F ∩ B = ∅; hence whenever a tag-free (p+1)-independent set exists (α(G − F) ≥ p + 1), X_max has a weight-0 member and is not the
all-positive witness. X_min (the intersection of all maximizers) has only members of positive weight, and φ(X_min) = φ(X_max) =
max φ, which is positive iff weighted Hall fails. The unqualified "X_max is never the all-positive witness" is false (P_6 at
p = 2, F = F_2 = both leaves: X_max = X_min = I_3, all of weight 1, max φ = 2). Instance: P_3 ⊔ K_{6,3,3,3} at p = 4 (not a
tree, not eligible), F_4 = {0,2}, supply 46, capacity 48, S = −2, max φ = 10; |X_min| = 20 with no weight-0 member; |X_max| = 71
with 51 of weight 0. Strikes U1's Cycle 2 plan to take X_max (canonMax) as the positive invariant deficient witness; confirms the
C2-LA1 statement's witness X_min. Corrects no registered text: (INV) claims positivity only for X_min. bounded_computation for
the instances; proved_informal for the statement. Graph-generic; no Hall, flow, cut or sign conclusion; primary aggregate untouched.
```

**6. Bounded records** (`bounded_computation`, records not keys; attribution C-U2-F for the `d = 1` coarsening and `CB(1,7)/10`,
C-U2-T for the `d ≥ 2` positive-network equality, U adjudicator replays, SR-C2-5 replay):

```text
Coarsest admissible equitable partition (colour refinement from (side, w_F)) against Aut(T)-orbits, whole network
(sources + targets): CB(1,7)/10 11 (5+6) vs 147 (57+90); CB(1,8)/11 13 (6+7) vs 224 (90+134); CB(1,9)/12 15 (7+8) vs 324 (134+190). All
three eligible, F_p = all leaves, every node of positive weight. Positive-weight networks of the tested d ≥ 2 rows: equal to the
orbit partition (CB(2,2)/5, CB(2,3)/6, CB(2,3)/7, CB(3,2)/6 and the eligible CB(2,5)/10, replayed by SR-C2-5); full
networks may merge zero-weight targets (CB(2,2)/5 54 vs 57; CB(2,3)/7 138 vs 141). Untested at d ≥ 6.
CB(1,7)/10: n 24, α 15, x 8, |F_p| 8 (all leaves), |I_11| 8,673, |I_10| 22,197, supply 29,190, capacity 58,002, S −28,812
(q-side), mixed = deletion-only max-flow = 29,190 (saturating); the refinement quotient flow lifts exactly. CB(1,8)/11: supply
177,576, capacity 322,112, S −144,536, mixed = deletion-only = 177,576. CB(1,9)/12: supply 1,039,752, capacity
1,759,392, S −719,640, mixed = deletion-only = 1,039,752. On all three the refinement quotient flow lifts exactly.
Candidate 2 narrowed: on CB(5,2) at p = 7 (not eligible) with F = all leaves, the weight-0 sources A and B share marginal totals
but their switch targets have weights {1,3} and {2,2}; the marginal-totals partition of that full network is not equitable. Off the
flow-relevant network; says nothing about lift granularity.
```

## Verdicts

verdict[SR-C2-5a]: confirmed_with_repairs
verdict[SR-C2-5b]: confirmed_with_repairs
verdict[SR-C2-5c]: confirmed_with_repairs
verdict[SR-C2-5d]: confirmed_with_repairs
verdict[SR-C2-5e]: confirmed_with_repairs

- 5a: the lift iff is correct and needs no group; repair R-a1 (weights in `ℕ`; double count a consequence).
- 5b: the class-union identity and the Hall chain are correct; repair R-b1 (`ℕ` load-bearing); framing decided (R-b2): S11
  strictly generalizes (LIFT) and contains all of (INV)(ii) as its orbit special case, not (INV)(i)/(iii) or C2-LA1.
- 5c: every number replayed with my own instrument; repairs R-c1 (orbit counts are whole-network; `d ≥ 2` equality on the
  positive-weight network) and R-c2 (Candidate 2's witness is weight-0, not tag-free, at a stipulated tag set on a non-eligible row).
- 5d: both halves re-proved and the instance confirmed; the unqualified "never" is refuted (`P_6`, `p = 2`), repair R-d1; the
  C2-LA1 witness ruling `X_min` is confirmed; S12 corrects U1's plan, not the registry.
- 5e: the name is a predicate the statement satisfies, with no collision; register with the text above.

## Artifact inventory

- **Deliverable:** `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/second-reads/SR-C2-5/SECOND-READ.md`
  (this file only).
- **Scratch:** `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-sr-SR-C2-5/`.
  Standard library only, exact integers and `Fraction`; replay with `cd` into the directory and `python3 -B <script> [args]`.

  | file | SHA-256 | role |
  |---|---|---|
  | `net_core.py` | `f2a29b6deb7b8255dcb653a3c4d062c71d0748c010efbcd1e524fb71059e98d8` | graph builders, tree test, generic `i_k(G − D)`, `x` through `α`, selector, q-side `S`, literal network ((D) ∪ (S), `w_F`), Dinic, colour refinement, equitability check, coloured canonical-form orbits |
  | `cb_rows.py` | `2e342628852029a42443cc758b72bb4404cf2733524d398b5b2842c8886f48b9` | per-row driver (`d m p [flows] [noelig]`) |
  | `cb_rows_1_7_10.json` | `f50033b427fcad41db1d9192bc1a2721b664cca8f53911294db1ef40d053d47d` | CB(1,7)/10 (flows) |
  | `cb_rows_1_8_11.json` | `8b959a95d88f1c7282e1da0464a5f76d5e896a018b3117ca466d69e04394d4a5` | CB(1,8)/11 (flows) |
  | `cb_rows_1_9_12.json` | `2286e662d3c85683d852742e0116d1c4668b351a0678e5e928d7fcc0a149fb7f` | CB(1,9)/12 (flows) |
  | `cb_rows_2_5_10.json` | `96ed5e67603b8b9cafffc40143a57b5e1ecca6321e34b614a968cba79cad5705` | CB(2,5)/10 (no flows) |
  | `cb_rows_2_2_5.json` | `5fbec9419307377629c14dd9f6bd9674a874afbb57b885936e8400d940ad7956` | CB(2,2)/5 (not eligible; flows) |
  | `cb_rows_2_3_6.json` | `8da86d46b39d97121c7235863bb50ee66293dcd1fd536385dd4153043f541ea8` | CB(2,3)/6 (not eligible; flows) |
  | `cb_rows_2_3_7.json` | `48145a96b85fd5527e4b8de6970a04cd583987f52cf786fe7d3c014d89fa7116` | CB(2,3)/7 (not eligible; flows) |
  | `cb_rows_3_2_6.json` | `657bca9203649fce9a1f1434b0130653aa7b2d5432895c7d392834f88ebb044f` | CB(3,2)/6 (not eligible; flows) |
  | `toy_and_lift.py` | `38f3f2cdd2af7cd01630ef60f99b549c2209f8a3d571e0af94a31bd3ae2b93b7` | toy; 3,000 random equitable lift/Hall-chain trials; 3,000 random orbit-equitability trials |
  | `toy_and_lift.json` | `84282379c0be4f157252ba56ea9fbe19a650bacf2c0cd853478c4087dd3bbb4b` | its output |
  | `cand2_witness.py` | `c914a81bb424d750d5750779a8e3c1d54394459127ee587508f0fe86d819b99c` | Candidate 2 A/B witness on CB(5,2)/7; zero-weight removal test |
  | `cand2_witness.json` | `e1eac7ef6c118ef12c7e8fcc94f91703d4a92abe74534ebc2bfaac791d6ac1a6` | its output |
  | `xmax_check.py` | `15c6b7f4f4d5b4ae868b6af469baecc1aaadfbb1828470f957b51263005eefcb` | `P_3 ⊔ K_{6,3,3,3}`/4; 16,618 random brute-force instances; the `P_6` instance |
  | `xmax_check.json` | `f0302134ac4e4b0b39993632e049bfb0ff3ad44d1c9a0444114d33a1e2295d1c` | its output |
  | `merge_check.py` | `244ad025e34c3d48536c4876153b4e61638da94afec723c1444b929a777f3c32` | full-network merges at CB(2,2)/5, CB(2,3)/7 are zero-weight targets |
  | `merge_check.json` | `6e43245907acc32d5f9b54b66169dc92e1ef8985ad79dda441069829604dc882` | its output |
  | `alias_check.py` | `1ff1fac40f8ce7d76fde6a0eb83f3346c9ec24453673203e051544e8c9942edb` | alias/pattern/lexical check against both registries |
  | `alias_check.json` | `adf9a5e5e04a3651db19419900b1c59df27cd1cce602e54f1513bf602ee9057a` | its output |

  Replay: `python3 -B cb_rows.py 1 7 10 flows` (about 7 s), `… 1 8 11 flows` (about 3 min), `… 1 9 12 flows` (about 50 s),
  `… 2 5 10` (about 5 min), `… 2 2 5 flows noelig` (and 3 2 6, 2 3 6, 2 3 7), `python3 -B toy_and_lift.py`,
  `python3 -B cand2_witness.py`, `python3 -B xmax_check.py` (about 36 s), `python3 -B merge_check.py`, `python3 -B alias_check.py`.
  The outputs are deterministic: rerunning the `cb_rows`, toy, witness, `X_max` and alias outputs on the final code reproduced
  each one byte for byte (`merge_check` was run once, on the final code).

- **Seal check (run inline before reading):** `json.load` the manifest, pop `seal_sha256`, SHA-256 of
  `json.dumps(m, sort_keys=True, separators=(",", ":"))`, then SHA-256 and byte length of each listed path from the run root.
- **Background jobs:** I started none deliberately. One foreground run was auto-backgrounded by the harness, then killed by
  literal PID 58856 and confirmed gone, along with its shell 58854 (disclosure 6). The monitor ended with it. No job is running at
  this write.
- **Not produced:** no Lean, no network, no installs, no writes outside this file and my scratch directory; no sealed member edited.
