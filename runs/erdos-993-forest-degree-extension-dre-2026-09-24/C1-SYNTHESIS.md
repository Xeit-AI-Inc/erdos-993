# Cycle 1 Neutral Synthesis

Neutral Stage 6 synthesis of Cycle 1, r27 (`erdos-993-math-dre-20260924-r27-forest-degree-extension`):
audit and formalize the finite forest degree/extension inequality.

**VerityOS boot acknowledgment.** Operating within VerityOS. Booted by reading **exactly** the two files
the dispatch authorizes — `verity.md` (root constitution) and `identity/startup-protocol.md` (identity
subsystem, startup sequence) — and no other file under the VerityOS root outside this experiment.
Subsystem loaded: `experiments/`, this run root only. No `memory/`, `knowledge/`, `decisions/`,
`operations/`, `logs/`, `conversations/`, `modules/`, `skills/`, `inbox/` or `writing/` file was read; the
startup protocol's task-type map into those subsystems was not followed (the controller booted for the
run). No read-boundary disclosure arises on that axis.

chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

---

## Identity and seal audit

**Dispatch capsule seal (required report).** `control/C1-STAGE6-DISPATCH-MANIFEST.json`, inner seal
recomputed by my own script over the canonical JSON minus `seal_sha256` (`sort_keys=True`,
`separators=(",",":")`, UTF-8, no trailing newline):

```
478243b7c3900fbbc74e01c6c2f1555a332a38f70a3c9e5075cb0eee18d8357d
```

— identical to the declared value. **MATCH.** `file_count: 12` equals the member count; **12/12** members
verify byte length **and** SHA-256 on disk, zero mismatches:

| Member | Bytes | SHA-256 | Result |
|---|---|---|---|
| `SEMANTIC-CONTRACT.md` | 7195 | `b59552b8ab6e8185335888ac3f125702477aee462784e6e48bd7e2e3ce81af9d` | OK |
| `SOLUTION-CONTRACT.md` | 6385 | `607da80443620a51195bd62738fa99f551c8b152677f38a43274f7a8a77dc2e7` | OK |
| `control/C1-ALLOCATION.md` | 13529 | `c602f9c15a78292c74f31abc1ba6c49592775ea1b06c8ce1c810ed7203b03115` | OK |
| `control/C1-STAGE1-GATE.md` | 3725 | `4fb5af66cd33347bc6c3741c53b64259909ad662c751f85c297e6297db29b1a5` | OK |
| `control/C1-STAGE5-PACKET-MANIFEST.json` | 5695 | `ea386914513806981510f8f80d62e016c89f9f728a223a280fbb597ea2ab8882` | OK |
| `control/C1-STAGE6-CONTROLLER-FACTS.json` | 3839 | `ae55cc2cfeceed7d0c00955c4556b674f0ff1df71128bc1bc432138261c9fe42` | OK |
| `control/C1-SYNTHESIS-PROTOCOL.md` | 4554 | `57453a5f5ea8b3db9e3d4d521b5d977e0701adde14afd8118559986aa61684e9` | OK |
| `control/PATH-CHECK-c1-stage6-dispatch.json` | 533 | `bba3438dd6af1dab82ffc68d4f93a9507ae37668089e7d2b3eb4d82792dc1c5d` | OK |
| `control/SOURCE-DIGESTS.json` | 17493 | `3c93868eb3e498ff280f73ccb0923540e943d73347752fda90c1b56dee501fb8` | OK |
| `cycles/cycle-1/stage5/adjudicators/F/ADJUDICATION.md` | 66760 | `34dbff41a93191e6aa8595fe2acb1963925a90d5d7f919617f2bc79f3d17f274` | OK |
| `cycles/cycle-1/stage5/adjudicators/T/ADJUDICATION.md` | 59225 | `7401b4948a33b141d09bb7616fa968fda674c359ac5784cc4243990cd353d5b4` | OK |
| `cycles/cycle-1/stage5/adjudicators/U/ADJUDICATION.md` | 54490 | `9c0a2edc52f42f8d92bb70f794a1e44790bbd668b49c795119c40215e0e1b0e8` | OK |

The three adjudications I reconcile are byte-identical to the Stage 5 packet manifest's rows for the same
three paths.

**Stage 5 packet manifest, recomputed independently.** Inner seal
`4732eb49c6704be35ff36387addf55a712a4d6ad26a02c5f507cbfac75d9b1ba` — declared and recomputed identical,
**MATCH**, `file_count: 31`.

**Enclosing seals reported by the adjudicators, carried but not recomputed by me** (their manifests are not
members of my capsule and I did not open them): Stage 2 `64d142ed1a3beb3dec7eaaa941d5c862c0bd3381ee678f6aa27c5c43850828e7`
(110 members), Stage 3 `8e78cf1f781381b34db629d8e596e36891df1d2346b54b5b805a18e0a1c0164d` (33), Stage 4
packet `d93b97002be201517a1850acd2a031ca7885a8e2d6a580df5af4a27191d9932a` (57), adjudicator capsules T
`81ef1bfb6b74854dd337e52ceef7092aadaac0972954a783dbc296b845a04f36`, F
`2a4ae30dec4028c8e249269338231332aff67135d4297e788cfa910e7a6f4c59`, U
`44e9389d9d6727137e230f9be7e897f2271eec61a5be1cfc7195e085ed8767ce`. All three adjudicators recomputed the
Stage 2/3/4 values independently and all three agree digit for digit; that triple concordance is the
evidence of record for those seals at this stage.

**Path check.** `control/PATH-CHECK-c1-stage6-dispatch.json`: 11 files scanned, `finding_count: 0`, no
denied root touched.

**Frozen carrier of record, verified by me from the bytes** (run-root `sources/` is authorized), each also
matching `control/SOURCE-DIGESTS.json`:

| Frozen file | Bytes | SHA-256 |
|---|---|---|
| `sources/r25/c4-forest-descent-order-bound/LeanProject/LeanProof/Main.lean` | 17180 | `736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0` |
| `sources/r25/c4-forest-descent-order-bound/LeanProject/LeanProof.lean` | 22 | `f4dfdef8320a735eab53d24f4b47d3b60bcb474ffd2c84c77f24ae2fc75fcf31` |
| `sources/r25/c4-forest-descent-order-bound/LeanProject/lake-manifest.json` | 3559 | `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` |
| `sources/r25/c4-forest-descent-order-bound/LeanProject/lakefile.toml` | 237 | `45d0ca58145784d5f29322ff21a1335e350c38e72afe8d5396d9c9910b94ff49` |
| `sources/r25/c4-forest-descent-order-bound/LeanProject/lean-toolchain` | 25 | `2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273` |

This **settles the `736eb9db…`/`736eb9df…` transcription dispute** of U1 and U3 from the bytes: the tail is
`…df…`, 17,180 bytes, exactly as the U adjudicator ruled and exactly as the U carry list prints.

**The registry alias check that three seats, six critics and all three adjudicators could not run is
discharged here.** `sources/authority/CLAIM-IDENTITY.json` is run-root authority and inside my grant; the
controller facts record states that `control/CLAIM-IDENTITY.run-local.json` is byte-identical to it, so a
check against either is a check against the same identities. Read digest
`47697cba1e11d5898000d66c4d3d4502278af59e380ef0e952da3197d13e7fa2`; **370 claims** (214 VERIFIED / 89
REFUTED / 41 OPEN / 26 CONDITIONAL), 452 `aliases` entries, 132 `alias_patterns`. Result, from my own
script: **zero** exact alias matches and **zero** `alias_patterns` matches against the eleven candidate key
names and against plain-language renderings of (DL), (EX), (LB), (R5), (XR), the double count and the
extension lower bound; no registered `statement` field mentions a degree lemma, an extension inequality, a
double count, a linear `4k` order bound, a rank-5 ceiling of 20, or a `4r − 4` restriction. **No alias
exists; every `E993-R27-…` candidate below is a genuinely new identity.**

**Registry facts the adjudicators had to carry second-hand, now read by me at the exact key** (this
resolves the T adjudication's "record item I cannot adjudicate"):

| Registered key | Status | Statement | Relation to r27 |
|---|---|---|---|
| `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` | VERIFIED (formal award) | `Δ_k < 0 ⇒ n ≤ (k+1)²`, `k ≥ 1` | `(k+1)² − 4k = (k−1)² ≥ 0`: (LB) at least as strong at every `k`, strictly stronger for `k ≠ 1` |
| `E993-R25-FOREST-ORDER-BOUND-SHARPENED` | VERIFIED | `Δ_k < 0 ⇒ n ≤ k²+k+3`, `k ≥ 2` | `k²+k+3 − 4k = k²−3k+3 > 0` for every `k` (discriminant `−3`): (LB) strictly dominates at every `k ≥ 2`. The key exists; C-T3-F's critic-attributed report is confirmed |
| `E993-R25-SECOND-ORDER-TWO-SIDED-CEILING` | VERIFIED | `Δ_4 < 0 ⇒ n ≤ 19`; `Δ_5 < 0 ⇒ n ≤ 29` | (LB) gives 16 and 20: strictly stronger at both ranks |
| `E993-R25-RANK5-CEILING-SHARPENED-TO-25` | VERIFIED | `Δ_5 < 0 ⇒ n ≤ 25` | (R5) gives 20; its stated residue (orders 22–25, ≥ 3 branch vertices) is therefore empty |
| `E993-R25-KADDITION-CLOSURE-X-LE-4` | VERIFIED | `x(G ⊔ K₁) ≤ x(G)+1` for `x(G) ≤ 4` | extended to `x ≤ 5` by (R5) + the order-≤21 census |
| `E993-R25-UNR-FOREST-WIDE` | **OPEN** | `|V| ≥ 2r+2`, `x(F) < r` ⇒ `Δ_r(F) ≤ 0` | **untouched; no status transfer; no truth value asserted** |
| `E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` | REFUTED | paths `P_n`, first strict descent = first maximizer | key confirmed **without** an `R25-` segment (erratum R27-E-c); premise nowhere |
| `E993-G1WIDE-NO-SIZE-CAP` | OPEN | — | untouched |
| `E993-FOREST-FIRST-DESCENT-DISJOINT-UNION-UPPER-ADDITIVITY` | REFUTED | — | stays REFUTED |

**Errata.** R27-E-a (r26 residue in the sealed worker brief), R27-E-b (the "tight cases" mislabel) and
R27-E-c (the malformed refuted-mechanism key) are corroborated across all three portfolios and no seat is
charged for following the binding contract. R27-E-b is **upgraded from erratum to theorem** by orientation
F (see Established results 3) and independently disconfirmed over 85,625 isomorphism classes by orientation
T: the `SEMANTIC-CONTRACT.md` §4 fixed-point **values** are right, the label "tight" has **no instances at
all** on forests at `k ≥ 1` with `i_k > 0`. Sealed members are not edited (fence §3.5); these are records
and scope notes.

**My own independent instrument** (`scratchpad/c1-S/`, Python standard library only, exact integers, no
floats, no RNG, no network, no installs, all foreground). Built from `SEMANTIC-CONTRACT.md` §1 alone; I
executed no seat, critic or adjudicator script. Every **labelled** forest on `1 ≤ n ≤ 7` vertices — every
acyclic edge subset of `K_n`, counts `1, 2, 7, 38, 291, 2932, 36961`, **40,232** objects, plus the empty
forest checked separately — at every `k`, and for (RC) under **every** choice of one root per component:
zero failures of (DL), (RC), the double count, the per-set `e(J)` bound, (EX), (LB), the strictness bound
`2k·i_k − D_k ≥ 2`, and the exact `k = 1` slack `= 2c`. All `SEMANTIC-CONTRACT.md` §4 fixed points
reproduced before any table: empty forest `i = [1]`, `Δ_0 = −1`, `x = 0`; `K₁` `i = [1,1]`, `Δ_0 = 0`,
`Δ_1 = −1`, `x = 1`; `K₂` `i = [1,2]`, `D_1 = 2`; `P₅` `i = [1,5,6,1]`, `D = [0,8,18,4]`; `K_{1,5}`
`i = [1,6,10,10,5,1]`. Arithmetic fences checked symbolically: `(k+1)² − 4k = (k−1)²` and
`k²+k+3 − 4k > 0` for `k ≥ 2`.

---

## Reconciliation

The three adjudications are reconciled claim by claim, never by majority vote and never by consulting a
lower tier. The controller's own framing — "the three adjudications differ by evidence grade" — is
confirmed and is the whole of the apparent disagreement.

**1. The headline disagreement on (DL) is not a contradiction; it is two different questions.**
T returns `status: proved`, F returns `status: proved`, U returns `status: still_open`. Read at their
exact statements:

- T rules that **the mathematics of (DL) is proved informally**, by T1's retained architecture (§2
  primitives, the every-rooted-tree induction, the forest assembly, the §5 range completion and cast
  ledger) composed with the critics' **corrected single-edge join**, the T adjudicator re-deriving the
  chain symbolically and confirming every identity on 5,776 labelled joins.
- F rules that **the mathematics of (DL) is proved informally**, by `C-F1-T`'s **injection** proof of the
  strictly stronger root-corrected lemma (RC), the F adjudicator verifying it line by line and
  machine-checking the injection pair by pair on 40,233 labelled forests under every root choice.
- U rules that **no compiled artifact states (DL)**, that its own orientation's mechanism (`C-U2-T`'s
  edge-split join) is an informally derived identity with exhaustive small-case confirmation rather than a
  verified statement-level proof, and that (DL) is therefore the single open node beneath (EX), (LB), (R5)
  and (XR). U states its scope explicitly: "at **this orientation's evidence grade** there is no complete
  informal proof of (DL) that I have verified."

None of the three asserts the negation of another. T and F each hold a complete statement-level proof by a
**different mechanism**, each verified by a different neutral adjudicator and by a different independent
instrument; U holds the formal ledger and correctly reports it empty at (DL). **Synthesis ruling: the
mathematics of (DL) is `proved_informal` with two independent proofs of record; the formal node is open.**
`status` at Stage 6 is `proved_informal`, not `still_open` and not `formally_verified`.

**2. The two mechanisms T and U each verified are the same identity, independently derived in two isolated
orientations — a fact only this synthesis can state.** T's corrected `(D-REC)`/`(E-REC)` for
`U = S ⊔ T` joined by the single edge `r~s` and **rooted at `r`**,

```
D_U = D_S·A + A'·D_T + x(E_S·B + B'·E_T) + 2x·B·(A'−B')
E_U = E_S·Z + A'·D_T + x·B·(A'−B')
```

and `C-U2-T`'s edge-split join for two arbitrary rooted pieces,

```
D_T(a) = D_A(a)·Z_{B−b} + Z_{A−a}·D_B(b) + x(E_A(a)·Ẑ_B + Ẑ_A·E_B(b)) + 2x·Ẑ_B·(Z_{A−a} − Ẑ_A)
E_T(a) = E_A(a)·Z_B + Z_{A−a}·D_B(b) + (Z_B − Z_{B−b})·(Z_{A−a} − Ẑ_A)
```

are term for term the same object in two notations. The T portfolio derived it **symbolically** (corrected
Step c, identity (i), (P1) at `r` inside `S`, (P2) on the separated pair) and checked it on 5,776 labelled
joins; the U portfolio derived it **structurally** and checked it on 215,754 instances (every labelled tree
to order 7, split at every edge, both orientations), with the seven-term nonnegativity closure and the
every-(tree, root) reach also verified. **Consequence:** U's own caveat — that its edge-split join is
"informally derived … not a verified statement-level proof" — is **discharged by orientation T**, which has
the statement-level derivation U's portfolio lacked. The two-potential route's mathematics is
`proved_informal`, and every remaining node on it is a Lean-engineering node. This upgrade is the single
most consequential cross-orientation result of Cycle 1 and neither adjudicator could reach it.

**3. Two independent proofs of (DL) now exist, by disjoint mechanisms.** The corrected two-potential chain
(generating functions, root conditioning, separated-union multiplicativity, all-roots induction) and the
injection proof of (RC) (incidence counting, a parent map, one injection) share no step. The record wanted
a second derivation; it has one, and the two were produced in orientations that never saw each other.

**4. The "forest layer is a debt" diagnosis is refuted from three directions.** T2's Part 1 Step 3 claimed
the tree→forest step needs its own convolution account and would collapse into T1's mechanism. `C-T2-U` and
`C-T2-F` refuted it independently with the convolution
`i_k(G₁⊔G₂) = Σ_{a+b=k} i_a i_b`, `D_k(G₁⊔G₂) = Σ_{a+b=k}[D_a i_b + i_a D_b]`; the U adjudicator derived the
sharper single-root reduction `D_{A⊔B}(a) = D_A(a)·Z_B + Z_A·D0_B ≥ D_A(a)·Z_B + Z_A·D_B(b)` (1,596
separated-union instances, zero mismatches); and F's injection proof handles disconnected forests natively
under any root choice. **Struck across the run.**

**5. Acyclicity accounting, reconciled and now exact.** T3 and both its critics establish that acyclicity
enters **nowhere** in the double count or in `e(J) ≥ n − k − Σ deg`, and exactly **once**, through (DL), in
(EX) and everything below. U compiled both of those unconditional facts for an arbitrary finite simple
graph. F sharpens what acyclicity buys: plain (DL) does **not** characterize forests (every cycle `C_n`
satisfies it with equality at every `k`); the statement equivalent to acyclicity is the **root-corrected**
form at `k = 1`, `D_1 + 2c ≤ 2·i_1 ⟺ |E| ≤ n − c ⟺ G is a forest`. F1's `|E| > n` boundary is the weaker
`k = 1` fence of plain (DL). All three are consistent; the registrable fence is F's.
**Binding on Stage 7: the double count, the `e(J)` bound and (EXX) are stated WITHOUT `hG : G.IsAcyclic`;
a stray binder is struck at fidelity review.**

**6. `E993-R25-KADDITION-CLOSURE-X-LE-5`: T defers, F discharges, and the grade is F's.** T3 and the T
adjudicator correctly declined the object as orientation F's. F converts it from conditional to
unconditional-at-informal-evidence: (R5) gives `x(G) = 5 ⇒ n ≤ 20`, inside the census horizon; the census
**content** (not only its counts) is re-verified in-run to order 19 by `C-F3-T` (1,291,315 classes) and to
order 20 by `C-F3-U` (3,269,193 classes), both reproducing the frozen r25 first-descent histograms digit
for digit; rank 0 is covered by `closure_certificate.json`, not by the search report, whose population
starts at order 1. Grade `proved_informal`-with-census, carrying the census on its face, **never
`formally_verified`** (Gate ruling 6, fence §3.4). T's statement of the same fence agrees.

**7. The (XR) live-region table.** T3's Step 8 column header "live" is struck to "not excluded by (XR)"
with an occupancy row beside it; the T adjudicator's complete order-16 census voids `n = 12` at `r = 4` and
`n = 16` at `r = 5`; `C-F3-T`'s order-19 census voids `n = 19` at `r = 6`; `r = 6, d = 8, n = 20` remains
**unverified by anyone** and must be labelled so.

**8. Descent maxima, reconciled across all three portfolios.** `M(k) := max{n : ∃ finite forest, Δ_k < 0}`
= 4, 8, 11, 15 for `k = 1..4`, reproduced by the T adjudicator (complete to order 16), `C-T3-F` (horizon
19), `C-F1-U`/`C-U3-F` (horizon 16) and `C-U1-F` (horizon 12) — four independent instruments, one answer.
`M(1)`, `M(2)`, `M(3)` are **unconditional**, because the formally verified `(k+1)²` award caps the search
at 4, 9 and 16 and the enumeration is complete to 16. `M(4) = 15` is complete only under (LB)'s cap 16 and
therefore carries (DL)'s grade; standalone it is `bounded_computation` at horizon 16. Hence **(LB) is tight
at `k = 1` and `k = 2`** (witness `P_8`, the unique order-8 forest with `x < 3`) and **provably slack at
`k = 3, 4`**. T3's inherited "tight at `k = 1`" wording is struck for `4k`.

**9. Grade transfer.** T3's "(EX)/(LB)/(R5)/(XR) upgrade to (DL)'s grade **automatically**, at
`proved_informal` **or better**" is struck by both its critics, by the T adjudicator and by me: a compiled
derivation is itself an input and a composition takes its weakest input's grade (`SOLUTION-CONTRACT.md`
§4). The automatic upgrade is valid **only up to `proved_informal`**. This is exactly the hazard the stop
gate turns on, since §5(a) requires (DL) **and** (EX) formally verified.

**10. Census populations, reconciled.** 15,206 classes to order 14 (F1, `C-F1-T`, `C-F1-U`); 20,514 at
order 15 and 49,905 at order 16, cumulative **85,625** (T adjudicator complete census; `C-F1-U`; `C-U3-F`;
`C-F3-U`'s `x ≥ 1` histogram sums to 85,624 = 85,625 minus the empty forest); 8,355,831 to order 21
matching the frozen r25 figure; 13,184,156 at order 22, cumulative 21,539,987, new in this run and behind
three instruments. All `bounded_computation` at attained horizons (Gate ruling 10). No count is a filter
bound and none funds an award.

**11. Where the adjudicators disagreed about process, not mathematics.** (i) The `ps aux | grep` charge
against F3 is **not sustained** (the controller's recorded ruling binds critics and wrappers, not that
seat; F3's kill was on the literal PID with a `ps -p` exit confirmation). (ii) The external-slice
declaration and citation-closure **counts** are instrument artifacts — four instruments, four answers — and
**no count is registrable**; only the structural facts are. (iii) The de minimis over-quotation of one
external proof line is portfolio-wide, not seat-specific; it is not propagated here and Gate ruling 3's
substance is intact. (iv) Three name coincidences with the unlicensed external slice exist, all in U2's
file, and are cured by the three renames named under `## Lean awards`.

**12. Nothing in any portfolio bears on the out-of-scope layer.** No `N₀`, no CLT, no asymptotics, no
"sufficiently large forests are unimodal" (fence §3.2). No pointwise degree statement: (DL), (RC), (SH),
(DL+) and (EXX) are all averages over `I_k` (fence §3.3).

---

## Exact established results

Graded per `SOLUTION-CONTRACT.md` §4. Attribution travels on every face: **Fang–Lu–Nevo–Yao–Zheng 2026 §8**
for the mathematics of (DL), (EX) and the polynomial induction; the literature map (FRESH-LEAD, lane 11)
for the conditional deductions (LB)/(XR)/(R5); r25 seats/critics for the K1-addition lineage; r27 seats and
critics for their derivations. Items marked **STATED** were first stated at a review stage and need an
isolated second read before registration.

| # | Statement (exact) | Grade | Hypotheses consumed | Attribution |
|---|---|---|---|---|
| 1 | **(DL)** For every finite forest `G` and every `k : ℕ`: `(indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k` | `proved_informal` | acyclicity, finiteness; **no `α` side condition**; root a free parameter | FLNYZ 2026 §8; **two independent in-run proofs**: the corrected two-potential chain (T1 architecture + `C-T1-F`/`C-T1-U` join) and the injection proof of (RC) (`C-F1-T`) |
| 2 | **(RC) root-corrected degree lemma** `D_k(G) + 2·Σ_i a_{r_i}(k) ≤ 2k·i_k(G)` for **every** choice of one root per component, `a_v(k) := #{J ∈ I_k : v ∈ J}` | `proved_informal`, **STATED** | acyclicity (twice: edge↔non-root bijection; `N(v) = {p(v)} ∪ children(v)`), finiteness | `C-F1-T`; F adjudicator verified line by line; synthesis instrument: 40,232 labelled forests, every root choice, 0 failures |
| 3 | **Corrected single-edge join / edge-split recurrences**, rooted at the split endpoint, in the two equivalent presentations displayed under Reconciliation 2 | `proved_informal`, **STATED** | acyclicity (single cross edge, separation); the rooting is part of the statement | `C-T1-F` + `C-T1-U` (symbolic derivation); `C-U2-T` (structural derivation); T adj. 5,776 joins, U adj. 215,754 instances |
| 4 | **Forest-from-tree convolution** `i_k(G₁⊔G₂) = Σ_{a+b=k} i_a i_b`; `D_k(G₁⊔G₂) = Σ_{a+b=k}[D_a i_b + i_a D_b]`; and the single-root reduction `D_{A⊔B}(a) = D_A(a)·Z_B + Z_A·D0_B ≥ D_A(a)·Z_B + Z_A·D_B(b)` | `proved_informal`, **STATED** (the reduction) | finiteness only | `C-T2-U`, `C-T2-F` (convolution, independently); U adjudicator (reduction) |
| 5 | **(★) double count** `((k:ℤ)+1) * indepCount G (k+1) = Σ_{J ∈ indepSetFinset k} (e G J : ℤ)` | **`formally_verified`** | **finiteness only — NO acyclicity**; `[Fintype X] [DecidableEq X] [DecidableRel G.Adj]` | U3 (`Erdos993G1.double_count`), independently re-derived by `C-U1-T`; T3 wrote the statement-level proof |
| 6 | **Extension lower bound** `(e G J : ℤ) ≥ (Fintype.card X : ℤ) − k − Σ_{v∈J} G.degree v` for `hJ : G.IsNIndepSet k J` | **`formally_verified`** | **finiteness only — NO acyclicity** | U3 (`Erdos993G1.e_ge_sub`); T3, F1 and both F1 critics for the informal proof |
| 7 | **(EXX)** `e(J) = n − k − Σ_{v∈J} deg(v) + exc(J)`, `exc(J) := Σ_u max(codeg(u,J) − 1, 0)`; summing, `(k+1)i_{k+1} = (n−k)i_k − D_k + E_k` and `(k+1)i_{k+1} − (n−3k)i_k = (2k i_k − D_k) + E_k` | `proved_informal`, **STATED** | finiteness only | `C-T3-U`; T adjudicator confirmed the derivation |
| 8 | **(EX)** `(Fintype.card X : ℤ) * indepCount G k ≤ (k+1) * indepCount G (k+1) + 3*k*indepCount G k` | `proved_informal` | acyclicity **exactly once**, through (DL) | T3 for the derivation; composition with 1, 5, 6 |
| 9 | **(LB)** `Δ_k(G) < 0 ⇒ n ≤ 4k`, every `k : ℕ` including `k = 0` | `proved_informal` | acyclicity through (DL); `Δ_k < 0 ⇒ 0 < i_k` | T3, F1/`C-F1-T`; composition with 1 |
| 10 | **(R5)** `21 ≤ Nat.card X ⇒ 0 ≤ Erdos993G1.delta G 5` | `proved_informal` | as (LB) | T3, F3; composition with 9 |
| 11 | **(XR)** `firstDescent G < r ⇒ Nat.card X ≤ 4*r − 4`; `ℤ` restatement `d ≤ 2r − 4`; the `r = 0` truncation is vacuous-hypothesis-sound, not correct arithmetic | `proved_informal` | as (LB); `firstDescent` defined | T3; composition with 9 |
| 12 | **The implication chain, compiled**: `DlHyp → ExHyp ∧ LbHyp`, `LbHyp → R5`, `LbHyp → XR`, with the hypothesis types definitionally the frozen §2 declarations, and the `[Finite X]`/`Nat.card` landings | **`formally_verified` as implications** (the targets stay conditional on (DL)) | (DL) at §2's exact statement **with instance binders** | `C-U1-T` (capstone), `C-U3-T`, `C-U3-F` (contract-signature landings), `C-U1-F` (independent carrier bridge); U adjudicator replayed all fourteen |
| 13 | **Definition layer of record** `indepDegreeSum`, `extensionCount`/`e`, `firstDescent` (`Nat.find`, first STRICT descent), with existence, spec and minimality; `i_0 = 1`; `i_k = 0` for `k > n`; `Δ_k < 0 ⇒ i_k > 0` | definitions kernel-elaborated (ungraded); six supporting lemmas **`formally_verified`** | — | U1, U3; U adjudicator proved U1's and U3's texts **definitionally equal by `rfl`** |
| 14 | **Carrier bridges** `R27DegreeLemma.Z G univ k = Erdos993G1.indepCount G k`; `R27DegreeLemma.degOn G univ v = G.degree v`; `indepFinsets_union_of_separated`; `indepDegreeSum_agree`; `firstDescent_agree` | **`formally_verified`**, **STATED** (adjudicator-derived) | as stated | U adjudicator |
| 15 | **Single-edge-join (`m = 1`) recurrences** on the `Finset` carrier, for an arbitrary simple graph | **`formally_verified`** | `SingleEdgeJoin` (`notMem`, `rootMem`, `onlyNbhr`) | U2; both U2 critics; U adjudicator replayed |
| 16 | **(SH)** `D_k + 2·M_k ≤ 2k·i_k`, `M_k := Σ_{components} max_v a_v(k)`; **(EXS)** `(k+1)i_{k+1} ≥ (n−3k)i_k + 2M_k` | `proved_informal`, **STATED** | acyclicity | `C-F1-U` (statements), `C-F1-T` (the proof that discharges them) |
| 17 | **Strictness / R27-E-b as a theorem.** For every finite forest, every `k ≥ 1` with `i_k > 0`: `2k·i_k − D_k ≥ 2M_k ≥ 2`, with **exact** slack `2c` at `k = 1`. (DL) is **never tight** on a finite forest except at `k = 0` and `i_k = 0`; same for (EX) | `proved_informal`, **STATED** | acyclicity | `C-F1-T`, `C-F1-U`; T adjudicator (0 tight cases over 85,625 classes); synthesis instrument confirms slack `= 2c` at `k = 1` with 0 exceptions |
| 18 | **(DL+) / root-deficit**, Corollary A (no nontrivial tight case) and Corollary B (`n·D_k ≤ 2k·i_k·(n−1)`, tight for every tree at `k = 1`) — the same object as (RC) in the max-over-rootings presentation | `proved_informal`, **STATED** | acyclicity | `C-T1-U`, `C-T1-F`; **moves no order bound** (Corollary B through (EX) still yields `n = 4k` as the largest integer solution) |
| 19 | **`k = 1` criterion.** For every finite graph, (DL) fails at `k = 1` iff `|E| > n`; tight iff `|E| = n`. **The statement equivalent to acyclicity is the root-corrected form at `k = 1`:** `D_1 + 2c ≤ 2i_1 ⟺ |E| ≤ n − c ⟺ G is a forest` | `proved_informal`, **STATED** | none | `C-T2-U`, `C-T2-F` (plain form); `C-F1-U`, `C-F1-T` (root-corrected form, which is the registrable fence) |
| 20 | **ℤ-index completeness.** `Erdos993G1.delta G k ≥ 0` for every integer `k < 0`, so `Nat.find` over `ℕ` loses no descent and `firstDescent` is faithful | `proved_informal`, **STATED** | none | `C-T3-U` (F5) |
| 21 | **Leaf/branch reformulation.** For a finite tree with `2 ≤ n` and leaf set `L`: (DL) at `k` ⟺ `Σ_{deg v ≥ 3}(deg v − 2)c_v(k) ≤ Σ_{ℓ∈L} c_ℓ(k)`, with `Σ_{deg v ≥ 3}(deg v − 2) = |L| − 2` | `proved_informal`, **STATED**, with the `n ≥ 2` correction | treeness | `C-T2-U` (Step A); T adjudicator supplied the `n ≥ 2` correction |
| 22 | **Descent maxima.** `M(1) = 4`, `M(2) = 8`, `M(3) = 11` **unconditional**; `M(4) = 15` at (DL)'s grade via (LB)'s cap, else `bounded_computation` horizon 16. (LB) tight at `k = 1, 2`; slack at `k = 3, 4` | as stated | — | `C-T3-F`, `C-T3-U`, `C-F1-U`, `C-U1-F`, `C-U3-F`; T adjudicator sharpened to unconditional at `k ≤ 3` |
| 23 | **(XR) occupancy.** `max{n : x(F) < r} = 0, 4, 8, 11, 15` for `r = 1..5` (complete to order 16), `= 18` at `r = 6` (horizon 19, critic-attributed). `r = 6, d = 8, n = 20` unverified by anyone | `bounded_computation`, horizons on the face | — | `C-T3-F`; T adjudicator at `r ≤ 5` |
| 24 | **`E993-R27-KADDITION-CLOSURE-X-LE-5`.** `x(G ⊔ K₁) ≤ x(G) + 1` for every finite forest with `x(G) ≤ 5`. Evidence: (R5) ⇒ `x = 5 ⇒ n ≤ 20`; the r25 order-≤21 census target check (8,355,831 classes, 0 violations); in-run re-verification of the census **content** to order 19 (`C-F3-T`) and order 20 (`C-F3-U`); ranks 0–4 by `E993-R25-KADDITION-CLOSURE-X-LE-4`, rank 0 by `closure_certificate.json` | `proved_informal`-with-census, **STATED** (evidence line rewritten at Stage 5) | (DL)→(LB)→(R5); the census | F3 + `C-F3-T` + `C-F3-U`; F adjudicator rewrote the evidence line |
| 25 | **Rank-5 residue closeout record.** Under (R5) no finite forest of order 22–25 has `Δ_5 < 0`, so the residue of `E993-R25-RANK5-CEILING-SHARPENED-TO-25` (orders 22–25, ≥ 3 branch vertices) is **EMPTY** at `proved_informal`. The r25 lineage `36 → 33 → 29 → 25`, the two-branch exactness census and the `(k+1)²` formal award are untouched at their own statements | `proved_informal`, **STATED** | (R5) | T3, F3; both adjudicators; **not** unconditional, **not** formal |
| 26 | **External-source audit record** (restated): `sum_degOn_le` = (DL) at `S = univ`; `prefix_ratio` = (EX)'s prefix form with ℕ-truncated subtraction; `sum_numExtensions` = the double count (no acyclicity); `numExtensions_ge` = the subtraction-free `e(J)` bound; import closure `{Basic, Components, DegreeLemma, Extensions, Recursion}` (+`Ends`), **no excluded project module reachable**, but `Basic.lean` imports all of Mathlib so the slice gives **no** minimal-import signal; zero `sorry`/`admit`/`axiom`/`native_decide`/`unsafe`, five `decide` hits none reachable from either target by declaration order; Lean 4.29.1 / a different Mathlib pin vs. the run's 4.32.2 / `905b9581…`; **no LICENSE anywhere**, so Gate ruling 3 stands; the Lean comments' "Lemma 6.1"/"Proposition 6.2" vs the paper's 8.1/8.2; **`Polynomial.finset_sum_coeff` is a deprecated alias under the run's pin** (current name `Polynomial.finsetSum_coeff`), used three times inside `vpoly_coeff`, on the (DL) path. **No count of any kind is registrable** | record, **STATED** | — | F2; `C-F2-T` (the drift finding and the import-order argument), `C-F2-U`; F adjudicator rewrote the record |
| 27 | **Bounded evidence.** Zero violations of (DL), (RC), (EX), (LB), (XR), the double count and the per-set `e(J)` bound across: 85,625 forest isomorphism classes to order 16; all classes to order 19 and 20 (property layer); 40,232 labelled forests to order 7 under every root choice (F adjudicator and, independently, this synthesis); adversarial families to orders 120 and 200; 46,745 unicyclic graphs to order 12 plus 232,308 graphs with `|E| ≤ n` to order 7 | `bounded_computation`, horizons on the face | — | F1, T/F/U adjudicators, six critics, this synthesis |

**Registry comparison (mine, read at the exact keys).** (LB) `n ≤ 4k` strictly dominates every registered
forest order bound for `k ≥ 2`: `(k+1)²` (equal only at `k = 1`), `k²+k+3` (`k²−3k+3 > 0`), `Δ_4 < 0 ⇒ n ≤ 19`
(vs 16) and `Δ_5 < 0 ⇒ n ≤ 29` / `≤ 25` (vs 20). Every one of those registered claims **stays registered at
its own statement**; (LB) is a comparison, never a supersession, and the `(k+1)²` award's formal grade is
untouched.

---

## Refuted or narrowed mechanisms

**Refuted, at the exact statement, never to be carried forward.**

1. **T1 §3's displayed Step c** — false, 5,700/5,776; smallest witness `S = K₂` rooted at `r`, `T = K₁`
   (true `−2x`, displayed `−x`); it drops `−deg_S(r)·B'·A`.
2. **T1 §3's substitution box `E_S = vpoly_{S∖N[r]}(f_D^S) + B' − B`** — definitionally impossible (`B` is a
   quantity of `T`), false 5,602/5,776. **Must not reach Lean.**
3. **T1 §3's displayed `[x^k]E_T`** — omits `+ i_k(T∖N[r])`, yields `E_{K₁} = −1`. The §3 **definition
   line** is the specification.
4. **(D-REC)/(E-REC) read with the join rooted at `s`** — false in 4,414/5,776. The rooting annotation is
   part of the statement and travels into Lean.
5. **The naive child-swap injection** `(J,v,c) ↦ (J∖{v})∪{c}` — well defined iff every component is a star
   rooted at its centre; minimal rooting-free witness **`P₄`**, not `P₃`; "pick a better root" is closed.
6. **Edge-local charging** — the root-corrected (DL) is exactly `Σ_e c_{parent} ≤ Σ_e c_{child}`, false edge
   by edge (`K_{1,3}` rooted at a leaf, `k = 2`); the two-case repair collides on `P₄`, `k = 2`.
7. **Pointwise leaf dominance** — REFUTED; witness the order-5 tree `{0–1,0–2,0–3,1–4}` at `k = 3`. Any
   proof of the Hall condition must use the matching, not a maximum.
8. **(DL) on all finite bipartite graphs** — REFUTED, `K_{2,3}` at `k = 1` and `k = 2`. The registrable
   fence is the stronger `k = 1` criterion.
9. **"The forest layer is an unresolved debt that cannot be paid without T1's mechanism"** — refuted three
   times independently (Reconciliation 4).
10. **"average degree ≤ 2 ⟺ pseudoforest"** — false; `{|E| ≤ n}` strictly contains the pseudoforests.
11. **"(EX)/(LB)/(R5)/(XR) upgrade to (DL)'s grade automatically, at `proved_informal` or better"** — false
    for any formal grade.
12. **(DL) as a statement that certifies acyclicity** — every cycle `C_n` satisfies it with equality at
    every `k`. Only the root-corrected form separates, and exactly at `k = 1`.
13. **U2's leaf-by-leaf (pendant-only) shortcut** — REFUTED by both U2 critics and by the U adjudicator's
    reach table: pendant-only reaches exactly one rooted class per order (the path rooted at an endpoint);
    smallest obstruction `K_{1,3}`; the repair-by-strengthening fails inside the pendant family (negative in
    922 of 24,620 configurations).
14. **"Leaf existence is missing from Mathlib"** — REFUTED at the pin (`Acyclic.lean:494/508/516`); and the
    funded architecture does not need it.
15. **The naive single-root product `D_{A∪B}(a) = D_A(a)·Z_B`** — REFUTED at `|A| = |B| = 1`; the correct
    reduction is Established result 4.
16. **Any registrable count from the external slice** — declarations, citation closure, "proof-term"
    closure: four instruments, four answers, and Gate ruling 3 makes a true proof-term closure permanently
    unavailable for this source.
17. **An ℕ-transport obligation for (EX)** — the run states (EX) subtraction-free or in `ℤ` and may carry no
    external Lean text, so no transport of `prefix_ratio` is needed by any route.
18. **"Exactly this one inequality" as a necessity claim** for the K1-addition closure at rank `x` —
    `Δ_{x+1}(G) ≤ 0` suffices, is not necessary (`C-F3-U`'s exact witness); the conflation is inherited from
    the frozen r25 artifact's own "equivalently NR1" phrasing, which owes a scope note.
19. **The hygiene charge against F3's `ps aux | grep`** — NOT SUSTAINED; both critics applied a rule that
    did not bind that seat, and F3's kill was on the literal PID with an exit confirmation.

**Narrowed, not rejected.** `hyp-alpha` (enters no step; must not become a Lean hypothesis); T3's Step 8
"live" labels → "not excluded by (XR)" with the occupancy row; "(LB) tight at `k = 1`" → tight at `k = 1, 2`,
slack at `k = 3, 4`; T2's child-swap obstruction → re-witness at `P₄` in the rooting-free form; T2's
unicyclic null → state the class as `{|E| ≤ n}`, whose `k = 1` content is a theorem; the rank-5 residue
emptiness → carries (DL)'s grade at the point of use; F1's smallest non-forest witnesses → `K₄`/`K_{2,3}`
are order-minimal, `K₄ − e` is edge-minimal; F2's "self-contained slice" → "reaches no excluded **project**
module" (four files reach outside; `Basic.lean` imports all of Mathlib); F3's four orphaned digests
(`census_report_n{17,18,19,20}.json`) struck as evidence, contents reproduced independently; F3's "every
canonical tree checked" → 75 sampled objects across orders 1–10; F3's "Key finding" framing →
dispatch-derived; the order-22 novelty framing → the number stands on three instruments; C-U2-F's "the full
product apparatus of (8.4)–(8.5) is required" → a **binary** product layer is required, not the m-indexed
apparatus; U2's, U1's and U3's certification literals as listed by the U adjudicator.

**Refuted stays refuted.** `E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` (REFUTED; registered scope:
ordinary paths `P_n`) is a premise nowhere in any portfolio or in this synthesis;
`E993-FOREST-FIRST-DESCENT-DISJOINT-UNION-UPPER-ADDITIVITY` stays REFUTED. `SOLUTION-CONTRACT.md` §3.8's
`E993-R25-`-prefixed spelling is a packet defect (R27-E-c); the registry key governs and the fence is
intact either way.

---

## Headline verdicts

Exact evidence-grade verdict for every target of `SOLUTION-CONTRACT.md` §1.

| Target | Verdict at the close of Stage 6 | Basis |
|---|---|---|
| **(DL)** `E993-R27-FOREST-DEGREE-LEMMA` | **`proved_informal`** — closed DAG, no remaining unproved informal node, **two independent proofs** | corrected two-potential chain (T) and the injection proof of (RC) (F); each adjudicator-verified and machine-checked by a different instrument; synthesis instrument confirms |
| **(EX)** `E993-R27-FOREST-EXTENSION-INEQUALITY` | **`proved_informal`** (was `conditional`) | (DL) + the double count and the `e(J)` bound, both **`formally_verified`** in Lean this cycle |
| **(LB)** `E993-R27-FOREST-DESCENT-LINEAR-BOUND` | **`proved_informal`**, uniform in `k` including `k = 0` | (EX) + `Δ_k < 0 ⇒ i_k > 0`; the implication is compiled |
| **(R5)** `E993-R27-RANK5-CEILING-20` | **`proved_informal`** | (LB) at `k = 5`; the implication is compiled including the `(5:ℤ)`/`((5:ℕ):ℤ)` cast bridge |
| **(XR)** `E993-R27-DESCENT-RESTRICTION-4R-MINUS-4` | **`proved_informal`**; `r = 0` truncation vacuous-hypothesis-sound | (LB) at `k = x(G) ≤ r−1`; `firstDescent` compiled and proved definitionally unique across two seats |
| **(K1)** `E993-R27-KADDITION-CLOSURE-X-LE-5` | **`proved_informal`-with-census**, STATED | (R5) + the r25 order-≤21 census, its content re-verified in-run to order 20; **never `formally_verified`** (Gate ruling 6, fence §3.4) |
| **Rank-5 residue closeout record** | **`proved_informal`**, STATED; the residue is **EMPTY** | (R5); a scope note on the r25 face, not an edit and not an unconditional statement |
| **External-source audit record** | **record**, STATED (rewritten at Stage 5); **no count registrable** | F2 as narrowed by both critics and the F adjudicator |

**Separately, with no status transfer** (fence §3.1) — unchanged by construction, and I say so explicitly:

| Key | Status entering r27 | Status at the close of Cycle 1 |
|---|---|---|
| `E993-R25-UNR-FOREST-WIDE` (r25 Tier 1) | OPEN | **OPEN, untouched, no truth value asserted** |
| `E993-G1WIDE-NO-SIZE-CAP` | OPEN | **OPEN, untouched** |
| NR1 | as registered | **unchanged** |
| FOREST | as registered | **unchanged** |
| TREE | as registered | **unchanged** |
| TRANSFER | as registered | **unchanged** |
| Erdős #993 | open | **open, unchanged** |

(LB), (R5) and (XR) are ORDER BOUNDS whose contrapositives carry sign `Δ_k ≥ 0`; none is a no-recovery
statement and no no-recovery wording appears anywhere in this synthesis.

**Scope notes the controller should add to each r25 key of the lineage** (records and notes only; sealed
claims are never edited, fence §3.5):

1. `E993-R25-RANK5-CEILING-SHARPENED-TO-25` — "r27 Cycle 1: under (R5) (`E993-R27-RANK5-CEILING-20`,
   `proved_informal`) the stated residue for `x = 5` on orders 22–25 with ≥ 3 branch vertices is EMPTY. The
   claim's own statement and VERIFIED grade are unchanged; the residue note is a downstream consequence at
   `proved_informal` and does not promote to this face."
2. `E993-R25-RANK5-TWO-BRANCH-EXACTNESS-ORDERS-22-29` — "r27 Cycle 1: stands as a standalone theorem at its
   own statement; its **role as an input** to the K1-addition closure is superseded by the (R5) route, which
   needs no branch-vertex analysis."
3. `E993-R25-SECOND-ORDER-TWO-SIDED-CEILING` — "r27 Cycle 1: (LB) gives `Δ_4 < 0 ⇒ n ≤ 16` and
   `Δ_5 < 0 ⇒ n ≤ 20` at `proved_informal`, strictly stronger at both ranks. This claim is unchanged; no
   grade moves."
4. `E993-R25-KADDITION-CLOSURE-X-LE-4` — "r27 Cycle 1: extended to `x ≤ 5` by
   `E993-R27-KADDITION-CLOSURE-X-LE-5` at `proved_informal`-with-census; the census input is named on the
   new claim's face, order 0 is covered by `closure_certificate.json`'s rank-0 entry, and no formal grade
   from (LB)/(R5) promotes either claim."
5. `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` — "r27 Cycle 1: `4k ≤ (k+1)²` with equality only at `k = 1`,
   so (LB) is at least as strong at every `k` and strictly stronger for `k ≠ 1`, and covers `k = 0` which
   this award's scope excludes. Both stay registered; this award's formal grade is untouched and its scope
   note's true maxima 4, 8, 11, 15 are reconfirmed, with `M(1..3)` now unconditional."
6. `E993-R25-FOREST-ORDER-BOUND-SHARPENED` — "r27 Cycle 1: `k²+k+3 − 4k = k²−3k+3 > 0` for every `k`, so
   (LB) strictly dominates at every `k ≥ 2`. This claim is unchanged."
7. `E993-R25-HUNTER-SPANNING-TREE-INEQUALITY` — "r27 Cycle 1: the `x ≤ 5` closure route does not use it;
   the claim is unchanged and its r25 role is untouched."
8. The frozen r25 census artifacts (`sources/r25/c4-T4-census/search_report_n21.json`) — "the
   `claim_checked` phrasing 'equivalently NR1' conflates a sufficient condition with a necessary one; a
   scope note is owed on the artifact's phrasing, not on any r27 seat."

**Packet record corrections owed by the controller** (not seat findings): the `(8.8)` pointer in
`SEMANTIC-CONTRACT.md` §3 and `control/C1-ALLOCATION.md` item 5(b) — the double count is **(8.1)**, (EX) is
the unnumbered ratio display inside Proposition 8.2's proof, and (8.8) is that proposition's conclusion;
`sources/external/STATIC-SCAN.json`'s undeclared scope in both dimensions (file set and token set);
`SEMANTIC-CONTRACT.md` §4's "tight cases" label (R27-E-b, now a theorem); `SOLUTION-CONTRACT.md` §3.8's
malformed refuted key (R27-E-c); and `control/C1-ALLOCATION.md` item 1, which printed the (D-REC)/(E-REC)
forms verbatim under the instruction "derive it yourself".

---

## Lean awards

### Decision 1 — the proof of record for (DL) that the Stage 7 formalizer follows

Two complete informal proofs exist and both are `proved_informal`. I decide, and I do not leave it open:

> **The proof of record for (DL) is the injection proof of the root-corrected lemma (RC),
> critic-attributed to `C-F1-T`, with the corrected two-potential chain (`C-T1-F`/`C-T1-U`, equivalently
> `C-U2-T`'s edge-split join) retained as the NAMED FALLBACK, and the formalizer authorized to switch to
> the fallback at a single stated decision point.**

Reasons, on the evidence and not on adjudicator counts:

1. **Lean cost.** The injection route's open nodes are: rooting a finite acyclic graph by a parent map; the
   edge ↔ non-root bijection; `N(v) = {p(v)} ∪ children(v)`; one `Finset.card_le_card_of_injOn` over
   `Σ_{v non-root} I_k`; the ℕ→ℤ cast. The two-potential route's open nodes are: `Z_union_of_separated`;
   closure of coefficientwise nonnegativity under convolution; the tree edge-split API; the simultaneous
   all-roots induction on `Finset.card`; the forest step. Five structural nodes with a product layer versus
   a rooting API and one injection.
2. **It deletes the run's long pole.** The injection avoids the polynomial/potential layer entirely, so
   `C1-U-02`'s machinery is not on the critical path at all, and with it the **deprecated-alias hazard**
   (`Polynomial.finset_sum_coeff`, three uses inside `vpoly_coeff`) disappears with the polynomial layer.
   This is orientation F's highest-value message to Stage 7 and it is correct.
3. **It proves more.** (RC) is strictly stronger than (DL) and yields (SH), the strictness theorem
   (`2k i_k − D_k ≥ 2`, exact slack `2c` at `k = 1`) and the acyclicity equivalence at `k = 1` as
   corollaries, all of which the record wants and none of which the two-potential route gives for free.
4. **Fence hygiene.** All three external name coincidences live on the two-potential route's carrier; the
   injection route shares no vocabulary with the unlicensed external slice and is the cleanest possible
   discharge of Gate ruling 3.
5. **Verification depth.** The proof was verified line by line by the F adjudicator, including
   well-definedness in both branches of the type-A/type-B split, and machine-checked **pair by pair** on the
   injection itself over 40,233 labelled forests under every root choice; `C-F1-T`'s own instrument mapped
   356,703 source pairs to order 10; this synthesis reproduced the whole check independently on 40,232
   labelled forests (plus the empty forest) with zero failures. That the in-run derivation lands verbatim on
   the paper's own strengthened intermediate step, by a disjoint mechanism and with the source text not
   read, is the strongest fidelity evidence this run has produced.

**The switch point, stated exactly.** If the rooting API — a parent map `p` on a finite acyclic graph with
the edge ↔ non-root bijection and `N(v) = {p(v)} ∪ children(v)` — is not sorry-free by the halfway mark of
the bounded attempt, the formalizer switches to the fallback, where `R27DegreeLemma`'s 27 declarations, both
U2 critics' modules, both adjudicator carrier bridges and `AdjU.indepFinsets_union_of_separated` already
compile and the smallest open node (`Z_union_of_separated`) is Finset bookkeeping over content that is
already compiled. The formalizer records which route it followed and why; **whichever route lands, the award
face carries FLNYZ 2026 §8 for the mathematics and the r27 critic attribution for the derivation.**

The fallback is fundable because of this synthesis's Reconciliation 2: the U orientation's own caveat that
its edge-split join is "informally derived, not a verified statement-level proof" is discharged by the T
orientation's symbolic derivation of the same identity. Without that cross-orientation reconciliation the
fallback would not meet §5(c)'s "proved mathematics" test; with it, it does.

### Decision 2 — Stage 7 funding

**Stage 7 is funded**, in four award groups. Every open node in every funded group is a **Lean-engineering
node over proved mathematics**, which is exactly the condition `SOLUTION-CONTRACT.md` §5(c) and protocol
duty 4 impose.

**`C1-LA1` — (DL) + (EX). FUNDED as a BOUNDED ATTEMPT.**

Exact statements (unchanged from `SOLUTION-CONTRACT.md` §2; the synthesis narrows nothing):

```lean
theorem forest_degree_lemma {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ) :
    (indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k

theorem forest_extension_inequality {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ) :
    (Fintype.card X : ℤ) * Erdos993G1.indepCount G k
      ≤ (k + 1) * Erdos993G1.indepCount G (k + 1) + 3 * k * Erdos993G1.indepCount G k
```

Hypotheses: acyclicity and finiteness only; **no `α`/`hyp-alpha` side condition**; the root is a free
parameter of the proof, never of the statement. Both must be stated **with instance binders**, not at one
fixed `Fintype` instance (`C-U3-F`'s caveat, load-bearing: the free composition with the compiled chain
depends on it). Fences: §3.3 — an average over `I_k`, no pointwise degree statement registrable; §3.1 — no
status transfer to `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER, the
all-rank aggregate, `E993-BETA-AGG` or Erdős #993; §3.2 — nothing asymptotic; §3.6 — every declaration
authored in-run, no external Lean text, independent identifier names. Attribution: FLNYZ 2026 §8 on the
face for the mathematics; `C-F1-T` for the injection derivation (or `C-T1-F`/`C-T1-U`/`C-U2-T` if the
fallback is taken); T1 for the two-potential architecture if used. Excluded conclusions: nothing about
tightness of (DL) (it is never tight — Established result 17); no claim that (DL) certifies acyclicity (it
does not — only (RC) at `k = 1` does); no `α` hypothesis; no pointwise statement.
Open nodes (all Lean-engineering): the rooting API, the edge ↔ non-root bijection, the children/parent
neighbour decomposition, one `card_le_card_of_injOn`, the ℕ→ℤ cast discipline on `2 − (G.degree v : ℤ)`
(the one place a development type-checks while proving a clamped falsehood — `f_D(v)` genuinely reaches
`−3` and `−5`). (EX) then follows from (DL) by **already-compiled** theorems.

**`C1-LA2` — the unconditional counting core. FUNDED; ready now, independent of (DL).**

```lean
theorem Erdos993G1.double_count {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k : ℕ) :
    ((k : ℤ) + 1) * Erdos993G1.indepCount G (k + 1) = ∑ J ∈ G.indepSetFinset k, (Erdos993G1.e G J : ℤ)

theorem Erdos993G1.e_ge_sub {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k : ℕ) {J : Finset X} (hJ : G.IsNIndepSet k J) :
    (Erdos993G1.e G J : ℤ) ≥ (Fintype.card X : ℤ) - (k : ℤ) - (∑ v ∈ J, G.degree v : ℤ)
```

Candidate keys `E993-R27-INDEP-EXTENSION-DOUBLE-COUNT` and `E993-R27-EXTENSION-LOWER-BOUND`. Hypotheses:
`[Fintype X] [DecidableEq X] [DecidableRel G.Adj]`, and for the second `hJ`. **No acyclicity, no `(★)`
hypothesis, no `hyp-alpha`** — a stray `hG : G.IsAcyclic` binder on either is a hypothesis the statement
does not need and is struck at fidelity review. Already sorry-free at `[propext, Classical.choice,
Quot.sound]`, seat-attributed to U3, independently re-derived by `C-U1-T`, replayed by the U adjudicator.
Excluded conclusions: these are **graph-general** facts; they are not forest statements, they are not
evidence for (DL) or (EX) beyond "the bridge is built", and they transfer no status. Stage 7 work is
assembly and fidelity review only. Optional, at the formalizer's discretion: compile (EXX-local)
(`e(J) = n − k − Σ deg + exc(J)`) and obtain the inequality by `exc(J) ≥ 0` together with the equality case
for free — `C-T3-U`'s identity, STATED, needs its own second read before it is registered separately.

**`C1-LA3` — the implication chain. FUNDED; ready now, independent of (DL).**
`DlHyp → ExHyp ∧ LbHyp` with `LbHyp → R5` and `LbHyp → XR`, the hypothesis types **definitionally** the
frozen §2 declarations, plus the `[Finite X]`/`Nat.card` contract landings and the `(5:ℤ)`/`((5:ℕ):ℤ)` cast
bridge. Candidate key `E993-R27-DEGREE-LEMMA-IMPLIES-EXTENSION-CHAIN`. Grade **`formally_verified` as
implications**; the four targets stay `conditional` until `C1-LA1` lands. Fence, on the face: **the
implication is the award, the targets are not**; and `C-U3-F`'s instance caveat travels with it.
Critic-attributed (`C-U1-T`, `C-U3-T`, `C-U3-F`, `C-U1-F`).

**`C1-LA4` — the linear-bound consequences (LB), (R5), (XR). FUNDED, contingent on `C1-LA1`.**
Exact §2 statements `forest_descent_linear_bound`, `forest_rank5_ceiling_20`, `forest_descent_restriction`.
They require **no new mathematics and no new Lean work** beyond `C1-LA1`: the implications are `C1-LA3`, so
they land by application the moment (DL) compiles. Fences: order bounds with contrapositive sign
`Δ_k ≥ 0`; none is a no-recovery statement; (XR) is **not** a uniform bound on `d`; the `r = 0` truncation
is recorded as vacuous-hypothesis-sound, not as correct arithmetic; the r25 `(k+1)²` award stays registered
at its own statement and this is a comparison, not a supersession. Excluded conclusions: no tightness claim
for `4k` beyond `k = 1, 2`; `M(4)`'s exactness carries (DL)'s grade, not a formal one; `M(1..3)` are
unconditional and are census facts, not awards.

**Not funded, and explicitly `no award attempted`:**

- **(K1) `E993-R27-KADDITION-CLOSURE-X-LE-5`** — `no award attempted`. It is `proved_informal`-with-census
  by construction and can never be `formally_verified` (Gate ruling 6, fence §3.4). It is a registration,
  not an award.
- **The rank-5 residue closeout and the external-audit record** — records, not awards; each STATED and
  owing an isolated second read.
- **Every fixed-rank and bounded result** — `dl_rank_zero`, `dl_rank_one`, `ex_rank_one`, `lb_rank_zero`,
  `lb_rank_one`, `crit_LB_k0`, `crit_LB_k1`, the `M(k)` values, the (XR) occupancy row, the `Δ_5 < 0 ⇒ n ≤ 18`
  companion, every census figure: correct, sorry-free where compiled, and **a fixed-band or bounded result
  never qualifies as an award group**. They narrow the SORRY LEDGER and they are the run's first
  unconditional forest content; they are not awards.
- **The Hall/SDR route to (DL)** (`C-T2-U` Step C) — a proved reduction of (DL) to one named, isolated
  combinatorial hypothesis, with zero failures over all 987 free trees to order 12 and every `k`. A
  zero-failure search is not a proof. Step A `proved_informal` (with the `2 ≤ n` correction), Step B
  `proved_informal`, **Step C OPEN**, Step D REFUTED. It is the best Cycle 2 route for a third derivation
  and it is **not** on the funded critical path.

**Smallest unproved node, per route.** Primary route: none mathematically; the smallest Lean node is the
parent-map rooting API for a finite acyclic graph. Fallback route: none mathematically (Reconciliation 2);
the smallest Lean node is

```lean
theorem Z_union_of_separated {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] {A B : Finset X} (hd : Disjoint A B)
    (hsep : ∀ a ∈ A, ∀ b ∈ B, ¬ G.Adj a b) (k : ℕ) :
    R27DegreeLemma.Z G (A ∪ B) k
      = ∑ i ∈ Finset.range (k + 1), R27DegreeLemma.Z G A i * R27DegreeLemma.Z G B (k - i)
```

whose mathematical content is already compiled as `AdjU.indepFinsets_union_of_separated`; what remains is a
`Finset.card_nbij'` on `J ↦ (J ∩ A, J ∩ B)` with inverse `(J_A, J_B) ↦ J_A ∪ J_B`, plus a decomposition of
the product set by `p.1.card`.

### The byte-identical carry list for Stage 7

Transport is **byte-identical only**, fragment by fragment through the registrar (the kernel verifier admits
a single source importing only Mathlib). **No external Lean text is carried, ever** (Gate ruling 3, fence
§3.6). Digests are full SHA-256. The five frozen rows I verified from the bytes myself and against
`control/SOURCE-DIGESTS.json`; the fourteen scratch rows are **carried on the U adjudicator's authority**
(that scratch is outside my read grant and I did not open it), and every digest the U adjudicator prints
agrees with the digests the corresponding returns and critiques assert.

| # | Seat / critic / adjudicator | Path (relative to the run root) | Bytes | Lines | SHA-256 |
|---|---|---|---|---|---|
| 1 | r25 award source (frozen) | `sources/r25/c4-forest-descent-order-bound/LeanProject/lakefile.toml` | 237 | 11 | `45d0ca58145784d5f29322ff21a1335e350c38e72afe8d5396d9c9910b94ff49` |
| 2 | r25 award source (frozen) | `sources/r25/c4-forest-descent-order-bound/LeanProject/lake-manifest.json` | 3559 | 117 | `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` |
| 3 | r25 award source (frozen) | `sources/r25/c4-forest-descent-order-bound/LeanProject/lean-toolchain` | 25 | 1 | `2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273` |
| 4 | r25 award source (frozen) | `sources/r25/c4-forest-descent-order-bound/LeanProject/LeanProof.lean` | 22 | 1 | `f4dfdef8320a735eab53d24f4b47d3b60bcb474ffd2c84c77f24ae2fc75fcf31` |
| 5 | r25 award source (frozen) — **G1 definitions of record, entries 1–17** | `sources/r25/c4-forest-descent-order-bound/LeanProject/LeanProof/Main.lean` | 17180 | 390 | `736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0` |
| 6 | **U1** — G1 prefix + definition layer + the five frozen target statements | `scratchpad/c1-U1/LeanProject/LeanProof/Main.lean` | 27328 | 591 | `8cc381f413e6b5533995a362f4f38f4930d99119e8eece9a5f1cc323a62dea0d` |
| 7 | **U1** — theorem contract (**draft**; carry only after the two corrections below) | `scratchpad/c1-U1/THEOREM-CONTRACT.draft.yaml` | 13390 | 219 | `791eb99f7a94d3bea672b2ed83591a9d020692ed47b58cb42c9149223184670a` |
| 8 | **U2** — `R27DegreeLemma` core (**rename before any award face**) | `scratchpad/c1-U2/LeanProject/LeanProof/Main.lean` | 26961 | 499 | `d068c00480a205cdbb9edef12592246bc0b0cf20575cb9d434d2458bdae164df` |
| 9 | **U3** — double count, `e(J)` bound, the conditional chain | `scratchpad/c1-U3/LeanProject/LeanProof/Extension.lean` | 18472 | 397 | `116b4f313eedfe4210173226c2f5ef877a6e1ee07061888f4106e908ba6b08a6` |
| 10 | **C-U1-T** — the capstone chain | `scratchpad/c1-crit-U1-T/CriticAdvances.lean` | 13033 | 256 | `41dae810663a4ae1c680afac7bacc0824351f94858e89f5da32fdd51c112515a` |
| 11 | **C-U1-F** — independent carrier bridge | `scratchpad/c1-crit-U1-F/LeanProject/CritAdvance.lean` | 3327 | 70 | `0ba36a8999911419e7655599acf459a6a7f866142cb6318632b05066250940a1` |
| 12 | **C-U1-F** — `k = 0`, `k = 1` | `scratchpad/c1-crit-U1-F/LeanProject/CritAdvance2.lean` | 2079 | 51 | `1cb6173f39071040bc4a682b2a0c02f885edb0bf01ff0213e5c7aabb9a2156a8` |
| 13 | **C-U2-T** — edge-split audit | `scratchpad/c1-crit-U2-T/LeanProject/LeanProof/Audit.lean` | 3535 | 75 | `19b9a2f8cf95652596cb35402ef9ca8018d55ce44f387b902347686ddf5a25d5` |
| 14 | **C-U2-F** — `D0` layer, leaf peeling, `degree_lemma_of_root` | `scratchpad/c1-crit-U2-F/LeanProject/LeanProof/CriticU2F.lean` | 6142 | 132 | `779d2ddca5d1cdc94bc90e083ddb047d79c3cccf6882b2728827bca682e80b02` |
| 15 | **C-U3-T** — §2 landings, ranks 0–1 | `scratchpad/c1-crit-U3-T/LeanProject/LeanProof/Audit.lean` | 8278 | 187 | `2d28f5adf70f34f464d7b7498939d8ec83816253f3dc4c023e7af6c3e74488dc` |
| 16 | **C-U3-F** — composition, non-vacuity, `Empty` carrier | `scratchpad/c1-crit-U3-F/replay/LeanProject/LeanProof/Critic.lean` | 6149 | 145 | `15cadccc89bb23c3f835e59b40f6a9d4838db2987206befc81a952208efc954d` |
| 17 | **U adjudicator** — `Z`/`degOn` carrier bridges | `scratchpad/c1-adj-U/LP-BRIDGE/Bridge.lean` | 1573 | 43 | `8f5daebe06eab9995458846a87071d6821cae4a9bc91717d69ce6cadca61ad2d` |
| 18 | **U adjudicator** — separated-union characterisation | `scratchpad/c1-adj-U/LP-BRIDGE/Prod.lean` | 1918 | 41 | `09a92e3cbd06c387e3f575b73e993bbfdc37b96769aa9383c85c5e4bda0f856b` |
| 19 | **U adjudicator** — U1 ≡ U3 by `rfl` | `scratchpad/c1-adj-U/LP-MERGE/Reconcile.lean` | 801 | 21 | `0d3de24cd2972b0cb0dec3c7c4b5264662abf98e55b864b67773689f06ac3f2d` |

Conditions on the carry. (i) U1's five `sorry`'d targets are carried **as statements of record only**; they
are not theorems and no grade attaches. (ii) Row 7 is carried only after the `Type u`/`Type v`
reconciliation and after either recording per-statement digests or deleting the two sentences promising
them; until then the anti-drift test of record is the elaborated-type comparison (`#check`), which is
stronger than a byte comparison and immune to the universe-binder difference. (iii) Rows 10–16 are
**critic-attributed** and rows 17–19 **adjudicator-attributed** on every face; they are not seat work.
(iv) Row 8 is carried only **after** the three renames below. (v) Attribution travels on every face as in
`SOLUTION-CONTRACT.md` §3.7. (vi) Toolchain pinned: Lean 4.32.2 / Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`,
bound by MANUAL SYMLINK of `.lake/packages` to the pinned shared Mathlib project; never `lake update`,
never `lake clean`, never `elan`, no network, no installs.

### The three renames (Gate ruling 3 hygiene, mandatory before any award face)

The U adjudicator computed the intersection of every declaration base name in the carry list with all 192
declaration base names of the frozen external slice. **The complete coincidence list is exactly three
names, all in row 8 (U2's file)**; every other carried file has zero coincidences, and the external
carrier's own vocabulary (`icoeff`, `Zgen`, `indepPoly`, `vpoly`, `Dpoly`, `Epoly`, `degDefect`,
`degDefectAux`, `indepCard`, `numExtensions`, `sum_degOn_le`, `prefix_ratio`) appears nowhere in this run's
work.

| # | Current identifier | External location | Relation | Required rename |
|---|---|---|---|---|
| 1 | `indepFinsets` | `Basic.lean:62` | **body identical** up to the type variable and `noncomputable`/`open scoped Classical in` | `indepFinsets → r27IndepFinsets`, **and the body re-expressed** |
| 2 | `mem_indepFinsets` | `Basic.lean:67` | **name and statement identical** up to the type variable; proof differs; **first recorded by the U adjudicator, disclosed by nobody earlier** | `mem_indepFinsets → mem_r27IndepFinsets` |
| 3 | `degOn` | `Basic.lean:152` | name only; external body `(nbr G v ∩ S).card` vs. U2's `(S.filter (fun w => G.Adj v w)).card` | `degOn → r27DegreeIn` |

**No Gate-ruling-3 strike is recorded**: the three names are quoted to every seat by its own authorized
packet, `S.powerset.filter (independent)` is the one idiomatic Mathlib rendering, and U2's architecture
diverges from the external `Polynomial ℤ` route everywhere it had a choice. But the renames and the body
re-expression are **required before any award face may carry "authored in-run"**, so that no shipped line
coincides with unlicensed external text. U2's declarations already sit in namespace `R27DegreeLemma`, which
mitigates and does not discharge the coincidence. If the primary (injection) route lands, row 8 is off the
critical path entirely and the renames apply only if any of its fragments is carried.

**One further Stage 7 input from orientation F, operationally decisive if the fallback is taken:**
`Polynomial.finset_sum_coeff` is a **deprecated alias** under the run's pin; write
`Polynomial.finsetSum_coeff`. Also confirmed present at the pin: `SimpleGraph.IsAcyclic.path_unique`,
`Finset.card_nbij'`, `le_tsub_add`, and the acyclic/leaf API at `Acyclic.lean:96/137/494/508/516`.

---

## Progress and stop-gate ruling

```text
headline_resolved: no
material_progress: yes
plateau: no
continue: yes
```

**`headline_resolved: no`.** The headline is (DL)+(EX) **formally verified** at `SOLUTION-CONTRACT.md` §2
with (LB)/(R5) checked formally and the rank-5 residue closed out. That is a governed formal award; none
exists at Stage 6 and no Stage 5 or Stage 6 document can produce one. Two of the three orientations
compiled nothing at all; the one that compiled has no artifact stating (DL).

**`material_progress: yes`.** (DL) entered the cycle as an external claim absent from the registry, with no
in-run proof and nothing compiled. It leaves with: **two independent complete informal proofs** by disjoint
mechanisms, each verified by a different neutral adjudicator and machine-checked by a different independent
instrument; (EX), (LB), (R5) and (XR) moved from `conditional` to `proved_informal`; **two graph-general
counting theorems formally verified** (the double count and the `e(J)` bound, with the load-bearing finding
that neither needs acyclicity); the **entire implication chain formally verified** and landed on the
contract's own `[Finite X]`/`Nat.card` signatures; a definition layer of record proved **definitionally
equal across two independently written seats by `rfl`**; both carrier bridges compiled; the K1-addition
closure extended from `x ≤ 4` to `x ≤ 5` at a strictly smaller dependency footprint than the historical r25
route; the rank-5 residue closed out as EMPTY; the census property layer re-verified in-run to order 20 by
two independent instruments and the population extended to order 22 under three; R27-E-b upgraded from
erratum to theorem; nineteen mechanisms refuted at exact statements with exact witnesses; and the registry
alias check discharged. Against that: the cycle's single load-bearing derivation (T1 §3) shipped false and
was repaired by critics rather than by the route, the allocation's named `INFORMAL-PROOF.draft.md` was not
delivered, and several dozen certification literals are struck across the three orientations. That is large
material progress **with** a real process failure, and both are recorded.

**`plateau: no`.** A plateau is a cycle with no material progress on the proof, the formalization or the
closeout. All three moved. Cycle 1 of six; the ceiling is not in play.

**Stop gate (`SOLUTION-CONTRACT.md` §5), applied.**
(a) **Not met.** (DL) and (EX) are not formally verified; (LB) and (R5) are not checked formally; the
decisive event cannot occur before Stage 7.
(b) **Not met, and refuted rather than merely absent.** No in-scope counterexample exists: zero violations
over 85,625 isomorphism classes to order 16, all classes to orders 19 and 20 in the property layer, 40,233
labelled forests to order 7 under every root choice (twice, by two independent instruments), adversarial
families to orders 120 and 200 — and the strictness theorem **explains** why none exists: on a finite
forest, `2k·i_k − D_k ≥ 2M_k ≥ 2` for every `k ≥ 1` with `i_k > 0`.
(c) **Met exactly.** The mathematics of (DL) and (EX) is `proved_informal` at the close of Stage 6, with a
closed dependency DAG on the primary route and on the fallback, and Stage 7 is blocked on bounded, named
Lean obligations. **CONTINUE.**

**Is Cycle 2 needed at all?** No, if Stage 7 closes the award. Gate ruling 9 and
`SOLUTION-CONTRACT.md` §5(a) together mean that if Stage 7 returns `C1-LA1` `formally_verified` with
`C1-LA4` checked formally and the residue closeout recorded, **the run ends at the Cycle 1 close** and the
portfolio below is moot. `continue: yes` therefore means: Cycle 2 runs **unless** Stage 7 closes the award.

**Is the mathematics of (DL) and (EX) `proved_informal` at the close of Stage 6?** **Yes**, and this is the
explicit ruling the protocol asks for. (DL): two independent proofs, closed DAGs, no remaining unproved
informal node on either. (EX): (DL) plus the double count and the `e(J)` bound, both of which are stronger
than `proved_informal` — they are `formally_verified`. The composition's grade is its weakest input's, so
(EX) is `proved_informal`, never above.

---

## Next-cycle portfolio

Applies **only if Stage 7 does not close the award.** Nine routes, three per orientation, none outside the
charter. If Stage 7 closes the award, the whole portfolio is moot; what a **successor run** (not this one)
would inherit is stated at the end.

**Orientation T (prove).**

1. **`C2-T-01 DEGREE-LEMMA-PROOF-OF-RECORD`.** Write the `INFORMAL-PROOF.md` Cycle 1 owed and did not
   deliver, carrying **both** proofs at statement-level granularity in one claim ledger: the injection proof
   of (RC) as the proof of record (with the type-A/type-B invariant written out and `k = 0`, `k > α`, the
   empty forest and disconnected forests discharged), and the corrected two-potential chain as the fallback
   (T1's §2 primitives, the corrected join **with its rooting annotation**, the §3 **definition line** for
   `E_T`, the every-rooted-tree induction, both forest layers, the §5 range completion and the ℤ-cast
   ledger, `hyp-alpha` removed). One named Lean node per entry. *Closes in one cycle:* the Stage 7
   specification ambiguity that caused this cycle's failure, and the last attribution question on the
   record.
2. **`C2-T-02 LEAF-BRANCH-SDR-DECIDE`.** Prove or refute `C-T2-U`'s Step C at its exact statement via Hall's
   criterion, with Step A restated for `2 ≤ n`; push the horizon to order 15–16 first; note the pointwise
   form is refuted, so any proof must use the matching, and any injective route must avoid both the `P₄`
   rooting-free failure and the edge-local failure. *Closes in one cycle:* a third, generating-function-free
   derivation, or a sharp refutation that ends the search.
3. **`C2-T-03 SHARPENINGS-AND-RECORD-CORRECTIONS`.** Consolidate for isolated second reads: (RC)/(DL+) with
   Corollaries A and B in one canonical form; (EXX); the `k = 1` criterion and the root-corrected acyclicity
   equivalence as the single registrable fence; the ℤ-index completeness fact; the occupancy row replacing
   T3's "live" labels; the (LB) sharpness profile. Settle `M(4)` unconditionally and `M(5)` by extending the
   census to orders 17–20. *Closes in one cycle:* the Step 8 table correction, the r25 scope notes this run
   owes, the tight-case question, and the last unverified live-region cell (`r = 6, d = 8, n = 20`).

**Orientation F (falsify).**

1. **`C2-F-01 INJECTION-SECOND-READ-AND-REGISTRATION-PACKET`.** An **isolated** second read of (RC), (SH)
   and the strictness theorem at their exact statements, by a reader who has seen neither `C-F1-T` nor
   `C-F1-U`; plus the two-line double count written out at statement-level granularity so the (EX) DAG
   closes inside orientation F. (The registry alias check this route was to carry is **already discharged**
   by this synthesis — do not re-spend a route on it; re-run it only for keys coined after this stage.)
   *Closes in one cycle:* converts the proof of record from STATED to registrable.
2. **`C2-F-02 EXCESS-ONE-BOUNDARY`.** Either prove (DL) for excess-1 graphs by repairing the injection at
   the single vertex `y` where it fails (delete the cycle-closing edge `xy`, root at `x`; closing it needs
   `a_y ≤ a_x`), or find a failure at larger order. *Closes in one cycle:* turns the portfolio's strongest
   bounded null (46,745 + 31,892 + 232,308 instances, two instruments) into a theorem or a refutation, and
   fixes the registrable form of the fence as the root-corrected `k = 1` equivalence with `K₄ − e` as the
   edge-minimal witness.
3. **`C2-F-03 K1-ADDITION-AT-RANK-SIX`.** (LB) at `k = 6` gives `n ≤ 24` with no rank-specific machinery,
   but the in-run property layer stands at order 20 and the frozen census at 21. Priced: 146,271,593 classes
   cumulative to order 24, with **per-class evaluation, not enumeration**, as the bottleneck. Either push the
   property census toward 24 with a faster evaluator, or find a rank-6 argument that avoids a full census.
   *Closes in one cycle:* `E993-R27-KADDITION-CLOSURE-X-LE-6` at `proved_informal`-with-census, or a priced,
   evidenced statement that the census route is closed.

**Orientation U (formal).** Re-pointed from the U adjudicator's own proposals to follow the proof of record
named above.

1. **`C2-U-01 ROOTING-API-AND-THE-INJECTION`** — the funded long pole under the primary route. Formalize, in
   order: a parent map for a finite acyclic graph (one root per component, `p(v)` the next vertex on the
   unique path to the root, via `SimpleGraph.IsAcyclic.path_unique`); the edge ↔ non-root bijection;
   `N(v) = {p(v)} ∪ children(v)`; then `Φ` and one `Finset.card_le_card_of_injOn` to reach (RC), and (DL) by
   discarding the nonnegative root term. *Could close in one cycle:* (DL), and with it (EX), (LB), (R5) and
   (XR) by application of the already-compiled chain.
2. **`C2-U-02 PRODUCT-LAYER-AND-EDGE-SPLIT-JOIN`** — the fallback, run in parallel so the bounded attempt has
   two shots. `Z_union_of_separated` (its mathematical content is already compiled); closure of
   coefficientwise nonnegativity under convolution; the tree edge-split (Mathlib's bridge API,
   `isAcyclic_iff_forall_adj_isBridge`); `C-U2-T`'s two identities; then the simultaneous all-roots induction
   on `Finset.card` and the adjudicator's forest reduction. **Do not spend the cycle on leaf existence** — it
   is in Mathlib and the route does not need it. *Could close in one cycle:* the product layer and the
   `D_T(a)` identity, making the all-roots induction a bounded remaining step.
3. **`C2-U-03 AWARD-PROJECT-ASSEMBLY-AND-HYGIENE`** — one project from the carry list: a single run-local
   namespace for the definition layer, carrying the `rfl` agreement lemmas as the proof that no drift
   occurred; the three renames and the `indepFinsets` body re-expression; the run-local definitions' **text**
   plus per-definition digests lifted into the contract (Gate ruling 5, which no artifact currently
   satisfies); the `Type u`/`Type v` reconciliation and the per-statement digests added or their promise
   deleted; one copy of each duplicated critic result, recorded. *Could close in one cycle:* `C1-LA2`,
   `C1-LA3` and the definition layer registered, and a Stage 7-ready project blocked on nothing but (DL).

**If Stage 7 closes the award, a successor run (not this one) inherits:** the second and third derivations
of (DL) (the fallback mechanism and the Hall/SDR route) as optional record work; the excess-1 boundary; the
K1-addition closure at rank 6 and above (priced at 146,271,593 classes to order 24, bottleneck per-class
evaluation); `E993-R25-UNR-FOREST-WIDE`, which this run leaves **OPEN and untouched**; and the license
question on the external Lean source, which if resolved permissively would make a byte-identical port an
option for that successor and for no one in this run.

---

## Registrations

Every item below carries its grade and its attribution **on its face**. Items marked **second read** were
first stated by an adjudicator or by me at a review stage and are **STATED**: they need an isolated second
read before registration (`SOLUTION-CONTRACT.md` §4). The alias check is discharged above: **zero** matches
across 370 claims, 452 aliases and 132 alias_patterns.

**A. Register now (no second read needed).**

| Key | Statement | Grade | Attribution | Note |
|---|---|---|---|---|
| `E993-R27-FOREST-DEGREE-LEMMA` | (DL) at §2's exact statement | `proved_informal` | FLNYZ 2026 §8 (mathematics); `C-F1-T` (injection, proof of record); `C-T1-F`+`C-T1-U`+T1 (two-potential chain, second derivation); `C-U2-T` (the same identity, independently) | **No second read is owed on the STATEMENT**: (DL) is the chartered Tier-1 target, not a novelty first stated at review, and it now carries **two isolated in-run derivations** produced in orientations that could not see each other, each verified by a different neutral adjudicator. The individual **proofs** are separate items and are listed under B |
| `E993-R27-FOREST-EXTENSION-INEQUALITY` | (EX) at §2 | `proved_informal` | T3 (derivation); composition with (DL) and the two compiled counting theorems | — |
| `E993-R27-FOREST-DESCENT-LINEAR-BOUND` | (LB) at §2 | `proved_informal` | T3, F1/`C-F1-T`; FRESH-LEAD lane 11 for the conditional deduction | order bound; not a no-recovery statement |
| `E993-R27-RANK5-CEILING-20` | (R5) at §2 | `proved_informal` | T3, F3 | supersedes the informal ceiling 25 as a consequence, not as an edit |
| `E993-R27-DESCENT-RESTRICTION-4R-MINUS-4` | (XR) at §2 | `proved_informal` | T3 | **not** a uniform bound on `d`; `r = 0` vacuous-hypothesis-sound |
| `E993-R27-INDEP-EXTENSION-DOUBLE-COUNT` | `((k:ℤ)+1)·i_{k+1} = Σ_{J∈I_k} e(J)` | **`formally_verified`** | U3; `C-U1-T` (independent); T3 (informal proof) | **no acyclicity**; graph-general; not evidence for (DL)/(EX) |
| `E993-R27-EXTENSION-LOWER-BOUND` | `e(J) ≥ n − k − Σ_{v∈J} deg v` in `ℤ` | **`formally_verified`** | U3; F1 and both F1 critics (informal) | **no acyclicity**; graph-general |
| `E993-R27-DEGREE-LEMMA-IMPLIES-EXTENSION-CHAIN` | `DlHyp → ExHyp ∧ LbHyp`; `LbHyp → R5`; `LbHyp → XR` | **`formally_verified` as implications** | `C-U1-T`, `C-U3-T`, `C-U3-F`, `C-U1-F` | the implication is the award, the targets are not; instance-binder caveat on its face |
| **Definition layer of record** (registration item, not an award) | `indepDegreeSum`, `extensionCount`/`e`, `firstDescent` with existence, spec, minimality | definitions kernel-elaborated; six supporting lemmas `formally_verified` | U1, U3; U adjudicator for the `rfl` agreement | carry the agreement lemmas as the anti-drift proof |

**B. Register only after an isolated second read (STATED).**

| Item | First stated by | Why a second read |
|---|---|---|
| **(RC)** root-corrected degree lemma, and with it **(SH)** and the **strictness theorem** | `C-F1-T` / `C-F1-U`, at Stage 4; rewritten by the F adjudicator at Stage 5 | critic-derived, single-orientation; it is also the funded proof of record, so the second read is the run's highest-value review act |
| The **corrected join / edge-split identities** with the rooting annotation | `C-T1-F` + `C-T1-U`; independently `C-U2-T` | critic-derived; two isolated derivations exist, but the canonical single form has never been written by a route |
| **(EXX)** and the `exc(J)` defect term | `C-T3-U` | critic-derived; a genuinely new identity, not a restatement |
| **(DL+)** / root-deficit with Corollaries A and B | `C-T1-U`, `C-T1-F` | critic-derived; same object as (RC) in a different presentation — register **one** canonical form, not both |
| **`k = 1` criterion** and the **root-corrected acyclicity equivalence** (`|E| ≤ n − c ⟺ forest`) | `C-T2-U`/`C-T2-F` (plain); `C-F1-U`/`C-F1-T` (root-corrected, the registrable form) | critic-derived; the two forms must not both be registered |
| **ℤ-index completeness** of `firstDescent` | `C-T3-U` | critic-derived |
| **Leaf/branch reformulation** with the `2 ≤ n` correction | `C-T2-U`; correction by the T adjudicator | adjudicator-corrected at review |
| **Forest convolution** and the **single-root forest reduction** `D_{A⊔B}(a) = D_A(a)·Z_B + Z_A·D0_B` | `C-T2-U`/`C-T2-F`; reduction adjudicator-derived (U) | the reduction was first stated at Stage 5 |
| **Carrier bridges and agreement lemmas** `AdjU.Z_univ_eq_indepCount`, `AdjU.degOn_univ_eq_degree`, `AdjU.indepFinsets_union_of_separated`, `indepDegreeSum_agree`, `firstDescent_agree` | U adjudicator | adjudicator-derived; compiled, but first stated at review |
| **`E993-R27-KADDITION-CLOSURE-X-LE-5`** | F3; evidence line rewritten by the F adjudicator | the evidence line is new at Stage 5; the second read must confirm the order-0 coverage and that the grade is the census's |
| **Rank-5 residue closeout record** (residue EMPTY) | T3/F3; narrowed forms first stated at Stage 5 | grade must travel: `proved_informal`, never written onto a VERIFIED face |
| **External-source audit record** as restated | F2; rewritten by the F adjudicator | substantially rewritten at review; **no count of any kind is registrable** |
| **Descent maxima `M(k)` and the (XR) occupancy row** | `C-T3-F`/`C-T3-U`; sharpened to unconditional at `k ≤ 3` by the T adjudicator | the unconditional sharpening is adjudicator-derived |
| **Companion `Δ_5 < 0 ⇒ n ≤ 18`** (sharp, 9,532 witnessing order-18 classes) | `C-F3-T` | census-dependent, never formal, needed by nothing downstream; **must not enter any award statement** |
| **Registry comparison table and the alias-check result** of this synthesis | this synthesis | synthesis-derived at a review stage |

**C. Scope notes and record corrections** — the eight r25/artifact scope notes and the five packet record
corrections listed under `## Headline verdicts`. Sealed members are never edited (fence §3.5); these are
notes on faces and controller records.

**D. Register nothing for:** `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE,
TRANSFER, the all-rank aggregate, `E993-BETA-AGG`, Erdős #993. Untouched, no truth value asserted, no
status transferred.

---

## Continuation ruling

**CONTINUE.** Stop-gate case (c) is met exactly: the mathematics of (DL) and (EX) is `proved_informal` with
closed dependency DAGs on both the primary and the fallback route, and Stage 7 is blocked on bounded, named
Lean obligations, every one of which is a Lean-engineering node over proved mathematics. No decisive event
has occurred: (a) requires a formal award that does not exist at Stage 6, and (b) is not merely absent but
refuted by the strictness theorem.

Stage 7 is funded for `C1-LA1` (bounded attempt, primary route the injection proof of (RC), fallback the
corrected two-potential chain at the stated switch point), `C1-LA2` and `C1-LA3` (ready now, independent of
(DL)), and `C1-LA4` (contingent, free on `C1-LA1`). `C1-LA2` and `C1-LA3` are worth assembling **whatever
happens to `C1-LA1`**: they are already sorry-free under the pin and they are the run's first registrable
formal content.

If Stage 7 returns `C1-LA1` `formally_verified` with `C1-LA4` checked formally and the residue closeout
recorded, **the run ends at the Cycle 1 close** (Gate ruling 9) and Cycle 2 does not run. Otherwise Cycle 2
runs the nine routes above. Publication of any result of this run remains Ashton's decision and is not
pre-authorized by anything in this synthesis. The continuation flag is set in
`## Progress and stop-gate ruling` and is not restated here.

---

## Artifact inventory

**Deliverable — the only file written outside my scratch:**
`cycles/cycle-1/stage6/SYNTHESIS.md` (this file).

**Scratch — all under `scratchpad/c1-S/`; nothing written anywhere else**, nothing under `sources/`,
`control/`, `cycles/` other than this deliverable, any seat's, critic's or adjudicator's scratch, or any
system temporary directory.

| File | What it is |
|---|---|
| `verify.py` | dispatch-capsule seal recomputation and 12-member digest/byte verification |
| `sources_check.py`, `sources_check2.py`, `full_digests.py` | `control/SOURCE-DIGESTS.json` parse; verification of the five frozen carrier files from the bytes |
| `alias.py`, `alias2.py`, `alias3.py`, `alias4.py`, `alias5.py`, `alias6.py` | the registry alias check (lexical, pattern and statement-semantic) and the exact-key reads of the r25 lineage |
| `synth_check.py` | independent instrument: all labelled forests on `1 ≤ n ≤ 7` (40,232 objects), every `k`, every root choice — (DL), (RC), double count, per-set `e(J)` bound, (EX), (LB), strictness, `k = 1` slack `= 2c`; plus the symbolic fence checks |
| `fixedpoints.py` | `SEMANTIC-CONTRACT.md` §4 fixed points reproduced before any table |

**IMPORT LIST** (every script of this synthesis; Python standard library only): `itertools`, `json`,
`hashlib`, `os`, `re`, `sys`. No network, no `pip`/`brew`/`npm`/`elan`, no third-party package, no Lean
build, no `lake` invocation, no floats, no RNG. No hashed or reported payload contains a wall-clock, PID or
host field.

**Background jobs.** **None was started at any point.** Every command of this synthesis ran in the
foreground and returned synchronously, so there was no PID to kill, and **no pattern kill was issued**. Two
execution disclosures: (i) before this final write I ran one process listing **filtered to my own uid**, to
confirm that no Python process of mine was still running — it returned none; this is the same class as the
U adjudicator's recorded disclosure, and it is a listing, not a kill; (ii) no wall-clock, PID or host value
enters this file or any file I wrote. No background job is running at this final write.

**Read boundary.** VerityOS: exactly `verity.md` and `identity/startup-protocol.md`. Run root: the twelve
dispatch-capsule members, and under the authorized run-root `sources/` two exact-path reads —
`sources/authority/CLAIM-IDENTITY.json` (for the alias check the protocol's duty 7 and three adjudicators
required, and which no seat, critic or adjudicator could run) and the five frozen
`sources/r25/c4-forest-descent-order-bound/LeanProject/` files (for the carry-list digest verification).
I read **no** raw return, **no** critique, **no** seat, critic or adjudicator scratch, **no** other
experiment root, **no** research-packet directory, **no** prior synthesis, and **no** external source. No
`find`, `grep`, `rg`, `ls -R`, globbed `cat` or recursive listing was run at any point, at any level; every
path was exact. No network, no package install, no Lean build. The fourteen scratch rows of the carry list
are therefore carried on the U adjudicator's authority and are labelled as such.

**Disclosure.** The alias check and the r25 exact-key reads are reads of run-root authority under
`sources/`, which the protocol's read boundary authorizes; they are recorded here because three
adjudicators each declared the same check undischarged and passed it to this stage.

Reread before close.

chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.
