# Orientation Adjudication

Stage 5 adjudicator of orientation **T** (prove), Cycle 1, r27
(`erdos-993-math-dre-20260924-r27-forest-degree-extension`). Portfolio: the returns of seats `T1`, `T2`,
`T3` and their six cross-orientation critiques (`C-T1-F`, `C-T1-U`, `C-T2-F`, `C-T2-U`, `C-T3-F`,
`C-T3-U`).

**VerityOS boot acknowledgment.** Operating within VerityOS. Boot reads for this seat were **exactly** the
two files the dispatch names and nothing else in VerityOS: `/Users/ashtonsperry/VerityOS/verity.md` (root
constitution) and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (identity subsystem).
Subsystem in scope: `experiments/`, this run root only. No memory, knowledge, conversations, modules,
skills, logs, decisions, operations, inbox or writing file was read. No read-boundary disclosure to file on
that axis; two execution disclosures are recorded under `## Artifact inventory`.

chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its
runtime model/effort — stated on dispatch-record authority.

## Identity and seal audit

Every seal recomputed canonically by my own script (`scratchpad/c1-adj-T/seals.py`,
`scratchpad/c1-adj-T/verify_seal.py`): SHA-256 of `json.dumps(manifest_without_seal_sha256,
sort_keys=True, separators=(",",":"))`, UTF-8, no trailing newline. Nothing below is read off a record.

| Manifest | Recorded | Recomputed | Match |
|---|---|---|---|
| `control/c1-adjudicator-capsules/T-PACKET-MANIFEST.json` (my capsule) | `81ef1bfb6b74854dd337e52ceef7092aadaac0972954a783dbc296b845a04f36` | identical | **yes** |
| `control/C1-STAGE2-PACKET-MANIFEST.json` (110 files) | `64d142ed1a3beb3dec7eaaa941d5c862c0bd3381ee678f6aa27c5c43850828e7` | identical | yes |
| `control/C1-STAGE3-PACKET-MANIFEST.json` (33 files) | `8e78cf1f781381b34db629d8e596e36891df1d2346b54b5b805a18e0a1c0164d` | identical | yes |
| `control/C1-STAGE4-PACKET-MANIFEST.json` (57 files) | `d93b97002be201517a1850acd2a031ca7885a8e2d6a580df5af4a27191d9932a` | identical | yes |

**Reported capsule seal: `81ef1bfb6b74854dd337e52ceef7092aadaac0972954a783dbc296b845a04f36` (verified).**
All **24** capsule members matched byte count and SHA-256 on disk — `file_count: 24` is accurate, zero
mismatches — including the three returns
(`…/returns/T1/RETURN.md` `4fe0299b…`, 34,543 B; `…/T2/RETURN.md` `cdb01ec7…`, 27,676 B;
`…/T3/RETURN.md` `a1e41de0…`, 32,291 B) and the six critiques. The three return digests also equal their
Stage 3 manifest rows and the Stage 3 admission rows; the six critique digests equal their Stage 4
admission rows. **The portfolio I adjudicated is the admitted, sealed one.**
`control/c1-adjudicator-capsules/PATH-CHECK-T.json`: 23 files scanned, 0 findings, no denied root touched.

Admission. Stage 3 admitted 9/9 (one visible exception, F3's import list — not my orientation). Stage 4
admitted 18/18, `finding_count: 0`; every critique in my portfolio carries `verdict: retained_narrowed`
and `headline_resolved: no`, matching the shipped files.

Independence. `control/C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json` records T1's single non-recursive `ls` of
the shared `scratchpad/` (sibling directory **names** only, ruled "the r26 F3 class; no effect on
independence") and none for T2 or T3 — consistent with T3's "None" and with T2's three self-filed items,
which on audit are not breaches (`AUTHORIZATION.md` and `control/R27-CHARTER-PROMPT.md` are Stage 2
members, and items 2–3 are erratum reports, not reads). `control/C1-STAGE4-READ-BOUNDARY-DISCLOSURES.json`
records C-T2-F's and C-T3-F's in-grant listings and C-T3-U's full read of
`control/C1-CRITIC-ATTACK-BRIEFS.md` (controller ruling: briefs are controller prompts, not seat content;
no sealed content of another seat was read). **I find no independence defect in this orientation.** One
consequence of C-T3-U's disclosure is visible and correctly handled by the critic itself: it checked the
smallest non-forest (DL) failure, an F1 question, and deferred registration to F1's route (its A3). I
carry A3 as a corroborating fence only and register nothing from it.

Errata. R27-E-a (r26 residue in the sealed worker brief: the `hyp-tree`/`hyp-alpha`/`hyp-eligible`/`(★)`
labels and the `E993-R26-…` namespace) is visible in all three returns. T1 adopted the labels verbatim;
T2 and T3 each detected the defect from the text alone, defined their own labels tied to
`SEMANTIC-CONTRACT.md` §1, and resolved the namespace conflict toward the binding contract (`E993-R27-…`).
Per the controller's instruction I charge no seat for following the contract's wording; T2's and T3's
independent detection is to their credit. R27-E-b ("tight cases") is not propagated by any seat in my
portfolio and is independently disconfirmed below. R27-E-c (the `E993-R25-`-prefixed refuted key in
`SOLUTION-CONTRACT.md` §3.8) was caught by C-T3-U and C-T3-F; the fence is intact either way, since the
refuted claim is a premise nowhere in this orientation.

Controller facts record (`control/C1-STAGE5-CONTROLLER-FACTS-T.json`) weighed as one more replay, not as
authority. Its one load-bearing item — that `control/C1-ALLOCATION.md` item 1 **supplied** the one-child
join formulas verbatim while instructing "derive it yourself", the formulas having come from the
controller's reading of the external source's own comments — is confirmed by my own reading of the
allocation and is decisive for finding F-2/F-3 below.

## Route-by-route decisions

I re-derived every load-bearing object in this orientation on my own instrument
(`scratchpad/c1-adj-T/adj_instrument.py`, `adj_census.py`, `adj_extra.py`), built from
`SEMANTIC-CONTRACT.md` §1 alone, standard library only, exact integers, no floats, no RNG, no network, no
installs. I did **not** replay the seats' own generators: all six critics did that, each reproducing its
seat's digests exactly, and an independent instrument is the stronger evidence. Instrument gate reproduced
before any table: empty forest (`i_0 = 1`, `Δ_0 = −1`, `x = 0`); `K₁` (`Δ_0 = 0` — not a descent — `Δ_1 =
−1`, `x = 1`); free-tree classes 1,1,1,2,3,6,11,23,47,106,235,551,1301,3159,7741,19320 (orders 1–16); free
**forest isomorphism classes** 1,1,2,3,6,10,20,37,76,153,329,710,1601,3658,**8599**,20514,49905 (orders
0–16), matching the run's target sequence digit for digit through order 14 and extending it two orders.

### `T1` — `C1-T-01 DEGREE-LEMMA-POLYNOMIAL-INDUCTION-PROOF`

**Decision: retained, narrowed; route verdict `proved` downgraded in attribution, not in grade.**

The theorem is true, the mechanism is the right one, and the shipped derivation of the single load-bearing
identity is false. Both critics reached that conclusion independently and I confirm it on my own
instrument over **5,776** labelled single-edge joins (every labelled tree `S`, `T` of order ≤ 4, every root
`r ∈ S`, every `s ∈ T`):

| Object (RETURN T1 §3) | My failures / 5,776 | Ruling |
|---|---|---|
| Step b (`r ∉ J` half) | **0** | correct as printed |
| Step a, `vpoly_T(f_E) = D_T + 2(Z − A)` | 0 (implied by Step b's closure) | correct |
| **Displayed Step c** (`r ∈ J` half) | **5,700** | **FALSE — struck** |
| **Substitution box** `E_S = vpoly_{S∖N[r]}(f_D^S) + B' − B` | **5,602** | **FALSE — struck** |
| Critics' corrected Step c | **0** | correct |
| Critics' identity (i), `D_S = vpoly_{S∖{r}}(f_E^S) + x(vpoly_{S∖N[r]}(f_E^S) − deg_S(r)·B')` | **0** | correct |
| Step b + corrected Step c `= D_{S∪T}` | **0** | closes |
| (D-REC) and (E-REC), `S ∪ T` rooted at **`r`** | **0** each | correct |
| (D-REC) with `S ∪ T` rooted at `s` | **4,414** | the rooting is load-bearing |

My smallest witness for the displayed Step c reproduces C-T1-F's exactly: `S = K₂` rooted at `r`,
`T = K₁` — the true `r ∈ J` contribution is `−2x`, the displayed expression gives `−x`. The defect is
exact: `f_D^{S∪T}(r) = 2 − (deg_S(r)+1) − 2 = −deg_S(r) − 1`, and the display keeps only the `−1`. The
substitution box is worse than a slip — it puts `B = Z_{T∖N[s]}`, a quantity of `T`, inside an identity
for `E_S`, which is defined from `S` alone; it is a mis-transcription of the (correct) `E_T` box one line
below. Both chains in §3 terminate in printed ellipses (`... ` and `·? ...`), and the cited
`derivation-notes.md` was not shipped. Taken with the controller fact that `control/C1-ALLOCATION.md`
item 1 printed the final (D-REC)/(E-REC) forms verbatim under the instruction "derive it yourself", the
"re-derived" certification is not backed: the correct answer was in hand and the shipped working does not
reach it. **This is the route's single load-bearing obligation, so it is a narrowing finding, not a
presentational one.** It is not a dismissal: the repair is two substitutions, both critics supplied it
independently and concordantly, and I close it symbolically and numerically below.

Also struck on T1: the displayed `[x^k]E_T` identity (it omits `+ i_k(T∖N[r])` and yields `E_{K₁} = −1`,
contradicting the return's own base case — the §3 **definition line** is the specification, never the
display); the certification "§2–§5 has no gap / no smaller open lemma is identified" (there was a gap, at
Step c, and it was the smallest open step); "every derivation step above is carried out independently";
"the steps are reproduced in full below"; the alias literal "**7 hits**" (the two critics' independent
rescans give 6 on the `statement` field, 13 on `statement+scope`, 37 on whole records — the **count** is
struck, the **conclusion** "no alias; (DL) is a genuinely new candidate" stands on two independent
full-registry scans); and the script comment claiming a per-component root-occupancy check, which computes
`2·i_1 − D_1` and uses no root at all — so `(★)` received **zero** computational corroboration in the
return. Canonicalized count: T1 §6's "22 fixtures" is **22 fixture rows over 18 distinct isomorphism
classes** (`K₁ = edgeless_1`, `K₂ = P_2 = K_{1,1}`, `P_3 = K_{1,2}`); no downstream reading of "22
objects" may travel. The allocation's named deliverable `INFORMAL-PROOF.draft.md` was not delivered.

Retained and independently confirmed: the (P1)/(P2) primitives; the `f_D`/`f_E` weights; the §4 induction
**as stated over every rooted tree** (the quantifier a formalization needs — C-T1-F's F-6 adjudicates this
in T1's favour and I concur); `A' − B' ≥ 0` from the genuine subset relation `I(S∖N[r]) ⊆ I(S∖{r})`; the
forest assembly; `(★)`; the discard direction; the `k = 0` / `k > α` / empty-forest completion; and the
ℕ/ℤ cast ledger, which is the most valuable part of the return for Stage 7. On my instrument, `D_T` and
`E_T` are coefficientwise nonnegative at **every** root of every free tree to order 9 — 749 rooted
instances, zero negative coefficients — and `(★)` in its root-deficit form holds on **2,722** rootings of
every free-forest class to order 9, zero failures. `hyp-alpha` is cited by no step and must not enter the
Lean statement (C-T1-F F-8; the §2 target carries no `α` side condition, so dropping it is contract-
consistent).

### `T2` — `C1-T-02 DEGREE-LEMMA-ALTERNATIVE-PROOF`

**Decision: retained, narrowed; route verdict `blocked` upheld for the primary mandate, but its stated
reason is refuted.**

Everything T2 computed is correct and replays to the digit (both critics reproduced
`984c241a…` exactly). The bipartite refutation (`K_{2,3}`, `n = 5`, failures at `k = 1` and `k = 2`) is
sound; the leaf-deletion identity of Part 3 is a correct general theorem needing no acyclicity, and both
critics extended it from one tree at `k ≤ 3` to 3,753 (tree, leaf, k) instances with zero failures; the
`P₃` minimality claim, shipped as prose, is true for the endpoint-rooted reading.

What does not survive is the route's **diagnosis**. Its Part 1 Step 3 — that carrying (DL) from trees to
forests "is not free", needs "its own combinatorial account of the convolution", and that supplying one
"would mean adopting T1's generating-function mechanism" — is wrong, and both critics independently
refuted it with the same three-line discharge. C-T2-U: for `G = G₁ ⊔ G₂`,
`i_k(G) = Σ_{a+b=k} i_a i_b` and `D_k(G) = Σ_{a+b=k}[D_a(G₁)i_b(G₂) + i_a(G₁)D_b(G₂)]`, so (DL) on each
factor plus `2a + 2b = 2k` gives (DL) on `G`. C-T2-F: `S_G(k) = Σ_C Σ_j S_C(j)·i_{k−j}(G−C)` with
`S_G(k) := 2k·i_k − D_k`. These are the same fact in two presentations, neither uses a generating
function, a polynomial product or a coefficientwise-nonnegativity lemma, and the root-corrected form
carries identically. **I verified the pair identity independently: 64 ordered pairs of free trees, zero
failures.** T2's `Remaining obligation` items 1(b) and 4 are struck as spurious debts. Consequence:
**the tree case is the whole of the open problem for any alternative mechanism**, and the forest layer is
also the cheap way to state the multi-component extension in Lean.

Also struck: "(equivalently: at most one independent cycle per component, i.e. pseudoforests)" — the
classes are not equivalent (`{|E| ≤ n}` strictly contains the pseudoforests; witnesses `K_{2,3} ⊔ K₁`
from C-T2-U, `K₄ ⊔ 3K₁` from C-T2-F, both correct). The class actually tested is the larger `{|E| ≤ n}`,
so the null is not weakened, only misdescribed. Struck: the explanation "bipartite permits unbounded local
degree" (`K_{2,3}` has maximum degree 3) — the operative fact is the exact criterion **(DL) fails at
`k = 1` iff `|E| > n`** (`D_1 = 2|E|`, `i_1 = n`), which I verified on all **1,099** labelled graphs of
order ≤ 5 with zero exceptions; it implies the bipartite refutation, the `K₄`/`K_{2,3}` fences, and the
tightness of every connected unicyclic graph at `k = 1`, and it makes explicit what acyclicity buys (a
forest has `|E| ≤ n − 1`, so it is never even tight at `k = 1` unless edgeless). Struck: "`bad = []` in
the run" (the identifier occurs nowhere in the shipped generator; the substance is backed, the
parenthetical is not) and "the 370 aliases/alias_patterns entries relevant to the six named claims" (370
is the registry's **identity** count; the six claims carry 11 alias entries — conclusion survives on
C-T2-U's own wider scan). Struck: "the reason for stopping at order 7" (a fact about the chosen
instrument, not the problem — free-forest generation reaches order 14 in seconds; my own reaches 16 in
71 s). Narrowed: "three independent framings converge on the same structural obstruction" — one framing
was not an obstruction at all, and the remaining two obstruct particular **maps**, not the mechanism
class.

**Paired-critic disagreement, resolved.** C-T2-F's F-1 and C-T2-U's Finding 7 both claim to be the
sharpest obstruction and they are different objects. They are complementary, not contradictory, and both
are correct. C-T2-F's is the sharper statement **about T2's own map**: the naive child-swap
`(J,v,c) ↦ (J∖{v})∪{c}` is well defined for a rooted forest **iff every component is a star rooted at its
centre**, so `P₃` rooted at its centre works and T2's `P₃` witness is rooting-specific; the minimal
rooting-free witness is **`P₄`**, and "choose a better root" is closed as a repair. C-T2-U's is the
sharper statement **about the mechanism class**: the root-corrected (DL) is exactly
`Σ_e c_{parent(e)}(k) ≤ Σ_e c_{child(e)}(k)`, which fails edge by edge (`K_{1,3}` rooted at a leaf,
`k = 2`), so no edge-local charging can work, and the natural two-case repair collides on `P₄` at `k = 2`.
Ruling: T2's candidate `…CHILD-SWAP-INJECTION-OBSTRUCTION` survives as worded but must be **re-witnessed
at `P₄`** and restated in the rooting-free form; both critics' statements are retained, C-T2-F's as the
complete characterisation and C-T2-U's as the fence on local charging.

**C-T2-U's conclusion that "(DL) itself remains open on every route I can see, so `proved_informal` is
not yet available for (DL)" is out of its evidence scope** and I do not carry it. That critic's portfolio
is `T2` alone; it cannot see `T1`. Its statement is correct about what `T2` delivers and incorrect as a
statement about this orientation.

### `T3` — `C1-T-03 EXTENSION-DOUBLE-COUNT-AND-CONSEQUENCES`

**Decision: retained, narrowed; route verdict `proved_conditional` upheld as written and now upgraded by
cross-route composition (see `## Cross-route reconciliation`).**

Both critics attacked every theorem, bijection, quantifier edge case, cast and truncation and found **no
mathematical error**, and neither could I. I re-derived each step: the double count `(★)`'s bijection and
its inverse; `|N[J]| = k + |N(J)|` exactly by independence and `|N(J)| ≤ Σ deg` by the union bound with
the equality criterion "no vertex outside `J` is a common neighbour of two or more members"; (EX) in both
forms and their `ℤ`-equivalence; (LB) uniform in `k` including `k = 0` (where it reduces to `1 > n`, i.e.
`n = 0`) and vacuous for `k > α`; the existence witness `Δ_α = −i_α < 0` for `firstDescent`; (R5) as the
`k = 5` contrapositive; (XR) with the `4r − 4` truncation audit (sound because `x(G) < 0` is
unsatisfiable, not because the arithmetic is right at `r = 0`) and the `ℤ` restatement `d ≤ 2r − 4`; and
`(k+1)² − 4k = (k−1)² ≥ 0` with equality only at `k = 1`. On my census of **85,625 free-forest
isomorphism classes to order 16**: zero (DL) violations, zero (EX) violations, zero (LB) violations, zero
`(k+1)²` violations.

**The load-bearing structural finding of this route is correct and I confirm it independently:
acyclicity enters NOWHERE in the double count or the extension bound, and exactly once — through (DL) —
in (EX) and everything below it.** C-T3-F verified this on all 33,868 labelled graphs of order ≤ 6,
C-T3-U on all 1,100 of order ≤ 5, both with zero failures. **Consequence binding on Stage 7: the Lean
declarations for the double count and `e(J) ≥ n − k − Σ deg` must be stated WITHOUT an `IsAcyclic`
hypothesis; a stray `hG : G.IsAcyclic` binder on either is a hypothesis the statement does not need and
must be struck at fidelity review.**

**Strongest correction to this route (C-T3-F F-3, adjudicator-confirmed).** T3's Step 8 table heads its
column "**live** `d`-range for `x(F) < r`" and labels every non-excluded cell "live". (XR) supplies only a
**necessary** condition. I computed actual occupancy over my complete order-≤16 census:

| `r` | `d` | `n = 2r+d` | T3 label | Adjudicated |
|---|---|---|---|---|
| 3 | 2 | 8 | live | **OCCUPIED**, and the witness is unique: `P_8` (`i = 1,8,21,20,5`, `x = 2`) — the only order-8 forest with `x < 3` |
| 4 | 2, 3 | 10, 11 | live | OCCUPIED |
| 4 | **4** | **12** | live | **EMPTY — struck.** `max{n : x(F) < 4} = M(3) = 11` |
| 5 | 2–5 | 12–15 | live | OCCUPIED |
| 5 | **6** | **16** | live | **EMPTY — struck.** `max{n : x(F) < 5} = M(4) = 15` |
| 6 | **7** | **19** | live | **EMPTY** on C-T3-F's order-19 census — critic-attributed, horizon 19; above my own horizon |
| 6 | 8 | 20 | live | **unverified by anyone** — say so |

Both cells I could reach are empty on my own complete enumeration. T3 had the refuting numbers three
sections earlier in its own return: the r25 scope note "true maxima 4, 8, 11, 15 at `k = 1..4`" already
voids `n = 12` and `n = 16`. **Replace the column header with "not excluded by (XR)" and carry the
occupancy row beside it.**

Adjudicator-derived sharpening of the descent maxima. Writing `M(k) := max{n : ∃ finite forest with
Δ_k(G) < 0}`, my complete census to order 16 gives `M(1) = 4`, `M(2) = 8`, `M(3) = 11`, `M(4) = 15` —
reproducing C-T3-F's values and the r25 scope note exactly, and resolving the pair's disagreement about
completeness (C-T3-U could close only `k ≤ 2` at its order-12 horizon and said so honestly; C-T3-F closed
`k ≤ 5` at horizon 19). **`M(1) = 4`, `M(2) = 8` and `M(3) = 11` are now UNCONDITIONAL**, because the
*formally verified* r25 award `Δ_k < 0 ⇒ n ≤ (k+1)²` caps the search at 4, 9 and 16 respectively and my
enumeration is complete to 16 — they depend on no unproved input. `M(4) = 15` is complete only under
(LB)'s cap `4k = 16`, hence carries (DL)'s grade; as a standalone it is `bounded_computation` at attained
horizon 16. Consequences: **(LB) is tight at `k = 1` AND at `k = 2`** (witness `P_8`) and **provably slack
at `k = 3` and `k = 4`** (11 < 12, 15 < 16). T3's "tight at `k = 1`" wording — inherited from the
`(k+1)²` award's scope note, where it is correct — is struck for `4k`: the linear constant 4 cannot be
lowered, but `4k` is not the exact maximum function for `k ≥ 3`.

Also struck on T3: the grade-transfer sentence "(EX)/(LB)/(R5)/(XR) upgrade to the SAME grade as (DL)
**automatically**, at `proved_informal` **or better**" — both critics struck it and I adopt the strike. A
kernel-checked (DL) composed with an uncompiled informal derivation yields `proved_informal`, never
`formally_verified`; the compiled derivation is itself an input and a composition's grade is its weakest
input's (`SOLUTION-CONTRACT.md` §4). **The automatic upgrade is valid only up to `proved_informal`.** This
is the exact hazard the stop gate turns on, since §5(a) requires (DL) **and** (EX) formally verified.
Struck: "**byte-identical**" on the heading of the definitions-of-record block — the block is a faithful
**paraphrase**, not the source text (`{V}` for `{V : Type u}`, `noncomputable def Erdos993G1.indepCount`
for the in-namespace form, U+2212 MINUS SIGN for U+002D in `delta`). The mathematics is unaffected and no
fence is crossed (T3 built no Lean project), but the word must not travel: Stage 7 carries the G1
definitions byte-identically and a paraphrase certified as byte-identical is exactly the confusion that
rule exists to prevent. Struck: the provenance "`SEMANTIC-CONTRACT.md` §4 target sequence" for the
free-forest class counts — I read §4 and it contains no forest class counts at all (its fixed points are
the empty forest, `K₁`, `P_n`, `K_{1,m}`, the mislabelled "tight cases" and the r25 rank-5 margins); the
sequence lives in `control/C1-WORKER-COMMON-BRIEF.md`. **Strike the attribution, keep every number** — I
reproduce the whole sequence to order 14 and extend it to 16. Struck: "`Δ_k` shown per row above" on the
census check rows (no such rows exist; the shipped report carries aggregate fail counts) — a reporting
gap, not an evidence gap. Struck: "this seat's grant did not include those files" about
`sources/external/lean-source/` — the worker brief grants it READ ONLY; T3 chose not to read it, which is
correct and fence-compliant, but the statement about its own grant is wrong and the same sentence
contradicts itself. Narrowed (C-T3-U F3): the rank-5 residue emptiness must carry its conditionality at
the point of use — at Stage 4 it was `conditional` on (DL); see `## Cross-route reconciliation` for its
grade after composition. Struck parenthetical: "hyp-eligible's negation" as a gloss on `N(v) ∩ J = ∅` —
the step is correct, independence is what is used, the label is wrong.

Record item I cannot adjudicate: C-T3-F reports an **unnamed registered claim**,
`E993-R25-FOREST-ORDER-BOUND-SHARPENED` (VERIFIED, `Δ_k < 0 ⇒ n ≤ k²+k+3` for `k ≥ 2`), which T3 touched
but did not name. `sources/authority/CLAIM-IDENTITY.json` is not a member of my capsule, so I carry this
**critic-attributed** for the synthesis's comparison table. Its arithmetic I can check and it is right:
`k²+k+3 − 4k = k²−3k+3 > 0` for every `k` (discriminant `9 − 12 < 0`), so (LB) strictly dominates it at
every `k ≥ 2`.

## Cross-route reconciliation

**1. The proof of record for (DL).** The corrected two-potential chain — not T1's §3 as written — is the
derivation of record for the two recurrences, and it is critic-attributed jointly to `C-T1-F` (F-3) and
`C-T1-U` (its `## Independent re-derivation`, steps 1–6). The two critics worked in isolation from one
another and produced **the same** repair: `C-T1-F`'s `−(deg_S(r)+1)·B'·A` and `C-T1-U`'s
`(f_D^S(r) − 1)·B'·A` with `f_D^S(r) = −deg_S(r)` are the identical expression, and both use the same
auxiliary identity (P1)-at-`r`-inside-`S`. I re-derived the chain symbolically myself and every line
closes exactly:

- `f_D^U` restricted to `S∖N_U[r]` is `f_E^S`; to `T∖{s}` is `f_E^T`; at `r` it is `−deg_S(r) − 1`.
  `N_U[r] = N_S[r] ∪ {s}`, so `S∖N_U[r] = S∖N_S[r]` and the two pieces are separated in `U`.
- Part 2 `= x·[ vpoly_{S∖N[r]}(f_E^S)·A − (deg_S(r)+1)·B'·A + B'·vpoly_{T∖{s}}(f_E^T) ]` by (P1) at `r` and
  (P2) on the separated pair.
- (P1) at `r` inside `S` gives `D_S = vpoly_{S∖{r}}(f_E^S) + x(vpoly_{S∖N[r]}(f_E^S) − deg_S(r)·B')`.
- With `E_S = vpoly_{S∖{r}}(f_E^S) − A' + B'`, `E_T = vpoly_{T∖{s}}(f_E^T) − A + B` and `xB = Z − A`,
  Part 1 + Part 2 collapses to `D_S·A + A'·D_T + x(E_S·B + B'·E_T) + 2x·B·(A'−B')` — **(D-REC)**, with
  `U` rooted at `r`; and `E_U = Part1 − A'Z + B'A` collapses to `E_S·Z + A'·D_T + x·B·(A'−B')` —
  **(E-REC)**.

Every one of these identities verifies with **zero failures on 5,776 labelled joins** on my instrument,
while (D-REC) read with `U` rooted at `s` fails on 4,414 of them. **The rooting annotation is part of the
statement and must travel into Lean.**

**2. (DL) is proved.** Composing T1's retained architecture (§2 primitives; §4 nonnegativity induction
quantified over **every** rooted tree; §4 forest assembly; §5 range completion and cast ledger) with the
critics' corrected join gives a complete informal proof of
`D_k(G) ≤ 2k·i_k(G)` for every finite forest and every `k : ℕ`, with a **closed dependency DAG and no
remaining unproved informal node**. Grade: **`proved_informal`**, with the join step **critic-attributed**
and the mathematics attributed to Fang–Lu–Nevo–Yao–Zheng 2026 §8. The forest layer has two independent
proofs of record: T1's polynomial-product assembly and the T2-critics' convolution; the convolution is the
cheaper Lean route and neither depends on the other.

**3. (EX), (LB), (R5), (XR) upgrade from `conditional` to `proved_informal`.** T3 graded them
`conditional` because (DL) was open at Stage 3. (DL) is now `proved_informal` in this same orientation, the
implication `(DL) ⇒ (EX) ⇒ (LB) ⇒ {(R5), (XR)}` is gap-free (T3, confirmed by both its critics and by me),
and the upgrade is legitimate **only up to `proved_informal`** per the struck sentence above. This is the
single largest cross-route gain of the cycle and it is a composition of T1+critics with T3 — neither route
could state it alone.

**4. Unconditional layer, already Lean-ready.** The double count `(★)`, the extension bound
`e(J) + k + Σ_{v∈J} deg(v) ≥ n`, and `C-T3-U`'s identity **(EXX)**
`e(J) = n − k − Σ_{v∈J} deg(v) + exc(J)` with `exc(J) := Σ_u max(codeg(u,J) − 1, 0)`, summing to
`(k+1)·i_{k+1} = (n−k)·i_k − D_k + E_k` and `(k+1)i_{k+1} − (n−3k)i_k = (2k·i_k − D_k) + E_k`. I checked
(EXX)'s derivation: `Σ_{v∈J} deg(v) = Σ_u codeg(u,J)` and `|N(J)| = #{u : codeg ≥ 1}`, so
`Σ deg − |N(J)| = exc(J)`. Correct, unconditional, no acyclicity; it re-proves the equality case for free
and exhibits (EX)'s slack as the (DL) slack plus the co-degree excess. **U3 should compile (EXX-local)
rather than the inequality.** `C-T3-U`'s F5 is likewise adopted: the `ℤ`-indexed `delta` of record admits
no strict descent at a negative index (`Δ_{−1} = i_0 = 1 > 0`, `Δ_k = 0` for `k ≤ −2`), so the `Nat.find`
formulation of `firstDescent` is faithful — a fact U1/U3 must state.

**5. The strengthenings of (DL) are one object in two presentations.** `C-T1-F`'s
`…ROOT-DEFICIT` (`D_k + 2·Σ_i #{J : root_i ∈ J} ≤ 2k·i_k` for **every** rooting, Corollary A "no
nontrivial tight case", Corollary B `n·D_k ≤ 2k·i_k·(n−1)`, tight for every tree at `k = 1`) and
`C-T1-U`'s **(DL+)** (`D_k ≤ 2k·i_k − 2·Σ_i max_{v∈C_i} n_k(v)`) come from the same `(★)`; (DL+) is the
max-over-rootings specialization and subsumes the base statement and Corollary A. Corollary B is a
separate quantitative statement. All verified on my instrument (2,722 rootings to order 9, zero failures;
Corollary A zero failures). **They move no order bound**: C-T1-F checked that feeding Corollary B through
the (EX) derivation gives `n² − (4k+1)n + 2k < 0`, whose largest integer solution is still `n = 4k`. All
are `STATED` at a review stage and need an isolated second read before registration.

**6. Erratum R27-E-b independently disconfirmed.** Across all **85,625** free-forest classes to order 16 I
find **zero** nontrivial tight cases of (DL) (`k ≥ 1`, `i_k > 0`), agreeing with C-T1-F, C-T1-U, C-T2-F,
C-T2-U and C-T3-F. The contract's §4 fixed-point **values** are right; the label "tight" is wrong.
Independent one-line proof at `k = 1` (C-T2-U): `D_1 = 2|E|`, `2·1·i_1 = 2n`, and a forest has
`|E| = n − #components < n`.

## Established results

Established at this orientation's evidence grade. None is `formally_verified`; nothing in this portfolio
compiles anything.

| # | Statement (exact) | Grade | Hypotheses | Attribution |
|---|---|---|---|---|
| 1 | **(DL)** For every finite forest `G` (`G.IsAcyclic`) and every `k : ℕ`: `D_k(G) ≤ 2k·i_k(G)`, i.e. `(indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k` | `proved_informal` | acyclicity, finiteness; the root is a free parameter; **no `α` side condition** | FLNYZ 2026 §8 for the mathematics; T1 for the architecture; **C-T1-F and C-T1-U jointly for the join derivation of record** |
| 2 | **Two-potential recurrences.** For `U = S ⊔ T` joined by the single edge `r~s`, **rooted at `r`**: `D_U = D_S·A + A'·D_T + x(E_S·B + B'·E_T) + 2x·B·(A'−B')` and `E_U = E_S·Z + A'·D_T + x·B·(A'−B')` | `proved_informal` | acyclicity (one cross edge, separation); rooting at `r` is part of the statement | C-T1-F, C-T1-U (derivation); adjudicator-verified, 5,776 joins |
| 3 | **Forest-from-tree convolution.** `i_k(G₁⊔G₂) = Σ_{a+b=k} i_a i_b`, `D_k(G₁⊔G₂) = Σ_{a+b=k}[D_a(G₁)i_b(G₂) + i_a(G₁)D_b(G₂)]`; hence (DL) for all trees ⇒ (DL) for all forests, and likewise for the root-corrected form | `proved_informal` | none beyond finiteness | C-T2-U (Finding 1) and C-T2-F (F-2), independently |
| 4 | **(★) double count.** `(k+1)·i_{k+1}(G) = Σ_{J∈I_k(G)} e(J)` | `proved_informal` | **finiteness only — NO acyclicity** | T3 |
| 5 | **Extension bound.** `e(J) + k + Σ_{v∈J} deg(v) ≥ n`, with equality iff no vertex outside `J` is adjacent to two or more members of `J` | `proved_informal` | **finiteness only — NO acyclicity** | T3 |
| 6 | **(EXX).** `e(J) = n − k − Σ_{v∈J} deg(v) + exc(J)`; `(k+1)i_{k+1} = (n−k)i_k − D_k + E_k` | `proved_informal`, STATED | **finiteness only — NO acyclicity** | C-T3-U (A1) |
| 7 | **(EX).** `(Fintype.card X : ℤ) * indepCount G k ≤ (k+1)*indepCount G (k+1) + 3*k*indepCount G k` | `proved_informal` (was `conditional`) | acyclicity, once, through (DL) | T3 for the derivation; composition with 1 |
| 8 | **(LB).** `Δ_k(G) < 0 ⇒ n ≤ 4k`, every `k : ℕ` including `k = 0` | `proved_informal` | acyclicity through (DL) | T3; composition with 1 |
| 9 | **(R5).** `21 ≤ Nat.card X ⇒ 0 ≤ Erdos993G1.delta G 5` | `proved_informal` | as (LB) | T3; composition with 1 |
| 10 | **(XR).** `firstDescent G < r ⇒ Nat.card X ≤ 4*r − 4`, with the `r = 0` truncation vacuous | `proved_informal` | as (LB); `ℤ` restatement `d ≤ 2r − 4` | T3; composition with 1 |
| 11 | `(k+1)² − 4k = (k−1)² ≥ 0`, equality iff `k = 1`: (LB) is at least as strong as the r25 formal award at every `k`, strictly stronger for `k ≠ 1`, and covers `k = 0` which the award's scope excludes | `proved_informal` | none | T3 |
| 12 | **(DL+) / root-deficit**, with Corollary A ("no nontrivial tight case": `k ≥ 1`, `i_k > 0` ⇒ `D_k + 2 ≤ 2k·i_k`) and Corollary B (`n·D_k ≤ 2k·i_k·(n−1)`, tight for every tree at `k = 1`) | `proved_informal`, **STATED — isolated second read required** | acyclicity | C-T1-U, C-T1-F |
| 13 | **`k = 1` criterion.** For every finite graph, (DL) fails at `k = 1` iff `|E| > n`; tight iff `|E| = n`; hence every connected unicyclic graph is tight at `k = 1` | `proved_informal`, STATED | none | C-T2-U (Finding 3), C-T2-F (F-4) |
| 14 | **Leaf/branch reformulation.** For a finite tree with `n ≥ 2` and leaf set `L`: (DL) at `k` ⟺ `Σ_{deg v ≥ 3}(deg v − 2)c_v(k) ≤ Σ_{ℓ∈L} c_ℓ(k)`, with `Σ_{deg v ≥ 3}(deg v − 2) = |L| − 2` | `proved_informal`, STATED, **with the `n ≥ 2` correction below** | none beyond treeness | C-T2-U (Step A) |
| 15 | **ℤ-index completeness.** `Erdos993G1.delta G k ≥ 0` for every integer `k < 0`; `Nat.find` over `ℕ` loses no descent | `proved_informal`, STATED | none | C-T3-U (F5) |
| 16 | **Descent maxima.** `M(1) = 4`, `M(2) = 8`, `M(3) = 11` **unconditional** (the formal `(k+1)²` award caps the search at 4, 9, 16 and the enumeration is complete to 16); `M(4) = 15` at grade (DL) via (LB)'s cap, else `bounded_computation` horizon 16. Hence **(LB) tight at `k = 1, 2`, slack at `k = 3, 4`** | as stated | none / (DL) | C-T3-F, C-T3-U; **adjudicator-verified and sharpened to unconditional at `k ≤ 3`** |
| 17 | **(XR) occupancy.** `max{n : x(F) < r} = 0, 4, 8, 11, 15` for `r = 1..5` (complete to order 16); `= 18` at `r = 6` on C-T3-F's order-19 census | `bounded_computation`, attained horizon 16 (mine) / 19 (critic-attributed) | none | C-T3-F (F-3); adjudicator-verified at `r ≤ 5` |
| 18 | **Bounded evidence for (DL)/(EX)/(LB).** Zero violations, zero nontrivial tight cases, over **85,625 free-forest isomorphism classes to order 16** (49,905 at order 16 alone), plus the critics' order-14 and order-19 sweeps | `bounded_computation`, horizon stated | — | adjudicator; C-T2-U, C-T2-F, C-T3-F |

## Rejected and narrowed mechanisms

**Refuted, at the exact statement, and never to be carried forward:**

1. **T1 §3's displayed Step c** — false, 5,700/5,776 on my instrument; smallest witness `S = K₂` rooted at
   `r`, `T = K₁` (true `−2x`, displayed `−x`). It drops `−deg_S(r)·B'·A` and cannot be recovered from the
   `vpoly_{S∖N[r]}` term, which contains no root weight.
2. **T1 §3's substitution box `E_S = vpoly_{S∖N[r]}(f_D^S) + B' − B`** — definitionally impossible
   (`B` is a quantity of `T`), false 5,602/5,776. **Must not be carried into Lean.**
3. **T1 §3's displayed `[x^k]E_T`** — omits `+ i_k(T∖N[r])`, yields `E_{K₁} = −1`, contradicting
   nonnegativity and the return's own base case. The §3 **definition line** is the specification.
4. **(D-REC)/(E-REC) read with `S ∪ T` rooted at `s`** — false in 4,414/5,776 instances.
5. **The naive child-swap injection** `(J,v,c) ↦ (J∖{v})∪{c}` — well defined for a rooted forest **iff
   every component is a star rooted at its centre**; fails under every rooting as soon as a component is
   not a star; minimal rooting-free witness **`P₄`**, not `P₃`. "Pick a better root" is closed.
6. **Edge-local charging** — the root-corrected (DL) is exactly `Σ_e c_{parent} ≤ Σ_e c_{child}`, false
   edge by edge (`K_{1,3}` rooted at a leaf, `k = 2`); the natural two-case repair collides on `P₄`,
   `k = 2`.
7. **Pointwise leaf dominance** (`∀ v, ∀ leaf ℓ: c_v(k) ≤ c_ℓ(k)`) — REFUTED; witness the order-5 tree
   `{0–1, 0–2, 0–3, 1–4}` at `k = 3` (`c_2 = 2 > c_4 = 1`). Any proof of the Hall condition must use the
   matching, not a maximum.
8. **(DL) on all finite bipartite graphs** — REFUTED, witness `K_{2,3}` at `k = 1` and `k = 2`. The
   registrable fence is the stronger `k = 1` criterion (established result 13), which implies it.
9. **T2's "forest layer is an unresolved debt that cannot be paid without collapsing into T1's
   mechanism"** — refuted twice, independently (established result 3).
10. **"average degree ≤ 2 ⟺ pseudoforest"** — false; `{|E| ≤ n}` strictly contains the pseudoforests.
11. **"(EX)/(LB)/(R5)/(XR) upgrade to (DL)'s grade automatically, at `proved_informal` or better"** —
    false for the formal grade; a compiled derivation is itself an input to the composition.

**Narrowed, not rejected:** `hyp-alpha` (enters no step; must not become a Lean hypothesis); T3's Step 8
"live" labels (→ "not excluded by (XR)", with the occupancy row beside it); T3's "(LB) tight at `k = 1`"
(→ tight at `k = 1, 2`, slack at `k = 3, 4`); T2's `…CHILD-SWAP-INJECTION-OBSTRUCTION` (→ re-witness at
`P₄`, rooting-free form); T2's `…UNICYCLIC-AVGDEG2-NULL-RESULT-N7` (→ state the class as `{|E| ≤ n}`; its
`k = 1` content is a theorem, so the empirical content is entirely at `k ≥ 2`); the rank-5 residue
emptiness (see `## Progress and plateau assessment`).

**Refuted stays refuted.** `E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` (REFUTED) is a premise nowhere
in this orientation; both T3 critics and erratum R27-E-c record that `SOLUTION-CONTRACT.md` §3.8 carries a
non-existent `E993-R25-`-prefixed spelling. Scope note for the controller; sealed records are not edited.

## Lean readiness

**The cycle's central ruling for orientation T.** Assessed against `SOLUTION-CONTRACT.md` §2's exact
statements, on my portfolio's evidence only.

**(b) Compiled fragments: NONE, and none can be.** My portfolio contains no Lean seat — U1, U2 and U3 are
orientation U. T1, T2 and T3 each built no Lean project and each says so; all six critics confirm it and
none built one either. **No `#print axioms` output, no `sorry` ledger, no build log exists in this
portfolio**, so there is nothing to confirm against a shipped build log and I certify nothing on that
axis. Every ruling below is about (a) and (c) only. The synthesis must take (b) from orientation U.

**(a) Complete informal proof at statement-level granularity with a closed dependency DAG.** Yes, for all
five §2 targets. The DAG:

```
(P1) root-conditioning ─┐
(P2) separated-union    ├─> corrected single-edge join (D-REC)/(E-REC), rooted at r
A'−B' >= 0 from I(S\N[r]) subset I(S\{r}) ─┘        │
                                                    v
        strong induction on |V(T)|, quantified over EVERY rooted tree  ->  D_T, E_T >= 0 coefficientwise
                                                    │
              forest layer: T1 component product  OR  the convolution (either suffices)
                                                    v
                                     (*) 2k i_k - D_k - 2*sum_i #{J : root_i in J} >= 0
                                                    v
                                 (DL)  [discard the nonnegative root term]
                                                    v
        (*) double count  +  e(J) >= n - k - sum deg   ->  (EX)  ->  (LB)  ->  {(R5), (XR)}
```

Every node is discharged. `k = 0`, `k > α`, the empty forest, disconnected forests, the `n − 3k` cast and
the `4r − 4` truncation are all handled. **There is no remaining unproved informal lemma on the critical
path in this orientation.**

**Award groups that are contract-ready, with exact statements, hypotheses and fences.**

1. **`E993-R27-FOREST-DEGREE-LEMMA` (DL)** — contract-ready at
   `theorem forest_degree_lemma {X} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]
   (hG : G.IsAcyclic) (k : ℕ) : (indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k`.
   Hypotheses consumed: acyclicity (separation for (P1)/(P2), the rooted child decomposition, the single
   cross edge of the join) and finiteness. **No `α` hypothesis.** Fences: §3.3 — this is an **average**
   over `I_k`; no pointwise degree statement may be registered. §3.7 — FLNYZ 2026 §8 on the face, with
   the join derivation **critic-attributed to C-T1-F and C-T1-U**. §3.1 — transfers nothing to
   `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER, the all-rank
   aggregate, `E993-BETA-AGG` or Erdős #993. §3.6 — every declaration authored in-run; U2 must choose Lean
   names independently of the external slice (not `NonnegCoeffs`, not `Dpoly_Epoly_nonneg`).
2. **`E993-R27-FOREST-EXTENSION-INEQUALITY` (EX)** — contract-ready at §2's
   `forest_extension_inequality`, subtraction-free form, `(Fintype.card X : ℤ)` cast. Acyclicity enters
   exactly once, through (DL).
3. **`E993-R27-FOREST-DESCENT-LINEAR-BOUND` (LB)** — contract-ready at §2's
   `forest_descent_linear_bound`, uniform in `k` including `k = 0`. Fence §3.1: an order bound whose
   contrapositive has sign `Δ_k ≥ 0`; not a no-recovery statement. The r25 `(k+1)²` award stays registered
   at its own statement; this is a comparison, not a supersession.
4. **`E993-R27-RANK5-CEILING-20` (R5)** — contract-ready at §2's `forest_rank5_ceiling_20`.
5. **`E993-R27-DESCENT-RESTRICTION-4R-MINUS-4` (XR)** — contract-ready at §2's
   `forest_descent_restriction`, with the `r = 0` truncation recorded as vacuous-hypothesis-sound, not as
   correct arithmetic. Fence: **not** a uniform bound on `d`, **not** a no-recovery statement.
6. **The unconditional pair, ready now and independently of (DL):** the double count
   `(k+1)·indepCount G (k+1) = Σ_{J ∈ I_k} e J` and `e J + k + Σ_{v∈J} G.degree v ≥ n`, plus **(EXX)**.
   **These three must be stated WITHOUT `hG : G.IsAcyclic`** — the hypothesis is not merely unused, it is
   unnecessary, and a stray binder must be struck at fidelity review. U3 should compile (EXX-local) and
   obtain the inequality by `exc(J) ≥ 0` and the equality case for free.

**What is NOT ready.**

- **Nothing in this orientation is `formally_verified` and nothing here can be.** `headline_resolved: no`.
- **The whole remaining obligation is formal.** The smallest first sub-obligation: `vpoly`, `Z`, (P1),
  (P2) on `Finset X` with the **ℤ-cast discipline on `2 − (G.degree v : ℤ)`** — the single step where a
  Lean development type-checks while proving a clamped falsehood, since `f_D(v)` genuinely reaches `−3`
  and `−5`. The long pole: the single-edge join **with its rooting hypothesis**, then the strong induction
  over vertex-set cardinality for the statement quantified over **every** rooted tree, then the component
  sum. Three specification corrections bind U2: use the §3 **definition line** for `E_T`; root `D_{S∪T}`
  and `E_{S∪T}` at **`r`**; drop `hyp-alpha`.
- **The smallest unproved lemma in this orientation is NOT on the critical path.** It is
  **C-T2-U's Hall/SDR condition (Step C)** — see the ruling below. It blocks only the second, independent
  derivation, not the award.
- **The Hall/SDR route is NOT a proof of (DL).** Ruling at its exact statement, as dispatched:
  - *Step A* (leaf/branch reformulation, established result 14) — **proved_informal**, and I confirm the
    algebra: `2 − deg` is `+1` on leaves, `0` at degree 2, `−(deg−2)` above, and `Σ_v (deg v − 2) = −2` for
    a tree. **Adjudicator-derived correction: the slot-count identity `Σ_{deg ≥ 3}(deg − 2) = |L| − 2`
    requires `n ≥ 2`.** At `n = 1` the single vertex has degree 0, so `|L| = 0` while the left side is 0
    and `|L| − 2 = −2`. (DL) is trivial there, but a formalizer must discharge `n ≤ 1` separately. State
    Step A with `2 ≤ n`.
  - *Step B* (convolution to forests) — **proved_informal**; verified independently, 64 pairs, zero
    failures.
  - *Step C* (the Hall/SDR sufficient condition: *for every finite tree and every `k` there is an
    injective assignment giving each branch vertex `v` exactly `deg(v) − 2` distinct leaves `ℓ` with
    `c_ℓ(k) ≥ c_v(k)`*) — **OPEN. A conjecture with bounded-computation support only.** I reproduced
    C-T2-U's test independently by bipartite matching on **all 987 free trees to order 12, every `k`:
    zero failures** — and a zero-failure search is not a proof. The *implication* "Step C ⇒ (DL) for
    trees" is `proved_informal`; Step C itself is not.
  - *Step D* — the pointwise strengthening is **REFUTED** (established result 7), so no maximum can
    replace the matching.
  **Verdict: a proved reduction of (DL) to one named, isolated combinatorial hypothesis — not a proof, and
  not Lean-ready as a proof of (DL).** It is nonetheless the strongest genuinely distinct mechanism this
  orientation produced (no generating function, no two-potential system, no root correction) and it is
  critic-attributed to `C-T2-U`. It is the best Cycle 2 route for the second derivation the record wants.
- **The corrected two-potential chain IS a proof.** Ruling at its exact statement: the corrected Step c,
  identity (i), Part 1, and the assembled (D-REC)/(E-REC) rooted at `r`, as reproduced under
  `## Cross-route reconciliation`. Gap-free, closed, verified symbolically and on 5,776 joins. **It is the
  derivation of record for the recurrences and, with T1's retained §2/§4/§5, the proof of record for
  (DL).** Grade `proved_informal`; the load-bearing step is critic-attributed; Lean-ready as a
  specification, not yet as a compiled artifact.
- **A fixed-band or bounded result never qualifies, and none is proposed as an award here.** Established
  results 16–18 are explicitly bounded computations with their attained horizons on their faces (16, 19),
  named as **isomorphism-class** counts; none is a universal statement and none funds an award.
- **A repackaged identity never qualifies.** (EXX) is a genuinely new identity, not a restatement of the
  extension bound: it carries the exact defect term `exc(J)` and yields the equality case. The alias
  question is the synthesis's, on the registry I cannot read.

## Progress and plateau assessment

material_progress: yes

orientation_plateau: no

(DL) entered this cycle as an external claim absent from the registry and leaves it with a complete
informal proof, a closed DAG and an exactly named Lean obligation; (EX), (LB), (R5) and (XR) moved from
`conditional` to `proved_informal` by a cross-route composition no single route could state; the double
count, the extension bound and (EXX) are unconditional and Lean-ready **now**, with the load-bearing
finding that they need no acyclicity hypothesis at all. The forest layer was shown never to have been a
debt. Two order-bound sharpenings landed (`M(k)` exact for `k ≤ 4`; (LB) tight at `k = 1, 2` and slack
above), and three cells of T3's live-region table were voided. Five mechanisms were refuted at exact
statements with exact witnesses. On the other side, the cycle's single load-bearing derivation shipped
false and was repaired by the critics rather than the route, the required `INFORMAL-PROOF.draft.md` was
not delivered, and fifteen certification literals are struck above. That is a cycle with large material
progress and a real process failure, not a plateau.

**Stop gate.** `SOLUTION-CONTRACT.md` §5, assessed on this orientation only. (a) Not met: (DL) and (EX)
are **not** formally verified — this portfolio compiles nothing, so the decisive event cannot occur here.
(b) Not met: no in-scope counterexample exists; (DL), (EX) and (LB) survive 85,625 forest classes to order
16 on my own instrument with zero violations, on top of the critics' order-14 and order-19 sweeps. (c) Met
exactly: **the mathematics is proved informally with a closed DAG and Stage 7 is blocked on a bounded,
named Lean obligation — CONTINUE.** Cycle 1 is not a plateau and the six-cycle ceiling is not in play.

**Rank-5 residue closeout, at this orientation's grade.** (R5) gives `Δ_5 < 0 ⇒ n ≤ 20`, so every forest
of order 22–25 has `Δ_5 ≥ 0` and the stated residue of `E993-R25-RANK5-CEILING-SHARPENED-TO-25` (orders
22–25 with ≥ 3 branch vertices) is **empty at grade `proved_informal`** — an upgrade from the
`conditional` that C-T3-U correctly insisted on at Stage 4, and **not** an unconditional or formal
statement. Fence §3.5: the sealed r25 claim is never edited; this is a scope note on its face, and a
`proved_informal` consequence may not be written onto a `VERIFIED` face without its grade. The residue
closeout and the K1-addition composition are **F3's objects** under `control/C1-ALLOCATION.md` item 6; T3
named them without overreaching and so do I. Registration is for orientation F's adjudicator and the
synthesis; the narrowed form is `STATED` at this review stage and needs an isolated second read.

**Item 7 of the protocol (the external-source audit record; the rank-5 residue / K1-addition
reconstruction) is for orientation F and is not in my portfolio.** I read no F return and no F critique and
I rule on neither. My portfolio bears on them only through (R5), whose grade is stated above and whose
fences travel with it: a composition takes its weakest input's grade, so the `x ≤ 5` closure remains bound
by the r25 order-≤21 census's `bounded_computation`, and the formal grade of nothing here promotes it.

## Headline assessment

headline_resolved: no

status: proved

`headline_resolved: no` — the headline is (DL)+(EX) **formally verified** with (LB)/(R5) checked and the
residue closed out. No Stage 5 adjudication can produce it, and this portfolio contains no compiled
artifact at all.

`status: proved` — for (DL)+(EX) **at this orientation's evidence grade**, meaning a complete informal
proof I have verified. I re-derived the corrected join chain symbolically and confirmed every identity on
5,776 labelled single-edge joins; confirmed coefficientwise nonnegativity of both potentials at every root
of every free tree to order 9; confirmed `(★)` on 2,722 rootings; confirmed the forest convolution; and
found zero violations of (DL), (EX) and (LB) across 85,625 free-forest isomorphism classes to order 16.
The formal award is Stage 7's and remains open.

Fence check, explicit. No status is transferred to the all-rank aggregate, `E993-BETA-AGG`, transport,
TREE, FOREST, NR1, `E993-G1WIDE-NO-SIZE-CAP`, `E993-R25-UNR-FOREST-WIDE` (still OPEN, untouched, no truth
value asserted) or Erdős #993. No `N₀`, no CLT, no asymptotics, nothing about "sufficiently large forests
are unimodal". No pointwise degree claim — (DL), (DL+) and (EXX) are all aggregates over `I_k`. No formal
grade on any composition using the r25 census or an informal r25 claim. No sealed record edited. No
external Lean text carried; the two identifier mentions in T1 are disclosed, are not line-by-line
transcription, are not in a project file, and are not evidence — no breach of Gate ruling 3, and U2 is
bound to independent names. Attribution travels on every face.

## Next-route allocation

Cycle 2 keeps three routes for orientation T. The exact remaining obligation is: **(DL) and its
consequences are proved informally; every open item is now either a Lean obligation or an optional
second derivation. Produce the specification Stage 7 needs, close or kill the second mechanism, and
consolidate the corrections.**

1. **`C2-T-01 DEGREE-LEMMA-PROOF-OF-RECORD`.** Write the `INFORMAL-PROOF.md` the allocation asked for and
   Cycle 1 did not deliver: T1's §2 primitives, the **critics' corrected join** with its rooting
   annotation, the §3 **definition line** for `E_T`, the every-rooted-tree induction, the forest layer
   (both the component product and the convolution, with the convolution named the cheaper Lean route),
   the §5 range completion and the ℤ-cast ledger, `hyp-alpha` removed — as a statement-level claim ledger
   with a closed DAG and one named Lean node per entry, plus the three specification corrections binding
   U2. *Closes in one cycle:* the Stage 7 specification ambiguity that caused this cycle's failure, and
   the last attribution question (critic-derived vs route-derived) on the record.
2. **`C2-T-02 LEAF-BRANCH-SDR-DECIDE`.** Prove or refute C-T2-U's Step C at its exact statement, via
   Hall's criterion (*for every set `S` of branch slots, `|{ℓ : c_ℓ(k) ≥ min_{v∈S} c_v(k)}| ≥ |S|`*),
   with Step A restated for `n ≥ 2`. Push the horizon to order 15–16 first (cheap with a
   leaf-augmentation enumerator — my own reached order 16 in 71 s), then attack the Hall condition
   directly; note the pointwise form is already refuted, so any proof must use the matching, and any
   injective route must avoid both the `P₄` rooting-free failure and the edge-local failure. *Closes in
   one cycle:* either the second, generating-function-free derivation of (DL) the record wants, or a
   sharp refutation that closes the mechanism and ends the search.
3. **`C2-T-03 SHARPENINGS-AND-RECORD-CORRECTIONS`.** Consolidate for isolated second reads and
   registration: (DL+)/root-deficit with Corollaries A and B in one canonical form; (EXX); the `k = 1`
   criterion `|E| > n` as the registrable fence in place of the three separate non-forest statements; the
   ℤ-index completeness fact; the occupancy row `max{n : x(F) < r}` replacing T3's "live" labels; and the
   (LB) sharpness profile. Settle `M(4)` unconditionally and `M(5)` by extending the census to orders
   17–20 (the r25 formal `(k+1)²` caps `k = 4` at 25 and `k = 5` at 36; (LB) caps them at 16 and 20, so
   order 20 closes `M(5)` outright under (LB), and orders 17–25 close `M(4)` unconditionally). *Closes in
   one cycle:* the Step 8 table correction, the r25 scope notes this run owes, the tight-case question,
   and the last unverified live-region cell (`r = 6`, `d = 8`, `n = 20`).

Deferred to orientation U and the synthesis, not to a T route: every compiled fragment, the `sorry`
ledger, `#print axioms`, and the `E993-R25-FOREST-ORDER-BOUND-SHARPENED` comparison row (the registry is
not a member of my capsule).

## Artifact inventory

**Deliverable (this file, the only file written outside my scratch):**
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-forest-degree-extension-dre-2026-09-24/cycles/cycle-1/stage5/adjudicators/T/ADJUDICATION.md`

**Scratch — all under `<run root>/scratchpad/c1-adj-T/`, nothing written anywhere else.** Standard library
only (`itertools`, `json`, `hashlib`, `os`, `sys`); exact integers; no floats; no RNG; no network; no
package installs; no Lean build and no `.lake` binding (this is not a Lean seat).

| File | SHA-256 | What it is |
|---|---|---|
| `verify_seal.py` | `cca2a0a7b79a9775bceddd8b9ad9762dbc814bad8438aa7b410710c6d81a0d41` | capsule seal recomputation + all 24 member digests |
| `seals.py` | `f3f5ff09f38e770065174fefa28b0ac4dbb7a94738bc81b864bbe23ac37501a5` | canonical seal recomputation, Stage 2 / 3 / 4 / capsule |
| `adj_instrument.py` | `83cbf709432fe7d89158bf13be72752cfa626b5ae3e7e51fce070e5f50371d0c` | `ℤ[x]` layer, `Z`/`vpoly`/`D_T`/`E_T`, the join checks |
| `adj_instrument_small.py` | `7490c77618448ffac0c0ed1c3ace255f7bfcdd27e27c3d31b80ed0ffb13f5280` | same at the order-≤4 join horizon (the one that was run) |
| `join_result.json` | `91cf2fe3b3fdca70a12e9a5d2965052b947f0706e1bd4329d3120ea1687e1729` | 5,776 joins: Step b 0 fail; displayed Step c 5,700 fail; box 5,602 fail; corrected Step c 0; identity (i) 0; Part1+Part2 0; (D-REC) 0; (E-REC) 0; rooted-at-`s` 4,414 fail |
| `adj_census.py` | `ffbc785a48f1544592f495f9fda0b5c3aaa0da3bc09952cd9033502eb67d98a9` | free-tree/forest generation (AHU canonical form), rooted DP for `i_k`/`D_k`, (DL)/(EX)/(LB)/`(k+1)²`, `M(k)`, convolution, Hall/SDR matching |
| `census16.json` | `077aa979d1ae4bbc39607417a3533d0a403032860ebad05c0ec05b5a7bf55a70` | order-16 census: 85,625 classes; 0 (DL)/(EX)/(LB)/`(k+1)²` violations; 0 nontrivial tight cases; `M = 4, 8, 11, 15`; 987 trees Hall-tested, 0 failures |
| `adj_extra.py` | `21fac3a9a484010e40f63c46244f131d4542e2c617b03d731e3f4fa031fe64b6` | nonnegativity at every root; `(★)` over all rootings; `P_8` uniqueness; the `k = 1` criterion |
| `extra_result.json` | `d2ccb4ed0f5d41d87cb7ac21227c53b86b4a8b18509dc4f702d3e334f4559b0c` | 749 rooted instances 0 negative coefficients; 2,722 rootings 0 `(★)` failures; Corollary A 0 failures; exactly 1 order-8 forest with `x < 3`, namely `P_8`; 1,099 graphs 0 `k = 1`-criterion failures |

Reproduction, from that directory, all foreground:

```
python3 verify_seal.py                 # capsule seal + 24 member digests
python3 seals.py                       # Stage 2/3/4 + capsule seals
python3 adj_instrument_small.py        # the 5,776-join recurrence audit      (~2 s)
python3 adj_census.py 16 12            # order-16 census, M(k), convolution, Hall/SDR  (~71 s)
python3 adj_extra.py                   # nonnegativity, (*), P_8, k=1 criterion (~1 s)
```

**Read boundary.** VerityOS: exactly `verity.md` and `identity/startup-protocol.md`. Run root: the 24
capsule members and nothing else — the three returns, the six critiques, `SEMANTIC-CONTRACT.md`,
`SOLUTION-CONTRACT.md`, `control/C1-ADJUDICATOR-PROTOCOL.md`, `control/C1-ALLOCATION.md`,
`control/C1-STAGE1-GATE.md`, the Stage 2/3/4 packet manifests, the Stage 3/4 admission reports, the Stage
3/4 read-boundary disclosure files, `control/C1-STAGE5-CONTROLLER-FACTS-T.json`,
`control/SOURCE-DIGESTS.json` and `control/c1-adjudicator-capsules/PATH-CHECK-T.json`. I read **no** F or U
return, **no** other orientation's critique, **no** adjudication, **no** prior synthesis, **no** other
experiment root, **no** research-packet directory and **no** external source; I did not open
`sources/authority/CLAIM-IDENTITY.json` or the frozen `sources/` tree, which my capsule does not list, so
every registry statement above is carried as critic-attributed. **No `find`, `grep`, `rg`, `ls`, `ls -R`,
globbed `cat` or any recursive listing was run at any point, at any level.** No network, no package
install. I did not replay the seats' own generators — all six critics did, each reproducing its seat's
digests exactly — and built an independent instrument instead; I record that choice so the evidence base
is clear.

**Two execution disclosures.**

1. **Background job.** My first instrument run was written for a larger join horizon, exceeded the
   harness's 120 s foreground tool timeout, and was **auto-backgrounded by the harness**. I stopped it
   immediately by its **task handle** (`TaskStop`, task id `b06ugdcc0`) and re-ran at the reduced horizon
   in the foreground. **No pattern kill was issued, no `pgrep`/`pkill` was used, and no process listing of
   any kind was run** (r26 incident R26-I-1). This is the same class as the disclosures the controller
   already recorded for `C-U2-T` and `C-U2-F` at Stage 4. Every other command in this adjudication ran in
   the foreground and exited before the next; **no background job is running at the final write**, and no
   PID-targeted kill was needed.
2. **Wall clock.** The `time` builtin was used on two runs (~2 s and ~71 s) for this disclosure only; no
   wall-clock, PID or host value enters any file I wrote, and my result JSONs contain deterministic
   mathematical content only.

Reread before close.
