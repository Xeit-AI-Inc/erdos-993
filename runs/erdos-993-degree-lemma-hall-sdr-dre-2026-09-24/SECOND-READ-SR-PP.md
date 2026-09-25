# Second Read

Isolated second read `SR-PP`, r28 Cycle 1: the pendant-path dominance lemma and its companions (PP-1 to PP-5).
Run `erdos-993-math-dre-20260924-r28-degree-lemma-hall-sdr`.

**Boot acknowledgment.** Operating within VerityOS. The boot reads were exactly
`/Users/ashtonsperry/VerityOS/verity.md` (the constitution) and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (the identity subsystem's startup protocol). No other
VerityOS file outside the run root was read. The host harness placed the repository `CLAUDE.md` and the user
auto-memory index in my context without a read by me; neither enters any step below.

**Model disclosure.** chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority

## Identity and seal audit

- **Dispatch wrapper.** `control/dispatch/c1-second-read/DISPATCH-SR-PP.md` carries only the pointer (capsule,
  protocol, brief, output path, scratch path). I read it and followed it.
- **Capsule.** `control/c1-second-read/SR-PP-PACKET-MANIFEST.json`, stage `cycle-1-second-read-SR-PP`.
  - Recorded seal: `26d6eeac282d9782b1ad6cd283b07bd4e306055d890844389c1d37f0d37fb77c`.
  - Recomputed (SHA-256 of `json.dumps(manifest minus seal_sha256, sort_keys=True, separators=(",",":"))`, UTF-8,
    no trailing newline; `scratchpad/c1-sr-SR-PP/seal_check.py` → `seal_out.txt`): **identical**.
  - **59/59 members match** in SHA-256 and byte count; `file_count` is 59.
- **Read boundary.** Capsule members read for content: the protocol, the brief, `SEMANTIC-CONTRACT.md`,
  `SOLUTION-CONTRACT.md`, `control/c1-second-read/PATH-CHECK-SR-PP.json`,
  `control/C1-SECOND-READ-PATH-LITERAL-QUOTATION-RECORD.json`; the five Stage 3 returns T1, T2, F2, U1, U2 (full);
  the critiques `C-T1-U`, `C-T1-F`, `C-T2-U`, `C-T2-F`, `C-F2-T`, `C-F2-U`, `C-U2-T` (full), `C-U2-F` (from
  `## Attacks and findings` to the end of `## Remaining obligation`) and `C-U1-F`, `C-U1-T` (their
  `## Attacks and findings` and `## Mechanism-equivalence and fence check` sections); `second-reads/SR-HS-REF/SECOND-READ.md` (full);
  `sources/r27/records/C1-CRITIQUE-T2-U.md` (Finding 6, Steps A–D and its remaining obligation);
  `control/CLAIM-IDENTITY.run-local.json` (read programmatically: full statements of
  `E993-PAIR-R-LE-G-POINTWISE`, `E993-PAIR-SPIDER-CLOSED-FORM`, `E993-PAIR-GENERATION-THEOREM`,
  `E993-PAIR-BRANCH-FACTORIZATION`, `E993-R27-FOREST-DEGREE-LEMMA`, `E993-R27-DEGREE-LEMMA-K1-ACYCLICITY-CRITERION`,
  `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`, and a lexical scan of all 392 claims);
  `scratchpad/c1-U2/LeanProject/LeanProof/Main.lean` (lines 1–75 and 320–483) and `AxiomCheck.lean`.
  Members hashed but not read: `AUTHORIZATION.md`, `control/C1-STAGE1-GATE.md`, `control/C1-STAGE4-PACKET-MANIFEST.json`,
  `control/SOURCE-DIGESTS.json`, `control/C1-STAGE2-PATH-LITERAL-QUOTATION-RECORD.json`,
  `control/controller-prerun/r22_check.py`, `sources/r27/second-reads/SR-JOIN.md`, and every critic scratch
  instrument (none was replayed; my evidence is my own instrument).
- **Mathlib (API meaning only).** One `sed` of `Mathlib/Combinatorics/Hall/Basic.lean` lines 185–205 inside the
  shared Mathlib package directory, and one read-only `git rev-parse HEAD` there
  (`905b95818eb32af7874a58b427f50c1711a5e96c`, the pin). No Lean build was run by this seat.
- **Process disclosure.** Two command outputs exceeded the tool display limit; the harness persisted them to its
  own session tool-results directory (under `~/.claude/projects/…/tool-results/`), and I read them back from
  there. Their content is exactly the capsule members `cycles/cycle-1/stage3/returns/T1/RETURN.md` (whole),
  the first 400 lines of `…/T2/RETURN.md`, and `second-reads/SR-HS-REF/SECOND-READ.md`. No other file outside the
  capsule, the boot files and the Mathlib package was opened. A non-recursive `ls` of `second-reads/` (to create my
  output directory) showed the directory names `SR-BTP` and `SR-HS-REF`; I opened nothing in `SR-BTP`. No
  `cycles/cycle-1/stage5/` or `stage6/` path was touched. No `find`/`grep -r`/`rg` above the capsule members; no
  network; no installs; every computation ran in the foreground (longest 22 s); no background job, no PID, no kill.

## Statements read

- **PP-1** Pendant-path dominance lemma. Sources: T1 Part D (L2, left `bounded_computation`), T2 Step 4′ (left
  open), F2 L3 (left `bounded_computation`); the six critic proofs `C-T1-U` Finding 1 (shift-by-two induced
  embedding), `C-T1-F` F1 and `C-T2-U` Finding 1 (interior isomorphism `G − N[u_i] ≅ (G − N[ℓ]) − u_{i−1}` plus a
  polynomial identity at `u_0`), `C-T2-F` F1, `C-F2-T` Finding 1, `C-F2-U` F-1 (exact nonnegative difference
  identities); registry `E993-PAIR-R-LE-G-POINTWISE`.
- **PP-2** Surplus identity. Sources: `C-T2-F` F2 (key name `E993-R28-BRANCH-TREE-SURPLUS-IDENTITY`), `C-T2-U`
  Findings 2–3, `C-F2-U` F-2, `C-F2-T` Finding 3, `C-T1-F` F2 and item 4, `C-T1-U` Findings 2 and 5; the starved hub
  of T1 Part E, T2 Part 3, F2 L4.
- **PP-3** SDR ⟺ threshold. Sources: T2 Part 2 (sort-and-pair, "SAP"); `C-T2-U` (Direction 2 needs `m ≤ |L|`);
  `C-T2-F`; `C-U2-F` Finding 1 (`K_4`, `k = 2`); `C-U2-T` F2; U2's `R28U2.sdr_iff_threshold` (capsule member
  `Main.lean`); the T adjudicator's ruling that the graph-general form quantifies over every `t` including 0 (taken
  from the brief as context; the adjudication itself is outside my capsule).
- **PP-4** The `(k,t) = (1,1)` row and the non-tree fences. Sources: F2 §4–§5; `C-F2-T` Findings 6–8; `C-F2-U`
  F-4, F-5; U1's graph-general finding; `C-U1-F` Attack 2 and `C-U1-T` A2–A4 (`t ≥ 1` form).
- **PP-5** Refuted local mechanisms. Sources: T1 Part C and F2 L2 (monotonicity); T1 Part E, T2 Part 3, F2 L4
  (self-sufficiency); F2 L5 (interior vs extremal); `C-T1-U` F3, `C-T1-F` F2 (ELD), `C-T2-U` F4, `C-T2-F` F3 (DD)
  (per-direction service); `C-T1-U` F4 and `C-T1-F` F5 (branch-wording (PW), erratum R28-E-b).
- Fact of record relied on (brief): (HS) is FALSE (`SR-HS-REF`, confirmed): `R(3,2)_3`, order 22, `k = 12`, `t = 18`.

## Independent re-derivation

**Instrument** (`scratchpad/c1-sr-SR-PP/`, Python standard library, exact integers; shares no code with any seat
or critic).
- `sr_pp_lib.py`: every independent set of `G` is enumerated by bitmask backtracking; `c_v(k)` is counted **from
  the definition** (independent `k`-sets containing `v`); the independence polynomial of any induced subgraph
  `G[S]` is obtained by filtering the same enumeration (`J ⊆ S`). No vertex/path recursion of the statements under
  test is used to compute either side of any identity. Free trees: leaf extension with a centre-rooted AHU string,
  counts checked against A000055; every tree passes an edge-count, BFS-connectivity and union-find-acyclicity test.
- `fixed_points.py`: the enumeration equals a literal `2^n` subset scan on all 1,300 graphs tested (every free tree
  of order ≤ 10 and every labelled graph of order ≤ 5), 0 mismatches; `Σ_v c_v(k) = k·i_k`, `c_v(0) = 0`,
  `c_v(1) = 1` on all of them. `S(2,1,1)` at `k = 3`: `c = (0,1,2,2,1)`; `K_{1,3}`: centre `c(2) = 0`, leaves
  `c(2) = 2` — the contract's fixed points.
- A negative control (`mutation_check.py`): replacing `P_{j−2}` by `P_{j−1}` or `P_{j−3}` in the PP-1 identity
  produces 197 and 81 mismatches out of 620 checks (trees ≤ 9), so the identity check discriminates.
- Every script was re-run copy-out-first in `scratchpad/c1-sr-SR-PP/replay/`; all six outputs are byte-identical.

**PP-1** (`pp1_check.py 13 6 3000` → `pp1_out.txt`, canonical digest `5bb2adb3…c332`). For every leaf `ℓ` with maximal
pendant walk `ℓ = w_0, w_1, …, w_d` and every `u = w_j` (`1 ≤ j ≤ d`, so `w_1..w_{j−1}` have degree 2 and `u` is
arbitrary), with `Q := G − {w_0..w_j}`:
(E) `Σ_k (c_ℓ(k) − c_u(k)) x^{k−1} = I(P_{j−2})·(I(Q) − I(Q − N_Q(u)))` exactly; (M) `I(Q) − I(Q − N_Q(u))` equals
the generating polynomial of independent sets of `Q` meeting `N_Q(u)`; (I) `c_u(k) ≤ c_ℓ(k)` for every `k = 0..n`;
(S) for interior positions, `I(G − N[w_j]) = I(G − {w_0, w_1, w_{j+1}})` (the shift isomorphism).

| Family | Objects | (E) and (M) checks | (I) checks | (S) checks | Failures |
|---|---|---|---|---|---|
| All free trees, orders 1–13 (A000055 counts match) | 2,288 | 20,249 | 269,389 | 6,086 | 0 |
| All labelled graphs, orders 1–6 | 33,867 | 45,748 | 317,718 | 13,638 | 0 |
| Random host (1–10 vertices, 5 densities) + 1–3 attached pendant paths of length 1–5, seed 993028 | 3,000 (2,377 non-trees) | 23,744 | 321,160 | 15,509 | 0 |

The tree count 269,389 agrees with `C-F2-T`'s all-vertices figure at the same horizon (counted from my own run).

**I re-derived the proof by hand.** Write the path from the leaf: `ℓ = w_0, …, w_d = u` (`d ≥ 1`, distinct vertices,
`deg w_0 = 1`, `deg w_1 = … = deg w_{d−1} = 2`). The degree pattern alone forces every edge at `w_0..w_{d−1}` to lie
on the path, so `Q := G − {w_0..w_d}` meets the path only through `N_Q(u)`. Put `A := I(Q − N_Q(u))`, `B := I(Q)`,
`P_j := I(path on j vertices)`, `P_0 = P_{−1} := 1`, `P_j = P_{j−1} + x·P_{j−2}` (`j ≥ 1`). Using `c_v(k) =
i_{k−1}(G − N[v])` (`k ≥ 1`; any finite graph):
1. `G − N[u] = path(w_0..w_{d−2}) ⊔ (Q − N_Q(u))`, so `I(G − N[u]) = P_{d−1}·A`.
2. `d = 1`: `G − N[ℓ] = Q`, `I = B`, and `P_0·A = A`: difference `B − A = P_{−1}(B − A)`.
   `d ≥ 2`: `G − N[ℓ] = G − {w_0, w_1}` is `Q` with the path `w_2..w_d` hung at `u`; splitting on `u` (the
   path-attachment / vertex recurrence) gives `I = B·P_{d−2} + x·A·P_{d−3}`.
3. `P_{d−1} = P_{d−2} + x·P_{d−3}` gives `I(G − N[ℓ]) − I(G − N[u]) = P_{d−2}·(B − A)`.
4. `B − A` counts the independent sets of `Q` meeting `N_Q(u)`; `P_{d−2}` has nonnegative coefficients. At `k = 0`
   both counts are 0. ∎

Hypotheses used: finiteness and the degree pattern of the path. No acyclicity, no connectivity, no `n ≥ 2`, no
`k ≥ 1` (the `k = 0` row is `0 ≤ 0`), no degree condition on `u`. No ℕ-subtraction: the identity is in `ℤ[x]`, or
equivalently the ℕ-identity `c_ℓ(k) = c_u(k) + [x^{k−1}] P_{d−2}·M_Q(u)` with `M_Q(u)` the meeting polynomial.

**The six presentations are one proof.** Each rests on exactly two facts — the vertex/path-attachment recurrence
`I(H) = I(H − w) + x·I(H − N_H[w])` and induced-subgraph monotonicity — applied to the same cut of the pendant path:
- `C-T2-F`, `C-F2-T`, `C-F2-U` state the uniform identity above (indexed from the leaf, from the anchor, and
  multiplied by `x`, respectively). Applied with `u = u_i` it covers every position at once.
- At an interior position `N_Q(u_i) = {u_{i−1}}`, and the identity reads `I(G−N[ℓ]) − I(G−N[u_i]) =
  x·P_{d−2}·I(Q − N_Q[u_{i−1}]) = I(G−N[ℓ]) − I((G−N[ℓ]) − u_{i−1})`. That is exactly the interior isomorphism
  `G − N[u_i] ≅ (G − N[ℓ]) − u_{i−1}` of `C-T1-F` and `C-T2-U`; their `u_0` identity
  `(I(R − u_0) − I(R − N_R[u_0]))·I(P_{m−2})` is the uniform identity at `i = 0`.
- `C-T1-U`'s shift-by-two embedding is the injective (bijective-shadow) form of the same cut: it slides the leaf-side
  segment two steps toward the anchor; the lost sets are those counted by the difference polynomial.
I checked all six line by line (including `i = 1`, `i = m − 1`, `m = 1, 2`, and the conventions `P_0 = P_{−1} = 1`);
none has an error. The canonical form is the uniform identity, because it is position-uniform, exact, and names the
defect.

**Relation to `E993-PAIR-R-LE-G-POINTWISE`.** Its clause (i), "for any graph `G` with a leaf/support pair `(v,u)`:
`i(G−N[u]) ≤ i(G−N[v])` coefficientwise", read at coefficient `k − 1` is `c_u(k) ≤ c_ℓ(k)` for a leaf and its
support. That is PP-1 at `i = m − 1` (and every leaf/support pair is such an instance, with `m = 1`). PP-1 is a
strict generalization **along the path**: it adds every position `i = 0, …, m − 2` at distance ≥ 2 from `ℓ`,
including the anchor `u_0` of arbitrary degree. Clause (ii) of that key (`g ≤ f`) is a different inequality and is
not touched. The registered path-attachment lemma of `E993-PAIR-SPIDER-CLOSED-FORM` (any graph, any vertex) is step
2 of the proof; `C-F2-U` cites it correctly.

**PP-2** (`pp2_check.py 16` → `pp2_out.txt`, digest `51c06848…be9d`). Own leaves are computed from T-paths
(leaves whose path to `v` has no other branch vertex); the branch tree `B(T)` from T-paths with only degree-2
interiors — not by the walks whose identity is being tested. On all 32,492 trees of orders 1–16 with `Br ≠ ∅`
(110,327 branch vertices): `B(T)` is a tree; every leaf has exactly one owner; `|own(v)| = deg v − deg_B(v)` at every
branch vertex; `Σ_{Br}(|own(v)| − (deg v − 2)) = 2`; the slot count `|L| − 2` holds; the own-leaf assignment exists
iff `max deg_B ≤ 2` — 0 defects of any kind. Failing trees by order: 10:1, 11:4, 12:19, 13:77, 14:287, 15:1002,
16:3365; the unique order-10 one is H10 (canonical string match).

Proof (mine). Let `T` be a finite tree with `Br ≠ ∅` (so `n ≥ 4`). From a leaf `ℓ`, the walk through degree-2
vertices is forced; it ends at a vertex of degree ≠ 2, which cannot be a leaf (else `T` is a path and `Br = ∅`),
so it ends at a branch vertex `β(ℓ)`; every path from `ℓ` to another branch vertex passes `β(ℓ)`. Hence each leaf is
own to exactly one branch vertex (connectivity, acyclicity) and `Σ_{Br}|own(v)| = |L|`. With the registered slot
count `Σ_{Br}(deg v − 2) = |L| − 2` (`n ≥ 2`) the sum is 2. Per vertex: each of the `deg v` directions at `v` ends at
a leaf or at a branch vertex, distinct directions end at distinct vertices (acyclicity), so `|own(v)| = deg v − b(v)`
with `b(v) = deg_B(v)`, i.e. `|own(v)| − (deg v − 2) = 2 − b(v)`. (A second derivation: `B(T)` is a tree, so
`Σ b(v) = 2|Br| − 2`.) Own-leaf sets are pairwise disjoint, so an injective own-leaf slot assignment exists iff
`|own(v)| ≥ deg v − 2` for every `v`, iff `b(v) ≤ 2` for every `v`. Minimality: `b(v) ≥ 3` gives three directions
each containing a branch vertex `w` plus at least one vertex in each of `w`'s ≥ 2 further directions, so
`n ≥ 1 + 3·3 = 10`; equality forces `deg v = 3`, each neighbour a degree-3 branch vertex adjacent to `v`, carrying
two leaves — H10, unique. Its hub has `own = ∅`.

**PP-3** (`pp3_check.py 6 13 20000` → `pp3_out.txt`, digest `31bbe709…e146`). Four evaluators per instance: Kuhn
maximum matching on the literal slot/leaf relation; threshold at every `t ≥ 0`; threshold at `t ≥ 1` only; SAP.

| Family | Instances | matching ≠ threshold(`t ≥ 0`) | matching ≠ SAP | `t ≥ 1` holds, matching fails | …of which `#slots ≤ #leaves` |
|---|---|---|---|---|---|
| Random abstract multisets, seed 28993 | 20,000 | 0 | 0 | 2,082 | 0 |
| All labelled graphs ≤ 6, every `k = 0..n+1` | 269,747 | 0 | 0 | 137,586 | 0 |
| All free trees ≤ 13, every `k` | 32,495 | 0 | 0 | 0 | 0 (the `t = 0` row never fails) |

On `R(3,2)_3` all four evaluators agree at every `k`; at `k = 11` and `k = 12` the maximum matching is 3 < 4 slots
and every threshold form fails, as the equivalence requires.

Proof (checked line by line). *SDR ⇒ threshold at every `t ∈ ℕ`*: restrict the injection `φ` to the slots with
`τ ≥ t`; their images are distinct leaves with `μ ≥ τ ≥ t` (any finite graph, `t = 0` included). *Threshold at
every `t ∈ ℕ` ⇒ SDR* (SAP, T2): the `t = 0` row gives `m := #slots ≤ #leaves`, so pairing the `i`-th largest slot
with the `i`-th largest leaf is defined and injective; if `τ(x_i) = t ≥ 1`, the first `i` slots have `τ ≥ t`, so at
least `i` leaves have `μ ≥ t`, so `μ(ℓ_i) ≥ t`; if `τ(x_i) = 0` there is nothing to check. The `t = 0` row is
load-bearing off trees: `K_4` at `k = 2` (4 slots, no leaves, every `c = 0`), the diamond `K_4 − e` at `k = 2`, and
`K_{2,3}` at `k = 3` satisfy every row `t ≥ 1` and have no SDR. On a finite tree the `t = 0` row always holds
(`n = 1`: `0 ≤ 0`; `n ≥ 2`: `|L| − 2 ≤ |L|`), so the tree form quantifies `t ≥ 1` and is exactly (HS) ⟺ (HS-SDR).

U2's Lean statement (read, not rebuilt): `R28U2.sdr_iff_threshold (k : ℕ) : (∃ f : Slot G → LeafT G,
Function.Injective f ∧ ∀ s, occ G s.1.1 k ≤ occ G (f s).1 k) ↔ ∀ t : ℕ, slotsAtLeast G k t ≤ leavesAtLeast G k t`,
for any `G : SimpleGraph X` with `[Fintype X] [DecidableEq X] [DecidableRel G.Adj]` and no tree hypothesis; `Slot G
:= Σ v : {v // 3 ≤ G.degree v}, Fin (G.degree v.1 − 2)` (slot multiplicity exact, subtraction guarded);
`occ`/`slotsAtLeast`/`leavesAtLeast` are the `SOLUTION-CONTRACT.md` §2 text. **It is the graph-general `t ≥ 0`
form.** Its proof composes `nested_hall_iff_threshold` (the minimizer of `f` over a nonempty `A` makes the union of
nested neighbourhoods a single threshold set — I checked the argument, including `A = ∅`) with Mathlib's
`Fintype.all_card_le_filter_rel_iff_exists_injective`, whose statement at the pin (`Hall/Basic.lean:196–198`) is
`(∀ A : Finset α, #A ≤ #{b | ∃ a ∈ A, r a b}) ↔ ∃ f : α → β, Injective f ∧ ∀ x, r x (f x)` — the rewrite chain is
correct. The kernel rebuild and axiom set are reported by `C-U2-T` (`[propext, Classical.choice, Quot.sound]`); I
did not rebuild.

**PP-4** (`pp4_check.py 6 7` → `pp4_out.txt`, digest `7d2f5594…65a5`). `D_k` is computed from its definition (sum of
degrees over independent `k`-sets), never from `c`.

| Check | Scope | Result |
|---|---|---|
| `Σ_{Br}(deg v − 2) = |L| + 2(|E| + Z − n)` | all 33,867 labelled graphs ≤ 6 | 0 failures (13,832 with `Br ≠ ∅`, `L = ∅`) |
| `(1,1)` row ⟺ `|E| + Z ≤ n`; equality ⟺ `|E| + Z = n` | same | 0 failures |
| `2k·i_k − D_k = Σ_v (2 − deg v)c_v(k) = 2Σ_{deg 0} c + Σ_L c − Σ_{Br}(deg−2)c` | same, every `k` | 0 failures |
| every (DL) failure `(G,k)` is an (HS) failure at the same `k` at some `t ≥ 1` | 47,799 (DL)-failure instances | 0 exceptions |
| connected bipartite, labelled, orders 2–6 | 3,249 graphs | 605 fail = the 605 with `|E| > n`; each fails at `(1,1)`; none fails only at `k = 1` |
| connected bipartite, order 7 (labelled by side split) | 2,007 graphs | 802 fail = the 802 with `|E| > n`; each at `(1,1)` |
| `R(3,2)_3` | order 22, connected, bipartite, `|E| = n − 1` | (HS) fails at `k ∈ {11, 12}` (`t = 137..141`, `t = 18`); the `(1,1)` row holds; (DL) holds |

Derivations (mine). Handshake: `2|E| = |L| + 2M + Σ_{Br} deg v`, `n = Z + |L| + M + |Br|`, so `Σ_{Br}(deg v − 2) =
|L| + 2(|E| + Z − n)`. At `k = 1` every `c_v(1) = 1`, so the `t = 1` row is `Σ_{Br}(deg v − 2) ≤ |L|` and every row
`t ≥ 2` is `0 ≤ 0`. Since `2·i_1 − D_1 = 2n − 2|E|`, the row is also `D_1 + 2Z ≤ 2·i_1` — the r27 K1 criterion with
`Z` in place of the component count `c`. For (HS) ⇒ (DL): by the layer-cake identities, `Σ_{t≥1}(leaves_{≥t} −
slots_{≥t}) = Σ_L c − Σ_{Br}(deg − 2)c`, and `2k·i_k − D_k` exceeds this by `2Σ_{deg 0} c_v(k) ≥ 0`; so (HS) at every
`t ≥ 1` at `k` gives (DL) at `k` on every finite simple graph.

**PP-5** (`pp5_check.py 12` → `pp5_out.txt`, digest `3aebc56a…0585`; witness tables in `fp_out.txt`). First
failures over all free trees of orders 1–12 at every `k`, and (M1) over all labelled graphs ≤ 6:

| Mechanism | Failing trees by order (first orders) | Unique at first order? | Failing `k` on the witness |
|---|---|---|---|
| M1 monotonicity, branch-anchored | 6:1, 7:4, 8:9, … | yes (`S(3,1,1)`) | 3, 4 |
| M1a monotonicity, arbitrary anchor | 3:1, 4:1, 5:1, … | yes (`P_3`) | 2 |
| M1 over all labelled graphs ≤ 6 | none at orders ≤ 5 | — | — |
| M2 self-sufficiency | 10:1, 11:4, 12:19 | yes (H10) | (no `k`) |
| M3 interior ≤ extremal | 8:1, 9:4, 10:21, … | yes (`T8`) | 3, 4, 5 |
| M4 per-direction, deficient form (and M4a all directions, M4b ELD) | 12:1 each | yes (`T12`, same tree for all three) | 6, 7 |
| M5 (PW) branch wording | 9:1, 10:2, 11:12, 12:33 | yes (`T9`) | 5 |
| M5a (PW) every-vertex wording | 5:1, 6:3, … | yes (`S(2,1,1)`) | 3 |

Hand verifications (all agree with `fp_out.txt`):
- **M1**, `S(3,1,1)`, edges `0–1, 0–2, 0–3, 1–4, 4–5`, path `0–1–4–5`, `k = 3`: `c_0 = i_2({4,5} with edge 4–5) = 0`;
  `c_1 = i_2({2,3,5} edgeless) = 3`; `c_4 = i_2({0,2,3} with edges 0–2, 0–3) = 1`; `c_5 = i_2(star 0;1,2,3) = 3`.
  `(0,3,1,3)`: a dip. Minimality by hand: the only tree of order ≤ 5 with a branch-anchored pendant path of length
  ≥ 2 is `S(2,1,1)`, and along `0–1–4` its values are `(1,2,3)` at `k = 2`, `(0,1,1)` at `k = 3`, trivial otherwise;
  length-1 paths cannot dip (leaf ≥ support). The only order-5 non-tree candidate (a triangle through the anchor)
  gives `(1,2,3)`, `(0,0,0)`. With an arbitrary anchor the sequence dips already on `P_3` (`k = 2`: `(1,0,1)`).
- **M2**, H10: the hub has three branch neighbours, `own = ∅`, one slot.
- **M3**, `T8`, edges `0–1, 0–2, 0–3, 1–4, 1–5, 2–6, 2–7` (`0` interior, `1` extremal), `k = 3`:
  `c_0 = i_2({4,5,6,7} edgeless) = 6`; `c_1 = i_2({2,3,6,7} with edges 2–6, 2–7) = 6 − 2 = 4`. Minimality by hand:
  three branch vertices force `|L| ≥ 5` and `n ≥ 8`; equality forces three degree-3 branch vertices, five leaves, no
  degree-2 vertex — `T8`, unique.
- **M4**, `T12`, edges `0–1, 0–2, 0–3, 1–4, 1–5, 2–6, 2–7, 3–8, 3–9, 4–10, 5–11`, `v = 0` (`b = 3`), direction via
  `1`, `k = 6`: `c_0(6) = [x^5](1+2x)^2(1+x)^4 = 16 + 4 = 20`; `c_{10}(6) = [x^5](x(1+2x)(1+x)^4 + (1+3x+x^2)^3)
  = 9 + 9 = 18 = c_{11}(6)`; the direction's only leaves are `10, 11`. At `k = 7`: `4 > 3`.
- **M5**, `T9`, edges `0–1, 0–2, 0–3, 1–4, 1–5, 2–6, 3–7, 4–8`, `k = 5`: `c_0 = i_4({4,5,6,7,8}, edge 4–8) =
  5 − 3 = 2`; `c_8 = i_4(spider on {0,1,2,3,5,6,7} with legs 1–5, 2–6, 3–7) = 1` (only `{0,5,6,7}`). Leaf `8` ends
  the pendant path `1–4–8`, not a path at `0`, so this is consistent with PP-1.
- **M5a**, `S(2,1,1)`, `k = 3`: `c_2 = 2 > c_4 = 1`, both leaves.

## Findings and repairs

1. **PP-1 is correct in all six presentations, and they are one proof.** No mathematical error was found in any of
   `C-T1-U`, `C-T1-F`, `C-T2-U`, `C-T2-F`, `C-F2-T`, `C-F2-U`. One canonical statement (the uniform exact identity,
   which includes the inequality at every position and the anchor) is registered below. The relation to
   `E993-PAIR-R-LE-G-POINTWISE` is confirmed: its clause (i) is the case `i = m − 1`; the new key strictly generalizes
   it along the path. Consequences for candidate keys: F2's `E993-R28-LEAF-SUPPORT-DOMINANCE` (L1) and T1's Part A
   are aliases of that registered clause and must not be opened; T1's `…-LEAF-DOMINATES-OWN-PENDANT-PATH` and F2's
   `…-PENDANT-LEAF-DOMINANCE` are the same statement as the new key and fold into it. T1's Part D "obstruction" and
   T2's "Lemma DM does not extend past distance 1" block only the one-step peeling strategy, not the lemma.
2. **Key overload.** "Dominance" also names (HS), which is REFUTED. The PP-1 face must say it is not (HS), not (PW),
   and not refuted by `R(3,2)_3` (where it holds at every vertex of every pendant path, per `SR-HS-REF` and my
   own general checks).
3. **PP-2 repair (logic of "hence").** The characterization "the own-leaf assignment fails exactly when some branch
   vertex has ≥ 3 branch-tree neighbours" follows from the **per-vertex** identity `|own(v)| − (deg v − 2) =
   2 − b(v)`, of which the surplus identity is the sum; it does not follow from the sum. "Fails" is the count-level
   statement (no injective own-leaf slot assignment); that such an assignment, when it exists, respects occupancy is
   PP-1, not PP-2. The identity needs `Br ≠ ∅` (for `Br = ∅` the sum is 0). Minimality and uniqueness of H10 are
   proved, not only censused.
4. **PP-2 composes with PP-1 into Theorem BTP** ((HS-SDR) on every tree with `max b ≤ 2`) in three lines. BTP is not
   assigned to this read (a separate `SR-BTP` read exists; I did not open it), so I issue no verdict on it; I record
   only that both of its inputs are confirmed here.
5. **PP-3 repairs.** (a) T2's Direction 2 needs `#slots ≤ #leaves`; on a tree this is the slot count, in general it
   is the `t = 0` row (`C-T2-U`'s repair; adopted). (b) The graph-general form must quantify every `t ∈ ℕ`; the `t ≥ 1`
   form is insufficient off trees (`K_4`, `k = 2`; diamond, `k = 2`; `K_{2,3}`, `k = 3`); every one of my 137,586
   graph instances and 2,082 abstract instances with "`t ≥ 1` holds, no SDR" has `#slots > #leaves`. (c) U2's
   `sdr_iff_threshold` is exactly the graph-general `t ≥ 0` form; the contract's `(HS-SDR) ⟺ (HS)` (`t ≥ 1`) is its
   tree specialization, which needs the tree `t = 0` row (`C-U2-F` reports a Lean proof of that row; not read by me).
   (d) **Controller-facing:** the same U2 file carries `slot_leaf_sdr_exists` (one `sorry`) and
   `tree_leaf_slot_dominance`, both now **false statements** (refuted by `R(3,2)_3` at `k = 12`). They must be
   removed before any Stage 7 carry; `sdr_iff_threshold` does not depend on them.
6. **PP-4 repair (the bipartite sentence is false as a general statement).** "Bipartite failures are exactly
   `|E| > n` at `k = 1`" holds on connected bipartite graphs of order ≤ 7 only (census: 605 of 3,249 at orders 2–6,
   802 of 2,007 at order 7, each exactly the `|E| > n` graphs, each failing at `(1,1)`, and never only at `k = 1`). It
   is **false in general**: `R(3,2)_3` is a connected bipartite graph with `|E| = n − 1` that violates (HS) at
   `k ∈ {11, 12}` and satisfies the `(1,1)` row. The theorem part is only the direction `|E| + Z > n ⇒` failure at
   `(1,1)`, on every finite simple graph; bipartiteness plays no role. Whether an even-unicyclic graph of order 15–21
   fails before order 22 is untested (unicyclic null to order 14 is `C-F2-U`'s prior).
7. **PP-4 ruling: scope notes, no new keys.** The `(1,1)` criterion is the `k = 1` instance of the general weight
   identity already in the scope of `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`, and the parallel of the
   plain/root-corrected forms of `E993-R27-DEGREE-LEMMA-K1-ACYCLICITY-CRITERION` with `Z` in place of `c`; it goes on
   the K1 key as a scope note (candidates F2-7 and F2-9 are struck as keys). "(HS) at `t ≥ 1` ⇒ (DL) on every finite
   graph" is a one-line consequence of that weight identity; it goes on the reformulation key as a scope note (and,
   if the (LC) key `E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA` is registered, as its graph-general scope sentence). The
   hypothesis must be `t ≥ 1`: the `t = 0` row is not implied by (DL) off trees (diamond and `K_{2,3}` examples above).
8. **PP-5 repairs.** (a) M1 must state that the anchor is a branch vertex: with an arbitrary anchor (the generality
   of PP-1) monotonicity fails already at order 3 (`P_3`, `k = 2`). (b) F2's "minimal by construction" argument for
   M1 is struck (`C-F2-T`, `C-F2-U`); minimality is by hand exhaustion (only `S(2,1,1)` below order 6) plus census,
   and it holds over all finite simple graphs. (c) M2 and M3 minimality are proved with uniqueness; M4 and M5
   minimality are census-only (`bounded_computation`), with uniqueness at the first order. (d) M4's minimal witness
   is also the minimal witness of the all-directions form (`C-T1-U` F3) and of ELD (`C-T1-F` F2). (e) The (PW)
   witness of record (order 5) refutes only the every-vertex wording; the branch wording's order-minimal witness is
   `T9` (erratum R28-E-b). (PW) stays REFUTED in both wordings; no status regresses.
9. **Key-name predicate checks.** `E993-R28-PENDANT-PATH-LEAF-DOMINANCE`: the statement is that the leaf dominates
   every vertex of its pendant path — satisfied; it does not assert monotonicity. `E993-R28-BRANCH-TREE-SURPLUS-IDENTITY`:
   names the identity it states — satisfied. `E993-R28-SDR-THRESHOLD-EQUIVALENCE`: satisfied. For PP-5 I propose
   `E993-R28-HS-LOCAL-MECHANISMS` with status REFUTED (the key names the family of local statements; the status
   carries the refutation; no `-REFUTED` suffix). Lexical scan of the 392 run-local claims: `PENDANT-PATH`,
   `BRANCH-TREE`, `branch tree`, `THRESHOLD-EQUIV`, `R28`, `LEAF-DOMINANCE`, `own pendant`, `starved`,
   `self-suffic` have 0 hits; `SURPLUS` hits only `E993-R25-SURPLUS-COVER-EDGE-BUDGET` (a residual-class cover
   object); `SDR` hits `E993-R25-PENDANT-CAP-TAU-7` (a padding-simplex statement) and the r27 reformulation (an
   input); the 14 `pendant` hits are r20–r25 objects (spider closed form, generation theorem, branch factorization,
   pendant caps), none stating PP-1 or PP-2. No collision.
10. **Fences.** Nothing here transfers status to `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST,
    TREE, TRANSFER, `E993-BETA-AGG`, the aggregate, `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` or Erdős #993. (DL)
    `E993-R27-FOREST-DEGREE-LEMMA` is neither re-registered nor edited. (PW) is a premise nowhere: PP-1 compares a
    vertex only with the leaf ending its own pendant path. No census receives a proof grade. No sealed record is
    edited; the notes below are new records.

## Registration text

**K1 — `E993-R28-PENDANT-PATH-LEAF-DOMINANCE`** (status VERIFIED; grade `proved_informal`; register verbatim)

> *Statement.* Let `G` be any finite simple graph and `u_0 – u_1 – … – u_m = ℓ` (`m ≥ 1`) a path of distinct vertices
> with `deg ℓ = 1` and `deg u_1 = … = deg u_{m−1} = 2`; the degree of `u_0` is arbitrary. Then for every
> `i ∈ {0, …, m}` and every `k ∈ ℕ`, `c_{u_i}(k) ≤ c_ℓ(k)`; equivalently `i(G − N[u_i]) ≤ i(G − N[ℓ])`
> coefficientwise. Exactly: for `0 ≤ i ≤ m − 1`, with `d := m − i`, `Q := G − {u_i, …, u_m}` and
> `N_Q(u_i) := N(u_i) ∩ V(Q)`,
> `Σ_{k≥1} (c_ℓ(k) − c_{u_i}(k)) x^{k−1} = I(P_{d−2}; x) · (I(Q; x) − I(Q − N_Q(u_i); x))`,
> where `I(P_j)` is the independence polynomial of the path on `j` vertices (`I(P_0) = I(P_{−1}) := 1`) and
> `I(Q) − I(Q − N_Q(u_i))` is the generating polynomial of the independent sets of `Q` that meet `N_Q(u_i)`; both
> factors have nonnegative coefficients.
>
> *Proof.* `c_v(k) = i_{k−1}(G − N[v])` for `k ≥ 1`; both sides are 0 at `k = 0`. The degree pattern puts every edge
> at `u_{i+1}, …, u_m` on the path. `G − N[u_i]` is the path `u_{i+2}..u_m` (`d − 1` vertices) disjoint from
> `Q − N_Q(u_i)`. For `d = 1`, `G − N[ℓ] = Q`; for `d ≥ 2`, `G − N[ℓ] = G − {u_{m−1}, u_m}` is `Q` together with the
> path `u_i..u_{m−2}`, joined to `Q` only by the edges from `u_i` to `N_Q(u_i)`, and splitting on `u_i` (the
> path-attachment recurrence) gives `I(Q)·I(P_{d−2}) + x·I(Q − N_Q(u_i))·I(P_{d−3})`.
> The recurrence `I(P_{d−1}) = I(P_{d−2}) + x·I(P_{d−3})` leaves the stated difference. ∎
> Hypotheses used: finiteness and the degree pattern of the path only — no acyclicity, no connectivity, no `n ≥ 2`,
> no condition on `k` or on `deg u_0`.
>
> *Relation to the registry.* The case `i = m − 1` (a leaf and its support) is clause (i) of
> `E993-PAIR-R-LE-G-POINTWISE` (VERIFIED); this key strictly generalizes that clause along the pendant path, to every
> position at distance ≥ 2 from `ℓ`, including the anchor `u_0`. Step 2 is the path-attachment lemma of
> `E993-PAIR-SPIDER-CLOSED-FORM`; the sign step is induced-subgraph monotonicity (SR-JOIN JN-1). The sequence
> `c_{u_0}(k), …, c_{u_m}(k)` need not be monotone (see `E993-R28-HS-LOCAL-MECHANISMS`, M1); only its maximum is at
> the leaf.
>
> *Scope.* This is not the leaf/slot dominance condition (HS), which is REFUTED (`E993-R28-DOMINANCE-REFUTATION`), and
> it is not the pointwise form (PW): it compares a vertex only with the leaf ending its own pendant path. It holds
> on the (HS) counterexample `R(3,2)_3`. Equivalent presentations (one proof): the shift-by-two induced embedding
> (`C-T1-U`); the interior isomorphism `G − N[u_i] ≅ (G − N[ℓ]) − u_{i−1}` with the anchor identity (`C-T1-F`,
> `C-T2-U`); the uniform identity (`C-T2-F`, `C-F2-T`, `C-F2-U`). A Lean target: a polynomial identity plus
> `indepSetFinset` monotonicity.
>
> *Evidence.* Six independent critic proofs; second read `SR-PP` re-derived the proof and checked the exact identity,
> the inequality at every `k` and the interior isomorphism on all free trees to order 13 (20,249 identity checks,
> 269,389 inequality checks), all labelled graphs to order 6 (45,748; 317,718) and 3,000 seeded random graphs with
> attached pendant paths, 2,377 of them non-trees (23,744; 321,160): 0 failures.
>
> *Attribution.* Posed as open by r28 T1 (Part D, L2), T2 (Step 4′) and F2 (L3). Proved independently by r28 Stage 4
> critics `C-T1-U`, `C-T1-F`, `C-T2-U`, `C-T2-F`, `C-F2-T`, `C-F2-U` (Claude Opus 5, medium); canonical proof as written
> by `C-T2-F`. Leaf/support case: `E993-PAIR-R-LE-G-POINTWISE` (r20). Second read `SR-PP`.
>
> *Fences.* §3.1 no status transfer; (DL) untouched; (PW) not a premise; not (HS).

**K2 — `E993-R28-BRANCH-TREE-SURPLUS-IDENTITY`** (status VERIFIED; grade `proved_informal`; register verbatim)

> *Statement.* Let `T` be a finite tree with at least one branch vertex (`Br ≠ ∅`). For `v ∈ Br` let `own(v)` be the
> set of leaves `ℓ` such that the `T`-path from `v` to `ℓ` contains no branch vertex other than `v`, and let `b(v)` be
> the degree of `v` in the branch tree `B(T)` (vertex set `Br`; `v ~ w` iff every interior vertex of the `T`-path from
> `v` to `w` has degree 2). Then (i) every leaf lies in `own(v)` for exactly one `v ∈ Br`; (ii) for every `v ∈ Br`,
> `|own(v)| − (deg v − 2) = 2 − b(v)`; (iii) `Σ_{v∈Br} (|own(v)| − (deg v − 2)) = 2` (in `ℤ`). Consequently an injective
> assignment of the `deg v − 2` slots of every branch vertex `v` to leaves of `own(v)` exists iff `b(v) ≤ 2` for every
> `v ∈ Br`. The smallest tree where it does not exist has order 10 and is unique: H10, edges `0–1, 0–2, 0–3, 1–4, 1–5,
> 2–6, 2–7, 3–8, 3–9`, whose hub `0` has `own(0) = ∅` and one slot.
>
> *Proof.* From a leaf, the walk through degree-2 vertices is forced and, since `Br ≠ ∅`, ends at a unique first branch
> vertex that every path to another branch vertex passes (connectivity, acyclicity): (i), and `Σ_{Br}|own(v)| = |L|`.
> The registered slot count `Σ_{Br}(deg v − 2) = |L| − 2` gives (iii). Each direction at `v` ends at a leaf or a branch
> vertex, at distinct vertices for distinct directions (acyclicity), so `|own(v)| = deg v − b(v)`: (ii). Own-leaf
> sets are disjoint, so the assignment exists iff every `|own(v)| ≥ deg v − 2`, i.e. by (ii) iff every `b(v) ≤ 2`.
> If `b(v) ≥ 3`, three directions at `v` each hold a branch vertex and at least two further vertices, so `n ≥ 10`, with
> equality only for H10. ∎ The characterization rests on the per-vertex identity (ii); (iii) is its sum.
>
> *Scope.* A counting statement about degrees and leaves; it involves no occupancy count. That the own-leaf
> assignment, when it exists, satisfies `c_ℓ(k) ≥ c_v(k)` is `E993-R28-PENDANT-PATH-LEAF-DOMINANCE` (with `u_0 = v`),
> not this key.
>
> *Evidence.* Second read `SR-PP`: all 32,492 trees with `Br ≠ ∅` of orders ≤ 16 (own leaves and `B(T)` computed from
> `T`-paths), 0 defects in (i)–(iii), the slot count or the characterization; failing trees by order 10:1, 11:4,
> 12:19, 13:77, 14:287, 15:1002, 16:3365 (`bounded_computation` for the counts; the minimality and uniqueness are
> proved).
>
> *Attribution.* r28 critic `C-T2-F` (F2; this key name), independently `C-T2-U` (Findings 2–3), `C-F2-U` (F-2),
> `C-F2-T` (Finding 3), `C-T1-F` (F2), `C-T1-U` (Findings 2, 5); the starved hub by r28 T1 (Part E), T2 (Part 3) and F2
> (L4). Slot count: r27 `C-T2-U` (Step A), the `2 ≤ n` correction the r27 T adjudicator, second read SR-JOIN (JN-3).
> Second read `SR-PP`.
>
> *Fences.* §3.1 no status transfer; (DL) untouched.

**K3 — `E993-R28-SDR-THRESHOLD-EQUIVALENCE`** (status VERIFIED; grade `proved_informal`; register verbatim)

> *Statement.* (a) Graph-general. For every finite simple graph `G` and every `k ∈ ℕ`, give each branch vertex `v`
> (`deg v ≥ 3`) exactly `deg v − 2` slots. An injection from the slots to the leaves (`deg ℓ = 1`) sending each slot of
> `v` to a leaf `ℓ` with `c_ℓ(k) ≥ c_v(k)` exists iff `slots_{≥t}(k) ≤ leaves_{≥t}(k)` for **every `t ∈ ℕ`,
> including `t = 0`** (the `t = 0` row is `Σ_{Br}(deg v − 2) ≤ |L|`). (b) Trees. For every finite tree the `t = 0` row
> holds (`0 ≤ 0` at `n = 1`; `|L| − 2 ≤ |L|` for `n ≥ 2`), so (HS-SDR) at `k` ⟺ (HS) at `k` (rows `t ≥ 1`).
>
> *Proof.* Restricting an injection to the slots with `c_v ≥ t` gives each row. Conversely (sort-and-pair), the
> `t = 0` row makes the pairing of the `i`-th largest slot value with the `i`-th largest leaf value defined and
> injective; if the `i`-th slot value is `t ≥ 1`, the row at `t` gives at least `i` leaves with value `≥ t`. Hall's
> theorem on the nested-neighbourhood graph `H_k` gives the same equivalence.
>
> *Scope.* The `t ≥ 1` rows alone do not imply an SDR off trees: `K_4` at `k = 2`, the diamond `K_4 − e` at `k = 2` and
> `K_{2,3}` at `k = 3` satisfy every row `t ≥ 1` and have no SDR (their `t = 0` row fails). The equivalence is true
> while (HS) is REFUTED (`E993-R28-DOMINANCE-REFUTATION`): on `R(3,2)_3` both forms fail together at `k ∈ {11, 12}`.
> Lean: form (a) is `R28U2.sdr_iff_threshold` (r28 U2 scratch; nested-neighbourhood reduction composed with Mathlib's
> `Fintype.all_card_le_filter_rel_iff_exists_injective`), compiled sorry-free with the permitted axioms and rebuilt by
> `C-U2-T`; a formal grade attaches only at a Stage 7 award. The same scratch file's `slot_leaf_sdr_exists` and
> `tree_leaf_slot_dominance` are false statements and are not part of this key.
>
> *Evidence.* Second read `SR-PP`: matching, `t ≥ 0` threshold and sort-and-pair agree on 20,000 seeded abstract
> instances, on all labelled graphs to order 6 at every `k` (269,747 instances) and on all free trees to order 13 at
> every `k` (32,495); every "`t ≥ 1` holds, no SDR" instance (137,586 graph, 2,082 abstract) has more slots than leaves.
>
> *Attribution.* SDR condition: r27 critic `C-T2-U` (Finding 6, Step C). Sort-and-pair proof: r28 T2 (Part 2);
> `#slots ≤ #leaves` input named: r28 `C-T2-U`; `t = 0` necessity off trees: r28 `C-U2-F` (Finding 1); quantifier
> ruling: r28 T adjudicator. Lean: r28 U2. Hall: classical (Mathlib). Second read `SR-PP`.
>
> *Fences.* §3.1 no status transfer; (DL) untouched; (PW) not a premise.

**N1 — scope-note record on `E993-R27-DEGREE-LEMMA-K1-ACYCLICITY-CRITERION`** (a new record; the sealed face is not
edited; no new key; F2 candidates 7 and 9 are struck as keys)

> r28 note (the `(k, t) = (1, 1)` row of the leaf/slot threshold condition). For every finite simple graph with `n`
> vertices, `|E|` edges, `Z` isolated vertices, leaf set `L` and branch set `Br` (`deg ≥ 3`), the handshake gives, in
> `ℤ`, `Σ_{v∈Br}(deg v − 2) = |L| + 2(|E| + Z − n)`. Since `c_v(1) = 1` for every vertex, the `(1,1)` row
> `Σ_{Br}(deg v − 2) ≤ |L|` holds iff `|E| + Z ≤ n`, with equality iff `|E| + Z = n`; equivalently
> `D_1 + 2Z ≤ 2·i_1` (this key's root-corrected form with the isolated-vertex count `Z` in place of the component count
> `c`); rows `t ≥ 2` at `k = 1` read `0 ≤ 0`. It is the `k = 1` instance of the general weight identity in the scope of
> `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`. Hence every finite graph with `|E| + Z > n` — every connected
> graph of order ≥ 2 with `|E| > n` — violates (HS) at `(1,1)`; bipartiteness plays no role (e.g. `K_{2,3}`, no leaf;
> `K_{2,3}` with a pendant leaf, order 6). Census observation (`bounded_computation`): on connected bipartite graphs
> of order ≤ 7 the (HS) failures are exactly the graphs with `|E| > n`, each failing at `(1,1)`. This pattern does not
> persist: the tree `R(3,2)_3` (order 22, connected, bipartite, `|E| = n − 1`) violates (HS) at `k ∈ {11, 12}` and
> satisfies the `(1,1)` row. Attribution: r28 F2 (§4), `C-F2-T` (Findings 6, 8), `C-F2-U` (F-4, F-5); second read
> `SR-PP`. Fences: §3.1; (DL) untouched; the plain `k = 1` form gets no key.

**N2 — scope-note record on `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`** (a new record; the sealed face is
not edited; no new key)

> r28 note. From this key's general weight identity `2k·i_k − D_k = Σ_v (2 − deg v)·c_v(k) = 2·Σ_{deg v = 0} c_v(k) +
> Σ_{ℓ∈L} c_ℓ(k) − Σ_{v∈Br}(deg v − 2)·c_v(k)`, valid on every finite simple graph, and the layer-cake identities: if
> `slots_{≥t}(k) ≤ leaves_{≥t}(k)` for every `t ≥ 1`, then `D_k ≤ 2k·i_k` at that `k`, on every finite simple graph (no
> tree hypothesis, no `2 ≤ n`). Contrapositively every (DL) failure `(G, k)` is an (HS) failure at the same `k` at some
> `t ≥ 1` (0 exceptions among 47,799 (DL)-failure instances on all labelled graphs to order 6). The hypothesis is
> `t ≥ 1`; the `t = 0` row is not implied (the diamond `K_4 − e` at `k = 2` and `K_{2,3}` at `k = 3` satisfy (DL) and
> every row `t ≥ 1` but not the `t = 0` row). If `E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA` is registered, this
> sentence is its graph-general scope. Attribution: r28 U1 (unused `IsTree`), `C-U1-F` (Attack 2) and `C-U1-T` (A2–A4,
> `t ≥ 1` form, Lean in critic scratch), `C-F2-U` (F-4); second read `SR-PP`. Fences: §3.1; (DL) untouched.

**K4 — `E993-R28-HS-LOCAL-MECHANISMS`** (status **REFUTED**, each of M1–M5 separately; register verbatim)

> *Statement (each refuted).* Five local statements proposed as mechanisms for (HS), or as its fence wording, each
> claimed for every finite tree `T` and every `k`; `b(v)` is the branch-tree degree and `own(v)` the own leaves of
> `E993-R28-BRANCH-TREE-SURPLUS-IDENTITY`.
> - **M1 (pendant-path monotonicity, branch-anchored).** For every branch vertex `v` and pendant path
>   `v = u_0 – … – u_m = ℓ`: `c_{u_0}(k) ≤ c_{u_1}(k) ≤ … ≤ c_{u_m}(k)`. *Witness* `S(3,1,1)`, order 6, edges
>   `0–1, 0–2, 0–3, 1–4, 4–5`, path `0–1–4–5`, `k = 3`: `(c_0, c_1, c_4, c_5) = (0, 3, 1, 3)` (also `k = 4`:
>   `(0, 1, 0, 1)`). Order-minimal among finite trees and among all finite simple graphs, unique among trees. With an
>   arbitrary anchor the statement fails already on `P_3` at `k = 2` (`(1, 0, 1)`). The endpoint form holds
>   (`E993-R28-PENDANT-PATH-LEAF-DOMINANCE`).
> - **M2 (branch-vertex self-sufficiency).** Every branch vertex has `|own(v)| ≥ deg v − 2`. *Witness* H10, order 10,
>   edges `0–1, 0–2, 0–3, 1–4, 1–5, 2–6, 2–7, 3–8, 3–9`: `own(0) = ∅`, one slot. Order-minimal and unique (proof). It
>   fails exactly when some `b(v) ≥ 3`.
> - **M3 (interior-vs-extremal dominance).** If `|Br| ≥ 3`, `b(v) ≥ 2` and `b(w) = 1`, then `c_v(k) ≤ c_w(k)`.
>   *Witness* `T8`, order 8, edges `0–1, 0–2, 0–3, 1–4, 1–5, 2–6, 2–7`, `v = 0`, `w = 1`, `k = 3`: `c_0 = 6 > 4 = c_1`
>   (also `k = 4`: `4 > 1`; `k = 5`: `1 > 0`). Order-minimal and unique (proof: three branch vertices force `n ≥ 8`,
>   with equality only for `T8`).
> - **M4 (per-direction service).** For every `v ∈ Br` with `b(v) ≥ 3` and every direction at `v` leading to a branch
>   vertex, the component of `T − v` in that direction contains a leaf `ℓ` with `c_ℓ(k) ≥ c_v(k)`. *Witness* `T12`,
>   order 12, edges `0–1, 0–2, 0–3, 1–4, 1–5, 2–6, 2–7, 3–8, 3–9, 4–10, 5–11`, `v = 0`, direction via `1`, `k = 6`:
>   `c_0(6) = 20 > 18 = c_{10}(6) = c_{11}(6)` (also `k = 7`: `4 > 3`). Order-minimal among finite trees
>   (`bounded_computation`: no failure at orders ≤ 11), unique at order 12. The same tree is the minimal witness of
>   the all-branch-vertex, all-direction form and of "every deficient vertex is dominated by every extremal vertex's
>   best own leaf".
> - **M5 ((PW), branch wording).** `c_v(k) ≤ c_ℓ(k)` for every branch vertex `v` and every leaf `ℓ`. *Witness* `T9`,
>   order 9, edges `0–1, 0–2, 0–3, 1–4, 1–5, 2–6, 3–7, 4–8`, `k = 5`: `c_0(5) = 2 > 1 = c_8(5)`. Order-minimal among
>   finite trees (`bounded_computation`: no failure at orders ≤ 8), unique at order 9. Erratum R28-E-b: the (PW)
>   witness of record (order 5, edges `0–1, 0–2, 0–3, 1–4`, `k = 3`, `c_2 = 2 > 1 = c_4`) compares two leaves and
>   refutes only the every-vertex wording, for which it is the unique order-minimal witness among trees. (PW) stays
>   REFUTED in both wordings.
>
> *Grade.* Each witness is an exact finite computation, verified by hand and by independent instruments. Minimality:
> proved for M1 (by hand exhaustion: below order 6 the only tree with a branch-anchored pendant path of length ≥ 2 is
> `S(2,1,1)`, monotone at every `k`), M2 and M3; `bounded_computation` for M4 and M5 (several instruments; exhaustive
> to order 11 and order 8 respectively).
>
> *Attribution.* M1: r28 T1 (Part C) and F2 (L2); confirmed by `C-T1-U`, `C-T1-F`, `C-F2-T`, `C-F2-U`, `C-T2-F`
> (T2's stepwise form). M2: r28 T1 (Part E), T2 (Part 3), F2 (L4); minimality proofs `C-T1-U` (F5), `C-T1-F`,
> `C-T2-U` (F3), `C-T2-F` (F2). M3: r28 F2 (L5). M4: r28 critics `C-T1-U` (F3), `C-T1-F` (F2, ELD), `C-T2-U` (F4),
> `C-T2-F` (F3, DD). M5: r28 critics `C-T1-U` (F4) and `C-T1-F` (F5); (PW) itself: r27 `C-T2-U` (Step D). Second read
> `SR-PP`.
>
> *Fences.* These refute local mechanisms and a fence wording, not (DL) and not `E993-R28-PENDANT-PATH-LEAF-DOMINANCE`.
> §3.1 no status transfer; (DL) untouched; REFUTED never regresses.

## Verdicts

verdict[PP-1]: confirmed
verdict[PP-2]: confirmed_with_repairs
verdict[PP-3]: confirmed_with_repairs
verdict[PP-4]: confirmed_with_repairs
verdict[PP-5]: confirmed_with_repairs

- `PP-1`: the brief's statement is correct as written; all six proofs are correct and are one proof; registered once
  (K1) in the exact-identity form; strict generalization of `E993-PAIR-R-LE-G-POINTWISE` clause (i) along the path.
- `PP-2` repair: the characterization rests on the per-vertex identity, not on the sum; "fails" is count-level;
  `Br ≠ ∅`; minimality and uniqueness proved.
- `PP-3` repairs: Direction 2 needs `#slots ≤ #leaves` (the `t = 0` row); graph-general form over every `t ∈ ℕ`, tree
  form over `t ≥ 1`; U2's statement is the graph-general form; U2's two sorry-dependent declarations are false.
- `PP-4` repairs: the bipartite "exactly `|E| > n`" is a census observation to order 7 and is false in general
  (`R(3,2)_3`); the (HS) ⇒ (DL) hypothesis is `t ≥ 1`; ruled as two scope notes (N1, N2), no new keys.
- `PP-5` repairs: M1 must be branch-anchored (arbitrary anchor fails at order 3); F2's constructive minimality argument
  struck and replaced; M4/M5 minimality graded `bounded_computation`; one record (K4) with status REFUTED.
- Not assigned and no verdict: Theorem BTP (PP-1 ∘ PP-2; see Finding 4).

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-degree-lemma-hall-sdr-dre-2026-09-24/scratchpad/c1-sr-SR-PP/`
(SHA-256 of file bytes; the canonical digest printed on each output's last line is quoted in the text above):

| File | SHA-256 | Role |
|---|---|---|
| `seal_check.py` | `928ef39fd24d93fe10c83420480f0fc89b978f101ed2c96b2d31fd9f104cb120` | capsule seal and 59 member digests |
| `seal_out.txt` | `0a8aa955da7dcf8052d5228aab513a248f10c76f37ad4d69ebbc9a81e3537565` | seal MATCH, 59/59, 0 bad |
| `sr_pp_lib.py` | `8cad24c21dc3e532577ef2b62093cdadb54907af09af8d84692b88a2db3b3297` | enumeration of independent sets, definitional `c_v(k)`, free trees, tree tests, pendant walks, branch data |
| `pp1_check.py` / `pp1_out.txt` | `cda0025c5cce2e9f13b9b82f7454592054bc82a658af8a6cbd4511e4ebf3116e` / `0207a2259247e4a2b26f4622101f14804426b17a0bbb1cd2b7a70cae9042cfb9` | PP-1; run `python3 pp1_check.py 13 6 3000` (22 s) |
| `mutation_check.py` / `mutation_out.txt` | `341c5fd250a3b4b66e6a39acacb466621292945dfc4a3f11087208dcc2577a5a` / `bed7f9d98e59fbe824936c72c57eff0d19d1ae58bbfb5932011155b0e5314374` | negative control for the PP-1 identity check |
| `pp2_check.py` / `pp2_out.txt` | `8ac867fb2cc8f430870384f31328abfbff3c4c372488aec5808cd2a8e220b0e1` / `d4f074b71f45b711b32752c3987c3a01cf8108a94461abb40e784b0c97f0f20a` | PP-2; `python3 pp2_check.py 16` (7 s) |
| `pp3_check.py` / `pp3_out.txt` | `2878cf92222f6e2df880356c3ba165979331a8b9cf315dc374d49514096408de` / `f49fd131701c96bd1698333a59788ca26c656e69ecd61d365fae4a432d82bfa3` | PP-3; `python3 pp3_check.py 6 13 20000` (4 s) |
| `pp4_check.py` / `pp4_out.txt` | `9ea7666cec4ce3755a40d64a63647a7dab26bea2fdf29f7738b77de6e65f9cb5` / `e21e0c832c5bbfff869ba5bf2eeca0e48dc3ce099eb01a823fb42ba6f3aecf3d` | PP-4; `python3 pp4_check.py 6 7` (2 s) |
| `pp5_check.py` / `pp5_out.txt` | `df2e1cc632bae35c205aaf87e0ff8e567a95c3169ece5ad4f01bc0d32f526675` / `0a5dee24c343f9cd1f2069d3161e9b218a9ae37fa4e87a964b8d8a3a8192dfd6` | PP-5; `python3 pp5_check.py 12` (1 s) |
| `fixed_points.py` / `fp_out.txt` | `55a80d4513577fcd23e5e08fa2b8104aec84380bda7e5742b5f882f4d2d1b84f` / `2ea9a31b7330fe651bcb908ac7177e60a86e4386c395f0bf55ac94738303d386` | enumeration vs `2^n` scan; fixed points; witness `c`-tables |
| `pp*_err.txt`, `fp_err.txt` | empty | stderr of the runs |
| `replay/` | copies of the seven scripts and their six outputs | copy-out-first replay; all six outputs byte-identical to the originals |

Only this `SECOND-READ.md` and the scratch directory above were written. No background job was started; nothing is
running. Reread before close.
