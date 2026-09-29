# Critique

Critic `C-F3-U` (cross-orientation critic, orientation U, formal / structural) of route `C1-F-03`, mechanism token
`ELIG-TOP-DESCENT-ADVERSARY`, orientation F (falsify), r31 Cycle 1 Stage 4. Date 2026-09-27.

**VerityOS boot.** I am working within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and nothing else from VerityOS. The tool display cut part of the
middle of `verity.md` (about 5 KB). The startup protocol's task map (memory, modules, skills, logs, decisions, conversations)
was not followed, as the dispatch requires.

**Model disclosure (two parts):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Read-boundary disclosure.** (1) I printed all of `control/C1-CRITIC-ATTACK-BRIEFS.md`, which is a capsule member, in one
`cat`. That exposed the other seats' sections as well as F3's. I used only F3's section. (2) I read
`control/C1-WORKER-COMMON-BRIEF.md`. The critic common brief authorizes it as a Stage 2 member, and its digest `89a93d95…`
matches the Stage 2 manifest. It is not in the capsule list, so I record it here. (3) I made one non-recursive listing of
`scratchpad/c1-F3/`, the directory holding the return's inventoried artifacts, to copy them out. (4) I read
`sources/authority/CLAIM-IDENTITY.json` and `sources/SOURCE-DIGESTS.json` with Python (both authorized) for the alias check.
The digest `b4a339ee…` matches. (5) The harness injected the project `CLAUDE.md` and the user's memory index into my context. I
did not fetch them and did not use them. (6) Replaying F3's generators imported the numpy 2.4.6 already on the host. Nothing
was installed. My own instruments use the standard library only. There was no network access, no search tool rooted above my
grant, and no background job; every computation ran in the foreground.

## Identity and seal audit

- Dispatch `DISPATCH-C-F3-U.md`: SHA-256 `17cccca09f0fd06642f52e7a7df762957dd99dc4f437b2382bf5d4886fcf18bd`, verified before I
  read it.
- **Capsule seal** (`F3-PACKET-MANIFEST.json`, canonical JSON without `seal_sha256`, sort_keys, `(",",":")`):
  recomputed `cbe2f29cbe64fcd4670d99349f884021342f2ff6b276fad74e3d07f33801a5c8`. It matches. All 14 capsule members match
  their listed SHA-256 and byte counts.
- Stage 4 dispatch manifest seal `86453c5c1eae81d5c1a8cf4759bcec530ccf1ca6a47c1b693d35dce430a2587b`: recomputed, matches.
- Stage 3 packet manifest seal `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37`: recomputed, matches.
- Stage 2 packet manifest seal `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc`: recomputed, matches.
- Return `cycles/cycle-1/stage3/returns/F3/RETURN.md`: `4dda61ef…` (capsule), matches. It cites the dispatch digest
  `78a65966…`, which is the value in the Stage 3 manifest. I checked all ten source digests the return cites against the
  Stage 2 manifest: SEMANTIC, SOLUTION, ALLOCATION, STAGE1-GATE, ROUTE-STATE, WORKER-COMMON-BRIEF, AUTHORIZATION,
  OBLIGATIONS.csv, R31-CHARTER-PROMPT and the run-local registry. All ten match.
- Route identity: the route ID `C1-F-03` and the token `ELIG-TOP-DESCENT-ADVERSARY` appear verbatim. The seat model
  disclosure is two-part ("chartered sonnet/high … claude-sonnet-5").
- The Stage 3 read-boundary record lists, for F3, two harness auto-backgrounded runs that were stopped and re-run. The
  return's own disclosure says the same. No background-only result is used, and my replays below do not depend on them.
- **Process violation:** the worker common brief, rule 7, requires "an explicit IMPORT LIST … (standard library only)".
  Every F3 generator except `block_crossover_check.py` and `e1_condition_check.py` imports `numpy`, and the return says so
  openly. It is used only as an object-dtype container of exact Python ints, so correctness is not affected. It is still a
  rule breach, and I record it here.

## Independent re-derivation

All of my instruments are my own and use the standard library only. They live in `scratchpad/c1-crit-F3-U/own/`.

**R1: fidelity on the literal tree (`fidelity.py`, output `1c6baf71…`).** I build `CB(8,m)` as an explicit labelled
adjacency list: `r–s–v`, `m` chokes on `r`, 8 supports per choke, and one private leaf per support. I compute the
independence polynomial of the tree, of `T − v` and of `T − c` by a generic rooted DP, using no closed form. I did this at
`m ∈ {1,2,3,4,5,8,11,95,107,110,113}`.

At every one of these `m`:
- `n = 17m + 3` and there are `17m + 2` edges;
- `α = deg I = 9m + 1`;
- the closed forms of SEMANTIC-CONTRACT §2 for `I`, `I(T−v)` and `I(T−c)` equal the literal DP coefficient for coefficient;
- `I(T−c)` is the same for a leaf on the first choke and a leaf on the last choke.

The closed forms also follow in three lines:
- If `r ∉ B`: the edge `s–v` contributes `(1+2x)`, and each choke contributes `G = (1+2x)^8 + x(1+x)^8` (choke absent or
  present).
- If `r ∈ B`: `s` and every `u_i` are excluded, giving `x(1+x)(1+2x)^{8m}`.
- The `T − v` and `T − c` forms follow the same way.

At the class rows 107, 110 and 113, the literal first descent is `x = p* − 2` (570, 586, 602), parent descent holds,
`3p* < 2α + 1`, and both leaf classes are favorable at `p*` (literal `Δ_{p*} = i_{p*+1} − i_{p*} < 0` on `T − v` and on
`T − c`). So `F_{p*} = leafSet` is derived there, not assumed. At `m = 95`: `x = 506`. At `m = 107`: `n = 1822`, `α = 964`,
`x = 570`. These are the SEMANTIC §5 fixed points, and here they come from the literal tree rather than from formulas.

**R2: a different exact coefficient engine (`crit_core.gpow_miller`).** I compute `G^m` from the J.C.P. Miller power
recurrence `G·H' = m·G'·H`, which gives `(n+1)h_{n+1} = Σ_{t≥1}((m+1)t − (n+1)) g_t h_{n+1−t}`, and assert that the integer
division is exact at every step. This method shares no code with F3's repeated convolution or with my literal DP. It costs
O(9p*) big-integer operations per row: 0.55 s at `m = 2600`, against F3's 407 s for its cumulative sweep. `I_closed`,
`Iv_closed` and `Ic_closed`, built on this engine, equal the literal DP at every `m` in R1.

**R3: exact class sweep (`sweep.py 107 2600`, output `5680717d…`, 3 min 42 s in the foreground).** The sweep covers all 832
class rows `m ∈ [107, 2600]`, `m ≡ 2 (mod 3)`. On every row:
- parent descent `i_{p*−1} < i_{p*−2}` holds;
- the first descent satisfies `x ≤ p* − 2`;
- `3p* < 2α + 1` holds.

It also reproduces F3's 69 rows `m ∈ [2396, 2600]` exactly: the same `p*`, the same `x` and the same parent-descent flag on
every row.

**R4: my own E1(i) and favorability checks (`checks2.py`).**
- E1 condition (i) `r_q(p*−q) ≤ r_q(p*−q−1)` holds at every `q ∈ [1,m]` for `m ∈ {107, 110, 113, 116, 500, 1001, 2000}`.
  The method is the ODE recurrence `(t+1)c_{t+1} = (a+2b−3t)c_t + 2(a+b−t+1)c_{t−1}` for `(1+y)^a(1+2y)^b`. I validated it
  against a direct convolution, and it differs from F3's `math.comb` sum. Outputs: `6324e960…` and `906a8281…`.
- Both leaf classes are favorable at `p*` for `m ∈ {116, 500, 2396, 2600}`, using the closed forms validated in R1 and the
  Miller engine.

**R5: replays of F3's generators, copied out first into `scratchpad/c1-crit-F3-U/replay/run/`.**
- `validate_fixed_points.py`: OK.
- `block_crossover_check.py` → `1ba14d73…`
- `favorability_check.py 116` → `e3f00032…`; `favorability_check.py 500` → `271cc56b…`. The shipped file (from 2396) is
  `b1ec56a9…`.
- `e1_condition_check.py` → `1b7fdf8b…`
- `elig_top_sweep.py 2600` → `70e02c7f…` (430.6 s).

Every digest F3 states reproduces byte for byte. Whether the content is valid is a separate question; see finding A1.

## Attacks and findings

**A1: FIDELITY FAILURE in favorability (struck).** In `favorability_check.run`, the loop evaluates the leaf polynomials
*before* it advances `gvec`. At iteration `m`, therefore, `gvec = G^{m−1}` and `prev_gvec = G^{m−2}`.

So the shipped check computes the wrong polynomials:
- it evaluates `(1+x)G^{m−1} + x(1+2x)^{8m}` instead of `I(T−v) = (1+x)G^m + x(1+2x)^{8m}`;
- it evaluates `(1+2x)G_cG^{m−2} + x(1+x)^2(1+2x)^{8m−1}` instead of `I(T−c) = (1+2x)G_cG^{m−1} + …`.

I demonstrated this by instrumenting the shipped loop (`fav_bug_probe.py`). At iteration 5 the captured vector equals `G^4`
and not `G^5`. At 107, 110 and 113, F3's `Δ_v` is not equal to the literal `Δ_v`. The signs happen to agree, because a
`G^{m−1}` mixture is further past its mode, so the wrong computation is biased toward "favorable". This is not a check of
favorability. The return's claim "Confirmed favorable for both leaf classes at m ∈ {107,110,113,116,500} and at m = 2396"
is **struck as evidence**. It is replaced by R1 (literal tree at 107/110/113) and R4 (closed forms at 116/500/2396/2600).
Under both, favorability holds at those rows, still at `bounded_computation`. The favorability key keeps its registered grade;
nothing here upgrades it.

**A2: the tail term is miscategorized in the ascend/descend mass split (the stated numbers are corrected).** Both
`block_crossover_check.ascend_descend_mass` and `elig_top_sweep` set `desc = total − asc_{j=0,1,2}`. That nets the tail
`x(1+x)(1+2x)^{8m}` into the "descending mass (j ≥ 3)". But the tail *ascends* at `p* − 2`: its mean is `p* + 1/6`, and I
certify the sign uniformly below. With the tail counted correctly on the ascending side:

| m | correct descending / ascending ratio | F3's stated ratio |
|---|---|---|
| 107 | 3.4655 | 3.9172 |
| 110 | 4.0117 | not stated |
| 113 | 4.6340 | not stated |

The tail is about 15% of the ascending mass at these rows. The return's guidance that "only 3 blocks (`j = 0,1,2`) ever need
to be controlled by hand" is incomplete: four ascending components need control (`j = 0,1,2` and the tail). The `10^38`–`10^41`
ratios at `m ≥ 2396` carry the same netting, though it does not change their order of magnitude.

**A3: the block crossover was a probe set, not a sweep (overclaim struck, then resolved by me; see the Remaining obligation
section).**
- At `m = 10001` only `j ≤ 3` were probed, and at `m = 2396` only `j ≤ 5`. "Every tested `j ≥ 3` descends" is true only of
  those probes.
- "Across four orders of magnitude" is wrong: `107…10001` spans two orders of magnitude.

The mean offset the return quotes as "≈ (j−1)/3" is in fact exact. For `P_j := (1+x)^{8j}(1+2x)^{8m−8j+1}`,
`μ(P_j) = (16m + 2 − 4j)/3`. The block `x^j P_j` therefore has mean `μ_j = (16m + 2 − j)/3 = (p* − 2) + (4 − j)/3`.

**A4: the brief's question, "diverge for m > 2395" versus "p* − x grows".** The parent descent is TRUE on all of F3's range
(R3 replays it). The two notions separate much earlier than 2395:
- `x = p* − 2` exactly on the 18 class rows `m ∈ {107, …, 158}`;
- the first class row with `x < p* − 2` is **`m = 161`** (`p* = 860`, `x = 857`);
- from there `p* − x` is nondecreasing across all 832 rows up to 2600.

This settles F3's open item 4 (critic-derived; bounded_computation).

The return says `p* − x` "tracks 256m/20451 to within integer rounding at every one of the 69 rows". That is true of those
69 rows. On my wider range it fails at `m = 479, 1358, 1997`, where `p* − x = ⌈256m/20451⌉ + 1`. The asymptotic `256m/20451`
is `m·(16/3 − 36272/6817)`, the gap between `p*/m` and the mean of `G` per choke. It is a heuristic and not a law, and the
return's word "confirmed" is struck; "consistent on 69 rows" is what the data supports.

**A5: independence labels.**
- The "bit-for-bit … independent" cross-check at `m = 107` (block sum against the `G^m` DP) evaluates the same closed form
  twice: one model checked twice, which is the r30 lesson. It says nothing about fidelity to the tree. R1 supplies the
  literal-tree check that was missing.
- The fixed-point script "reproduces" `n` and `α` by evaluating `17m + 3` and `9m + 1` and asserting them against the same
  numbers. That is a tautology, not a reproduction, and the literal is struck. R1 reproduces both from the tree.

**A6: minor points.**
- `m = 1000`, cited as the abandoned E1 horizon, is not in the class (`1000 ≡ 1 (mod 3)`, and `pstar` asserts on it). I ran
  E1(i) at the class rows 1001 and 2000 instead; both pass.
- ℕ-subtraction and casting: Python ints throughout, with correct `k < 0` guards. No finding.
- Newton/Darroch hygiene: the return invokes neither anywhere. Clean.
- "x through α": the scan stops at the first descent it finds, which is at most `p* − 2`. That is correct by definition,
  because `x` is the least such `k`.

**No cut and no obstruction.** Nothing in the return or in my instruments contradicts (E) at any class row.

## Mechanism-equivalence and fence check

- One rank per tree and the class only. The additional probe `m ∈ {92, 98, 101, 104}` is below the class, and the return
  labels it as an observation. My certificate is stated only for `m = 3u + 2 ≥ 107` at `p*`.
- No refuted mechanism is revived. Newton and Darroch are applied only to the real-rooted `P_j`, never to `I`, `G` or `G^m`.
  `E993-TREE-REAL-ROOTED` is respected.
- Census discipline: F3's extension to 2600 and my sweep to 2600 are both `bounded_computation`. Neither proves the universal
  statement. My certificate below is a proof and does not rely on either census.
- No status is transferred to (HALL), to the aggregates or to Erdős #993. The favorability, E1-threshold and criterion keys
  are cited at their registered grades.
- Claim identity. F3 proposes no key. That is correct: its results are bounded evidence for the existing obligation
  `R31-OBL-ELIG-TOP`. For my critic-derived result I propose, as STATED only, the candidate predicate key
  `E993-R31-CB8-CLASS-PARENT-DESCENT-HOLDS-AT-PSTAR-MINUS-2`.
  - Lexical alias check: the frozen registry has 491 keys, digest verified. No key containing `CB` also contains
    `DESCENT`, `ELIG`, `PARENT` or `FIRST`, apart from three r30 row and scope keys about Hall and deletion, which are other
    objects.
  - Mathematical alias check: the nearest keys are the favorability key (coefficients of `I(T−v)` and `I(T−c)` at
    `p*/p*+1`), the E1 threshold key (coefficients of `r_q`) and `E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` (REFUTED;
    a general statement about arbitrary trees). All are distinct statements.
  - It still needs an isolated second read before registration.

## Certification audit

| Literal on the return's face | Status |
|---|---|
| Digests `70e02c7f…`, `1ba14d73…`, `1b7fdf8b…`, `e3f00032…`, `271cc56b…`, `b1ec56a9…` | **backed**: replayed byte for byte |
| "Parent descent holds, 69/69, m ∈ [2396, 2600]", `bounded_computation` | **backed**: replay plus my independent Miller sweep |
| "`x < p* − 2` at all 69 rows" and the table values | **backed**: independent sweep |
| "E1 condition (i) zero failures at every q, m ∈ {107, 110, 113, 116, 500}" | **backed**: replay plus my ODE-recurrence check; extended by me to 1001 and 2000 |
| "favorable for both leaf classes at {107, …, 500} and 2396" | **STRUCK** (A1: wrong polynomials `G^{m−1}` and `G^{m−2}`); the conclusion is re-established by R1 and R4 |
| "Fixed points n, α reproduced independently" | **STRUCK** for `n` and `α` (formula evaluation); `x` backed; R1 supplies the literal reproduction |
| "cross-validated … bit-for-bit, independent" | narrowed: two evaluations of one closed form |
| "descending mass (j ≥ 3)" / "ratio ≈ 3.917" | **corrected** (A2): tail netted in; the correct ratio is 3.4655 |
| "four orders of magnitude"; "confirmed … 256m/20451" | **STRUCK** (A3, A4) |
| "Standard library plus numpy only" | process breach of rule 7 (see the seal audit); disclosed on the face |

## Verdict

verdict: retained_narrowed

headline_resolved: no

`LS_top: not_advanced`
`ELIG_top: advanced`
`cut_candidate: none`

**What is retained:**
- the exact extension of the (ELIG-top)(a) census to `m = 2600` (69 rows, `bounded_computation`), replayed and independently
  reproduced;
- `x < p* − 2` on those rows;
- E1(i) at the sampled rows;
- the honest "no break found" adversarial result.

**What is narrowed:**
- the favorability evidence is struck because of a fidelity failure (A1);
- the mass-split labelling and ratio are corrected (A2);
- four certification literals are struck (A3–A5);
- the numpy import is a rule-7 breach.

**Critic-derived advance: (ELIG-top)(a) for every m in the class.**

*Statement.* For every `m = 3u + 2` with `u ≥ 35`, that is every `m ≥ 107` with `m ≡ 2 (mod 3)`:
`i_{p*−1}(CB(8,m)) < i_{p*−2}(CB(8,m))`. Consequently `x ≤ p* − 2`. Combined with `3p* = 16m + 4 < 18m + 3 = 2α + 1`,
this gives (E) on the whole class.

*Setup.* Let `k = p* − 2 = 16u + 10` and `N = 8m + 1 = 24u + 17`, so `N − k = 8u + 7`. Define
`Δ := i_k − i_{k+1} = Σ_{j=0}^{m} C(m,j) D_j + D_tail`, where `D_j := [x^{k−j}]P_j − [x^{k+1−j}]P_j`.

*Step 1: exact certificate for j ≤ 10 and the tail (`symbolic_descent.py 10 35`, output `c87fded3…`, `Num` digest
`4f798fd5…`).* Each term `C(N−dN, k+dk)2^{k+dk}` divided by `E := C(N,k)2^k` is exactly a ratio of products of integer linear
forms in `u`. So `R_10(u) := [Σ_{j≤10} C(m,j)D_j + D_tail]/E = Num(u)/(L·Den(u))`, where:
- `Num` is an integer polynomial of degree 100;
- `L` is a positive integer;
- `Den` is a product of 91 linear forms `au + b`, each with `a > 0` and each positive at `u = 35`.

I checked the identity against direct big-integer evaluation at `u = 35, 36, 40, 100`. Every coefficient of `Num(35 + t)` as
a polynomial in `t` is strictly positive; I verified the Taylor-shift routine on 200 random polynomials. Hence `R_10(u) > 0`
for every real `u ≥ 35`. For example, `R_10(35) ≈ 0.0995`.

*Step 2: blocks j ≥ 11.* Each `P_j` is a product of linear factors with positive coefficients in degrees 0 to `N`, so it is
real-rooted. Its block mean is `μ_j = k + (4 − j)/3 ≤ k − 7/3`.
- By Darroch, every mode `M` satisfies `M < μ_j + 1 ≤ k − 4/3`, so `M ≤ k − 2`. This uses Darroch only in the weak form
  "mode < mean + 1"; the margin is `7/3`.
- By Newton, the coefficient sequence is strictly log-concave.
- Therefore `D_j > 0`.

This is legitimate under SEMANTIC §2, SOLUTION §3.3 and gate ruling 3, because the input is a real-rooted block. So
`Δ/E = R_10 + Σ_{j≥11} C(m,j) D_j/E > 0`.

*Supplementary certificates (`block_sign.py`, outputs `5601316f…`, `bc529bce…` … `2f897142…`).* The same machinery gives a
uniform sign for each piece separately for all `u ≥ 35`: the tail and `j = 0, 1, 2` **ascend**, and `j = 3, …, 10`
**descend**. Together with Darroch for `j ≥ 11`, this **proves F3's observed crossover `j = 2/3` for every m in the class**.
The same certificate already works with `J = 5`, where the Darroch margin for `j ≥ 6` is `2/3`. For `J = 3, 4` the sufficient
Taylor test fails.

*Grade.* My assessment is `proved_informal` modulo Darroch's mode theorem on the real-rooted blocks `P_j`, `j ≥ 11`. The
same dependency class appears on the carried favorability and E1 keys. There is no `M_0` above 107 and no finite-range
residue. This is a critic-derived statement, STATED at a review stage, and it needs an isolated second read. It is not
registered here and is not formally verified. It covers only (E): (H), which needs (L-S)_top, is untouched.

## Remaining obligation

What the successor inherits, stated exactly:

1. **Second read of the critic-derived certificate.** An isolated read of `symbolic_descent.py` and `block_sign.py` (term
   generation, the ratio formula `C(N−dN,k+dk)/C(N,k)` and its validity range at `u ≥ 35`, the common denominator, the Taylor
   shift) and of the Darroch step for `j ≥ 11`. Only after that can (ELIG-top)(a) move from `bounded_computation` (record to
   2395, now 2600) to `proved_informal` under a registered key.
2. **A Darroch-free discharge for blocks `j ∈ [11, m]`.** An integer argument, uniform in `(m, j)`, that
   `[x^{s}]P_j > [x^{s+1}]P_j` at `s = k − j`, would make (E) Darroch-free. A useful starting point is the three-term
   recurrence `(t+1)c_{t+1} = (a+2b−3t)c_t + 2(a+b−t+1)c_{t−1}` together with a lower bound on `c_s/c_{s−1}`. The crude
   termwise bound `2(b−s+1)/s` is too weak; I checked this asymptotically. This is the natural target for U3's Lean route.
   The `j ≤ 10` part is already a polynomial-positivity certificate that Lean can check. A Lean version must not use
   `native_decide` in its universal step.
3. **Favorability at `p*`.** F3's check is struck (A1). The registered favorability key (`proved_informal` modulo
   Darroch/Newton) still carries (H)'s selector, and bounded confirmation now rests on R1 and R4. A uniform certificate of the
   same polynomial-in-`u` kind looks feasible for `I(T−v)` and `I(T−c)`, because both have the same block structure. It has
   not been attempted.
4. **E1(i) at `p*` for every `q`.** This stays at the carried key's grade. It is bounded-confirmed at
   `m ∈ {107, 110, 113, 116, 500, 1001, 2000}`.
5. **(L-S)_top** is untouched by this route and by this critique.
6. **Housekeeping.** Fix `favorability_check.py`'s loop order if it is reused. Report ascending mass with the tail included.

F3's own remaining obligation, judged:
- Item 1 (faster exact method) is met by the Miller recurrence (R2).
- Item 3 (prove the crossover) is met by the critic-derived certificates, modulo Darroch for `j ≥ 11`.
- Item 4 (locate the transition) is met: `m = 161`.
- Item 2 (E1 at scale) is met for the sampled rows 1001 and 2000. It remains a census.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-F3-U/`.

Own instruments (`own/`; standard library only; every run `python3 -B`, in the foreground):

| File | SHA-256 | Purpose |
|---|---|---|
| `crit_core.py` | `182af651db46adfbf03e1669079745bae8ed652e5a63b21ac5f250bf99ec3a43` | literal tree, forest DP, Miller engine, closed forms |
| `fidelity.py` | `aa92fd8253bf7fad484bba5d67348776c038067d515078a4c7a925921c5b3424` | writes `fidelity_output.json` `1c6baf7130836166ea1867cc88b68153959da6532f346881dee4204c448d829d` |
| `sweep.py` | `f95d2c9f44383c23092cec81878abf22f294ee78ef9022cf804d42ddc39edfaf` | `sweep.py 107 2600` writes `sweep_107_2600.json` `5680717db4a9606202fcf0eab767269cc746a626956b73bad7b5ce6b839ddb09` |
| `checks2.py` | `73f6ee1e35932d2abce678a57b95a07eb62afef51e524a989d9bc9e02aebf2a8` | writes `checks2_default.json` `6324e960772aae4d6017639873c4c93e04e56aea86ba162e3c5cad40f33e10cf` and `checks2_1001_2000.json` `906a828167e89c4477d6eaf649435d515ff46c7bb7197ddb175215b15b9944f4` |
| `fav_bug_probe.py` | `647def88e71341d73ce6f9062013e15ae0eb32e4ab487ea624c2b15e5bf37583` | A1 demonstration; imports the replay copy, hence numpy |
| `symbolic_descent.py` | `9f6a74ceaa8a04c19f3b6d80d3055f5b0d8cd57fd7584a844720972c30194880` | `symbolic_descent.py 10 35` writes `symbolic_J10_U35.json` `c87fded3e736ce7afde7fc99f16fe0d3b5c367ca9d60f0ac72e8920eda7a9863`; `J = 5` gives `4bf34963…` (also positive); `J = 3, 4` give `5d8b7…` and `5d4f7…` (sufficient test fails) |
| `block_sign.py` | `2254145ac78524d1a7173ef74d34c723e32ea5e070f07daf119b810c108b543a` | per-block signs, see below |

`block_sign.py` outputs (`blocksign_<j>_U35.json`):

| Piece | SHA-256 |
|---|---|
| tail | `5601316fa6c8a0b32e9a7906ed2638b302daedef0cfc66e48afd79262821483b` |
| 0 | `bc529bceba45e1c9d9ae32c876dfcf3107313197a9e0c05aa03b08e138580a98` |
| 1 | `499b296c59e4283238677b1ce88236a7256124b36916464b9532f06b724d934c` |
| 2 | `cdc35e6239f75977baa9439c4eb292ef202be875704c371cf0a4528118fdd62f` |
| 3 | `07c8e0101e730131f8549890b88a0a742eb262b1543128dd81966cf01f4dc65f` |
| 4 | `0863ae1c1dadd09262b5bc3b4bb34837d0304700b438c74913720415edcdd025` |
| 5 | `a60dab54428c99071db90f2f4597b4f371175f8b1b38d818689f6b7f5307c802` |
| 6 | `3b888f66ef048d91a2b293e1be1575e4a04648be0b0c5f473982cee6d3266b75` |
| 7 | `ffbdf0248deea8819be91d28bbac92f98a97472baa3600eaea08e5eff140cfc6` |
| 8 | `98eb937cc36f3211f666a898ada1833c314e3149e2bff3af0f810b77c04d2933` |
| 9 | `d0cbf738917e615ab6222f6e9db7ba5272d4da06344af9f453d33e6f658ccc8d` |
| 10 | `2f89714215cbcd211c18a9c0c9f03fdd54abff408a141ed36e3ae83e5641f1ad` |

Replay commands, copy-out-first (from the critic scratch):
```
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-F3-U/own
python3 -B fidelity.py
python3 -B sweep.py 107 2600
python3 -B checks2.py
python3 -B checks2.py 1001 2000
python3 -B symbolic_descent.py 10 35
for j in tail 0 1 2 3 4 5 6 7 8 9 10; do python3 -B block_sign.py $j 35; done
```

Replays of F3 (`replay/`, byte copies of `scratchpad/c1-F3/*.py`, `*.json`; runs in `replay/run/`): every stated digest
reproduced, as listed in R5.

No background job was started, and none is running at the time of writing.
