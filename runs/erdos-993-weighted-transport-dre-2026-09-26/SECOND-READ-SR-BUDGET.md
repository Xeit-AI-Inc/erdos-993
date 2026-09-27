# Second Read

Isolated second read `SR-BUDGET`, r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`), Cycle 1. Object: the scalar
budget hierarchy (P14, P17), the chain among OPEN keys (P15), the deg-2 collapse and the `T_22` obstruction, two
`CLAIM-DISTINCTIONS` rows, and the `Q_j` lead (B-g). Date 2026-09-26.

**Boot.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The subsystem loaded is `experiments/`, limited to this read's
sealed capsule. The harness injected the root `CLAUDE.md` and the user auto-memory index into context at session start. I did
not open either as a source, and nothing below relies on them. Under the binding protocol ("write exactly one file") I wrote no
conversation log. The controller holds that duty for the run.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Capsule** `control/c1-second-read/SR-BUDGET-PACKET-MANIFEST.json` (stage `cycle-1-second-read-SR-BUDGET`). I recomputed
  SHA-256 over the canonical JSON without `seal_sha256` (`sort_keys`, separators `(",", ":")`, no trailing newline). Result:
  **`f3fe58dce46981996b6184d7ed10133b6058be0642f2992282dc0a0d1860a4ae`**. This equals the recorded seal and has the
  dispatched prefix `f3fe58dce4698199`.
- **Members.** All 17 of 17 listed members match their SHA-256 and byte counts, with 0 mismatches (`seal_check.out`). They
  include `SEMANTIC-CONTRACT.md` `ee7ca2e2…`, `SOLUTION-CONTRACT.md` `3168e7a1…`, the protocol `1f7ef6b1…`, this brief
  `9b7e50f2…`, `SYNTHESIS.md` `339a208e…`, the T2 return `f6a0dec8…`, C-T2-F `06f75b0e…`, C-T2-U `91d1d496…`, the T
  adjudication `44f0fe81…`, the F2 return `cd0976be…`, C-F2-T `5e4c2a0c…`, the registry `sources/authority/CLAIM-IDENTITY.json`
  `eba20be3…` (434 claims) and the run-local registry `86f94811…` (435 claims).
- **Registry consistency.** The nine keys I read (the eight named in the brief plus the (HALL) key) are byte-equal as JSON
  objects in the master and run-local registries. The run-local registry adds exactly one key,
  `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`.
- **Read boundary.** I read only the capsule members and the two boot files. There were no Mathlib or Lean reads, no network
  and no installs. I ran `grep` only on three capsule members (F2 return, C-F2-T, the T adjudication), plus one Python
  regex scan of the capsule registry for an `α(H_v)` alias. I ran no `find`, and one non-recursive `ls` of my own scratch
  directory. The harness saved two over-long outputs of my own `cat` of capsule members
  (the synthesis and the T2 return) to its tool-results folder, and I read those copies back. Their content is the capsule
  bytes. No background job was started.
- **Evidence discipline.** I cite no controller fact (`C1-STAGE6-CONTROLLER-FACTS.json`) and no frozen census as evidence.
  Seat and critic numbers are cited only where I recomputed them.

## Statements read

Registered statements, read verbatim from `sources/authority/CLAIM-IDENTITY.json`:

- `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN): "…the complete sum over original leaves v with
  Delta_p(T-v)<0 of Delta_(p-1)(T-{v,s_v})-Delta_(p-1)(T-N_T[s_v]) is nonpositive." It applies for `x(T)+2<=p`, `3p<2a+1`.
- `E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY` (VERIFIED, `proved_informal_adjudicated_no_formal_award`): "For every
  finite bipartite graph H, vertex subset W, integer h>=alpha(H), and 1<=k<=h, … D=sum_A(2(h-k)-e(A)), and C count independent
  (k+1)-sets meeting W in at least two vertices once each. Then k*q_(k+1)+C=2(h-k)*q_k-D, with D,C>=0."
- `E993-LOWER-REGION-EARLY-MARKED-OCCUPANCY-TRANSFER` (`CT_x`, OPEN): "… Then i_x(T)*E <= (x+1)*i_(x+1)(T)*Q."
- `E993-LOWER-REGION-FLAT-ADDABILITY-BUDGET` (OPEN): "… Then E<=(x+1)*Q." Its scope line reads: "Weaker sufficient budget
  than CT_x; stronger than the current-rank budget when p>x+2."
- `E993-LOWER-REGION-CURRENT-RANK-ADDABILITY-BUDGET` (OPEN): "… Then E<=(p-1)*Q." Its scope line reads: "Sufficient scalar
  addability budget with C omitted; … stronger than primary E-C<=(p-1)Q. Failure alone is not primary refutation."
- In all three OPEN statements, `k=p-1`, `F` is the original strict selector, `Q=sum_F q_v(k)`, and
  `E=sum_F sum_{A independent k-set of H_v meeting W_v} #{vertices of H_v addable to A}`.
- `E993-ORDINARY-DEG2-SIBLING-G1-COEFFICIENT-IDENTIFICATION` (VERIFIED): "For every finite ordinary tree T, original leaf v whose
  support s has degree two with other neighbor g, and every integer p, define A=T-{v,s}, H=A-g, U=A-N_A[g]=T-(N_T[v] union
  N_T[g]). Then I(T-v)=I(A)+z*I(H), I(A)=I(H)+z*I(U), a_v(T,p)=Delta_p(T-v)=Delta_p(A)+Delta_(p-1)(H)=Gamma, and
  b_v(T,p)-B_s(T,p)=Delta_(p-1)(A)-Delta_(p-1)(H)=Delta_(p-2)(U)." Its scope includes "B_s(T,p)=Delta_(p-1)(T-N_T[s])".
- `E993-R23-LITERAL-DELETE-ONLY-HALL` (REFUTED): "For every finite ordinary tree T, natural p>=x(T)+2 under the r23 literal
  contract, and every X subset of the complete tagged top side P, |X|<=|Gamma_Delete(X)|." Its certificate cites the witness
  key `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL` with `witness_order: 91`. That key's certificate reads "r23 Cycle 1 exact
  T22 witness at p=34: all 67 original leaves are favorable…".
- `E993-R28-TREE-LEAF-SLOT-DOMINANCE` (REFUTED): (HS). Its scope reads "witness T22, k = 12, t = 18", with
  `smallest_witness_order: 22`. The companion `E993-R28-DOMINANCE-REFUTATION` names the witness "the order-22 tree R(3,2)_3 =
  T22 (a root joined to three hubs, each hub carrying two pendant paths of three edges; 22 vertices, 21 edges…)".
- For context, `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN). Its scope reads: "A sufficient mechanism for the
  lower-region aggregate, not equivalent to its scalar assertion. Distinct from the refuted literal Delete/Retag and
  deletion-only mechanisms because their clone compatibility and edge sets differ." It also says "all clone pairs over each
  allowed set pair are permitted".
- `E993-ORDINARY-TM-LOWER-REGION-AGGREGATE` (VERIFIED, `computer_assisted`) defines `T_m`: path `0-1-2` plus `m` claws at `0`.

Statements under review (the synthesis, verbatim in substance):
- P14 (SR-16);
- P17 (SR-16);
- P15 (SR-17);
- registration 11b and T2 Step 4 (SR-18);
- registrations 11a and 11c, plus correction 7 (SR-19);
- B-g (SR-20).

## Independent re-derivation

**Instrument.** `scratchpad/c1-sr-SR-BUDGET/srb_lib.py` and `srb_check.py`. I wrote both from SEMANTIC-CONTRACT §1 with
erratum R30-E-b applied (active iff `B ∩ W_v ≠ ∅`). They use the standard library and exact integers only; no seat code was
opened or run. Components:
- a tree test with the edge count, BFS connectivity and union-find acyclicity checked separately;
- an iterative forest DP for `I(T − D)`;
- `x` computed through rank `α`, including `Δ_α = −i_α`;
- `F_p` from `Δ_p(T − v) < 0` on the original tree;
- `S` computed literally as `C5LA1.aggregate`;
- `q_v(j) = i_j(H_v) − i_j(R_v)`;
- free trees generated by leaf extension and deduplicated by a centre-rooted AHU string (A000055 reproduced for orders 1–14).

Run: `python3 -B srb_check.py 14` (foreground, 171 s). Asserted on every eligible row:
- nonempty eligibility and `F ≠ ∅`;
- `α(H_v) = α − 1` for every leaf;
- `S = Q_p − Q_{p−1}`;
- `supply − capacity = S` by brute-force enumeration of `I_{p+1}`, `I_p` with the literal `w_F` (orders ≤ 13 and three fixed
  points);
- by direct enumeration of every marked `k`-set `A` and its `e_v(A)`:
  - `Q`, `U`;
  - the double count `E = kU + C`;
  - `d_v(A) ≥ 0` pointwise;
  - the P14 identity;
  - the three-way equivalence;
  - the chain and the equivalence `CURRENT-RANK ⟺ kS ≤ −C ⟺ D ≥ (2α+1−3p)Q_{p−1}`.

### SR-16 (P14 and P17)

1. **`S = Q_p − Q_{p−1}` by definition.**
   - The summand is `Δ_{p−1}(T − H_v) − Δ_{p−1}(T − R_v) = [i_p(H_v) − i_{p−1}(H_v)] − [i_p(R_v) − i_{p−1}(R_v)]`, which
     equals `q_v(p) − q_v(p−1)`.
   - Here `R_v = H_v − W_v`, so `q_v(j)` counts the independent `j`-sets of `H_v` meeting `W_v`.
   - **Where `F` fixed at `p` enters:** `S` sums over `F_p(T)`. `Q_{p−1}` and `Q_p` must both be summed over that same set. With
     `F_{p−1}` in `Q_{p−1}`, the equality fails in general.
   - **Favorability itself is never used.** The identity and the equivalences hold for any one fixed set of original leaves
     used at both ranks.
2. **DCB instantiation per tag.**
   - Take `H = H_v`, a forest and hence bipartite, with `W = W_v`, `h = α − 1` and `k = p − 1`.
   - **Hypotheses and where they enter:**
     - `h ≥ α(H_v)` holds because `J ∪ {v}` is independent for every independent `J ⊆ V(H_v)`, since `N(v) = {s_v}`. Only this
       trivial half of `α(H_v) = α − 1` is load-bearing for the identity and for `D ≥ 0`. The equality is true (proof below) and
       is used only for the König form.
     - `1 ≤ k`: eligibility gives `p ≥ x + 2`, and `x ≥ 1` on a tree with an edge (`Δ_0 = n − 1 > 0`), so `k ≥ 2`. `k ≥ 1`
       suffices.
     - `k ≤ h`: `3p < 2α + 1` gives `p ≤ α`.
   - **ℕ-subtractions:**
     - `p − 1` is guarded by `p ≥ 2`;
     - `α − 1` is guarded by `α ≥ 1`;
     - `h − k = α − p ≥ 0` holds by the previous item;
     - `2α + 1 − 3p > 0` is the lower-region hypothesis itself, though the identity only needs it in ℤ.
3. **Summation.**
   - From `k·q_v(k+1) + C_v = 2(h − k)q_v(k) − D_v` summed over `F`: `kU + C = 2(α − 1 − k)Q − D`.
   - Subtracting `kQ` gives `kS = (2α − 2 − 3k)Q − D − C`, which is `(2α + 1 − 3p)Q − D − C`.
   - Hence **`D + C − (2α+1−3p)Q_{p−1} = −(p−1)S`**.
   - Since `p − 1 > 0`: budget ⟺ `−kS ≥ 0` ⟺ `S ≤ 0` ⟺ `Q_p ≤ Q_{p−1}`, instance by instance.
   - The grade is `proved_informal`, the weakest input being DCB at `proved_informal`.
4. **P17 re-proofs, checked.**
   - **`α(H_v) = α(T) − 1`** for every original leaf, in any finite graph (degree one suffices). If a maximum set `I` omits
     `v`, then `s_v ∈ I` by maximality, and `I − s_v + v` is maximum. Then `I ∖ {v}` is independent in `H_v = T − N[v]`, which
     gives `≥`. The converse is as in item 2.
   - **`D ≥ 0`.** `H' = H_v − N[A]` is bipartite with `α(H') ≤ h − k`, since `A ∪ J` is independent. So
     `e_v(A) = |V(H')| ≤ 2α(H') ≤ 2(h − k)`.
   - **König form** (C-T2-F). With `h = α(H_v) = n_v − ν_v`: `d_v(A) = (n_v − 2ν_v) + |N_{H_v}(A)| − k`. I checked the algebra
     using `|N[A]| = k + |N(A)|`.
   - **Indicator identity.** From `Σ_s(−1)^s C(m,s) = [m=0]` and `Σ_s(−1)^s s C(m,s) = −[m=1]`, removing the `s = 0` and
     `s = 1` terms gives `Σ_{s=2}^m (−1)^s(s−1)C(m,s) = [m ≥ 2]`. This holds for all `m` unconditionally, and I also checked it
     exactly for `m < 300`.
   - **Independence of `W_v`** is a hypothesis of the *counting formula* `#{A ⊇ X} = i_{r−|X|}(H_v ∖ N[X])`, not of the
     identity. It holds in a tree, which has no triangle through `s_v`.
5. **Numbers.** All 515 eligible rows of orders 11–14 (5/34/163/313) pass every assertion, and the minimum pointwise deficit
   is ≥ 1. Fixed points, each recomputed with direct `D`/`C`:

   | row | `n` | `α` | `x` | `p` | `\|F\|` | supply | capacity | `S` | `Q_{p−1}` | `Q_p` | `D` | `C` |
   |---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
   | `K_{1,12}` | 13 | 12 | 6 | 8 | 12 | 1980 | 3960 | −1980 | 3960 | 1980 | 15840 | 1980 |
   | double broom | 11 | 9 | 4 | 6 | 9 | 255 | 516 | −261 | 516 | 255 | 1602 | 219 |
   | path-star (2,3,4) | 15 | 11 | 5 | 7 | 10 | 1483 | 2701 | −1218 | 2701 | 1483 | 11608 | 1102 |
   | path-star (2,2,4,3) | 18 | 13 | 6 | 8 | 12 | — | — | −5434 | 13467 | 8033 | 73216 | 5223 |
   | `CB(1,7)` | 24 | 15 | 8 | 10 | 8 | — | — | −28812 | 58002 | 29190 | 317310 | 0 |

### SR-17 (P15)

1. **Double count (DCB content).** A marked `(k+1)`-set with exactly one mark has `k` marked lower covers; one with at least
   two marks has `k + 1`. So `E = kU + C`, with `U = Q_p` and `Q = Q_{p−1}`. I checked this by direct enumeration on all 515
   rows.
2. **CURRENT-RANK ⟺ `kS ≤ −C`.** `E ≤ kQ` ⟺ `kU + C ≤ kQ` ⟺ `kS ≤ −C`.
   - Combined with P14 this is also **⟺ `D ≥ (2α+1−3p)Q_{p−1}`**: the budget with `C` dropped, exactly as the key's scope line
     says ("budget with C omitted").
   - It implies `S ≤ 0` because `C ≥ 0` and `k ≥ 1`.
3. **FLAT ⇒ CURRENT-RANK.** `x + 2 ≤ p` gives `x + 1 ≤ p − 1`, and `Q ≥ 0`. At `p = x + 2` the two inequalities coincide as
   instances. For `p > x + 2`, FLAT is the stronger inequality, as its scope line records.
4. **`CT_x` ⇒ FLAT.** By the definition of `x`, `0 ≤ i_{x+1} < i_x`, and `i_x > 0` since `x ≤ α`. So
   `i_x E ≤ (x+1)i_{x+1}Q ≤ (x+1)i_x Q`, using `E, Q ≥ 0`. Divide by `i_x`.
5. **Alias check.**
   - The four keys are distinct predicates:
     - `CT_x` vs FLAT: factor `i_{x+1}/i_x < 1`;
     - FLAT vs CURRENT-RANK: they differ for `p > x + 2`;
     - CURRENT-RANK vs primary: `D ≥ cQ` vs `D + C ≥ cQ`.
   - No row may read `equivalent` or `alias`, and no strictness is exhibited. On the 515 rows and the fixed points, `CT_x`, FLAT
     and CURRENT-RANK all hold (0 failures). The minimum of `−kS/C` over rows with `C > 0` is 4.5 (`bounded_computation`), so no
     row separates any adjacent pair.
   - The "budget" is not a registered key. By P14 it is the primary key instance by instance, so the chain's last arrow must
     name the primary key.

### SR-18 (deg-2 collapse; the `T_22` obstruction)

1. **The collapse.** Suppose `deg s_v = 2` and `W_v = {g}`.
   - Then `R_v = T − N[s_v] = H_v − g`, and `I(H_v) = I(H_v − g) + z·I(H_v − N_{H_v}[g])`.
   - So `q_v(j) = i_{j−1}(U)` for every `j` (zero extension), with `U = H_v ∖ N_{H_v}[g] = T − (N_T[v] ∪ N_T[g])`.
   - `C_v = 0` because `|W_v| = 1`.
   - Under `A = H_v`, `H = R_v`, this is the coefficient extraction of the key's **second conjunct** `I(A) = I(H) + z·I(U)`. The
     per-leaf summand `q_v(p) − q_v(p−1) = Δ_{p−2}(U)` is literally the key's **fourth conjunct**
     `b_v − B_s = Δ_{p−1}(A) − Δ_{p−1}(H) = Δ_{p−2}(U)`.
   - It is a corollary, not the key. The key is a four-conjunct package that includes the `a_v = Γ` bridge, which the collapse
     does not state.
   - I asserted the collapse for every tag with a degree-2 support in every tree of orders 3–12 (1,547 tags).
2. **The `T_22` obstruction, recomputed.** `T_22` = `T_m` at `m = 22`: `n = 91`, `α = 68`, `x = 32`, `p = 34`, with all 67
   leaves in `F_34`.
   - For the marked-arm tag (`v = 2`, `s = 1`, `g = 0`), `U` is the 66 isolated claw leaves. Hence `q_v(j) = C(66, j−1)`, which
     I asserted for `j = 0…69`.
   - The per-leaf term is `C(66,33) − C(66,32) = +212336130412243110`.
   - Each of the 66 claw-leaf terms is `−7560098737536570631`.
   - `212336130412243110 + 66·(−7560098737536570631) = −498754180547001418536 = S`, which equals my literal aggregate.
   - `C(66, j−1)` increases through `j = 34`, so this favorable tag's own term is positive while `S < 0`. A tag-by-tag sign
     argument through the collapse cannot give `Q_p ≤ Q_{p−1}`. Confirmed (E8; a route record).

### SR-19 (distinctions)

**(a) The r23 delete-only key against the r30 active-weight deletion-only condition.** The r23 key is a **cardinality**
condition, `|X| ≤ |Γ_Delete(X)|`. Its `X` ranges over "the complete tagged top side P" of the r23 literal contract, its rank
window is `p ≥ x(T)+2` with no upper bound in the statement, and its relation is r23's `Γ_Delete`. The r30 condition is
**weighted**, `Σ_{B∈X} w_F(B) ≤ Σ_{A∈N_D(X)} w_F(A)`, with these ingredients:
- `X ⊆ I_{p+1}(T)` (untagged independent sets);
- `N_D` the (D) half of (REL) (`A = B ∖ {q}`, any `q ∈ B`);
- `w_F` the active-tag weight: a tag `v ∈ F_p(T) ∩ B` counts only when `B ∩ W_v ≠ ∅`;
- all clone pairs over each joined set pair permitted;
- the eligible window `x + 2 ≤ p`, `3p < 2α + 1`.

They differ in four ways:
- demand: cardinality vs active weight;
- tag semantics: r23 tagged objects vs active tags;
- clone compatibility, as the registered (HALL) scope line itself records;
- the rank window.

The exact r23 definitions of `P` and `Γ_Delete` sit in the r23 contract, which is outside this capsule. The differences above
are read from registry text only.

I replayed the arithmetic behind "fails at `CB(8, 86)`, `p = 460`, on `X_sec`" with my own instrument:
- `n = 1465`, `α = 775`, `x = 458` through `α`, so `p = 460` is eligible;
- the arm leaf and a private leaf are both in `F_460`;
- `3p = 1380 < 2dm + 5 = 1381`;
- the sector ratio `|R_{p−1}|/|R_{p−2}| = 2(N − p + 2)/(p − 1) = 460/459 > 1`, with `N = dm`.

I also re-derived why the positive-weight deletion shadow of `X_sec` is exactly `{r, v} ∪ R_{p−2}`, each member with weight 1:
- deleting `r` or `v` leaves weight 0;
- private tags are inactive because their chokes are absent.

`CB(8, 89)`/476 (`n = 1516`, `α = 802`, `x = 474`, ratio 476/475) and `CB(8, 92)`/492 (`n = 1567`, `α = 829`, `x = 490`,
ratio 492/491) replay likewise. So the finding is a statement about the r30 network: `w_F`, the (D) half, `I_{p+1} → I_p`, and
r30 eligibility. It adds no evidence for or against the r23 key, which stays REFUTED at its own scope and order-91 witness.
REFUTED never regresses. The sector criterion itself is P8, which is STATED and outside my assignment. My replay is one more
instrument, not its second read.

**(b) Naming.** Two registry uses of the name "T22" refer to different trees:

| name in the registry | tree | order |
|---|---|---|
| r28 "T22" (`E993-R28-TREE-LEAF-SLOT-DOMINANCE`'s witness) | `R(3,2)_3`: root, three hubs, two pendant 3-edge paths per hub (`1 + 3 + 18`) | 22 |
| this program's `T_22` | `T_m` at `m = 22`: path `0-1-2` plus 22 claws (`3 + 4·22`); 67 leaves (recomputed) | 91 |

The collision also lives **inside the registry**: `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL` calls the order-91 tree
"T22" (`p = 34`, 67 favorable leaves, `witness_order 91`). That is the witness under `E993-R23-LITERAL-DELETE-ONLY-HALL`.

### SR-20 (B-g, the `Q_j` lead)

1. **Logic.** `(M1) Q_{p−2} ≥ Q_{p−1}` and `(LC) Q_{p−1}² ≥ Q_{p−2}Q_p` together imply `Q_p ≤ Q_{p−1}`.
   - If `Q_p > 0`, then `Q_{p−2} > 0` by downward closure (`p − 2 ≥ 1`), and `Q_p ≤ Q_{p−1}²/Q_{p−2} ≤ Q_{p−1}`.
   - If `Q_p = 0`, then `S ≤ 0` trivially.
   - T2's three-point form contains `Q_{p−1} ≥ Q_p`, which *is* `S ≤ 0`.
   - So the lead is a stronger sufficient condition, not a reduction. Its strictness is **not exhibited**: no row is known with
     `S ≤ 0` and (M1) or (LC) failing.
2. **Spot-check (six rows, own instrument).** Every row satisfies (M1), (LC), `S < 0` and log-concavity of `j ↦ Q_j` at every
   rank. The mode is `x` or `x − 1`.

   | row | `p` | `x` | `Q_{p−2}` | `Q_{p−1}` | `Q_p` | slack `Q_{p−2}/Q_{p−1} − 1` | mode |
   |---|---:|---:|---:|---:|---:|---:|---:|
   | double broom | 6 | 4 | 645 | 516 | 255 | 0.25 | 4 |
   | `K_{1,12}` | 8 | 6 | 5544 | 3960 | 1980 | 0.40 | 5 |
   | path-star (2,3,4) | 7 | 5 | 3247 | 2701 | 1483 | 0.2021 | 5 |
   | `CB(1,7)` | 10 | 8 | 78780 | 58002 | 29190 | 0.3582 | 8 |
   | C-T2-F order-15 minimum tree | 6 | 4 | 368 | 364 | 172 | 0.010989 | 4 |
   | `T_22` | 34 | 32 | 7096714351565349344988 | 7032072523191088241946 | 6533318342644086823410 | 0.009192 | 32 |

   - On all 515 rows of orders 11–14 there are 0 failures of (M1), (LC) or all-rank LC. The mode is `x` on 509 rows and `x − 1`
     on 6. The minimum slack is 0.0432.
   - The selector never binds: `F_p = L(T)` on all 515 rows.
3. **Slack along `T_m`** at `p = x + 2`, exact, displayed as floor(ppm):
   - The local minima at `m = 38, 47, 56, 65` are 4039, 3692, 3246 and 2847 ppm, which reproduces C-T2-F.
   - `m = 200` gives 933 ppm.
   - (M1), (LC) and `S ≤ 0` hold at every `m` in 20–70, 100, 150, 200 and 300.
   - The slack decreases toward 0 on the tested ranges, but "→ 0" is an extrapolation from bounded data, not a proved limit.

## Findings and repairs

1. **SR-16 (repair, wording).** The two scope notes must carry the budget's definition on their face:
   - `Q = Q_{p−1}` over the fixed `F_p(T)`;
   - DCB summed at `h = α − 1`, `k = p − 1`;
   - the grade and the attribution.

   Otherwise the undefined phrase "the scalar budget" stands inside a registry note. Replace "STATED" with the second-read
   reference. P14's hypothesis "`α(H_v) = α − 1`" is true but stronger than needed: only `α(H_v) ≤ α − 1` enters the identity.
   No change is required; this is recorded as precision.
2. **SR-16 (P17).** "Nothing new registered" is right:
   - `D ≥ 0` is a conjunct of the VERIFIED DCB statement.
   - The indicator identity is a classical binomial identity serving T2's `C_v` formula.
   - `α(H_v) = α − 1` is an elementary leaf fact that instantiates DCB's hypothesis. My registry scan found no key for it.

   One precision repair: the independence of `W_v` is a hypothesis of the `C_v` counting formula, not of the indicator identity,
   which holds for all `m` unconditionally.
3. **SR-17 (strongest repair).** The chain's last arrow targets "budget", which is not a registered key. The relation rows must
   end at `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`. They must be `implies` rows, instance-wise at every eligible
   `(T, p)`, with no `equivalent`/alias row and no strictness asserted. The rows prove on their face orderings that the
   registered scope lines of FLAT and CURRENT-RANK already assert in words (Codex, C4 intake). Novelty is the proofs, not the
   relations.
4. **SR-18.** Confirmed as stated. Precision: the per-leaf summand is the key's fourth conjunct verbatim; the coefficient form
   comes from the second.
5. **SR-19 (repairs).**
   - (a) The synthesis row "fails at `CB(8,86)`/460 on `X_sec`" must say that the failure rests on P8 (STATED; its own second
     read), that it concerns the r30 network only, and that it is not a re-refutation of the r23 key.
   - (b) The naming distinction must also record the registry-internal use of "T22" for the order-91 tree in
     `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`.
6. **SR-20 (repairs to the B-g record).**
   - "T2's 1,047 rows" is a mis-transfer. 1,047 is T2's (WID) direct-check count. T2's `Q_j` probe ran on **1,060** instances
     (1,043 census, 13 `T_m`, 3 fixed points, `T_22`), as C-T2-U backs.
   - "strictly stronger" must read "stronger (implies the aggregate at the same row); strictness not exhibited".
   - "vanishing slack" must read "slack decreasing toward 0 on tested families (`bounded_computation`); the limit is not
     proved".
   - The "515 rows (controller)" figure is a controller replay (CF6-0), which is not evidence. The critic censuses (C-T2-F to
     order 17, 13,867 rows; C-T2-U, 41,693 rows) and this read's 515 rows are the replays of record.

   The ruling "successor lead, not registrable" is right: it is bounded only, stronger than its target, and has no proof plan.

## Registration text

**R-16a: scope note on `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`.** Status OPEN, unchanged. Register verbatim:

> r30 C1 (P14; second read SR-BUDGET): for every eligible (T, p), with F = F_p(T) fixed at rank p, k = p − 1,
> Q_j = Σ_{v∈F} q_v(j), and E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY summed over F at h = α(T) − 1, k = p − 1:
> D + C − (2α + 1 − 3p)·Q_{p−1} = −(p − 1)·S(T, p); so the scalar budget D + C ≥ (2α + 1 − 3p)·Q_{p−1} holds at (T, p) iff
> Q_p ≤ Q_{p−1} iff S(T, p) ≤ 0 — the budget is equivalent to this key instance by instance (proved_informal). (HALL) ⇒ this
> key via (WID) + (FLOW⇒SIGN) (proved_informal; kernel-checked in scratch; no award). No status change.

- Grade: `proved_informal` (a relation; weakest input DCB).
- Attribution: r30 T2 (hierarchy); C-T2-U (identity form); DCB (Codex GPT-6, lower-region run); (WID)/(FLOW⇒SIGN) r30 F2, U2
  and critics.
- Fences:
  - no status change;
  - the budget route proves the aggregate, never (HALL);
  - `D, C ≥ 0` never supplies the budget.

**R-16b: scope note on `E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY`.** Status VERIFIED
`proved_informal_adjudicated_no_formal_award`, statement unchanged. Register verbatim:

> r30 C1 (second read SR-BUDGET): re-derived in r30 (T2; C-T2-F, C-T2-U: α(H_v) = α(T) − 1 for every original leaf, D ≥ 0 by
> the bipartite bound; C-T2-F: König form d_v(A) = (n_v − 2ν_v) + |N_{H_v}(A)| − k; C-T2-F, C-T2-U: the C_v indicator identity
> for all m, its counting formula using that W_v is independent). T2's numeric confirmation used a residual D and is not
> evidence; D and C were enumerated directly on the 515 eligible rows of orders 11–14 (C-T2-F, C-T2-U, SR-BUDGET;
> bounded_computation). Summed over F_p(T) at h = α − 1, k = p − 1 on eligible (T, p), the budget
> D + C ≥ (2α + 1 − 3p)·Q_{p−1} is instance-equivalent to S(T, p) ≤ 0 (P14). No statement or grade change; no sign-budget
> conclusion.

Nothing new is registered for P17.

**R-17: three relation rows** (P15). Each row is `implies`, instance-wise, `proved_informal`. Attribution: C-T2-U, second
read SR-BUDGET. Register verbatim:

> 1. `E993-LOWER-REGION-EARLY-MARKED-OCCUPANCY-TRANSFER` implies `E993-LOWER-REGION-FLAT-ADDABILITY-BUDGET` — at every eligible
>    (T, p) with the same F_p(T), k = p − 1, E and Q: 0 ≤ i_{x+1}(T) < i_x(T) by the definition of x, and E, Q ≥ 0.
> 2. `E993-LOWER-REGION-FLAT-ADDABILITY-BUDGET` implies `E993-LOWER-REGION-CURRENT-RANK-ADDABILITY-BUDGET` — at every eligible
>    (T, p): x + 1 ≤ p − 1 and Q ≥ 0; the two inequalities coincide at p = x + 2.
> 3. `E993-LOWER-REGION-CURRENT-RANK-ADDABILITY-BUDGET` implies `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` — at every
>    eligible (T, p): by the DCB double count E = (p − 1)·Q_p + C, the current-rank inequality holds iff (p − 1)·S(T, p) ≤ −C
>    iff D ≥ (2α + 1 − 3p)·Q_{p−1}; with C ≥ 0 and p − 1 ≥ 1 it gives S(T, p) ≤ 0.

- Fences:
  - no `equivalent`/alias row;
  - no strictness asserted (none exhibited);
  - all four keys stay OPEN;
  - failure of any premise refutes nothing downstream;
  - the rows prove orderings already stated in words on the FLAT and CURRENT-RANK scope lines (no novelty claimed for the
    relations).

**R-18: `CLAIM-DISTINCTIONS` row 11b.** Register verbatim:

> `E993-ORDINARY-DEG2-SIBLING-G1-COEFFICIENT-IDENTIFICATION` — relation `subclaim_of` (corollary). r30 T2's deg(s_v) = 2
> collapse — for an original leaf v whose support has degree two with W_v = {g}: q_v(j) = i_{j−1}(H_v ∖ N_{H_v}[g]) for every
> j (zero extension) and C_v = 0 — is the coefficient extraction of the key's second conjunct I(A) = I(H) + z·I(U) under
> A = H_v, H = R_v, U = H_v ∖ N_{H_v}[g] = T − (N_T[v] ∪ N_T[g]); its per-leaf summand q_v(p) − q_v(p − 1) = Δ_{p−2}(U) is the
> key's fourth conjunct; C_v = 0 because |W_v| = 1. Not the same statement (the key is a four-conjunct package); nothing new
> registered.

- Attribution: T2 (translation); C-T2-F (corollary relation); C-T2-U (alias check); T adjudicator.
- The E8 obstruction (`T_22` arm, `q_v(j) = C(66, j−1)`, term `+212336130412243110`) stays a route record. Attribution:
  C-T2-U.

**R-19a: `CLAIM-DISTINCTIONS` row 11a.** Register verbatim:

> `E993-R23-LITERAL-DELETE-ONLY-HALL` (REFUTED) vs r30 active-weight deletion-only transport (no key): the r23 key is the
> cardinality condition |X| ≤ |Gamma_Delete(X)| for X within the complete tagged top side P of the r23 literal contract,
> p ≥ x(T) + 2; the r30 object is the weighted condition Σ_{B∈X} w_F(B) ≤ Σ_{A∈N_D(X)} w_F(A) for X ⊆ I_{p+1}(T), N_D the
> deletion half (D) of the r30 relation, w_F the active-tag weight over the fixed F_p(T) (a tag counts only when B meets W_v),
> all clone pairs over a joined set pair permitted, p eligible (x + 2 ≤ p, 3p < 2α + 1). They differ in demand, tag
> semantics, clone compatibility and rank window. The r30 finding that active-weight deletion-only Hall fails on the
> root-plus-arm sector X_sec at CB(8, 86), p = 460 (sector criterion 3p < 2dm + 5; P8, STATED, pending its own second read)
> is a statement about the r30 network only; it neither re-refutes nor supports the r23 key, which stays REFUTED at its own
> scope and order-91 witness.

- Attribution: r30 F2 (D1); C-F2-T; C-F1-T, C-F1-U (sector criterion); synthesis.

**R-19b: naming distinction 11c.** Register verbatim:

> "T22" names two different trees in the registry. r28's T22 (`E993-R28-TREE-LEAF-SLOT-DOMINANCE`, `E993-R28-DOMINANCE-REFUTATION`)
> is R(3,2)_3 — a root joined to three hubs, each carrying two pendant paths of three edges — of order 22. This program's
> T_22 is T_m at m = 22 (`E993-ORDINARY-TM-LOWER-REGION-AGGREGATE`: path 0–1–2 plus 22 claws at 0) of order 91 with 67
> leaves; it is the tree the registry calls "T22" in `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL` (witness order 91, p = 34),
> the witness under `E993-R23-LITERAL-DELETE-ONLY-HALL`. No statement about one transfers to the other.

- Attribution: r30 F2 (D12); C-F2-T (registry-internal collision).

**R-20: no registration.** Corrected record text for B-g, verbatim:

> B-g (bounded_computation; not registrable; successor lead): with F = F_p(T) fixed, (M1) Q_{p−2} ≥ Q_{p−1} and (LC)
> Q_{p−1}² ≥ Q_{p−2}·Q_p together imply S(T, p) ≤ 0; no failure on T2's 1,060 instances, C-T2-F's 13,867 census rows to order 17,
> C-T2-U's 41,693 rows (log-concave at every rank; mode at x − 1 or x) and SR-BUDGET's 515 rows to order 14. A stronger
> sufficient condition, not a reduction; strictness not exhibited; the (M1) slack decreases toward 0 on the T_m and cherry-hub
> families (bounded; limit not proved).

## Verdicts

verdict[SR-16]: confirmed_with_repairs
verdict[SR-17]: confirmed_with_repairs
verdict[SR-18]: confirmed
verdict[SR-19]: confirmed_with_repairs
verdict[SR-20]: confirmed_with_repairs

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-sr-SR-BUDGET/`.
Everything uses the standard library and exact integers, and ran in the foreground. No background job was started, so none
remains.

| file | sha256 | role |
|---|---|---|
| `seal_check.py` | `4878be0e466924562467dd9eeead1d46f776a39dfcbe44ec311543d1048c9976` | capsule seal and member digests |
| `seal_check.out` | `32779d96bd723771759ecd178f501c46b91eee932123349e3f239862cc683787` | its output (seal equal; 17/17) |
| `srb_lib.py` | `41a313f96095a41ef24a1f3fe051e49d319f302ace3ddc7cbcc34c8173813021` | own instrument (DP, `x`, `F_p`, `S`, `q_v`, `w_F`, direct `D`/`C`/`E`, tree families) |
| `srb_check.py` | `774803694cc84105b1ba55eec6a0d60bc833fa927ebf1ea50da047c464247177` | SR-16 to SR-20 checks |
| `out14.json` | `34cc26c9bfe645225acb95814b1acdf041973cf1886dc237f3dafdccd2f99c6a` | output of `python3 -B srb_check.py 14` |

- Replay: `cd` into the scratch root and run `python3 -B seal_check.py` and `python3 -B srb_check.py 14 > out14.json` (about
  3 minutes).
- Deliverable: `second-reads/SR-BUDGET/SECOND-READ.md` (this file).
- No sealed member was edited.
