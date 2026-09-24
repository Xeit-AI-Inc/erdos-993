# Second Read

Cycle 1 isolated second read `SR-RC` — the root-corrected degree lemma (RC), its sharpening (SH), the
strictness theorem, (DL+)/root-deficit, and the `k = 1` criterion. Run
`erdos-993-math-dre-20260924-r27-forest-degree-extension`. Protocol
`control/C1-SECOND-READ-PROTOCOL.md`; brief `control/C1-SECOND-READ-BRIEF-SR-RC.md`.

Operating within VerityOS. Boot files read: `/Users/ashtonsperry/VerityOS/verity.md`,
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. Subsystem loaded for the task: `experiments/`
(this run root only, capsule members only).

---

## Identity and seal audit

**Capsule.** `control/c1-second-read/SR-RC-PACKET-MANIFEST.json`,
`schema_version: verityos.math-dre.packet-manifest.v1`, `stage: cycle-1-second-read-SR-RC`,
`file_count: 67`.

**Seal.** Recomputed as SHA-256 of the compact key-sorted JSON of the manifest minus `seal_sha256`, with
no trailing newline:

```
declared  caf34d6c27b18ff925bf6c76deaef7daef2da5bd5e261fd448916130faadbdf6
computed  caf34d6c27b18ff925bf6c76deaef7daef2da5bd5e261fd448916130faadbdf6
```

**SEAL VERIFIED.** All **67** listed members verified from the bytes: 67 digest matches, 67 byte-length
matches, **0** mismatches, **0** missing. `file_count` agrees with the length of `files`.

**Read boundary.** I read the two VerityOS boot files and, under the run root, only capsule members. I did
**not** read `sources/external/`, `sources/external/lean-source/`, the paper, `sources/authority/`, any
non-member return, critique, adjudication, scratch directory, other experiment root, or any prior-run
record other than the one sealed member `sources/r25/records/C6-ADJUDICATION-T.md`. No `find`, no `find /`,
no `rg`, and no `grep` rooted above a capsule member (the two `grep` invocations I ran were over explicitly
named member files, to locate headings and defined terms inside them). No network, no install, no Lean
build, no `lake`, no `elan`. No background job was started at any point, so no PID existed and no kill —
pattern or otherwise — was issued. Every command ran in the foreground and returned synchronously. I edited
no sealed member; every file I wrote is this deliverable and my own scratch under
`scratchpad/c1-sr-SR-RC/`. Seat, critic and adjudicator instruments inside the capsule were **read** and
never executed as authority; my instrument is written from scratch (see `## Independent re-derivation`).

**Model disclosure.** chartered opus/high; transport-resolved model opus (explicit parameter); the seat
cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

---

## Statements read

Candidates are `cycles/cycle-1/stage6/SYNTHESIS.md` `## Registrations` table B and `## Exact established
results` rows 2, 16, 17, 18, 19; the synthesis wording is the candidate, never the authority.

| id | Object | Primary source in the capsule |
|---|---|---|
| `RC-1` | **(RC)** root-corrected degree lemma `D_k + 2·Σ_i a_{r_i}(k) ≤ 2k·i_k`, every finite forest, every rooting, every `k`, **and its injection proof** | `cycles/cycle-1/stage4/critics/F1/T/CRITIQUE.md` Finding 1; rewritten and sustained line by line at `cycles/cycle-1/stage5/adjudicators/F/ADJUDICATION.md` Established result 1 |
| `RC-2` | **(SH)** `D_k + 2·M_k ≤ 2k·i_k` | `cycles/cycle-1/stage4/critics/F1/U/CRITIQUE.md` finding 2; F adjudication Established result 2 |
| `RC-3` | **Strictness theorem** (equality classification of (DL) and (EX)) | F adjudication Established result 3; `C-F1-T` Finding 1 consequences; `C-F1-U` finding 2 |
| `RC-4` | **(DL+) / root-deficit** with Corollaries A and B | `cycles/cycle-1/stage4/critics/T1/U/CRITIQUE.md` advance 2; `cycles/cycle-1/stage4/critics/T1/F/CRITIQUE.md` F-10 |
| `RC-5` | **`k = 1` criterion** (plain) and the **root-corrected acyclicity equivalence** | `cycles/cycle-1/stage4/critics/T2/U/CRITIQUE.md` findings 1/3; `cycles/cycle-1/stage4/critics/T2/F/CRITIQUE.md` F-4; `C-F1-U` finding 1; F adjudication Established results 2 and 8 |

Definitions are taken from `SEMANTIC-CONTRACT.md` §1 exclusively: `i_k(G) = Erdos993G1.indepCount G k`
(`ℤ`, `i_0 = 1`, `i_k = 0` for `k > α`), `D_k(G) = Σ_{J ∈ I_k} Σ_{v ∈ J} deg_G(v)`, forest = `G.IsAcyclic`
on a finite carrier (disconnected and empty admitted), `e(J) = |V ∖ N[J]|`, `Δ_k = coeff(k+1) − coeff(k)`,
`x(G)` the first **strict** descent. Run-local: `a_v(k) := #{J ∈ I_k(G) : v ∈ J}` (`C-F1-U` writes `c_v(k)`,
`C-T1-U` writes `n_k(v)`; the three are the same function and I use `a_v(k)` throughout), `c` the number of
connected components, `M_k := Σ_{components C} max_{v ∈ C} a_v(k)`.

**Definition agreement for `M_k` (brief's explicit question).** `C-F1-U` defines
`M_k(G) := Σ_{components T} max_{v ∈ T} c_v(k)`; the F adjudication defines
`M_k := Σ_{components T} max_{v ∈ T} a_v(k)`; `C-T1-U`'s (DL+) subtracts
`2·Σ_{i=1}^{c} max_{v ∈ C_i} n_k(v)`. **All three are the same quantity**, with the maximum taken inside
each component and then summed over components ("with multiplicity" across components). I adopt that
definition. The competing reading that `C-F1-U` itself flags — `#{J ∈ I_k : J contains at least one root}`,
i.e. **without** multiplicity — is a strictly smaller quantity, so the inequality also holds under it; it is
a weaker statement and must not be the registered one. The registration text below states the
with-multiplicity reading explicitly, in the unambiguous form `Σ_{J ∈ I_k} #{i : r_i ∈ J}`.

---

## Independent re-derivation

### The instrument

`scratchpad/c1-sr-SR-RC/` — Python standard library only (`itertools`, `json`, `sys`, `hashlib`, `math`),
exact integers only, no floats, no RNG, no network, no third-party package, no wall-clock/PID/host value in
any payload. Written from scratch for this read; the capsule's seat/critic/adjudicator scripts were read for
audit and **not** executed.

Deliberate method differences from every instrument in the capsule: free trees by **pendant extension**
deduplicated by a **centroid-rooted AHU** canonical string; forests as **index-monotone multisets** over the
globally ordered tree catalogue; `i_k` from an **in/out rooted-tree independence-polynomial DP**; and
`a_v(k) = i_{k−1}(G − N[v])` by **re-running the DP on the deleted graph** — so no subset enumeration and no
degree-weighted polynomial appears on the critical path. Subset enumeration is used only as an independent
cross-check and for the graph-general layer.

| File | What it is | SHA-256 |
|---|---|---|
| `srlib.py` | catalogue, forest DP, brute-force cross-check layer | `308fe6ebc430ca7081649fcbf1d5d124a1a8721b698b2dbfb4c360db8e3dc53d` |
| `fixedpoints.py` | `SEMANTIC-CONTRACT.md` §4 fixed points, before any table | `d131868d0234b4cab773abaef2d52c94abfc2e4b2f9c358cdc1866f84ac33019` |
| `rc_check.py` | (RC) at every rooting, (SH), (DL), identities, strictness, (EX)/(EXS)/(LB), Corollary B, `k=1` exactness | `86fe395f66c7ced26f8177299e8bb1a0abf8ca29e9e27ed84762c40e1ae27026` |
| `injection_check.py` | the injection `Φ` **pair by pair** + the double count and the `e(J)` bound, brute-forced | `902fce85808444c5a2c95e3bf1475a2cf00f8eb0f8197d802ca2a71ea1ee914e` |
| `graph_check.py` | the `k = 1` criterion, plain and root-corrected, on arbitrary graphs | `bfb58df44f08dab947ddf968c7a7326be231690401aad08d27766ef96582a2ad` |
| `families.py` | labelled-forest counts by the Cayley recurrence; adversarial families to order 255 | `ada6f5e3061c41d31f0a2315e2cc1868c88d4e45138af4dd8a0c2dcd0c43e549` |
| `sharpness.py` | equality-case census of (RC)/(SH)/(EX)/(EXS)/Corollary B | `6156f81e2c5ccf6781d52f37ed0fcea19c9de818284c0e66dfd0d51d7260a968` |

Census-row payload digest (order, edges, `k`, `i_k`, `D_k`, `M_k` over all 15,206 classes to order 14):
`7989725f8ca30bb0b9e4cdf60c50a4c724dcf8a2c2c96db861463800a91c1338`.

### Fixed points, before any table

All `SEMANTIC-CONTRACT.md` §4 fixed points reproduced and matched: empty forest `i = [1]`, `Δ_0 = −1`,
`x = 0`; `K₁` `i = [1,1]`, `Δ_0 = 0`, `Δ_1 = −1`, `x = 1`; `K₂` `i = [1,2]`, `D_1 = 2`;
`P_1..P_6` sequences; `P_5` `i = [1,5,6,1]`, `D = [0,8,18,4]`; `K_{1,5}` `i = [1,6,10,10,5,1]`
(`i_1 = m+1`, `i_k = C(5,k)` for `k ≥ 2`); edgeless order 6 `D_k ≡ 0`, `i = [1,6,15,20,15,6,1]`. The §4
"(DL) tight cases" label is **not** used as a fixed point — see Finding 4. The §4 r25 rank-5 margins are a
citation, not a computation, and I cite them nowhere.

DP against brute force: every labelled forest to order 6 — `i_k` and `Σ_v a_v(k)` agree set by set,
**0 mismatches**. Population cross-checks, computed analytically and independently of my enumerator: free
trees `1,1,1,2,3,6,11,23,47,106,235,551,1301,3159` (orders 1–14); forest isomorphism classes
`1,1,2,3,6,10,20,37,76,153,329,710,1601,3658,8599` (orders 0–14), cumulative **15,206**; labelled forests by
the Cayley component recurrence `1,1,2,7,38,291,2932,36961,561948,10026505`, cumulative to order 7 =
**40,233**. These reproduce `C-F1-T`'s and the F adjudicator's population figures exactly, from a different
derivation.

### (RC): the injection, re-derived by hand

Setup, from §1 definitions only. `Σ_v a_v(k) = k·i_k` (count incidences `(v, J)`), and
`D_k = Σ_v deg(v)·a_v(k) = Σ_{uv ∈ E}(a_u + a_v)`.

Root every component at a freely chosen `r_i`; let `p` be the parent map, defined exactly on the non-roots.
**Acyclicity use 1:** each component is a tree, so `|E| = n − c` and the edges are in bijection with the
non-root vertices via `v ↦ {v, p(v)}`; hence `D_k = Σ_{v non-root}(a_v + a_{p(v)})`. **Acyclicity use 2:**
`N(v) = {p(v)} ∪ children(v)` exactly — a rooted tree has no edge outside the parent/child relation.
**Acyclicity use 3 (latent; see Finding 1):** `p` is strictly depth-decreasing, so `p(p(u)) ≠ u`.

`S = {(v,J) : v non-root, J ∈ I_k, p(v) ∈ J}`, so `|S| = Σ_{v non-root} a_{p(v)}`;
`T = {(u,K) : u non-root, K ∈ I_k, u ∈ K}`, so `|T| = Σ_{v non-root} a_v`.

```
Φ(v, J) = (v, (J ∖ {p(v)}) ∪ {v})   if no child of v lies in J        (type A)
Φ(v, J) = (w, J), w the least child of v lying in J   otherwise       (type B)
```

*Well defined.* Type A: `v ∼ p(v) ∈ J` and `J` is independent, so `v ∉ J` and `|K| = k`; the only new
adjacency risk is at `v`, whose neighbours are `p(v)` (deleted, by acyclicity use 2) and its children (none
in `J`, by the case hypothesis); `v` is a non-root and `v ∈ K`. Type B: `w ∈ J = K`, and `w` has parent `v`,
so `w` is a non-root. In both branches the image lies in `T`. The tie-break "least child" is only needed to
make `Φ` a function; **injectivity does not depend on which child is chosen**, which matters for the Lean
statement (any choice function will do).

*The separating invariant.* I re-derived it as a **two-sided** dichotomy, stronger than the one-sided form
the critique states: for an image `(u, K)`,

```
Φ(v,J) is of type B   ⟺   p(u) is a non-root (i.e. p(p(u)) exists) and p(p(u)) ∈ K.
```

(⇒) a type-B source is `(p(u), K)` and `(p(u), K) ∈ S` requires `p(p(u)) ∈ K`. (⇐, contrapositive) a type-A
image has `K = (J ∖ {p(u)}) ∪ {u}` with `p(u) ∈ J`; `J` independent and `p(u) ∼ p(p(u))` give
`p(p(u)) ∉ J`; and `p(p(u)) ≠ u` because `p` strictly decreases depth; hence `p(p(u)) ∉ K`.

*Injective.* Given `(u, K)`: if `p(p(u))` exists and lies in `K` the source can only be type B and is forced
to `(p(u), K)`; otherwise the source can only be type A and is forced to `(u, (K ∖ {u}) ∪ {p(u)})`. Either
way the preimage is unique. ∎

*Conclusion.* `Σ_{v non-root} a_{p(v)} ≤ Σ_{v non-root} a_v`, and `Σ_{v non-root} a_v + Σ_i a_{r_i} = k·i_k`
(the roots and non-roots partition `V`), so

```
D_k(G) + 2·Σ_i a_{r_i}(k) ≤ 2k·i_k(G)     for every rooting, every k, every finite forest.        (RC)
```

`k = 0` is covered (both `S` and `T` are empty); `k > α` is covered (`i_k = 0`, all terms `0`); the empty
forest is covered (no components, empty sums); disconnected forests are covered componentwise. No `α` side
condition, no `n ≥ 2`, no `k ≥ 1` anywhere. Finiteness is used for the cardinalities and for the
`card_le_card_of_injOn` step.

### (SH), strictness, Corollary B, the `k = 1` criterion — re-derived

- **(SH).** (RC) holds at **every** rooting and the choices are independent across components, so taking
  `r_i ∈ argmax_{v ∈ C_i} a_v(k)` gives `D_k + 2·M_k ≤ 2k·i_k`. Conversely `Σ_i a_{r_i} ≤ M_k` for any
  rooting, so **(SH) and (RC) are equivalent statements**, not two theorems.
- **Strictness.** If `k ≥ 1` and `i_k > 0`, some `J ∈ I_k` is nonempty, so some `v` has `a_v(k) ≥ 1` and its
  component contributes `≥ 1`: `M_k ≥ 1` and `D_k + 2 ≤ D_k + 2M_k ≤ 2k·i_k`. Conversely `k = 0` gives
  `D_0 = 0 = 2·0·i_0` and `i_k = 0` gives `D_k = 0 = 2k·i_k`. So equality holds **iff** `k = 0` or `i_k = 0`.
- **`k = 1` exactness.** `a_v(1) = 1` for every vertex of any simple graph, so `M_1 = c`; on a forest
  `D_1 = 2|E| = 2(n − c)` and `i_1 = n`, hence `2·i_1 − D_1 = 2c = 2M_1` **exactly**: (RC)/(SH) is an
  identity at `k = 1`, for every rooting.
- **Corollary B.** `M_k ≥ max_v a_v(k) ≥ k·i_k / n` for `n ≥ 1`, so `n·D_k + 2k·i_k ≤ 2k·i_k·n`
  (subtraction-free; equals `n·D_k ≤ 2k·i_k·(n−1)` for `n ≥ 1`, and the subtraction-free form is also true
  at `n = 0`). Equality **exactly** for trees at `k = 1`.
- **`k = 1` criterion, graph-general.** For any finite simple graph, `D_1 = 2|E|`, `i_1 = n`, `M_1 = c`.
  Plain (DL) at `k = 1` is `|E| ≤ n`, an equality iff `|E| = n`. Root-corrected at `k = 1` is `|E| + c ≤ n`;
  since `|E| ≥ n − c` always (a spanning forest has `n − c` edges), this holds iff `|E| = n − c` iff `G` is
  acyclic.
- **(EX)/(EXS).** With the double count and `e(J) ≥ n − k − Σ_{v ∈ J} deg(v)`:
  `(k+1)i_{k+1} = Σ_J e(J) ≥ (n−k)i_k − D_k ≥ (n−3k)i_k + 2M_k`, so (EX) holds and is an equality iff
  `k = 0` or `i_k = 0`.

### Machine replay (my own instrument; bounded computation, horizons on the face)

| Layer | Extent | Result |
|---|---|---|
| (DL), (RC) **at every rooting**, (SH), `Σ_v a_v = k·i_k`, `D_k = Σ_{uv∈E}(a_u+a_v)`, `D_k = Σ_{non-root}(a_v + a_{p(v)})`, strictness, tightness classification, Corollary B, (EX), (EXS), (LB), `k=1` exactness, `\|E\| = n − c` | all **15,206** forest isomorphism classes to order 14, every `k`; all rootings explicitly to order 12 (**46,053** rootings, **431,055** (RC) instances); (SH) covers all rootings beyond | **0 failures** in 160,559 `k`-rows |
| the injection `Φ` **pair by pair** (well-definedness, the two-sided invariant, collisions, `\|S\| ≤ \|T\|`) | all **1,348** classes to order 11, **every** rooting (17,745 rootings), every `k` | **9,242,866** source pairs mapped (6,336,024 type A / 2,906,842 type B): **0 illegal targets, 0 collisions, 0 invariant violations** |
| double count `(k+1)i_{k+1} = Σ_{J∈I_k} e(J)` and `e(J) ≥ n−k−Σ deg`, brute-forced set by set | all 638 classes to order 10 (**114,615** independent sets) and all 1,348 to order 11 (**409,937**) | **0 mismatches**, **0** bound violations |
| `k = 1` criterion, plain and root-corrected, and `M_1 = c` | **all 33,868 labelled graphs on ≤ 6 vertices** (3,272 of them forests) | both equivalences hold with **0 exceptions**; (SH) holds at every `k` on all 3,272 forests |
| cycles `C_3..C_14` | every `k` | (DL) **tight at every `k`**; root-corrected fails at `k = 1`, as it must |
| adversarial families | 20 instances, max order **255**, 18 with `n ≥ 21` — stars to `K_{1,199}`, `P_201`, spiders `7×28`, caterpillars, complete binary trees to depth 7, edgeless 50, `30K₂`, mixed unions | (SH), strictness, (EX), (LB), Corollary B: **0 failures** |

**Sharpness of the correction term** (new here, and it settles whether `M_k` is the right object): (RC) is an
equality at `k = 1` **at every rooting on every forest** (6,984 rootings to order 10, all tight), and (SH) is
attained with equality at `k ≥ 2` on **1,444** forest classes with at least one edge to order 12 — e.g.
`K₂ ⊔ 10K₁` at every `k = 2..9`, and `P₄` at `k = 2` (`D_2 = 8`, `M_2 = 2`, `i_2 = 3`, `8 + 4 = 12 = 2·2·3`).
Corollary B is attained at exactly **987** rows to order 12 — precisely the 987 trees of orders 1–12, all at
`k = 1`, confirming `C-T1-F`'s "equality for every tree at `k = 1`" as an exact classification within the
horizon. Nontrivial tight cases of (DL): **0**. Nontrivial tight cases of (EX): **0**.

Named witnesses recomputed: `K₄` `i = (1,4,0,0,0)`, `D = (0,12,0,0,0)`, fails (DL) at `k = 1` only;
`K₄ − e` `i = (1,4,1)`, `D = (0,10,4)`, fails at `k = 1` (edge-minimal, `|E| = 5`); `K_{2,3}`
`i = (1,5,4,1)`, `D = (0,12,18,6)`, fails at `k = 1` **and** `k = 2`; `C₄` fails nowhere; bowtie
`D_1 = 12 > 10`, `D_2 = 16 = 2·2·4` (tight, not a failure). All agree with the capsule's reports.

---

## Findings and repairs

**Finding 1 (repair to the proof of record; the load-bearing one for Stage 7).** The injectivity argument as
written in `C-F1-T` and as restated in the F adjudication's node (v) contains one **unstated** step. The
text is: "a type-A image has `K = (J ∖ {p(u)}) ∪ {u}` with `p(u) ∈ J`, and `J` independent forces
`p(p(u)) ∉ J`, hence `p(p(u)) ∉ K`." The "hence" is valid only because `p(p(u)) ≠ u`: `K ⊆ J ∪ {u}`, so
`p(p(u)) ∉ J` alone leaves `p(p(u)) = u` open, and if `p(p(u)) = u` were possible the case split would
collapse (a type-A image would also satisfy the type-B test, since `u ∈ K` always). `p(p(u)) ≠ u` is true —
the parent map of a rooted forest strictly decreases depth — but it is a **third, latent use of the rooted
acyclic structure**, additional to the two the adjudication names, and the formalizer must supply it from
the rooting API (a `depth` function with `depth (p v) < depth v`, or `p v` landing in the strict ancestors).
**The statement is unaffected; the proof text and the Stage 7 node list must name this step.** This is the
only gap I found in `C1-LA1`'s proof of record. I verified computationally that the dichotomy is in fact
two-sided and exact (9,242,866 pairs, 0 violations), which is the strongest form the formalizer should
prove: *the image is of type B iff `p(p(u))` exists and lies in `K`*.

**Finding 2 (repair to the registration structure; three keys, not five).** (RC), (SH), `C-T1-U`'s **(DL+)**
and `C-T1-F`'s **root-deficit** are **one object in four presentations**. `C-T1-F`'s candidate is verbatim
(RC) (every rooting); `C-T1-U`'s (DL+) is verbatim (SH) (max rooting); and (RC) ⟺ (SH) in both directions,
as proved above. Synthesis table B lists them as two second-read items and the risk of two keys for one
theorem is live. **Register one canonical key** — the every-rooting form — because (i) it is exactly what
the injection proof produces, (ii) it is the cheapest Lean statement (no component decomposition, no
`Finset.sup`/`max'` and no nonemptiness side condition), and (iii) every other presentation is one line
away from it. The max form, (DL+), the root-deficit and Corollary B become **named corollary clauses on the
same face**.

**Finding 3 (what of (DL+)'s corollaries is not a restatement).** **Corollary A is subsumed** — it is the
`M_k ≥ 1` case of the strictness theorem, strictly weaker, and must not carry a key of its own.
**Corollary B is not a restatement**: `n·D_k + 2k·i_k ≤ 2k·i_k·n` eliminates the rooting and the auxiliary
`a_v` entirely and is a statement purely in `n, k, D_k, i_k`, sharp for every tree at `k = 1` (987 equality
rows to order 12, all trees, all at `k = 1`). It earns a **named corollary clause** on the canonical face,
with its honest scope (`C-T1-F`'s own: fed through (EX) it still yields `n = 4k` as the largest integer
solution, so it moves no order bound). I do not recommend a separate key for it: it has no downstream
consumer and a second key for a strict consequence of the same object is exactly the alias hazard the run
has been guarding.

**Finding 4 (repair to the strictness statement's precision).** The brief's gloss "never tight at `k ≥ 1`"
is not the theorem; `k > α` gives `i_k = 0` and a trivial equality at every `k ≥ 1`. The synthesis's row 17
wording ("except at `k = 0` and `i_k = 0`") is correct, and the correct registrable form is an **iff**:
`D_k = 2k·i_k ⟺ k = 0 ∨ i_k = 0`. The `i_k > 0` hypothesis must travel on the face. Same for (EX) —
including the fact that (EX) is tight at `k = 0` on **every finite graph**, not only forests. This upgrades
packet erratum **R27-E-b**: `SEMANTIC-CONTRACT.md` §4's "(DL) tight cases (e.g. edgeless forests …; single
edges)" has **no instances at all** at `k ≥ 1` with `i_k > 0` — I confirm it directly (edgeless order `n` at
`k ≥ 1`: `D_k = 0 < 2k·C(n,k)`; `K₂` at `k = 1`: `D_1 = 2 < 4`). The §4 **values** are right; the **label**
is empty. This is a record correction, not an edit of a sealed member (fence §3.5).

**Finding 5 (repair: ℕ-subtraction and the multiplicity reading in the registered text).** Three
subtraction-safety items for the faces and for Stage 7. (a) The correction term must be written
`2·Σ_i a_{r_i}(k)`, equivalently `2·Σ_{J ∈ I_k} #{i : r_i ∈ J}` — **with multiplicity across components**;
the "at least one root" reading is a different (weaker) statement, as `C-F1-U` itself flags. (b) The final
step must be assembled **additively** — `Σ_{non-root} a_v + Σ_i a_{r_i} = k·i_k`, never
`Σ_{non-root} a_v = k·i_k − Σ_i a_{r_i}` — so no ℕ-subtraction ever appears; the registered inequality and
(SH) are already subtraction-free. (c) Corollary B and the `k = 1` criterion must be stated subtraction-free
(`n·D_k + 2k·i_k ≤ 2k·i_k·n`; `|E| + c ≤ n`) rather than with `n − 1` and `n − c`; I verified the
subtraction-free forms hold on all 65,653 `k`-rows to order 13 **including `n = 0`**, where the `n − 1` form
is not even well posed in ℕ.

**Finding 6 (fence: the carrier hypothesis must be on the key, not only in the statement).** (RC)/(SH) are
**false** without acyclicity — every cycle `C_n` violates the root-corrected `k = 1` form
(`D_1 + 2c = 2n + 2 > 2n = 2·i_1`), and I confirm this for `C_3..C_14` and across all 33,868 graphs to order
6. The brief's candidate key `E993-R27-ROOT-CORRECTED-DEGREE-LEMMA` carries no carrier marker, unlike its
sibling `E993-R27-FOREST-DEGREE-LEMMA`. It is a sound predicate and asserts nothing the statement does not,
so it is **not** a blocker; I nevertheless recommend the carrier-bearing spelling
`E993-R27-FOREST-ROOT-CORRECTED-DEGREE-LEMMA` and write the registration text under it. The controller may
keep the brief's spelling with no change to the statement, grade, attribution or fences.

**Finding 7 (provenance of the second presentation, for the attribution line).** `C-T1-F`'s root-deficit and
`C-T1-U`'s (DL+) are derived from T1's polynomial `(★)`, and T1's §3 Step c was **refuted** and repaired by
those same critics. The two presentations are therefore genuinely independent of the injection in mechanism,
but their warrant is the **corrected** chain. The face must name the injection of `C-F1-T` as the **proof of
record** and the corrected two-potential chain as the **second, independent derivation** — not the other way
round, and not as though T1's shipped §3 were the warrant.

**Finding 8 (Gate ruling 2 hygiene on the fidelity remark).** The F adjudication records that (RC) "is
verbatim the paper's own displayed step immediately preceding (8.8)", and the synthesis reuses this as
"the strongest fidelity evidence this run has produced". **I could not and did not check it** — the paper is
not a capsule member and the external slice is off-limits. It is admissible only as a **fidelity remark**;
it is **not** evidence of the theorem and must not appear on the award face as warrant or attribution of
proof. The warrant is the in-run injection.

**Finding 9 (alias check not dischargeable at this seat).** `sources/authority/CLAIM-IDENTITY.json` is not a
capsule member, so I could run no registry alias check. The synthesis's check (zero matches across 370
claims, 452 aliases, 132 alias_patterns) and `C-T1-F`'s own check covered the spellings
`E993-R27-FOREST-DEGREE-LEMMA-ROOT-DEFICIT` and `-ROOT-SHARPENED`. **My proposed spellings differ from
both**, so the controller must re-run the alias check against the exact keys below before registering.

**Nothing rejected.** No numeric, structural or logical error was found in (RC), (SH), the strictness
theorem, (DL+), Corollaries A and B, or either `k = 1` criterion. Every hypothesis claimed is used, and no
hypothesis is used that is not claimed: acyclicity (three uses, one latent — Finding 1) and finiteness only;
**no** `α`/`hyp-alpha`, **no** `k ≥ 1`, **no** `n ≥ 2`, **no** connectivity, **no** nonemptiness. Fences
`SOLUTION-CONTRACT.md` §3.1–§3.8 checked item by item: §3.1 none of these is an order bound and none
transfers status to `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER,
`E993-BETA-AGG`, the all-rank aggregate or Erdős #993; §3.2 nothing asymptotic, no `N₀`, no CLT, no
unimodality; §3.3 every statement is a sum over `I_k` (or a global edge/vertex count) — **no pointwise
degree statement anywhere**, and none is registrable; §3.4 no census input enters any of these statements,
so none carries a census grade, and the bounded-computation tables above are corroboration, never warrant;
§3.5 no sealed member edited; §3.6 no external Lean text read, copied or quoted; §3.7 attribution on every
face, below; §3.8 `E993-R25-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` is a premise nowhere.

---

## Registration text

Register **three** keys. Items `RC-1`, `RC-2` and `RC-4` collapse into **KEY 1**.

### KEY 1

**Key:** `E993-R27-FOREST-ROOT-CORRECTED-DEGREE-LEMMA`
(the brief's candidate `E993-R27-ROOT-CORRECTED-DEGREE-LEMMA` is acceptable and changes nothing below;
Finding 6 explains the preference. Register exactly one of the two.)

**Statement.** Let `X` be a finite type, `G : SimpleGraph X` with `hG : G.IsAcyclic`, and let `k : ℕ`. Let
`I_k(G)` be the independent `k`-subsets, `i_k(G) = Erdos993G1.indepCount G k`,
`D_k(G) = indepDegreeSum G k = Σ_{J ∈ I_k} Σ_{v ∈ J} deg_G(v)`, and `a_v(k) = #{J ∈ I_k : v ∈ J}`. Then for
**every** choice of exactly one root `r_i` in each connected component `C_i` of `G`,

```
(D_k(G) : ℤ)  +  2 · Σ_i (a_{r_i}(k) : ℤ)   ≤   2 * k * i_k(G),
```

where the correction is summed over components **with multiplicity**, i.e.
`Σ_i a_{r_i}(k) = Σ_{J ∈ I_k} #{i : r_i ∈ J}`. Hypotheses consumed: acyclicity (three uses — the edge ↔
non-root bijection `|E| = n − c`; `N(v) = {p(v)} ∪ children(v)`; the parent map strictly decreases depth, so
`p(p(u)) ≠ u`) and finiteness. **No** `α` side condition, **no** `k ≥ 1`, **no** `n ≥ 2`, **no**
connectivity; disconnected and empty forests included; the root is a parameter of the statement, never of
the proof's validity.

**Named corollary clauses on this same face (no second key for any of them):**

- **(DL)** `D_k(G) ≤ 2k·i_k(G)` — drop the nonnegative correction. This is the Tier-1 target
  `E993-R27-FOREST-DEGREE-LEMMA`, which stays at its own key; this face is its strengthening.
- **(SH) = (DL+) = the max-rooting/root-deficit presentation.** With
  `M_k := Σ_{components C} max_{v ∈ C} a_v(k)`: `D_k + 2·M_k ≤ 2k·i_k`. **Equivalent** to the statement
  above (take `r_i ∈ argmax_{v∈C_i} a_v(k)`; conversely `Σ_i a_{r_i} ≤ M_k`). Attained with equality: at
  `k = 1` on every finite forest at every rooting, and at `k ≥ 2` on forests with edges (e.g. `P₄` at
  `k = 2`; `K₂ ⊔ 10K₁` at `k = 2..9`) — so `M_k` is the exact correction term.
- **Corollary B (auxiliary-free, `C-T1-F`).** `n·D_k(G) + 2k·i_k(G) ≤ 2k·i_k(G)·n` (subtraction-free; for
  `n ≥ 1` this is `n·D_k ≤ 2k·i_k·(n−1)`), with equality **exactly** for trees at `k = 1`. Scope, on the
  face: it moves **no** order bound — fed through (EX) it still yields `n = 4k` as the largest integer
  solution.
- **(EXS)** `(k+1)·i_{k+1} ≥ (n − 3k)·i_k + 2·M_k` in `ℤ`. This clause **composes** with
  `E993-R27-INDEP-EXTENSION-DOUBLE-COUNT` and `E993-R27-EXTENSION-LOWER-BOUND` (both `formally_verified`,
  graph-general); its grade is this face's, not theirs. It does **not** improve (LB): `Δ_k < 0` still yields
  only `n ≤ 4k`, adding at `n = 4k` only the side condition `i_k > 2M_k`.

**Grade.** `proved_informal`.

**Attribution.** Mathematics of the degree lemma: Fang–Lu–Nevo–Yao–Zheng 2026, *Unimodality of Independence
Polynomials for Sufficiently Large Forests*, arXiv:2609.20961v1, §8 — **attribution only; per Gate ruling 2
the paper is not evidence and is not the warrant of this statement**. In-run **proof of record**: the
type-A/type-B injection `Φ` of critic `C-F1-T` (r27 Cycle 1), verified line by line and machine-checked pair
by pair by the F adjudicator. Second, **independent** in-run derivation of the same object: `C-T1-F`
(root-deficit, verbatim this statement) and `C-T1-U` ((DL+), the max form), from T1's two-potential
architecture **as corrected by those critics** (T1's shipped §3 Step c is refuted and is not the warrant).
Correction term `M_k`, the `k = 1` exactness and (EXS): `C-F1-U`. Isolated second read: `SR-RC` (this file).

**Fences.** §3.1 — a counting inequality, **not** an order bound; no status transfer to
`E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER, `E993-BETA-AGG`, the
all-rank aggregate or Erdős #993; no no-recovery reading. §3.2 — nothing asymptotic. §3.3 — an **average
over `I_k`**; no pointwise degree statement is made, implied or registrable. §3.4 — no census input; the
bounded-computation replays carry their horizons and are corroboration, never warrant. §3.6 — every Lean
declaration authored in-run; no external Lean text. §3.7 — the attribution above travels on the face.
**Carrier fence:** the statement is FALSE without acyclicity (`C_n` violates it at `k = 1`), so `IsAcyclic`
must travel on the face and the key must never be read as graph-general. **Stage 7 note:** the latent third
use of acyclicity (`p(p(u)) ≠ u`) is a required node of the rooting API; assemble the last step additively
(`Σ_{non-root} a_v + Σ_i a_{r_i} = k·i_k`) so no ℕ-subtraction arises.

### KEY 2

**Key:** `E993-R27-FOREST-DEGREE-LEMMA-EQUALITY-CLASSIFICATION`

**Statement.** For every finite forest `G` (`G.IsAcyclic`, finite carrier), with `n = Nat.card X`, `c` the
number of connected components, `M_k` as above:

1. `D_k(G) = 2k·i_k(G)` **if and only if** `k = 0` or `i_k(G) = 0`.
2. For `k ≥ 1` with `i_k(G) > 0`: `D_k(G) + 2·M_k ≤ 2k·i_k(G)` with `M_k ≥ 1`, hence
   `D_k(G) + 2 ≤ 2k·i_k(G)`. The bound `2` is sharp (attained by every tree at `k = 1`).
3. At `k = 1`: `D_1(G) + 2c = 2·i_1(G)` **exactly** (equivalently `|E| + c = n`), so the `k = 1` slack of
   (DL) is exactly `2c`.
4. The same classification for (EX): `(k+1)·i_{k+1} = (n − 3k)·i_k` if and only if `k = 0` or `i_k = 0`; and
   `(k+1)·i_{k+1} ≥ (n − 3k)·i_k + 2` for `k ≥ 1` with `i_k > 0`. (EX) is tight at `k = 0` on **every**
   finite graph, not only on forests.

**Grade.** `proved_informal`. Clause 4 additionally consumes `E993-R27-INDEP-EXTENSION-DOUBLE-COUNT` and
`E993-R27-EXTENSION-LOWER-BOUND` (both `formally_verified`, graph-general); its grade stays
`proved_informal` — the weakest input governs and no formal grade promotes it.

**Attribution.** `C-F1-T` (the strictness consequence of the injection) and `C-F1-U` (the `M_k` form, the
`k = 1` exactness) — reached independently; `C-T1-F` Corollary A (the weak `+2` form, from the corrected
`(★)`); F adjudicator (line-by-line verification, 40,233 labelled forests); T adjudicator (0 tight cases
over 85,625 classes); `SR-RC` (this file: the iff form, and 0 nontrivial tight rows in 160,559 `k`-rows over
15,206 classes to order 14). FLNYZ 2026 §8 for the underlying degree lemma, attribution only.

**Fences.** §3.1/§3.2/§3.3/§3.6/§3.7 as for KEY 1. **Record correction carried on this face (not an edit of
a sealed member — §3.5):** `SEMANTIC-CONTRACT.md` §4's "(DL) tight cases (e.g. edgeless forests …; single
edges)" label has **no instances** at `k ≥ 1` with `i_k > 0` (packet erratum **R27-E-b**, here upgraded from
erratum to theorem); the §4 fixed-point **values** are correct and unchanged. **Excluded conclusion for
`C1-LA1`:** no tightness claim about (DL) or (EX) may be registered on any award face, and a zero-failure
census must never be cited as the reason — clause 1 is the reason.

### KEY 3

**Key:** `E993-R27-DEGREE-LEMMA-K1-ACYCLICITY-CRITERION`

**Statement.** Let `G` be **any** finite simple graph on a finite carrier, `n` its order, `|E|` its edge
count, `c` its number of connected components. Note `a_v(1) = 1` for every vertex, so `M_1 = c`.

1. **Registrable form (root-corrected).** `D_1(G) + 2c ≤ 2·i_1(G)` **⟺** `|E| + c ≤ n` **⟺** `G` is
   acyclic (a finite forest). Finiteness only; **acyclicity is the conclusion, not a hypothesis**.
2. **Recorded fact about plain (DL) on non-forests (no second key).** `D_1(G) ≤ 2·i_1(G)` **⟺** `|E| ≤ n`,
   with equality **⟺** `|E| = n`. Hence plain (DL) **does not certify acyclicity**: every cycle `C_n`
   satisfies (DL) with **equality at every `k`**, and every unicyclic graph (`|E| = n`) is tight at `k = 1`.
   The order-minimal (DL) failures are `K₄` (`n = 4`, `|E| = 6`) and `K_{2,3}` (`n = 5`, `|E| = 6`, failing
   at `k = 1` and `k = 2`); the edge-minimal one is `K₄ − e` (`n = 4`, `|E| = 5`, `D_1 = 10 > 8`).

**Grade.** `proved_informal` for both clauses (each is a two-line identity plus `|E| ≥ n − c`). The separate
"excess-1 never fails at any `k ≥ 2`" result is `bounded_computation` at its horizons and is **not** part of
this face.

**Attribution.** Plain form: `C-T2-U` (finding 3) and `C-T2-F` (F-4), independently. Root-corrected form —
the registrable one: `C-F1-U` (finding 1) and `C-F1-T` (Finding 1's consequence). F adjudicator (Established
results 2 and 8). `SR-RC` (this file: both equivalences verified on all 33,868 labelled graphs to order 6,
0 exceptions). FLNYZ 2026 §8 for the underlying degree lemma, attribution only.

**Fences.** §3.1 — not an order bound, no status transfer. §3.3 — aggregate statement; no pointwise degree
claim. §3.4 — no census grade on this face. §3.7 — attribution travels. **Registration fence:** the plain
`k = 1` form is recorded **as a fact about (DL) on non-forests** and gets **no key of its own**; the two
forms must never both be registered, and the plain form must never be described as an acyclicity criterion.
Statement 2's witnesses are order-minimal vs edge-minimal and must be labelled as such.

### What is *not* registered by this read

`C-T1-U`'s Corollary A — subsumed by KEY 2 clause 2 (strictly weaker); no key. `C-T1-U`'s suggested
`E993-R27-FOREST-DEGREE-LEMMA-ROOT-SHARPENED` and `C-T1-F`'s suggested
`E993-R27-FOREST-DEGREE-LEMMA-ROOT-DEFICIT` — the same object as KEY 1; **do not register**. `C-F1-U`'s
auxiliary-free (EXS) corollary `n(k+1)i_{k+1} + 3kn·i_k ≥ (n² + 2k)i_k` — correct (I re-derived and replayed
it), but it is a composition of KEY 1's (EXS) clause with the two counting theorems and belongs on the (EX)
face if anywhere; no key. The FLNYZ fidelity remark (Finding 8) — a remark, never warrant.

---

## Verdicts

verdict[RC-1]: confirmed_with_repairs
verdict[RC-2]: confirmed_with_repairs
verdict[RC-3]: confirmed_with_repairs
verdict[RC-4]: confirmed_with_repairs
verdict[RC-5]: confirmed_with_repairs

Repairs, by id — `RC-1`: the unstated `p(p(u)) ≠ u` step in the injectivity argument, a third and latent use
of the rooted acyclic structure, to be named in the proof of record and in `C1-LA1`'s node list (Finding 1);
the two-sided form of the separating invariant; the additive assembly of the last step (Finding 5b); the
carrier-bearing key spelling (Finding 6); the attribution ordering (Finding 7). `RC-2`: (SH) is **not** a
second registration — it is the max-rooting presentation of `RC-1` and is recorded as a named corollary
clause; the `M_k` definition and the with-multiplicity reading stated explicitly (Findings 2, 5a). `RC-3`:
the registrable form is an **iff** with the `i_k > 0` hypothesis on its face, stated subtraction-free, with
the (EX) counterpart's `k = 0` tightness noted as graph-general; carries the R27-E-b record correction
(Finding 4). `RC-4`: same object as `RC-1`, one canonical key; Corollary A subsumed, Corollary B kept as a
named corollary clause in its subtraction-free form (Findings 2, 3, 5c). `RC-5`: both forms confirmed, the
root-corrected one registrable and the plain one recorded without a second key, stated subtraction-free
(`|E| + c ≤ n`) and with acyclicity as conclusion rather than hypothesis (Finding 5c).

**No statement assigned to this read is rejected.** The mathematics of (RC), (SH), the strictness theorem,
(DL+)/root-deficit with Corollaries A and B, and both `k = 1` criteria is correct as stated, on hypotheses
exactly acyclicity and finiteness, and every numeric claim I could reach replayed with **0** failures.

---

## Artifact inventory

**Deliverable — the only file written outside my scratch:** `second-reads/SR-RC/SECOND-READ.md` (this file).

**Scratch — all under `scratchpad/c1-sr-SR-RC/`; nothing written anywhere else**, nothing under `sources/`,
`control/`, `cycles/`, any other seat's, critic's or adjudicator's scratch, or any system temporary
directory. The seven scripts and their SHA-256 digests are tabulated under `## Independent re-derivation`;
census-row payload digest `7989725f8ca30bb0b9e4cdf60c50a4c724dcf8a2c2c96db861463800a91c1338`.

**IMPORT LIST** (every script of this read; Python standard library only): `itertools`, `json`, `sys`,
`hashlib`, `os`, `math.comb`, `functools`. No network, no `pip`/`brew`/`npm`/`elan`, no third-party package,
no Lean build, no `lake` invocation, no floats, no RNG, no `decide`-style oracle. No hashed or reported
payload contains a wall-clock, PID or host field.

**Background jobs.** **None was started at any point.** Every command ran in the foreground and returned
synchronously, so there was no PID to kill and **no pattern kill and no process listing were issued**. No
background job is running at this final write.

**Read boundary, exactly.** VerityOS: `verity.md` and `identity/startup-protocol.md`. Run root: the dispatch
wrapper `control/dispatch/c1-second-read/DISPATCH-SR-RC.md`, the manifest
`control/c1-second-read/SR-RC-PACKET-MANIFEST.json`, and capsule members only —
`SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C1-SECOND-READ-PROTOCOL.md`,
`control/C1-SECOND-READ-BRIEF-SR-RC.md`, `cycles/cycle-1/stage6/SYNTHESIS.md`,
`cycles/cycle-1/stage5/adjudicators/F/ADJUDICATION.md`, and the critiques
`cycles/cycle-1/stage4/critics/{F1/T, F1/U, T1/U, T1/F, T2/U, T2/F}/CRITIQUE.md`. All other members were
verified by digest and not opened. I read **no** external source, **no** paper, **no**
`sources/external/lean-source/`, **no** registry, **no** Mathlib source (none was needed: this read produced
no Lean), **no** non-member file. No `find`, no `find /`, no `rg`, no recursive listing, no globbed `cat`.

**Undischarged at this seat.** The registry alias check for the three proposed key spellings (Finding 9) —
`sources/authority/CLAIM-IDENTITY.json` is not a capsule member. The FLNYZ §8 verbatim-coincidence claim
(Finding 8) — out of read boundary, and inadmissible as evidence in any case.

Reread before close.

chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.
