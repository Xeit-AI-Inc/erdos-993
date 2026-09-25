# Second Read

Isolated second reader `SR-BOUNDARY`, r29 Cycle 1 (Erdős #993: certify the uniform high-tail mechanism and its
non-residual top-rank consequence). Statements read: `SR-8a` (B1), `SR-8b` (B2), `SR-8c` (B3) of the Tier 2 record
`E993-R29-HIGH-TAIL-BOUNDARY-RECORD`. Date 2026-09-25.

## Identity and seal audit

**Boot.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, as the dispatch requires, and no other VerityOS-root file.

**Model disclosure.** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Read-boundary disclosures.**
1. Read: the dispatch `control/dispatch/c1-second-read/DISPATCH-SR-BOUNDARY.md`, the protocol, my brief, my capsule
   manifest, and capsule members only. Members read in full: `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`,
   `control/c1-second-read/PATH-CHECK-SR-BOUNDARY.json`, `control/C1-STAGE5-CONTROLLER-FACTS-F.json`,
   `control/CONTROLLER-NOTES.json`, `cycles/cycle-1/stage3/returns/F1/RETURN.md`, both F1 critiques,
   `cycles/cycle-1/stage5/adjudicators/F/ADJUDICATION.md`. Members read in part: `SYNTHESIS.md` (the boundary record,
   companion table, evidence-grade table, rulings 8–9, located by `grep` on that file), `AUTHORIZATION.md` and
   `control/C1-STAGE1-GATE.md` (`grep` for second-read/fence rules), `control/CLAIM-IDENTITY.run-local.json` (a Python
   query for the two entries `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` and `E993-BETA-TARGET`, and a key scan for
   `BOUNDARY`/`HIGH-TAIL`), `Main.lean` (`grep` for the definition lines of entries 1–14). The remaining members
   (`C1-STAGE6-PACKET-MANIFEST.json`, `SOURCE-DIGESTS.json`) were digest-checked only.
2. The harness saved two over-long reads (the F1 return and the F adjudication) to its own tool-results files under
   `~/.claude/projects/…`; I read them from there. Their content is the sealed members, digest-checked on disk.
3. The harness injected the repository `CLAUDE.md` and the user auto-memory index into my context unprompted. I did not
   open those files and nothing below depends on them.
4. I did not read any seat, critic or adjudicator scratch instrument (none is a capsule member), the controller's
   pre-run, any other second read, the network, or any file outside the grant. No `find`, no recursive
   `grep`/`rg`/`ls -R`; no installs; no Lean/`lake`; no background jobs (every run was foreground and ran to
   completion). Python standard library only, exact integers (`int`, `fractions.Fraction`).

**Capsule seal.** SHA-256 over `json.dumps(manifest minus seal_sha256, sort_keys=True, separators=(",", ":"))`, no
trailing newline: `9d9a8f201919e11011a065856afbbbed5f8b5b2824893c8bd0d730d3f5e71bd5` — **matches** the dispatch and the
manifest. All 18 members match their listed byte counts and SHA-256 (recomputed on disk at the start of the read).
`PATH-CHECK-SR-BOUNDARY.json` reports 0 findings.

**Close-of-read re-check (disclosure).** Re-hashing the 18 members before writing this file: 17 still match;
`control/CONTROLLER-NOTES.json` (a `"living_file": true` record) no longer matches its capsule digest `175bf497…92c`.
I did not write to it; it changed on disk during this read, outside my control. I read it once, immediately after
the start-of-read seal check, and did not re-open the changed version. Nothing in this read depends on it (it was
read for context only; its errata R29-E-a/R29-E-c agree with the sealed Stage 5 controller facts).

**Registry keys touched.** Candidate `E993-R29-HIGH-TAIL-BOUNDARY-RECORD` (absent from the run-local registry; key scan
found only `E993-C3-SR2-SINGLETON-BOUNDARY-WITNESS` (VERIFIED, unrelated) and `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE`
(OPEN)). Input of record: (HTP) `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` at `proved_informal` (brief: fact of record; not
re-read). Scope-note key: `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN; statement read verbatim). Fence key:
`E993-BETA-TARGET` (REFUTED; governed RTree scope, read verbatim). No status is changed by this read.

## Statements read

- **`SR-8a` (B1).** For every integer `α ≥ 2` there is a tree `T` of order `2α` with `α(T) = α` and an original leaf `v`
  whose (HTP) term `Δ_{p−1}(T − {v,s}) − Δ_{p−1}(T − N[s])` is strictly positive at `p = ⌊2α/3⌋`, one rank below the
  guard floor `⌈(2α+1)/3⌉`; Family A (C-F1-T) and Family B (C-F1-U) with the closed forms and sign claims in the brief.
- **`SR-8b` (B2).** For every `α ≥ 2` the largest `p` with a positive leaf term on trees is exactly `⌊2α/3⌋`
  (B1 lower bound; (HTP) upper bound); grade `proved_informal`; agreement with the F adjudicator's bounded table.
- **`SR-8c` (B3).** Minimal witnesses (`bounded_computation`): trees at `3p = 2α` order 6, exactly `P_6` and
  `S(1,2,2)`, `α = 3`, `p = 2`, term `+1`; trees at `3p = 2α − 1` order 3 (`P_3`, `p = 1`, `+1`); labelled bipartite
  graphs order 5 (`P_3 ⊔ K_2`, `+1`) and order 3.
- **Scope note (not attacked).** The synthesis's restatement of the open region of
  `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` as `{(T,p) : x(T) + 2 ≤ p ≤ ⌊2α(T)/3⌋}`, depth `α − p ≥ ⌈α/3⌉`.

## Independent re-derivation

Definitions used (SEMANTIC-CONTRACT §1; `Main.lean` entries 8, 9, 11, 12 checked by `grep`): `H G v = {v, s}`,
`R G v = insert s (neighborFinset s)`; `i_k(G − D)` counts independent `k`-subsets of `V ∖ D` on the original carrier;
`Δ_k(G − D) = i_{k+1} − i_k` in ℤ. Write `term_G(v,p)` for the (HTP) term, `p ≥ 1` (so `p − 1` in ℕ is the integer
rank). Independence polynomials `I(G; x) = Σ_k i_k x^k`; then `term(p) = [x^p − x^{p−1}](I(G − H_v) − I(G − R_v))`.

**Family A (proof).** `T_A(m)`, `m ≥ 1`: centre `s`, leaf `v ~ s`, legs `s – w_i – u_i` (`i = 1..m`). It has `2m + 2`
vertices and `2m + 1` edges and is connected, so it is a tree; `v` has the unique neighbour `s`, so it is an original
leaf with support `s`. `α = m + 1`: the edges `{v,s}, {w_i,u_i}` partition `V` into `m + 1` pairs (upper bound) and
`{v, u_1, …, u_m}` is independent (lower bound). So order `= 2α`, `m = α − 1` (ℕ-subtraction safe: `α ≥ 2`).
`T − {v,s} = mK_2`, so `I = (1 + 2x)^m`; `N[s] = {s, v, w_1..w_m}`, so `T − N[s] = mK_1`, `I = (1 + x)^m`. Hence for
every `p ≥ 1`
`term(p) = [C(m,p)2^p − C(m,p−1)2^{p−1}] − [C(m,p) − C(m,p−1)] = C(m,p)(2^p − 1) − C(m,p−1)(2^{p−1} − 1)`.
Using `C(m,p) = C(m,p−1)(m − p + 1)/p` (valid for every `p ≥ 1`, both sides `0` when `p ≥ m + 2`) and
`m − p + 1 = α − p = (t + p)/2` with `t := 2α − 3p ∈ ℤ`:
`term(p) = (C(m,p−1)/p)·[(t+p)(2^{p−1} − ½) − p(2^{p−1} − 1)] = (C(m,p−1)/p)·[t(2^{p−1} − ½) + p/2]`.
Signs: `2^{p−1} − ½ > 0`. If `t ≥ 0` the bracket is `≥ p/2 > 0`, and `C(m,p−1) > 0` because `t ≥ 0` gives
`p ≤ 2α/3 < α = m + 1`; so `term(p) > 0` exactly for `1 ≤ p ≤ ⌊2α/3⌋`. If `t ≤ −1` the bracket is
`≤ (p + 1 − 2^p)/2 ≤ 0` because `2^p − 1 ≥ p`; so `term(p) ≤ 0` for every `p ≥ ⌈(2α+1)/3⌉` (strictly `< 0` for
`⌈(2α+1)/3⌉ ≤ p ≤ α`, since there `p ≥ 2` and `C(m,p−1) > 0`; `= 0` for `p ≥ α + 1`). At `t = 0` the value is
`C(m,p−1)/2`. At `p = ⌊2α/3⌋` (`≥ 1` because `α ≥ 2`) the term is positive. **Family A is proved.**

**Family B (proof).** `T_B(m)`, `m ≥ 0`: path `v – s – w – c` plus `m` edges `a_i – b_i` with each `a_i ~ c`. `2m + 4`
vertices, `2m + 3` edges, connected: a tree; `v` is an original leaf with support `s`, `N(s) = {v, w}`. `α = m + 2`:
the perfect matching `{vs, wc, a_ib_i}` (upper) and the independent set `{v, w, b_1..b_m}` (lower). Order `= 2α`,
`m = α − 2` (safe: `α ≥ 2`). `T − {v,s}` is the spider at `c` with one leg `w` and `m` legs `a_i – b_i`:
`I_H = (1 + x)(1 + 2x)^m + x(1 + x)^m` (split on `c ∉ / ∈` the set). `T − N[s] = T − {v,s,w}`:
`I_R = (1 + 2x)^m + x(1 + x)^m`. So `I_H − I_R = x(1 + 2x)^m`, i.e. `i_j(H) − i_j(R) = q_j := C(m,j−1)2^{j−1}`
(`q_0 = 0`; these are the independent `j`-sets of `T − {v,s}` meeting `W = {w}`, consistent with `tagged_count_split`),
and `term(p) = q_p − q_{p−1}`. Hence `term(1) = q_1 − q_0 = 1`, and for `p ≥ 2`
`term(p) = C(m,p−1)2^{p−1} − C(m,p−2)2^{p−2}`. For `2 ≤ p ≤ m + 2`, `C(m,p−2) > 0` and
`C(m,p−1) = C(m,p−2)(m − p + 2)/(p − 1)`, so `term(p) = C(m,p−2)2^{p−2}(2m + 5 − 3p)/(p − 1)`, and
`2m + 5 − 3p = 2α + 1 − 3p`: the sign of `term(p)` is the sign of `2α + 1 − 3p`, zero exactly at guard equality
(which occurs iff `α ≡ 1 (mod 3)`, `α ≥ 4`). For `p ≥ m + 3` both binomials vanish and `term(p) = 0`. So the term is
positive exactly for `1 ≤ p ≤ ⌊2α/3⌋` (for `α ≥ 3` this lies in `2 ≤ p ≤ m + 2` apart from `p = 1`; at `α = 2`,
`⌊2α/3⌋ = 1` and `term(1) = 1`), and `≤ 0` for every `p ≥ ⌈(2α+1)/3⌉`. **Family B is proved.** ℕ note: the `p ≥ 2`
formula read at `p = 1` with ℕ-truncated `p − 2 = 0` would give `1 − 1 = 0`, not `1`; the separate clause
`term(1) = 1` is therefore necessary, and the brief carries it.

Overlaps: `T_A(1) = T_B(0) = P_4` (`α = 2`, `p = 1`, term `1`); `T_A(2) = S(1,2,2)` and `T_B(1) = P_6` are exactly the
two order-6 minimal tree witnesses of B3.

**Floor identity and complement (B2, scope note).** For every integer `α`: `⌈(2α+1)/3⌉ = ⌊(2α+3)/3⌋ = ⌊2α/3⌋ + 1`, so
`⌊2α/3⌋ = ⌈(2α+1)/3⌉ − 1` exactly. For integers `p, α`: `p ≤ ⌊2α/3⌋ ⟺ 3p ≤ 2α ⟺ ¬(3p ≥ 2α + 1)` — exactly the
complement of the guard. For `α ≥ 0`: `α − ⌈α/3⌉ = ⌊2α/3⌋`, so `p ≤ ⌊2α/3⌋ ⟺ α − p ≥ ⌈α/3⌉`.

**B2 composition.** Fix `α ≥ 2`. Lower bound: B1 gives a tree and a leaf with a positive term at `⌊2α/3⌋`. Upper
bound: every tree is a finite bipartite graph, so (HTP) (hypotheses consumed: `IsBipartite` via the tree, `IsGraphLeaf`
for the original leaf, `p ≥ 1`, `3p ≥ 2α + 1`) gives term `≤ 0` at every `p ≥ ⌈(2α+1)/3⌉ = ⌊2α/3⌋ + 1`. So the maximum of
`{p ≥ 1 : some tree with α(T) = α and original leaf has term > 0}` exists and equals `⌊2α/3⌋`. The restriction `α ≥ 2`
is necessary and exact: the only tree with `α = 1` and a leaf is `K_2`, whose terms are `0` at every `p` (`R_v = H_v`).
Grade: weakest input, `proved_informal`.

**Own instrument** (`scratchpad/c1-sr-SR-BOUNDARY/`, written from the definitions; shares no code with any seat):
two counting engines — E1 brute force over every subset of the allowed vertex set; E2 a rooted forest DP
(`f(u) = Π f(c) + x Π g(c)`, `g(u) = Π f(c)`); free trees by leaf extension, deduplicated by a centre-rooted AHU
canonical string, each re-tested (connected and `n − 1` edges); labelled bipartite graphs by enumerating all edge sets
and 2-colouring; isomorphism classes of small graphs by minimum over all `n!` relabellings.

| Check | Result |
|---|---|
| Both families, `m ≤ 7` (orders 4–18), E1 brute force at every `p ∈ 1..n+1` vs the claimed closed forms (and Family A's factorised form in exact `Fraction`s) | 0 mismatches; tree test, leaf test, `α = m+1` / `m+2`, order `2α` all pass |
| Same objects, every leaf (not only `v`), every guarded `p` | 0 positive terms (consistent with (HTP)) |
| E2 vs E1 on both families `m ≤ 7` | identical polynomials |
| Positive set of `p` for `v` (brute force, `m ≤ 7`) | exactly `{1, …, ⌊2α/3⌋}` in every case |
| Closed forms, `2 ≤ α ≤ 400`, every `p ∈ 1..2α+1` | Family A positive iff `3p ≤ 2α`; Family B `term(1) = 1`, sign `= sign(2α+1−3p)` on `2..m+2`, `0` above; no positive term at `3p ≥ 2α+1`; Family A `= C(m,p−1)/2` at `3p = 2α`; Family B zero terms: 133, all at guard equality (`α ≡ 1 mod 3`) |
| Exact positivity at `p = ⌊2α/3⌋`, `2 ≤ α ≤ 30` | both families positive at every `α`; `p_guard = ⌊2α/3⌋ + 1` at every `α` (e.g. `α = 9`: `p = 6`, A `28`, B `112`; `α = 30`: `p = 20`) |
| Floor identity / complement / depth form | exact for every integer `α ∈ [−3000, 3000]` (depth form for `α ≥ 0`) |
| Trees to order 18 (A000055: 1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, 551, 1301, 3159, 7741, 19320, 48629, 123867), E2 validated against E1 on all 584 supports of all trees to order 10 | largest positive `p` per `α`: `α = 2..10` → `1, 2, 2, 3, 4, 4, 5, 6, 6` `= ⌊2α/3⌋` at every one (first attained at orders 3, 6, 6, 8, 11, 10, 13, 17, 15); `α = 11..17` → `6, 7, 7, 7, 8, 8, 8` (`< ⌊2α/3⌋`: horizon); 0 positive terms at guarded `p` |
| Minima, trees to order 8 (E1) | `3p = 2α`: minimum order 6, exactly 2 classes (`P_6`: term `+1` at both end leaves; `S(1,2,2)`: `+1` at the pendant leaf of the centre, `0` at the two leg ends); none at orders 7–8. `3p = 2α − 1`: minimum order 3, unique class `P_3` (`+1` at both leaves); further classes at orders 4 (`P_4`) and 8 |
| Minima, labelled bipartite graphs to order 6 (E1; counts 1, 2, 7, 41, 376, 5177) | `3p = 2α`: minimum order 5, **unique** class `P_3 ⊔ K_2` (`α = 3`, `p = 2`, term `+1`; 30 labelled graphs, 60 leaf instances); order 6: 3 classes, 900 graphs, 1,440 instances. `3p = 2α − 1`: minimum order 3, unique class `P_3` (`p = 1`, `+1`; 3 graphs, 6 instances) |
| R23 remainder membership (trees to order 12; `x` and `α` only — no selector, no aggregate evaluated) | empty at orders ≤ 10; order 11: 5 trees, each `α = 9`, `x = 4`, `p = 6`; order 12: 34 pairs |

Agreement with the record: the adjudicator's 60 / 1,440 labelled instances, F1's per-`α` table to order 16, C-F1-T's
`α = 9` value `28`, CF-F-1's `P_6` hand values, and the synthesis's order-11 membership example all agree with my
instrument. These are consistency notes, not evidence used.

## Findings and repairs

1. **B1 (SR-8a): confirmed as stated.** Both closed forms, the factorisation, the tree and `α` claims, and every sign
   claim are proved above from the definitions and checked by an independent instrument. Precision added to the
   registration text (no change of content): Family B's zero at guard equality occurs exactly when `α ≡ 1 (mod 3)`
   (so on trees the `≤ 0` of (HTP) cannot be sharpened to `< 0` at guard equality; recorded as an observation only,
   not as a separate claim); Family A's term is strictly negative on `⌈(2α+1)/3⌉ ≤ p ≤ α` and `0` above; the `p = 1`
   clause of Family B is necessary in ℕ.
2. **B2 (SR-8b): confirmed with repairs.**
   - The composition is exact (floor identity holds for every integer `α`), the upper bound needs only (HTP)
     restricted to trees, and the grade is `proved_informal` (weakest input). It stays `proved_informal` even after
     (HTP) is formally verified, because B1 is `proved_informal`.
   - **Attribution repair.** The brief credits the composition to the F adjudicator only. It was first stated at
     Stage 4 by C-F1-T (A1, "conditional on (HTP)") and C-F1-U (A1, "uses (HTP) for the upper side"); the F
     adjudicator restated it as conditional on (HTP) and supplied the order-18 bounded table; the Stage 6 synthesis
     lifted the grade to `proved_informal` after R-HTP. The registration text carries all four.
   - **Bounded-table precision.** The F adjudicator's table agrees with mine; the bounded agreement to order 18 in fact
     holds for every `α ∈ {2, …, 10}` (`α = 10` is attained at order 15, already within F1's order-16 census), not only
     `α ≤ 9`. "`α ≤ 9`" is true but understated; the registration text states `α ≤ 10`.
3. **B3 (SR-8c): confirmed; no discrepancy with the record.** Exact orders, witness lists and terms reproduce. Precision
   added: the order-3 bipartite witness is `P_3` (the unique class), the order-5 bipartite witness is the unique class
   `P_3 ⊔ K_2`, and in `S(1,2,2)` only the centre's pendant leaf has a positive term.
4. **Record-level fence repair (applies to the whole record).** The brief's fence sentence is kept verbatim, with two
   qualifiers so it does not over-assert:
   - "no step into `3p < 2α + 1`" is literally false as a description of the computations: B1–B3 evaluate single
     original-leaf terms at ranks below the guard. What is true (SOLUTION-CONTRACT §3.3; C1-STAGE1-GATE item 4) is
     that no favorable selector, no aggregate and no mechanism is evaluated or proposed there. The text says so.
   - "the unguarded statement is already REFUTED as `E993-BETA-TARGET`": that key is the governed-RTree (β)
     statement, and no ordinary-to-governed bridge exists (§3.1, §3.4; the key's own certificate carries the D9
     caveat). The text says "in the governed setting" and adds that the record's own witnesses (e.g. `P_3` at `p = 1`)
     are explicit exact finite counterexamples to the unguarded ordinary pointwise sign, which is not a registry key,
     so no new refutation key is registered.
5. **Registry key predicate.** `E993-R29-HIGH-TAIL-BOUNDARY-RECORD` names only a record about the high-tail boundary;
   the statement satisfies it and the name asserts nothing more. No alias found in the run-local registry.
6. **Scope note (R23): confirmed exact.** The key's statement is "for every finite ordinary tree `T` and every natural
   `p ≥ x(T) + 2`, …" with no upper bound on `p`. (HTA) covers exactly the eligible `p` with `3p ≥ 2α + 1` (including
   `p > α`, and `p ≥ 2 ≥ 1` automatically). By the complement identity the uncovered eligible ranks are exactly
   `x(T) + 2 ≤ p ≤ ⌊2α(T)/3⌋`, equivalently depth `α − p ≥ ⌈α/3⌉`. The remainder is nonempty from order 11 (and empty
   at orders ≤ 10). "Open remainder" means "not covered by (HTA)"; nothing about its sign is claimed. Not attacked.
   **Wording repair:** the synthesis's closing clause "B1 shows no leafwise pointwise argument extends below the
   guard" over-reads B1. B1's witnesses are not shown to be eligible (`x + 2 ≤ p`) or favorably selected at the
   witnessing rank, and checking that would evaluate a selector below the guard (fenced). What B1 shows is that the
   unrestricted pointwise leaf sign fails one rank below the guard at every `α ≥ 2`; the registration text says that.
7. **Fences checked.** No status transfers (§3.1); the two VERIFIED awards are untouched (§3.2); nothing below the guard
   beyond single leaf terms (§3.3); `E993-BETA-TARGET` stays REFUTED at its governed scope (§3.4); no census value is
   used (§3.5); no sealed member edited (§3.6); attribution on every face (§3.7); nothing presented as awarded (§3.8).
   Controller priors were not used as evidence.

## Registration text

The controller should register the following verbatim (parts B1–B3; B4 arrives from `SR-MECH` and is not part of this
read).

> **Key:** `E993-R29-HIGH-TAIL-BOUNDARY-RECORD` — Tier 2 boundary record (run-local; r29 Cycle 1).
>
> **Definitions.** SEMANTIC-CONTRACT §1. For a finite simple graph `G`, an original leaf `v` (`C4LA1.IsGraphLeaf`) with
> support `s`, and a natural `p ≥ 1`: `term_G(v,p) := Δ_{p−1}(G − {v,s}) − Δ_{p−1}(G − N_G[s])` (ℤ; counts on the
> original carrier; `p − 1` is the integer rank because `p ≥ 1`). The guard of (HTP)
> `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` is `3p ≥ 2α(G) + 1`; its floor is `⌈(2α+1)/3⌉ = ⌊2α/3⌋ + 1` for every
> integer `α`.
>
> **B1 — the guard is sharp on trees at every `α ≥ 2`** (`proved_informal`). For every integer `α ≥ 2` there is a
> finite tree `T` of order `2α` with `α(T) = α` and an original leaf `v` with `term_T(v, ⌊2α/3⌋) > 0`, where
> `⌊2α/3⌋ = ⌈(2α+1)/3⌉ − 1 ≥ 1`. Hence the guard cannot be relaxed by one rank on finite trees, nor (trees being
> bipartite) on finite bipartite graphs, at any `α ≥ 2`. Two families, each proved:
> - *Family A* (`m = α − 1 ≥ 1`, order `2m + 2`): a centre `s` with a leaf `v` and `m` legs `s – w_i – u_i`.
>   `α = m + 1`; `G − {v,s} = mK_2`, `G − N[s] = mK_1`. For every `p ≥ 1`:
>   `term(p) = C(m,p)(2^p − 1) − C(m,p−1)(2^{p−1} − 1) = (C(m,p−1)/p)·[t(2^{p−1} − ½) + p/2]`, `t = 2α − 3p ∈ ℤ`.
>   It is positive exactly for `1 ≤ p ≤ ⌊2α/3⌋` (`t ≥ 0`), equals `C(m,p−1)/2` at `3p = 2α`, and is `≤ 0` for every
>   `p ≥ ⌈(2α+1)/3⌉` (`t ≤ −1`, using `2^p − 1 ≥ p`): strictly negative for `⌈(2α+1)/3⌉ ≤ p ≤ α`, zero for `p ≥ α + 1`.
> - *Family B* (`m = α − 2 ≥ 0`, order `2m + 4`): the path `v – s – w – c` plus `m` pendant edges `a_i – b_i` with
>   every `a_i ~ c`. `α = m + 2`; `term(p) = q_p − q_{p−1}` with `q_j = C(m, j−1)·2^{j−1}` (`q_0 = 0`), i.e.
>   `term(1) = 1` and `term(p) = C(m,p−1)·2^{p−1} − C(m,p−2)·2^{p−2}` for `p ≥ 2` (the `p ≥ 2` form is not to be read at
>   `p = 1` with ℕ-truncated `p − 2`). For `2 ≤ p ≤ m + 2` its sign is the sign of `2α + 1 − 3p` — zero exactly at
>   guard equality `3p = 2α + 1`, which occurs iff `α ≡ 1 (mod 3)` — and `term(p) = 0` for `p ≥ m + 3`.
> - `T_A(1) = T_B(0) = P_4`; `T_A(2) = S(1,2,2)`; `T_B(1) = P_6`.
> - Checks: brute force at every `p ≤ n + 1` for `m ≤ 7` (both families; every leaf of each object has no positive term
>   at a guarded `p`); closed forms for `α ≤ 400` (SR-BOUNDARY) and `α ≤ 1500` (F adjudicator); exact positivity at
>   `⌊2α/3⌋` for `2 ≤ α ≤ 30`.
> - Attribution: Family A — critic C-F1-T (A1); Family B — critic C-F1-U (A1); both re-derived by the F adjudicator,
>   Family A's factorisation by the Stage 6 synthesis, both confirmed by the isolated second read SR-BOUNDARY (SR-8a).
>   The boundary question was opened by seat F1 (sharp to order 16 for `α ≤ 8`, open beyond).
>
> **B2 — the largest positive rank on trees is exactly `⌊2α/3⌋`** (`proved_informal`). For every integer `α ≥ 2`,
> `max{p ≥ 1 : some finite tree T with α(T) = α and original leaf v has term_T(v,p) > 0} = ⌊2α/3⌋ = ⌈(2α+1)/3⌉ − 1`.
> Lower bound B1; upper bound (HTP) on trees (every `p` with `3p ≥ 2α + 1` has term `≤ 0`). At `α = 1` the set is
> empty (`K_2`, all terms `0`). Grade: weakest input (B1 `proved_informal`; (HTP) `proved_informal`). Bounded check:
> free trees to order 18 (A000055 matched), the largest positive `p` equals `⌊2α/3⌋` for every `α ∈ {2, …, 10}`, with no
> positive term at any guarded `p`; for `α ≥ 11` no tree of order `≤ 18` attains `⌊2α/3⌋` (a horizon effect: the
> families attain it at order `2α ≥ 22`), and the values found lie below `⌊2α/3⌋`, consistent with the upper bound.
> Attribution: first stated by critics C-F1-T (A1) and C-F1-U (A1) conditional on (HTP); composed and bounded-checked to
> order 18 by the F adjudicator; graded `proved_informal` by the Stage 6 synthesis after R-HTP; confirmed by
> SR-BOUNDARY (SR-8b). The upper-bound input (HTP) carries its own attribution (Codex/GPT-6 mechanism; r29 derivations).
>
> **B3 — minimal witnesses** (`bounded_computation`; exhaustive, five instruments).
> - Free trees, at `3p = 2α`: minimum order 6, exactly two classes — `P_6` (`α = 3`, `p = 2`, term `+1` at each end
>   leaf) and the spider `S(1,2,2)` (`α = 3`, `p = 2`, term `+1` at the centre's pendant leaf, `0` at the leg ends).
>   At `3p = 2α − 1`: minimum order 3, the unique class `P_3` (`α = 2`, `p = 1`, term `+1`).
> - Labelled bipartite graphs, at `3p = 2α`: minimum order 5, the unique isomorphism class `P_3 ⊔ K_2` (`α = 3`,
>   `p = 2`, term `+1` at the two leaves of the `P_3`; 30 labelled graphs, 60 leaf instances). At `3p = 2α − 1`:
>   minimum order 3, the unique class `P_3` (`p = 1`, term `+1`).
> - Instruments: F1; C-F1-T; C-F1-U; the F adjudicator; SR-BOUNDARY (trees to order 8 by AHU canonical form, labelled
>   bipartite graphs to order 6 with classes by exhaustive relabelling).
> - Attribution: F1 (`P_6`, `P_3`; `P_3 ⊔ K_2` in its own order-8 report); C-F1-T (the second order-6 class
>   `S(1,2,2)`); C-F1-U (the bipartite minimum by instrument); the F adjudicator (all minima confirmed); SR-BOUNDARY
>   (SR-8c).
>
> **B4** — see the second read `SR-MECH` (not part of this text).
>
> **Fence.** A record about the guard's precision; refutes nothing in scope; no step into `3p < 2α + 1`; the unguarded
> statement is already REFUTED as `E993-BETA-TARGET`. Precisely: the record evaluates single original-leaf terms at
> ranks below the guard only as witnesses of the guard's precision, and evaluates no favorable selector and no aggregate
> there and proposes no mechanism for the lower region (SOLUTION-CONTRACT §3.3); `E993-BETA-TARGET` is REFUTED in the
> governed RTree setting and no ordinary-to-governed bridge is claimed (§3.1, §3.4); the record's own witnesses (e.g.
> `P_3` at `p = 1`) are explicit exact finite counterexamples to the unguarded ordinary pointwise sign, which is not a
> registry key, so no new refutation key is registered. No status changes: (HTP), (HTA),
> `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE`, `E993-R26-TOP-RANK-RESIDUAL-SIGN`,
> `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, NR1, FOREST, TREE, TRANSFER and Erdős #993 are unchanged.
>
> **Scope note on `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN, unchanged; not attacked).** The eligible ranks
> not covered by (HTA) are exactly `{(T, p) : x(T) + 2 ≤ p ≤ ⌊2α(T)/3⌋}` — `p ≤ ⌊2α/3⌋` is exactly the complement of the
> guard for integers — equivalently depth `α − p ≥ ⌈α/3⌉`. The set is nonempty (smallest order 11: `α = 9`, `x = 4`,
> `p = 6`; membership only, no sign evaluated). B1 shows that the unrestricted pointwise leaf sign (over all trees
> and original leaves of a given `α`) fails one rank below the guard at every `α ≥ 2`; whether any sign holds on the
> eligible, favorably-selected summands of this remainder is not evaluated (fence §3.3).

## Verdicts

verdict[SR-8a]: confirmed
verdict[SR-8b]: confirmed_with_repairs
verdict[SR-8c]: confirmed

Grades at registration: B1 `proved_informal`; B2 `proved_informal`; B3 `bounded_computation`. Strongest repair: the
record-level fence qualifiers (Finding 4); for SR-8b, the attribution of the composition to C-F1-T and C-F1-U as first
statements (Finding 2); for the R23 scope note, the narrowed reading of what B1 shows below the guard (Finding 6).

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Artifact inventory

All under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-sr-SR-BOUNDARY/`
(file SHA-256; each report's inner `digest` hashes its compact key-sorted body without that field; no timing field is
hashed; every job ran in the foreground to completion).

| File | SHA-256 | Role / replay |
|---|---|---|
| `srb_lib.py` | `ca530a567f660c2981657bcdfc27377e32944a15ae34d1f2a8045743bbc87152` | own instrument (E1 brute force, E2 forest DP, tree/bipartite tests, AHU and relabelling canonical forms, tree generator) |
| `srb_families.py` | `d8086135c29d1eff2a767a4aa1d7192227b7e70d46b658413a3e8c4acfa37933` | `python3 srb_families.py srb_families_report.json` (SR-8a, SR-8b identities) |
| `srb_families_report.json` | `e34148cd822c2c3ffdfefb64b30c48c1c8dba6457d05166d52beb99f4b1efb94` (inner `880af8ae2b34c90c703e20a07acb3ea379e6113d5aa02abe7072f07abde53da6`, replayed identically) | 0 failures |
| `srb_minima.py` | `9e3a0bb129dd85ad2377daebc6c7177701247ff6e9925b79f121291499b7dea0` | `python3 srb_minima.py srb_minima_report.json` (SR-8c) |
| `srb_minima_report.json` | `0b1aec388bc93c9f5a613e2ad457655fa7dbe1dcf0ce63916dbd1c63a1f6ef09` (inner `5b3774e341e494668c03539e93e817c3c6115968f43aaf392a1278c5045d515d`) | 0 failures |
| `srb_census.py` | `bab5028a8ec7d19201a51d8ab2a136859b751bdf68140e32047005fabe74e8a4` | `python3 srb_census.py 18 srb_census_n18.json` (SR-8b table; R23 membership; ~77 s) |
| `srb_census_n18.json` | `d690a19bc1d8ba7510f1e76ec5f1ebdf30fe1e083d21dcbde94985485d098199` (inner `8d7fa808b54155e2fd594afd7ea49d89c9d3d5cdbc23128c7fa89007b8317bcd`) | 0 failures |
| `srb_census_n14.json` | `a025da7bdbdd7aa4f519526ff13f5bba7fbcd1ca90821a1bd0faa7d0053949c3` (inner `f4f5e9d4803abf9b4dc9d1b839423f70310beb9883b6a271ffd5d85656ece501`) | timing run to order 14 (superseded by n18) |

No capsule member was edited. Nothing was written outside this file and the scratch directory above.
