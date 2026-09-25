# Second Read

Isolated second read `SR-BTP`, r28 Cycle 1. It covers Theorem BTP: (HS) holds on every tree whose branch tree has
maximum degree ≤ 2. It also covers the theorem's sharpness and residue class, and the composed second mechanism for
(DL) on that class.
Run `erdos-993-math-dre-20260924-r28-degree-lemma-hall-sdr`.

**Boot acknowledgment.** I am operating within VerityOS. The boot reads were exactly
`/Users/ashtonsperry/VerityOS/verity.md` (the constitution) and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (the identity subsystem's startup protocol). I loaded no
other VerityOS subsystem. The host harness placed the repository `CLAUDE.md` and the user auto-memory index in my
context without my asking. I did not act on either. In particular I wrote no conversation log, because the sealed
second-read protocol governs this seat. Neither file enters any step below.

**Model disclosure.** chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority

(For the record, as text only: this session's system context names the engine "Opus 5.5
(`claude-opus-5-5[1m])`". I report that string as given. I did not inspect the runtime myself.)

## Identity and seal audit

- **Capsule.** `control/c1-second-read/SR-BTP-PACKET-MANIFEST.json`, stage `cycle-1-second-read-SR-BTP`, run id as
  above.
  - Recorded seal: `d205f715a0ed705f603909544f6aab1ba97096f2e3c71ed16365a9bbc3da5cdc`.
  - Recomputed seal: SHA-256 of `json.dumps(manifest minus seal_sha256, sort_keys=True, separators=(",",":"))`, no
    trailing newline (`scratchpad/c1-sr-SR-BTP/seal.py`). It is **identical**. The ASCII-escaped and the UTF-8
    serialisations give the same value.
  - **66/66 members match** in both SHA-256 and byte count. `file_count` is 66.
- **Dispatch wrapper.** `control/dispatch/c1-second-read/DISPATCH-SR-BTP.md` carries only the pointer. I followed it.
- **Members read.**
  - The protocol, the brief, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md` and `AUTHORIZATION.md`.
  - `control/C1-SECOND-READ-PATH-LITERAL-QUOTATION-RECORD.json` and `control/c1-second-read/PATH-CHECK-SR-BTP.json`.
  - The three proofs I was assigned: `C-T2-U`, `C-F2-U` and `C-F2-T`, all in full.
  - `C-T1-F` in full. I also read the passages of `C-T2-F` (lines 100–200 and 275–295) and of `C-F1-T` and `C-F1-U`
    (their remaining-obligation sections) that define the cycle's other sufficient conditions.
  - `second-reads/SR-HS-REF/SECOND-READ.md`.
  - The U1 return and `scratchpad/c1-U1/LeanProject/LeanProof/Main.lean`.
  - `control/CLAIM-IDENTITY.run-local.json`, by keyed and lexical search only, for the alias check.
  - The seat instruments under `scratchpad/c1-crit-*` were hashed only. I did not run or reuse them. I share no code
    with any seat.
- **Outside the capsule, all inside the granted roots.**
  - I ran the pinned Lean binary `~/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lean` on a *copy* of U1's
    `Main.lean`, with `LEAN_PATH` pointed at the shared, write-protected Mathlib build
    (`~/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages/*/.lake/build/lib/lean`).
  - There was no `lake`, no `elan` action, no network and no write outside my scratch directory.
  - I ran non-recursive `ls` of `~/.elan/toolchains/`, of `~/.local/share/verityos/lean/` and of that `packages/`
    directory, to locate the binary and the build.
- **Read-boundary incidents (disclosed; nothing below depends on them).**
  1. While searching for the "rooted-subtree rule" and for other proposed conjectures, two `grep` commands used the
     shell globs `cycles/cycle-1/stage3/returns/*/RETURN.md` and `cycles/cycle-1/stage4/critics/*/*/CRITIQUE.md`.
     - Those globs also matched non-members: the U2 return (no line printed) and the critiques under `critics/U1/`
       (and `critics/U2/`, if present).
     - The second grep printed five short lines from `critics/U1/T/CRITIQUE.md` (line 170, a heading about fencing a
       "graph-general strengthening") and from `critics/U1/F/CRITIQUE.md` (lines 85, 134 and 177, one sentence each on
       the same topic).
     - I did not open those files and did not use those lines. My treatment of the graph-general (LC) point in `BT-3`
       rests on my own kernel replay and my own reading of U1's source.
     - After this I restricted every search to the explicit member list (`scratchpad/c1-sr-SR-BTP/members.txt`).
  2. One `ls` of `cycles/cycle-1/stage3/returns/` and `cycles/cycle-1/stage4/critics/` showed the seat directory names
     `F1 F2 T1 T2 U1 U2`. The critics listing was cut by `head`. Nothing inside those directories was listed.
- **What I did not read.** Nothing under `cycles/cycle-1/stage5/` or `stage6/`. No other second read, adjudication or
  experiment root. No `find`, no network and no install. I did not use the controller's order-18 prior or any r27
  census as evidence.
- **Processes.** Every computation ran in the foreground; the longest took 161 s. I started no background job and
  made no process listing. I killed nothing.

## Statements read

- **`BT-1` — Theorem BTP.** Every finite tree whose branch tree has maximum degree ≤ 2 satisfies (HS) and (HS-SDR),
  through the own-leaf assignment. The class includes paths, stars, spiders, caterpillars, brooms and double brooms.
  - Sources: `C-T2-U` Finding 2, `C-F2-U` F-2 and `C-F2-T` Finding 2. The same local-service argument also appears in
    `C-T2-F` F2 and `C-T1-F` F2.
  - The pendant-path lemma it rests on appears as `C-T2-U` Lemma PP, `C-F2-T` Finding 1, `C-F2-U` F-1, `C-T2-F` F1
    (PPD) and `C-T1-F` F1 (L2).
  - Proposed key: `E993-R28-DOMINANCE-ON-PATHLIKE-BRANCH-TREES`, grade `proved_informal`.
- **`BT-2` — sharpness and the residue class.**
  - The witness `R(3,2)_3` has branch tree `K_{1,3}`, so BTP is sharp.
  - The residue class (trees with a branch vertex of branch-tree degree ≥ 3) begins at order 10, with counts 1, 4,
    19, 77, 287 and 1,002 at orders 10–15.
  - (HS) holds on the residue to order 21 and fails at order 22.
  - Every sufficient conjecture the cycle proposed falls to `R(3,2)_3`.
  - What remains open is the weakest matching-type strengthening of (DL).
- **`BT-3` — consequence for (DL).** BTP composed with (LC) gives a second, matching-type proof of (DL) on the BTP
  class. (DL) on all forests remains proved only by r27's injection.

## Independent re-derivation

### Instrument (`scratchpad/c1-sr-SR-BTP/btp_lib.py`; Python standard library; exact integers)

- **Free trees.** I generate them with the Wright–Richmond–Odlyzko–McKay successor on canonical level sequences. No
  seat used this method: the seats used centroid composition, leaf extension with AHU deduplication, and
  Beyer–Hedetniemi with a centre-AHU form.
  - Counts equal A000055 at every order 1–18.
  - All trees are pairwise non-isomorphic at every order ≤ 18, checked by my own centre-rooted canonical string
    (`validate_gen.out`, `distinct_17_18.out`). The enumeration is therefore exhaustive to order 18.
  - Every generated tree passes a tree test: `|E| = n−1`, union-find acyclicity and connectivity.
- **Occupancy.** `c_v(k) = [x^{k−1}] I(T − N[v])`, computed by a forest DP on the induced forest `V ∖ N[v]`, one per
  vertex.
  - It equals brute-force subset enumeration on all 987 trees of order ≤ 12.
  - On every tree of order ≤ 18, `c_v(0) = 0`, `c_v(1) = 1` and `Σ_v c_v(k) = k·i_k` at every `k = 0..n+1`, with 0
    failures.
  - On `R(3,2)_3`, a third, backtracking enumerator of all independent sets (54,929 of them) equals the DP at every
    vertex and every `k`.
- **Branch structure.** For each `v ∈ Br` and each neighbour, I walk through degree-2 vertices to the first vertex of
  degree ≠ 2. This gives the own leaves, the branch-tree neighbours, `p(v)` and `b(v)`.
- **Threshold form, literal.** I evaluate it at every `t` in `{0, 1} ∪ {c_x(k), c_x(k)+1 : x ∈ V}`. Both step
  functions are constant between consecutive values of `c`, so this set contains a representative of every class of
  `t ∈ ℕ`, including `t = 0` and `t > max c`. The check is exact and relies on no monotonicity argument.
- **Matching.** Kuhn augmenting paths on the literal bipartite graphs.

### Definitions and structural facts (with the case of 0 or 1 branch vertex)

Let `T` be a finite tree, with `L = {deg = 1}` and `Br = {deg ≥ 3}`.
- For `v ∈ Br` and `u ∈ N(v)`, the **direction** `(v, u)` is the walk `v = u_0, u_1 = u, u_2, …`. While
  `deg u_i = 2` it continues to the other neighbour, and it stops at the first `u_m` with `deg u_m ≠ 2`.
- The **branch tree** `B(T)` has vertex set `Br`, with `v ~ w` iff `v ≠ w` and every interior vertex of the `T`-path
  from `v` to `w` has degree 2. Interior vertices of a path have degree ≥ 2, so this is the same as "no interior
  vertex is a branch vertex".
  - If `Br = ∅`, then `B(T)` is the empty graph and `T` is a path `P_n`, `n ≥ 1`.
  - If `|Br| = 1`, then `B(T) = K_1` with `b = 0`, and `T` is a spider (a star when every leg has length 1).
  - Write `b(v) := deg_{B(T)}(v)`.

- **(F1) Acyclicity.** A direction's walk has distinct vertices and terminates. Its end `u_m ≠ v`, since otherwise
  there would be a cycle. `deg u_m ≠ 0`, because `u_{m−1}` is a neighbour.
  - So the walk ends either at a leaf (a *pendant direction*; the leaf is an *own leaf* of `v`) or at a branch vertex
    (an *internal direction*).
  - An internal direction ending at `w` gives `v ~ w`. Conversely, `v ~ w` determines the direction along the first
    edge of the `v–w` path.
  - Two directions of `v` with the same end would give two `v`–end paths, which would be a cycle.
  - Hence `b(v)` equals the number of internal directions, and `p(v) := #pendant directions = deg v − b(v)`. The
    distinct pendant directions of `v` end at distinct leaves.
- **(F2) Anchor uniqueness.** The walk inward from a leaf through degree-2 vertices is forced. So an own leaf has
  exactly one anchor, and the own-leaf sets of distinct branch vertices are pairwise disjoint.
- **(F3) Pendant-path lemma, anchor case** (the only case BTP uses). Let `G` be any finite simple graph containing a
  path `v = u_0 – u_1 – … – u_m = ℓ` with `m ≥ 1`, `deg u_i = 2` for `1 ≤ i ≤ m−1` and `deg ℓ = 1`. Then
  `c_ℓ(k) ≥ c_v(k)` for every `k ∈ ℕ`.
  - *Proof.*
    - Use `C_y(x) := Σ_k c_y(k)x^k = x·I(G − N[y])`. This is the polynomial form of `c_y(k) = i_{k−1}(G − N[y])` and
      needs no `k ≥ 1` guard.
    - Let `F := G − {u_1..u_m}`. The degree pattern forces the path to meet `F` only through the edge `vu_1`.
    - Let `A := F − v` and `B := F − N_F[v]`, and write `q_j := I(P_j)` with `q_{−1} = q_0 = 1` and
      `q_j = q_{j−1} + x·q_{j−2}`.
    - **Case `m = 1`.** `G − N[v] = B` and `G − N[ℓ] = A`.
    - **Case `m ≥ 2`.**
      - `G − N[v] = B ⊔ (u_2…u_m)`, which gives `I(B)·q_{m−1}`.
      - `G − N[ℓ]` is `F` with the path `u_1…u_{m−2}` hung at `v`. Splitting on `v` gives
        `I(A)·q_{m−2} + x·I(B)·q_{m−3}`. At `m = 2` the hung path is empty and `q_{−1} = 1` is correct.
    - In both cases, `C_ℓ − C_v = x·(I(A) − I(B))·q_{m−2}`.
    - `B` is an induced subgraph of `A`, so `I(A) − I(B) ≥ 0` coefficientwise. `q_{m−2} ≥ 0` coefficientwise. ∎
  - *Hypotheses.* Only finiteness and the degree pattern are used. No acyclicity, no connectivity.
  - *Agreement.* This is the identity of `C-T2-U` (case `i = 0`), `C-F2-T` F1, `C-F2-U` F-1 (with `A`/`B` named the
    other way round), `C-T2-F` F1 (`Q = F − u`) and `C-T1-F` F1. I checked each derivation line by line and found no
    defect.
  - *Checks.* The case `m = 1` is the registered `E993-PAIR-R-LE-G-POINTWISE`(i). I checked this in the run-local
    registry.
    - `pp_identity.py`: the exact polynomial identity and coefficient nonnegativity on 1,500 random general graphs
      (host graph of order 1–7, pendant path `m = 1..5`, brute-force counts): **0 mismatches**.
    - Census: 33,425,334 (anchor, own leaf, `k`) checks on every tree of order ≤ 18, **0 failures**.

### BT-1: canonical proof and replay

**Theorem BTP.** Suppose `b(v) ≤ 2` for every `v ∈ Br`. Then for every `k ∈ ℕ` the map `φ` that sends the `deg v − 2`
slots of each `v ∈ Br` to distinct own leaves of `v` is an injection from the slots into `L`, with
`c_{φ(s)}(k) ≥ c_v(k)` on every slot `s` of `v`. Hence for every `t ∈ ℕ`:
`slots_{≥t}(k) ≤ leaves_{≥t}(k)`.
- `φ` exists because, by (F1), `p(v) = deg v − b(v) ≥ deg v − 2`.
- `φ` is injective by (F2) and by the distinctness in (F1).
- Dominance on every pair is (F3).
- The threshold form follows because `φ` maps the slots with `c_v(k) ≥ t` injectively into the leaves with
  `c_ℓ(k) ≥ t`. ∎

**Where each hypothesis enters, and what is not used.**
- **Acyclicity** enters in (F1): walks terminate, ends are distinct, and `b` equals the number of internal
  directions.
- **Finiteness** enters in (F1) and (F3).
- **Not used:**
  - connectivity (it is needed only for the equivalences below);
  - `n ≥ 2`, `k ≥ 1` and `t ≥ 1` (the theorem also holds at `t = 0` and `k = 0`);
  - the slot count `Σ_{Br}(deg v − 2) = |L| − 2`;
  - the *global* surplus identity `Σ_{Br}(2 − b(v)) = 2`;
  - Hall's theorem;
  - (PW), since each comparison is between a vertex and a leaf of its own pendant path;
  - (HS) on any other tree;
  - (DL).

**The class, in equivalent forms.** For `Br ≠ ∅`, the following are equivalent:
- (i) `max_v b(v) ≤ 2`;
- (ii) every branch vertex has at least `deg v − 2` pendant directions (by F1);
- (iii) `B(T)` is a path;
- (iv) all branch vertices lie on one path of `T`.

The equivalences hold as follows:
- **(i)⇔(iii).** `B(T)` is a tree. It is connected: consecutive branch vertices along a `T`-path are `B`-adjacent. It
  has `|Br| − 1` edges. That count comes from `Σ b = Σ_{Br} deg − |L|`, which uses connectivity (every leaf has an
  anchor), together with the slot count.
- **(iii)⇒(iv).** Concatenate the `T`-paths of consecutive `B`-edges. The walk never backtracks, because distinct
  `B`-neighbours use distinct directions (F1). A non-backtracking walk in a tree is a path.
- **(iv)⇒(i).** A direction of `v` that contains a branch vertex must run along the common path, and there are at
  most two such directions.

The class therefore contains:
- every path;
- every star `K_{1,m}` (`m ≥ 3`) and every spider;
- every broom and double broom;
- every caterpillar, since its branch vertices lie on the spine;
- every tree with at most three branch vertices.

It excludes exactly the trees with some `b(v) ≥ 3`.

**Replay** (`btp_census.py`; `btp_census_14.json` and `btp_census_18.json`). The run covers every free tree, with
`k = 0..n+1` and every `t`-class including `t = 0`.

| Horizon | Class trees with `Br ≠ ∅` | Paths | `(T,k)` instances | Own-leaf SDR failures | Threshold failures | Structure-check failures | (i)⇔(iv) mismatches |
|---|---|---|---|---|---|---|---|
| order ≤ 14 (the brief's horizon) | 5,045 | 14 | 76,829 | 0 | 0 | 0 | 0 |
| order ≤ 18 | 155,290 | 18 | 2,991,832 | 0 | 0 | 0 | 0 |

- The structure checks are:
  - own-leaf sets are disjoint, and every own leaf has degree 1;
  - `p + b = deg`;
  - `B(T)` is symmetric, connected and has `|Br| − 1` edges;
  - `Σ(2 − b) = 2`;
  - the slot count `|L| − 2`;
  - leaves are partitioned by anchor.
- Class counts by order 4–18 are 1, 2, 5, 10, 22, 46, 104, 230, 531, 1,223, 2,871, 6,738, 15,954, 37,775 and 89,778.
- They reconcile with other seats' figures:
  - `C-T2-U`'s "27,737 of the 32,492 trees with `Br ≠ ∅`" to order 16 is reproduced: 27,737.
  - `C-F2-U`'s "65,512 of 81,136, 15,608 outside" for orders 2–17 is reproduced: 27,737 + 37,775 = 65,512.
- These counts are a replay of a theorem, `bounded_computation`, and are not its grade.

### BT-2: sharpness, residue and casualties

- **The witness** (`residue_witness.py`).
  - `R(3,2)_3` is a tree of order 22 with 21 edges.
  - `Br = {0,1,8,15}`, all of degree 3. `L = {4,7,11,14,18,21}`.
  - Its branch tree has edges `{0–1, 0–8, 0–15}`, which is `K_{1,3}`, with `b(0) = 3` and `b(1) = b(8) = b(15) = 1`.
  - `α = 13` and `i = (1,22,210,1144,3933,8907,13470,13529,8856,3691,975,171,19,1)`.
  - The threshold form fails exactly at `k ∈ {11, 12}`:
    - at `k = 12`: `c_0 = 18`, `c_1 = c_8 = c_15 = 0`, every leaf 17, and `t = 18`;
    - at `k = 11`: `c_0 = 141`, the other branch vertices 4, every leaf 136, and `t = 137..141`.
  - (DL) holds at every `k`: `372 ≤ 456` at `k = 12` and `3099 ≤ 3762` at `k = 11`.
  - This agrees with SR-HS-REF digit for digit.
- **Sharpness for every branch-degree bound.** The family `R(d,m)` (`d ≥ 3`, `m ≥ 2`) of `E993-R28-DOMINANCE-REFUTATION`
  (proved_informal, second-read by SR-HS-REF) has branch tree `K_{1,d}`. Each `b_i` has degree `m+1 ≥ 3` and one
  internal direction; its other directions are pendant.
  - So for every `D ≥ 3` the class "maximum branch-tree degree ≤ `D`" contains a counterexample.
  - I computed this at `D = 3, 4, 5` with `m = 2`:
    - `R(4,2)` (order 29) fails at `k = 16`, `t = 24`, where `c_root = 24` and every leaf has `c = 23`.
    - `R(5,2)` (order 36) fails at `k = 20`, `t = 30`, where `c_root = 30` and every leaf has `c = 29`.
  - Sharpness is existential only. The smallest tree outside the class, H10, satisfies (HS) at every `k`. (I also
    confirm `α(H10) = 7`, as `C-T2-U` corrected.)
- **Residue minimality (proof re-derived).**
  - A vertex with `b(v) ≥ 3` has at least three internal directions.
  - Each such direction contains a branch vertex `w` with at least `deg w − 1 ≥ 2` further directions, which are
    nonempty and disjoint. So each direction has at least 3 vertices, and `n ≥ 1 + 3·3 = 10`.
  - At equality, `deg v = 3` and each direction is exactly `w` adjacent to `v` with two leaves. That is H10, and it is
    unique.
  - This is `proved_informal`. Proofs appear in `C-T2-U` F3 and `C-T2-F` F2, and `C-T1-F` supplies the `n ≥ 10`
    bound.
- **Residue counts** (my census). Orders 10–18: **1, 4, 19, 77, 287, 1,002, 3,365, 10,853, 34,088**.
  - Orders 10–15 equal `C-F2-T`'s figures. Orders 10–16 equal `C-T2-U`'s and `C-T2-F`'s.
  - The order-17 figure equals `C-F2-U`'s residue total 15,608 over orders 2–17 (4,755 + 10,853).
  - (HS) holds on every residue tree to order 18 on my instrument: 49,696 trees, 971,648 instances, 0 failures.
  - Orders 19–21 rest on the record of SR-HS-REF (every free tree, two exhaustive instruments at order 21). The
    unique order-22 failure is `R(3,2)_3`, which lies in the residue class (a single instrument, SR-HS-REF).
  - Every counterexample to (HS) must lie in the residue, by BTP.
  - A partial assignment holds on every residue tree, as BTP's proof predicts. Every vertex with `b ≤ 2` is served
    by its own leaves: **0 failures** on the 971,648 instances.
- **Casualties, each tested literally on `R(3,2)_3` at `k = 11` and `k = 12`:**

| Proposed sufficient condition (proposer) | What it would imply | Result on `R(3,2)_3` |
|---|---|---|
| Local-first residual, LFR (`C-T2-F` F3); the same as the reduction R-SDR (`C-T1-F` F2), "own leaves, then one spare leaf per extremal branch vertex". Deficit slots go into the pool of the maximum-`c` own leaf of each branch-tree leaf | (HS-SDR) | max matching **0 of 1** at both `k` (pool `c` = 17 < 18, and 136 < 141) |
| Residual-Hall (`C-F2-U` F-3). Reserve the smallest-`c` own leaves, then apply the threshold form to the remaining leaves | (HS) | fails at `t = 137..141` (`k = 11`) and `t = 18` (`k = 12`) |
| Rooted Export Conjecture, REC (`C-T2-U` F4) | (HS-SDR) | max matching **3 of 4** for **every** root `r ∈ {0,1,8,15}`, at both `k` |
| Rooted-subtree rule (`C-T1-F` F3). Root at a leaf; each slot of `v` goes to a leaf descendant of `v` | (HS-SDR) | max matching **3 of 4** for **every** leaf root (all 6), at both `k` |
| "(HS) for connected graphs with `|E| ≤ n`" (`C-F2-T` F7; the same phenomenon in `C-F2-U` F-6) | (HS) on trees | falls: `R(3,2)_3` is connected with `|E| = 21 ≤ 22` |
| Fractional SDR with unit leaf capacities (`C-F2-U` F-7 notes it is equivalent to (HS)) | (HS) | falls: the bipartite matching polytope is integral, so the fractional optimum equals the maximum matching, 3 < 4 |
| SDR into leaves together with degree-2 vertices (`C-F1-T`'s candidate list) | a weakening | falls: the maximum `c` over degree-2 vertices is 17 (`k = 12`) and 134 (`k = 11`); max matching **3 of 4** |

- At both failing `k`, `c_0` is the **strict maximum of `c` over all 22 vertices**:
  - at `k = 12`: 18, against 17 for every leaf and every degree-2 vertex, and 0 for the other branch vertices;
  - at `k = 11`: 141, against 136, 134 and 4.
- So no injection from slots into non-branch vertices that respects the pairwise comparison `c_target ≥ c_source`
  exists. Any matching-type strengthening of (DL) that survives must relax the pairwise comparison itself.

### BT-3: the composition, and a kernel replay of (LC)

- **(LC) re-derived.** For any finite simple graph `G` and any `k`:
  - Double counting gives `Σ_v c_v(k) = k·i_k` and `Σ_v deg(v)·c_v(k) = D_k`. So
    `2k·i_k − D_k = Σ_v (2 − deg v)·c_v(k) = 2Σ_{deg 0} c + Σ_L c − Σ_{Br}(deg − 2)c` (degree-2 terms vanish)
    `≥ Σ_L c − Σ_{Br}(deg − 2)c`.
  - Layer-cake over `t = 1..i_k` (every `c ≤ i_k`) gives `Σ_{Br}(deg−2)c = Σ_{t=1}^{i_k} slots_{≥t}` and
    `Σ_L c = Σ_{t=1}^{i_k} leaves_{≥t}`.
  - So (HS) at `t = 1..i_k` implies (DL) at `k`.
- **Kernel replay.**
  - I copied U1's `Main.lean`. The copy's SHA-256 before my three appended audit lines is `74ab2108…d628e5`, which
    equals the member.
  - I checked it with the pinned `lean` v4.32.2 against the shared Mathlib build. It finished with **exit 0** in
    6.5 s.
  - The only diagnostic is the linter warning that `hT` is unused.
  - `#check` shows the statement of `SOLUTION-CONTRACT.md` §2 verbatim: hypotheses `G.IsTree`,
    `∀ t : ℕ, slotsAtLeast G k t ≤ leavesAtLeast G k t`; conclusion
    `(indepDegreeSum G k : ℤ) ≤ 2 * k * indepCount G k`.
  - `#print axioms` gives `[propext, Classical.choice, Quot.sound]` for `dominance_implies_degree_lemma` and for
    `layerCake_subset`.
  - The proof consumes `h` only on `Finset.Icc 1 N`, so `t = 0` is never used. It never uses `hT`, so it is
    graph-general in substance.
  - This is a scratch replay, not a governed Stage 7 award. The key's registry status is the controller's to
    register.
- **The composition.** Let `T` be a finite tree in the BTP class and `k ∈ ℕ`.
  - BTP gives `slotsAtLeast T k t ≤ leavesAtLeast T k t` for every `t ∈ ℕ`, including `t = 0`. So `h` is supplied
    exactly as the Lean statement requires.
  - `hT` is the tree hypothesis.
  - `dominance_implies_degree_lemma` then gives `D_k(T) ≤ 2k·i_k(T)`.
- **Where the reformulation enters.**
  - Inside (LC) as kernel-checked, the r27 leaf/branch identity is **not** used. It is replaced by the graph-general
    inequality above, in which the degree-0 and degree-2 terms are dropped as nonnegative.
  - An informal presentation may instead use the r27 reformulation `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`
    for `n ≥ 2`. The case `n = 1` is trivial: `D_k = 0`.
- **Where the slot count enters.** Nowhere. BTP's injection is built vertex by vertex, and (LC) never reads the
  `t = 0` row.
- **Numeric consistency.** On the witness, (DL) holds while BTP's hypothesis fails. That is consistent: the witness is
  outside the class.

## Findings and repairs

1. **`BT-1` is correct in all three assigned versions.** Each follows the same argument: `p = deg − b`, disjoint own
   leaves, the pendant-path lemma, then the direct injection. The same is true of the two further versions in
   `C-T2-F` and `C-T1-F`.
2. **Repair (mechanism wording).** The brief says "by the surplus identity every branch vertex in this class has
   ≥ `deg − 2` own pendant leaves". The input is the **per-vertex count `p(v) = deg v − b(v)`**, which follows from
   acyclicity (F1).
   - The global surplus identity `Σ_{Br}(2 − b) = 2` is true and census-checked, but BTP does not use it.
   - `C-T2-U`'s sentence "Its inputs are Lemma PP and the r27 reformulation's slot count, the latter only through
     Direction 1, which does not need it" should be struck. The slot count is not an input.
3. **Repair (definition).** The branch tree is defined exactly above, including the cases `Br = ∅` (empty graph,
   `T = P_n`) and `|Br| = 1` (`K_1`, spiders).
   - The brief's phrase "suppressing degree-2 vertices" is replaced by the path criterion, which is unambiguous.
   - The class is stated by the vertex condition `b(v) ≤ 2 ∀ v ∈ Br`, which holds vacuously when `Br = ∅`.
   - "Branch tree is a path" is kept only as an equivalent for `Br ≠ ∅`. So are "branch vertices collinear" and
     "every branch vertex has ≥ `deg v − 2` pendant paths". All were census-checked with 0 mismatches to order 18.
4. **Hypothesis and ℕ-subtraction audit.**
   - `deg v − 2` is guarded by `deg v ≥ 3`.
   - `p = deg − b` has `b ≤ deg`.
   - `p ≥ deg − 2` is a genuine inequality in ℕ.
   - The surplus `2 − b(v)` must be in ℤ, because `b` can exceed 2.
   - `c_v(k) = i_{k−1}(T − N[v])` **needs `k ≥ 1`**: under ℕ-truncation at `k = 0` it would read `i_0 = 1 ≠ 0`. Use
     the polynomial form `C_v = x·I(T − N[v])` or treat `k = 0` separately.
   - The indices `q_{m−2}` and `q_{m−3}` are integers with `q_{−1} = q_0 = 1`. ℕ-truncation happens to be harmless
     because both conventions give 1, but a formalizer should split `m = 1`, `m = 2` and `m ≥ 3` explicitly.
   - BTP needs neither `n ≥ 2` nor `k ≥ 1` nor `t ≥ 1`. It holds at `t = 0`.
5. **Repair (key).** The proposed `E993-R28-DOMINANCE-ON-PATHLIKE-BRANCH-TREES` is not a faithful predicate, for three
   reasons:
   - It says the dominance holds *on branch trees*, but it holds on the trees `T`.
   - "DOMINANCE" is overloaded in r28: pendant-path *leaf* dominance is a different, true lemma (SR-HS-REF finding 7).
   - "PATHLIKE" is undefined.

   `C-T2-U`'s `…-HS-BRANCH-TREE-MAX-DEGREE-2` reads as "maximum degree exactly 2", which is narrower than the
   theorem. The replacement is `E993-R28-LEAF-SLOT-DOMINANCE-BRANCH-TREE-MAX-DEGREE-LE-2`. It names (HS) as leaf/slot
   dominance, and the theorem satisfies it.
   - Alias check over the 392 run-local keys found no key containing `R28`, `LEAF-SLOT`, `SLOT`, `BRANCH-TREE`,
     `PATHLIKE` or `COLLINEAR`. There are no text hits for "branch tree" or "leaf/slot".
   - The nearest keys are `E993-R25-CATALAN-DOMINANCE-RANK-R-MINUS-2`, `E993-PAIR-CATERPILLAR-TRANSFER` and
     `E993-PAIR-SPIDER-CLOSED-FORM`. All three are independence-polynomial facts with no slots, no leaves-against-slots
     comparison and no injection. There is no collision.
6. **Attribution repair.**
   - BTP is due to `C-T2-U`, `C-F2-U` and `C-F2-T` independently. It is also stated in substance by `C-T2-F` F2 and
     `C-T1-F` F2, which are capsule members. The face should name all five critics, with `C-T2-U` first as the brief
     orders.
   - Hall's theorem is **not** used by BTP. It governs only the (HS)⇔(HS-SDR) equivalence, which BTP bypasses.
7. **`BT-2` is confirmed, with sharpening.**
   - Sharpness holds for every branch-degree bound `D ≥ 3`, through `R(D,2)` with branch tree `K_{1,D}`, not only for
     `D = 3`.
   - The residue counts are replayed and extended to order 18. Minimality with uniqueness is re-proved.
   - The phrase "(HS) holds on all of them to order 21" rests on SR-HS-REF's census of record for orders 19–21. My
     instrument reaches order 18.
   - All five casualties the brief names fall, as do two further ones (fractional SDR; SDR into leaves together with
     degree-2 vertices).
   - The open face is sharpened by the strict-maximum observation: a surviving strengthening must relax the pairwise
     comparison.
   - A multiplicative relaxation `c_ℓ ≥ c_v/λ` (`λ > 1`) is **untested**. On the witness the needed ratios are
     `18/17` (`k = 12`) and `141/136` (`k = 11`).
8. **Observation (not for registration without its own read).** (HS) holds at `k ∈ {0, 1, 2}` on every finite tree
   with `n ≥ 2`, for three reasons:
   - at `k = 0` every `c` is 0;
   - at `k = 1` every `c` is 1, and the slot count gives `|L| − 2 ≤ |L|`;
   - at `k = 2`, `c_v(2) = n − 1 − deg v`, so every leaf (`n − 2`) dominates every branch vertex (`≤ n − 4`)
     pointwise.

   This is elementary and gives no universal statement at `k ≥ 3`.
9. **`BT-3` is correct, with repairs.**
   - The slot count does not enter.
   - The r27 reformulation is replaced, inside the kernel-checked (LC), by a graph-general inequality.
   - The (LC) hypothesis `∀ t : ℕ` is met at `t = 0` by BTP itself.
   - The composition must be registered as a **scope note on `E993-R27-FOREST-DEGREE-LEMMA`**, never as a key.
     `SOLUTION-CONTRACT.md` §3.2 says (DL) is never re-registered and a second proof is a scope note.
   - The class is proper: it excludes H10 and `R(3,2)_3`.
10. **Fences.**
    - Nothing here transfers status to `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE,
      TRANSFER, `E993-BETA-AGG`, the aggregate `S(T,p)`, `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` or Erdős #993.
    - (DL) is neither re-registered nor edited. (PW) is no premise. REFUTED statements stay refuted.
    - No census receives a proof grade.

## Registration text

**R1 — new key `E993-R28-LEAF-SLOT-DOMINANCE-BRANCH-TREE-MAX-DEGREE-LE-2`** (grade `proved_informal`; register verbatim)

> *Statement (Theorem BTP).* Let `T` be a finite tree, `L = {v : deg v = 1}`, `Br = {v : deg v ≥ 3}`, and `c_v(k)`
> the number of independent `k`-sets of `T` containing `v`. For `v ∈ Br` and a neighbour `u`, the *direction* `(v,u)`
> is the walk `v, u, …` that continues through vertices of degree 2 and stops at the first vertex of degree ≠ 2. That
> vertex is either a leaf (a *pendant direction*, whose end is an *own leaf* of `v`) or a branch vertex. The *branch
> tree* `B(T)` has vertex set `Br`, with `v ~ w` iff `v ≠ w` and every interior vertex of the `T`-path from `v` to `w`
> has degree 2. `B(T)` is empty if `Br = ∅` and is `K_1` if `|Br| = 1`. Let `b(v) := deg_{B(T)}(v)`. **If
> `b(v) ≤ 2` for every `v ∈ Br`**, then for every `k ∈ ℕ` there is an injection `φ` from the slots
> `{(v,j) : v ∈ Br, 1 ≤ j ≤ deg v − 2}` into `L` with `c_{φ(v,j)}(k) ≥ c_v(k)`. Explicitly, `φ` sends the slots of
> `v` to distinct own leaves of `v`. Hence for every `t ∈ ℕ`,
> `Σ_{v∈Br : c_v(k) ≥ t} (deg v − 2) ≤ #{ℓ ∈ L : c_ℓ(k) ≥ t}`. So the leaf/slot dominance condition (HS), in both
> its threshold and matching forms, holds on this class at every `k` and every `t`, including `t = 0`.
>
> *The class.* For `Br ≠ ∅`, the following are equivalent: every branch vertex has at least `deg v − 2` pendant
> directions; `B(T)` is a path; all branch vertices lie on one path of `T`. The class contains every path (`Br = ∅`),
> every star `K_{1,m}` with `m ≥ 3`, every spider, broom and double broom, every caterpillar, and every tree with at
> most three branch vertices. It excludes exactly the trees with a branch vertex of branch-tree degree ≥ 3. The
> smallest such tree is H10 (order 10, unique).
>
> *Proof.*
> - (a) By acyclicity, each direction's walk terminates at a vertex other than `v`, and distinct directions have
>   distinct ends. So `b(v)` is the number of directions ending at a branch vertex, and the number of pendant
>   directions is `p(v) = deg v − b(v)`.
> - (b) The walk inward from a leaf through degree-2 vertices is forced. So each own leaf has a unique anchor, and
>   own-leaf sets of distinct branch vertices are disjoint.
> - (c) *Pendant-path lemma, anchor case* (any finite simple graph). For a path `v = u_0 – u_1 – … – u_m = ℓ` with
>   `m ≥ 1`, `deg u_i = 2` for `0 < i < m` and `deg ℓ = 1`, put `F = G − {u_1..u_m}`, `A = F − v`,
>   `B = F − N_F[v]`, `q_j = I(P_j)`, `q_{−1} = q_0 = 1`. Then
>   `Σ_k (c_ℓ(k) − c_v(k)) x^k = x·(I(A) − I(B))·q_{m−2}`, which has nonnegative coefficients because `B` is an induced
>   subgraph of `A`. So `c_ℓ(k) ≥ c_v(k)` for every `k`.
> - (d) `b(v) ≤ 2` gives `p(v) ≥ deg v − 2`. The own-leaf assignment is injective by (a)–(b) and dominant by (c).
> - (e) `φ` maps the slots with `c_v(k) ≥ t` injectively into the leaves with `c_ℓ(k) ≥ t`. ∎
>
> *Hypotheses used.* Finiteness and acyclicity only. Not used: connectivity (it is used only by the equivalent forms
> of the class), `n ≥ 2`, `k ≥ 1`, `t ≥ 1`, the slot count `Σ_{Br}(deg v − 2) = |L| − 2`, the global surplus identity
> `Σ_{Br}(2 − b(v)) = 2`, Hall's theorem, (PW), and (DL).
>
> *Grade.* `proved_informal`. The census replay is a `bounded_computation` record, not a grade. It was run by SR-BTP
> with its own instrument over every class tree of order ≤ 18: 155,290 trees with `Br ≠ ∅` plus 18 paths, `k = 0..n+1`,
> every class of `t` including `t = 0`. The own-leaf SDR was valid and the threshold form held on all 2,991,832 `(T,k)`
> instances, and the anchor case of the pendant-path lemma held on all 33,425,334 checks.
>
> *Attribution.*
> - Theorem BTP: r28 critics `C-T2-U` (Finding 2), `C-F2-U` (F-2) and `C-F2-T` (Finding 2), found independently. It
>   is also stated in substance by `C-T2-F` (F2) and `C-T1-F` (F2).
> - Pendant-path lemma: `C-T2-U` (Lemma PP), `C-F2-T` (Finding 1), `C-F2-U` (F-1), `C-T2-F` (F1, PPD) and `C-T1-F`
>   (F1). Its `m = 1` case is `E993-PAIR-R-LE-G-POINTWISE`(i).
> - The condition (HS)/(HS-SDR) and the leaf/branch reformulation: r27 `C-T2-U`.
> - Second read: SR-BTP.
>
> *Fences.*
> - (HS) is REFUTED as a universal statement over finite trees (`E993-R28-DOMINANCE-REFUTATION`, witness
>   `R(3,2)_3`). This key is a class theorem, not a proof of (HS), and does not reopen it.
> - The pendant-path lemma is a separate object, registered under its own read.
> - No status transfers (`SOLUTION-CONTRACT.md` §3.1). (DL) `E993-R27-FOREST-DEGREE-LEMMA` is untouched.
> - (PW) is not a premise: each comparison is between a vertex and a leaf of its own pendant path.

**R2 — scope note on `E993-R28-LEAF-SLOT-DOMINANCE-BRANCH-TREE-MAX-DEGREE-LE-2`: sharpness and the residue class**
(one canonical record; register verbatim)

> *Sharpness.* The class bound `b ≤ 2` cannot be raised to any finite `D ≥ 3`. For every `d ≥ 3` and `m ≥ 2`, the
> tree `R(d,m)` of `E993-R28-DOMINANCE-REFUTATION` has branch tree `K_{1,d}` and violates (HS) at `k = 2dm`,
> `t = 3dm`. The witness of record, `R(3,2)_3` (order 22), has branch tree `K_{1,3}`. `R(4,2)` (order 29) and
> `R(5,2)` (order 36) fail at `(k,t) = (16,24)` and `(20,30)`. Sharpness is existential: the smallest tree outside
> the class, H10, satisfies (HS) at every `k`.
>
> *The residue class* is the set of trees with a branch vertex of branch-tree degree ≥ 3. Its smallest member is at
> order 10 and is unique: H10, a centre joined to three degree-3 vertices, each carrying two leaves. This is
> `proved_informal`: `n ≥ 1 + 3·3`, with equality forcing H10. Counts at orders 10–18 are 1, 4, 19, 77, 287, 1,002,
> 3,365, 10,853 and 34,088 (`bounded_computation`). Orders 10–15 agree with `C-F2-T`; orders 10–16 with `C-T2-U` and
> `C-T2-F`; order 17 with `C-F2-U`'s complement count; order 18 rests on SR-BTP alone. By Theorem BTP, every
> counterexample to (HS) lies in this class.
>
> *True on the residue.* No universal (HS)-type statement holds there. What holds on every finite tree, residue
> included:
> - the pendant-path lemma;
> - the own-leaf assignment for every branch vertex with `b ≤ 2`, and for `p(v) = deg v − b(v)` of the `deg v − 2`
>   slots of each vertex with `b ≥ 3`;
> - (HS) at `t = 0`, by the r27 slot count for `n ≥ 2`;
> - the summed form, which is (DL) (`E993-R27-FOREST-DEGREE-LEMMA`, formally verified).
>
> (HS) holds on every residue tree of order ≤ 21. This is `bounded_computation`: the census of every free tree to
> order 21 by `C-F1-T` and SR-HS-REF, and SR-BTP's residue replay to order 18 (49,696 trees; 971,648 instances). It
> fails at order 22 at exactly one class, `R(3,2)_3`. That uniqueness rests on one instrument.
>
> *False: every sufficient condition proposed in Cycle 1 falls to `R(3,2)_3`* at `k = 12` (`c_0 = 18`, every leaf
> `17`) and at `k = 11` (`c_0 = 141`, every leaf `136`):
> - the local-first residual LFR (`C-T2-F`), which is the reduction R-SDR (`C-T1-F`): max matching 0 of 1;
> - the residual-Hall strengthening (`C-F2-U` F-3): threshold failure at `t = 18` and `t = 137..141`;
> - the Rooted Export Conjecture (`C-T2-U` F4): max matching 3 of 4 for every root in `Br`;
> - the rooted-subtree rule (`C-T1-F` F3): 3 of 4 for every leaf root;
> - "(HS) for connected graphs with `|E| ≤ n`" (`C-F2-T` F7): `R(3,2)_3` is such a graph;
> - the fractional SDR with unit leaf capacities, which is equivalent to (HS) by integrality: optimum 3 < 4;
> - an SDR into leaves together with degree-2 vertices: 3 of 4.
>
> *Open.* The weakest matching-type strengthening of (DL) that holds on all finite trees, if any. The witness forces
> a constraint on it. At both failing `k`, `c_0` is the strict maximum of `c` over all 22 vertices. So no slot-to-vertex
> injection into non-branch vertices that respects `c_target ≥ c_source` exists, and a surviving form must relax the
> pairwise comparison itself. One such relaxation, the multiplicative form `c_ℓ ≥ c_v/λ` with `λ > 1`, is untested;
> the witness needs `λ ≥ 18/17` at `k = 12` and `λ ≥ 141/136` at `k = 11`. The full mass relaxation is (DL) itself.
>
> *Attribution.*
> - Witness and family: `C-F1-T`, second-read by SR-HS-REF.
> - Residue minimality: `C-T2-U` F3 and `C-T2-F` F2.
> - Residue counts: `C-F2-T`, `C-T2-U` and `C-T2-F`.
> - Each casualty's proposer, as named above.
> - Sharpness for every `d`, the casualty tests and the strict-maximum constraint: SR-BTP.
>
> *Fences.* §3.1 applies. REFUTED never regresses. No census is a grade.

**R2′ — pointer on `E993-R28-DOMINANCE-REFUTATION`** (a scope-note record; register verbatim)

> r28 note: the casualties of the witness `R(3,2)_3` are recorded once, in the R2 scope note on
> `E993-R28-LEAF-SLOT-DOMINANCE-BRANCH-TREE-MAX-DEGREE-LE-2`. Besides the Rooted Export Conjecture and the `|E| ≤ n`
> conjecture already named here, they are LFR/R-SDR, residual-Hall, the rooted-subtree rule, the fractional SDR, and
> an SDR into leaves together with degree-2 vertices. This key's status does not change.

**R3 — scope note on `E993-R27-FOREST-DEGREE-LEMMA`** (a scope-note record; the key's face is not edited; register verbatim)

> r28 note: a second, matching-type mechanism on a proper subclass, with no status change.
>
> For every finite tree `T` whose branch tree has maximum degree ≤ 2
> (`E993-R28-LEAF-SLOT-DOMINANCE-BRANCH-TREE-MAX-DEGREE-LE-2`) and every `k ∈ ℕ`, `D_k(T) ≤ 2k·i_k(T)`.
>
> *Composition.* The theorem named above supplies `slotsAtLeast T k t ≤ leavesAtLeast T k t` for every `t ∈ ℕ`.
> `Erdos993G1.dominance_implies_degree_lemma`, the (LC) reduction `E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA`, is
> kernel-checked in U1's source (`74ab2108…d628e5`) and re-checked by SR-BTP with the pinned toolchain; its axioms are
> `propext`, `Classical.choice` and `Quot.sound`. Applying it with `hT` the tree hypothesis gives the conclusion.
> Inside (LC):
> - the layer-cake identities range over `t = 1..i_k`, so `t = 0` is not consumed;
> - the double counts are `Σ_v c_v(k) = k·i_k` and `Σ_v deg(v)·c_v(k) = D_k`;
> - the graph-general inequality `2k·i_k − D_k = Σ_v (2 − deg v)·c_v(k) ≥ Σ_L c − Σ_{Br}(deg − 2)c` holds because the
>   degree-0 and degree-2 terms are nonnegative.
>
> That inequality replaces the r27 leaf/branch reformulation. An informal proof may use the reformulation instead
> (`E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`, for `n ≥ 2`; `n = 1` is trivial). The slot count `|L| − 2`
> enters nowhere.
>
> *Grade.* `proved_informal`, set by the weakest input, Theorem BTP.
>
> *Scope.* (DL) on all finite forests remains proved only by r27's injection (this key, `formally_verified`). The
> composition adds a second mechanism on a proper subclass; H10 and `R(3,2)_3` lie outside it. It transfers no status,
> is not a second key for (DL), and does not edit this key's face.
>
> *Attribution.*
> - (DL): Fang–Lu–Nevo–Yao–Zheng 2026 §8, formally verified in r27.
> - (LC) and its Lean proof: r28 U1.
> - Theorem BTP: r28 `C-T2-U`, `C-F2-U` and `C-F2-T`.
> - The condition and the reformulation: r27 `C-T2-U`.
> - Composition and second read: SR-BTP.

## Verdicts

verdict[BT-1]: confirmed_with_repairs
verdict[BT-2]: confirmed_with_repairs
verdict[BT-3]: confirmed_with_repairs

- **`BT-1` repairs:**
  - the branch tree is defined exactly, including `|Br| ≤ 1`;
  - the mechanism rests on the per-vertex count `p = deg − b`, not the surplus identity;
  - the non-inputs are named (slot count, connectivity, Hall, `n ≥ 2`, `k ≥ 1`, `t ≥ 1`);
  - the ℕ-guards are stated (`k ≥ 1` for `i_{k−1}`; `2 − b` in ℤ);
  - the key is renamed to `E993-R28-LEAF-SLOT-DOMINANCE-BRANCH-TREE-MAX-DEGREE-LE-2`;
  - attribution is extended to `C-T2-F` and `C-T1-F`.
- **`BT-2` repairs:**
  - sharpness holds for every `D ≥ 3`, and is existential only;
  - the residue counts are extended to order 18;
  - the order-19–21 support is attributed to SR-HS-REF's census of record;
  - the casualties are verified and two are added;
  - the open face is sharpened by the strict-maximum constraint;
  - the face is registered as scope notes, not as a new key.
- **`BT-3` repairs:**
  - the slot count does not enter;
  - the reformulation is replaced inside the kernel-checked (LC);
  - the `t = 0` row is supplied by BTP;
  - registration is a scope note on `E993-R27-FOREST-DEGREE-LEMMA`, never a key.

## Artifact inventory

All paths are under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-degree-lemma-hall-sdr-dre-2026-09-24/scratchpad/c1-sr-SR-BTP/`.
Everything uses the standard library and ran in the foreground.

| File | Role | SHA-256 |
|---|---|---|
| `seal.py` / `seal.out` | capsule seal and 66-member digest check | `b8e4c053ef2cb01720bca00d75eb51785114e088899fda9c4fc6699018e75712` / `3260eecf89cccf2e317878bd7a2a8c3b641a4feee22a7ef984e50d894ee339a7` |
| `members.txt` | the explicit member list used after the glob incident | `88a65f2bedfc69eca273f4858bd0cb8e6ed78c7aec38c9d8d607604ab548aaf5` |
| `btp_lib.py` | instrument: WROM generator, tree test, canonical form, forest-DP occupancy, brute force, direction walks | `ea3513a46096a66c371adb5ee98fccf1aa0739a29845dbd441680ba3736311ff` |
| `validate.py` / `validate_gen.out` | A000055 1–17 and non-isomorphism ≤ 16 | `3dd123611b2299b00097e51e1424d60f2bba59c358f6ac9f046547f532e8cb19` / `cbf5d03ebe6f45fa7ea823e121142fe4c81fbd24d45c114792779c9d4352c569` |
| `distinct_17_18.out` | non-isomorphism at orders 17 and 18 (inline script) | `1c79f1b1c4db0311913d38fd50c6f64aa00c42ff26da88726f102fae8298d2fb` |
| `btp_census.py` | BT-1 replay, structure checks, residue census | `7c4b536f67960cc25e1ec43020011ca6cc98a4fff425c8b5d680aa0d89a41d6a` |
| `btp_census_14.out` / `btp_census_14.json` | orders 1–14 (canonical digest = file digest) | `dcfd64b62be84f2f4d319a68d560c222a3be467c6b6491182554653a9a6dfea5` / `c61de4130f2ae8a32e94e8589f6d8914d1450a83d46b04a42fedb6c6718e008b` |
| `btp_census_18.out` / `btp_census_18.json` | orders 1–18, 161.4 s (the `.out` holds the last six lines) | `36c6938c784be0a10985c38edbe92b6cb4e832d207bf58261c5e70854b067625` / `77c15491a2c5f656a85009a5e84064cd9f81af7cdf16fb223b8ee02696eb76fc` |
| `residue_witness.py` / `.out` / `.json` | `R(3,2)_3`, `R(4,2)`, `R(5,2)`, H10, and all casualty tests | `8df5011129b737a5b5a870a40d560953207fee6b57e19584bbafbad8c0f4dd5c` / `55d67fb81de910a0ed1eba9339867d93d9250177e2ad8175f2a8e2ebbf594186` / `7ac7d19f7eb053b996696c5365cc0b5b09ca9284345d855ef90267245c808da9` |
| `pp_identity.py` / `pp_identity.out` | pendant-path identity on 1,500 random general graphs | `2502d3289568e70c1ff37e1091d065e165b6adf94a17d9045dfe5f0578b92d16` / `9142cb3b0fa4b95fc530c75a5faf724f71f8bd492147c316d4f3cf44e7e387b6` |
| `lean/U1Main.lean` / `lean/lean_check.out` | copy of U1's `Main.lean` (member digest `74ab2108…d628e5` before three appended `#check`/`#print axioms` lines) and the kernel-check output | `42a5a776604f99df8b313b035f27ffa1847f426f961adb50620434d6ba09d956` / `41e6d848f02975f3d60d43fa3412b7a8e502c1d17017f0aae2155b4837a0a2cb` |

- No sealed member was edited.
- The only files written are this `SECOND-READ.md` and the scratch directory above.
- No process of mine is running.
- I reread this file before close.
