# Cycle 1 Neutral Synthesis

Neutral Stage 6 synthesis of Cycle 1 of r26 (`erdos-993-math-dre-20260923-r26-top-rank-residual-sign`),
target `E993-R26-TOP-RANK-RESIDUAL-SIGN` (RC).

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading EXACTLY the two files my
dispatch authorizes: the root constitution `verity.md` and the identity subsystem's
`identity/startup-protocol.md`. Subsystems loaded: the root constitution and the identity startup
protocol only. The startup protocol's own task-type map was deliberately not followed into `memory/`,
`knowledge/`, `decisions/`, `modules/`, `skills/`, `operations/`, `logs/`, `conversations/`,
`projects/`, `writing/` or `inbox/` — the dispatch fixes the read boundary at those two files and the
controller has booted for the run. This run is a bounded, reversible laboratory workspace under
`experiments/` per `verity.md`; nothing written here is a durable VerityOS record, and no conversation
record was created or appended (`conversations/` lies outside the grant).

**Model disclosure.** chartered opus/high; transport-resolved model opus (explicit parameter); the
seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

**Read-boundary disclosure.** None. Every file opened this session is one of: the two boot files
above; the sealed dispatch capsule `control/C1-STAGE6-DISPATCH-MANIFEST.json` and the twelve members
it lists (the three orientation adjudications, the Stage 5 packet manifest, `SEMANTIC-CONTRACT.md`,
`SOLUTION-CONTRACT.md`, `control/C1-ALLOCATION.md`, `control/C1-STAGE1-GATE.md`,
`control/SOURCE-DIGESTS.json`, `control/C1-STAGE6-CONTROLLER-FACTS.json`,
`control/C1-SYNTHESIS-PROTOCOL.md`, `control/PATH-CHECK-c1-stage6-dispatch.json`); and, under the
express run-root authority grant, one field-scoped read of `control/SOURCE-DIGESTS.json`'s own
`files` and `ORIGINS` records. Bytes of the 79 frozen `sources/` files and the 31 Stage 5 packet
members were streamed into `hashlib` for the digest audit and were never opened into context —
hashing is not reading, on the ruling the T adjudicator made and I adopt. No raw return, no critique,
no seat or critic scratch, no `control/controller-prerun/` file, no other adjudication, no prior
synthesis, no research-packet directory, no other experiment root and no external source was read. No
`find`, `grep`, `rg`, `ls -R` or globbed `cat` was run at any point, and every digest loop iterated a
manifest's own listed paths. No network, no package install; Python standard library and exact
integers only; no Lean build and no `lake` invocation. **No background job was started at any point
in this session**, so none was running at this write and none needed to be killed.

---

## Identity and seal audit

**Dispatch capsule seal, recomputed** as SHA-256 over the canonical JSON of
`control/C1-STAGE6-DISPATCH-MANIFEST.json` with `seal_sha256` removed (`sort_keys=True`,
`separators=(",",":")`, UTF-8, no trailing newline):

```
declared  = d52e8fe4bc72f2507fa20994459c333381b0617a5c118ba3da91dec8c0c16f4e
recomputed= d52e8fe4bc72f2507fa20994459c333381b0617a5c118ba3da91dec8c0c16f4e
match     = True
```

**All 12/12 listed members verify on disk by both `bytes` and `sha256`; `file_count` (12) equals the
listed count; 0 mismatches, 0 missing.** The three adjudications are
`cycles/cycle-1/stage5/adjudicators/T/ADJUDICATION.md` (85,952 B,
`fab43bfab7f126f97a7d6d626ff9416a73d441b2d803512e514a23320c96dffd`),
`.../F/ADJUDICATION.md` (78,761 B, `d94c8d0ddc172adf2f81f072f0d2f01578a7e598295614cfa2937e10a78ad6d3`)
and `.../U/ADJUDICATION.md` (57,453 B,
`123977ffbaf3d5e9edfae7bfc4101e226ec2d16a679d4eba459d93a963dfdc17`).

**Stage 5 packet manifest.** Inner seal of `control/C1-STAGE5-PACKET-MANIFEST.json` recomputed by the
same canonical rule: declared and recomputed both
`ec0de29154d709c8ac35e84118d080f98a555eb5799fad8e533ad8823c4dd43e` — **match**. All **31/31** listed
members re-hash to their declared values by `bytes` and `sha256`: 0 mismatches. This independently
authenticates the three adjudications a second time, and the Stage 5 controller-facts records, the
adjudicator capsules, the Stage 5 dispatches, the adjudicator protocol, `control/r26_tool.py` and the
charter prompt as sealed.

**Frozen sources.** All **79/79** entries of `control/SOURCE-DIGESTS.json` re-hash to their declared
values: 0 mismatches, 0 missing. **`SOLUTION-CONTRACT.md` §3.5 is therefore discharged run-wide at
Stage 6: no sealed r24 file was edited by any seat, critic, adjudicator or by this synthesis.** The
composition base is confirmed frozen: `sources/r24/c5-la1/LeanProject/LeanProof/Main.lean` = 32,876 B,
`0933211d8f02acd867e91547d4a2b09d13fcc3ea178e192e385acc33b696b63b`, which is exactly the digest the U
adjudicator reports for `LeanProof/C5LA1.lean` in all three scratch projects.

**Path check.** `control/PATH-CHECK-c1-stage6-dispatch.json`: 11 files scanned, 0 files with findings,
0 findings, no pruned roots, run root correct.

**Capsule seals the three adjudicators report** (each recomputed by its own code, each reported
matching, and each capsule digest-verified as a Stage 5 packet member by me):
T `848add3cce0a3d247c99ea76b735f8b027b44270f81530942bfa7ac2f136a9fd`;
F `7cfac90a445e5bae388fda099d8bee29e764264535488ff47cc5697b8959d215`;
U `fec178ffb7fc078f17eda32cf089827c7a05d59b366e862a02e5f6bd6fdcc87c`. All three report 24/24 members
verified. All three independently recomputed the Stage 2, Stage 3 and Stage 4 packet inner seals and
all three obtained identical values —
Stage 2 `c97e121561a7b63cef93312f22f60cfa2097b916f264bfb8ebff52cb68ee9de3` (96 members),
Stage 3 `86571d275c1b158757f81106d929450b052d819891899b2d6991e7e93df68a40` (32),
Stage 4 `7169114907fdb1f2ab3845ba07183ffa808114d588add7ccc05d15eadf92ab2c` (57) — with zero member
digest failures across 185 files in each independent run. Three isolated seats agreeing digit for
digit on five seals is the strongest identity evidence this stage can carry.

**Admission records, as the adjudicators report them.** Stage 3: 9 expected, 9 observed, 9 admitted,
0 findings, `source_seal` equal to the verified Stage 2 seal. Stage 4: 18 expected, 18 admitted, 0
findings; every critique `retained_narrowed`; every return and every critique declares
`headline_resolved: no`. One record-accuracy item, filed by the F adjudicator and not disputed: the
Stage 3 admission sets `read_boundary_disclosure: true` for F1 and F2 although both filed none and
`control/C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json` lists only F3, U2 and U1 — the controller's own
Stage 6 facts record states that this boolean is a phrase match and not the record, which settles it.
A second record gap, also filed by the F adjudicator: `control/C1-STAGE4-READ-BOUNDARY-DISCLOSURES.json`
carries no entry for any of the six F critics although four disclosed inside their critiques; the F
adjudicator re-ruled all six and found no breach. **Consequence for the close: both are record-hygiene
items for the controller, with no mathematical effect and no seat penalty.**

**Read-boundary rulings, reconciled across orientations.** Eight items were adjudicated (three at
Stage 3, five at Stage 4 in T's portfolio, six re-ruled in F's, two struck literals in U's). Every one
falls into one of four classes and none exposed sealed content of another seat: (i) process-table
exposure from `pgrep`/`ps` taken to discharge the kill-background-jobs duty (three T critics) — wrong
instrument, no reading; (ii) hashing non-capsule files to authenticate a manifest (`C-T3-F`,
`C-T3-U`, `C-F1-U`, `C-F2-U`) — hashing is not reading, in-grant, and the Cycle 2 correction
(recompute the inner seal from the manifest's own listed digests) is the right one; (iii) replay-
induced reads by inventoried generators (`C-T1-F`, `C-T1-U`) — in-grant, the replay grant covers a
generator's own reads; (iv) reads of the shared `bind-shared-packages` script (U1, U3, and the class
the controller already accepted for U2 under erratum **R26-E-a**) — benign, no mathematical input
possible, the returns' "no other VerityOS file was read" literals struck by the U adjudicator on
`C-U3-T`'s executed test. **Incident `R26-I-1`** (critic `C-T2-U`'s `pkill -f` pattern kill, which may
have hit `C-U2-F`'s process) is closed by the controller's own record: `C-U2-F` returned complete and
attributes no lost result to it; the T adjudicator independently reproduced every `C-T2-U` result it
checked. The Cycle 2 rule — kill by literal PID only — stands, and every Stage 5 and Stage 6 seat
started no background job at all. **No independence finding anywhere in the cycle.**

**Alias and registry discharge — an item the U adjudicator could not settle and routed onward, settled
here.** U could not read `control/CLAIM-IDENTITY.run-local.json` (not a capsule member), so the three
U seats' lexical alias checks were unverified at Stage 5. Two independent facts close it: the
controller's Stage 6 facts record states the run-local registry is byte-identical to
`sources/authority/CLAIM-IDENTITY.json` (363 identities), and the F adjudicator re-derived the sweep
from the frozen registry itself (2,383,262 B, 363 identities) — `E993-R26-TOP-RANK-RESIDUAL-SIGN`
absent, `E993-R26-C6-B3-FAMILY-I-REALIZATION-CORRECTION` absent,
`E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` OPEN, `E993-BETA-AGG` OPEN,
`E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` REFUTED, zero `residual`+`top` co-occurrences, zero
`top-rank` aliases. **The U adjudicator's routed item (i) is DISCHARGED; both run-local candidate keys
are genuinely new.**

---

## Reconciliation

Reconciled claim by claim. Where the three orientations differ I resolve on the mathematics and on
replay, never by counting orientations, and never by consulting a lower tier.

### The one disagreement that decides the cycle

**D1 — the status of (RC): T says `proved`, F says `still_open`, U says `still_open`.**
This is not a three-way split about one proposition. Each adjudicator ruled, correctly, **at its own
orientation's evidence grade**, and each said so on its face:

- **T** rules `proved` meaning proved informally at the literal scope of the four C5-LA1 hypotheses,
  on the chain `L0`–`L11` with `L5` replaced by `L5′` (arithmetic trichotomy) + `L5″` (pruning via
  forced neighbour), re-derived by both paired critics and a third time by the adjudicator's own
  from-scratch instrument.
- **F** rules `still_open` **because exactly one node of its own portfolio is unproved** — the
  family-(III) parametrization — and says in terms "Nothing in *my portfolio* proves it."
- **U** rules `still_open` on formal evidence, and states that it holds no informal proof of (RC) at
  all because no U seat was chartered to produce one.

**Resolution.** The two named open nodes are each proved in another orientation's portfolio, and I
verified both myself from the contract definitions rather than accepting either adjudicator's word:

- **F's open node — the family-(III) parametrization — is proved in T's portfolio** (T1 `L9`,
  attacked by `C-T1-F` and `C-T1-U`, re-derived by the T adjudicator) and I re-derived it here. Given
  `J' ∈ I_{a−1}(D)` and `A ⊆ U(J')` independent, `B := (L ∖ {v_s : s ∈ A}) ∪ A ∪ J'` is independent
  (`L` is independent at `α ≥ 2`; there is no `L`–`D` edge; each `s ∈ A` has its unique leaf removed;
  `A ⊆ U(J')` means `N(s) ∩ J' = ∅`), has size `(ℓ−|A|) + |A| + (a−1) = α−1` by `α = ℓ + a`, and lands
  in family (III) with `A_D = J'`, `A_C = A`, `h = 0` and weight `w(B) = (ℓ−|A|) − |A| = ℓ − 2|A|`.
  Injectivity is immediate (`J' = B ∩ D`, `A = B ∩ C`). Surjectivity: for `B` in family (III),
  `A_C ⊆ C_1` and independence of `B` give `A_C ⊆ U(A_D)` and `A_C` independent there, while `h = 0`
  with disjoint leaf fibres forces `B ∩ L = L ∖ {v_s : s ∈ A_C}` exactly. Hence
  `W_III = Σ_{J' ∈ I_{a−1}(D)} Σ_{A ∈ I(U(J'))} (ℓ − 2|A|)`. **F's open node is closed run-wide.**
- **U's open node — `α = ℓ + a` with the maximum-set bijection — is proved twice over**, in T (E3:
  `T1 L3`/`T3 (vi)` directly, `T2 §2.3` by the corona top coefficient) and independently in F (E1,
  critic-attributed to `C-F2-T` Step A and `C-F2-U` Preliminaries). U's open node is **formal, not
  mathematical**: no Lean declaration states it anywhere in the cycle.

The controller's Stage 6 facts record states the same structural fact and leaves the ruling to me.
**Ruling: at the run's evidence taken as a whole, the mathematics of (RC) is `proved_informal` with a
closed dependency DAG at the exact scope of the four C5-LA1 hypotheses.** Neither F's nor U's verdict
is overturned — both were correct within their capsules, and the only seat that can see all three
portfolios is this one. No majority was counted: T's single portfolio would not have carried the
ruling by itself, and did not; what carries it is that each orientation's named gap is closed, with a
proof, in another, and that I re-derived the hinge and the finish independently.

### The arithmetic of the finish, re-derived here

From (RI), `S = ℓM − Σ_{B ∈ I_{α−1}} w(B)` with `w(B) = |B ∩ L| − Σ_{s ∈ B} λ(s)`. With family (I)
contributing `ℓM` members of constant weight `ℓ−1`, family (II) contributing `N_2` members of constant
weight `ℓ−4`, and family (III) contributing `W_III`:
`S = ℓM − ℓ(ℓ−1)M − (ℓ−4)N_2 − W_III = −ℓ(ℓ−2)M − (ℓ−4)N_2 − W_III`.
`ℓ ≥ 4`: all three terms nonnegative, `S ≤ 0`. `ℓ = 3`: `k_2 ≤ ⌊3/2⌋ = 1`, so `N_2 ≤ k_2 M ≤ M` and
`−S ≥ 3M − M = 2M > 0`. `ℓ = 2`: `ℓ(ℓ−2)M = 0`, and a `λ = 2` support would force `G ≅ P_3` hence
`α = 2`, excluded by `hyp-eligible` through `α ≥ 3`; so `C_2 = ∅`, `N_2 = 0`, `−S = W_III ≥ 0`.
`ℓ ≤ 1` cannot occur (a tree with `α ≥ 2` has `n ≥ 3` and `ℓ ≥ 2`). The fibre bound is
`Σ_{A ∈ I(U)}(ℓ − 2|A|) = ℓ|I(U)| − 2Σ|A| ≥ (ℓ − |U|)|I(U)| ≥ 0` by the deletion injection and
`|U(J')| ≤ |C_1| ≤ ℓ`. **Every branch closes, and no branch rests on a census.**

### Claim-by-claim reconciliations across orientations

**D2 — the outer index of `W_III`.** F1's Phase-3 fibre check indexed `U(J)` and `W_III(J)` over the
**maximum** independent subsets `J ⊆ D`, where forced neighbour makes `U(J) = ∅` identically, so the
row asserted `ℓ ≥ 0`. Both F1 critics caught it independently with identical measurements; the F
adjudicator struck the row and confirmed the correct index set on its own instrument (2,435 of 4,118
fibres non-empty at `J' ∈ I_{a−1}(D)`, max `|U| = 6`, 207 negative individual terms, **0** negative
fibre sums, minimum fibre 0, minimum deletion-injection slack 0). The U adjudicator reached the same
conclusion from the opposite side (CR-7: read with `|J| = a` the exact identity **fails on 628 of 677**
members; read with `|J| = a−1` it holds with **0** failures). T's E6 states the `a−1` shell form
throughout. **Ruling: the outer index of `W_III` is the `a−1` shell `I_{a−1}(D)`, never the maximum
shell; the inequality is real, load-bearing and TIGHT (minimum fibre 0, minimum slack 0). Any Stage 7
statement of `node-fibre-bound` at the maximum shell would be vacuous.** `SEMANTIC-CONTRACT.md` §4 and
`C1-ALLOCATION.md` item 1(d) are silent on `|J'|`; that silence is a contract erratum candidate,
first stated by the U adjudicator, STATED, and it needs an isolated second read.

**D3 — `N_2 ≤ M`.** `C1-ALLOCATION.md` item 1(f) writes the `ℓ = 3` finish as "`N_2 ≤ M`" without
scope, and U's proposed Cycle 2 route `C2-U-03` inherits it as a Lean target. **`N_2 ≤ M` is false.**
The F adjudicator resolved an apparent critic conflict by computing `N_2` from its own definition over
two populations: over `residual ∧ α ≥ 2` to order 13, 53 of 695 trees have `N_2 > M` (reproducing
`C-F3-T` exactly, smallest the order-6 double star, `ℓ = 4`, the unique ineligible one of the 53);
over the **eligible residual** class to order 14, 118 of 1,469 fail, **first at order 9**, none at
`ℓ ≤ 5` (striking `C-F2-T`'s "smallest at order 16"). **Ruling: `N_2 ≤ M` may never be used unscoped.
The surviving lemma is `N_2 ≤ k_2·M`, and the `ℓ = 3` finish is safe only through `k_2 ≤ ⌊ℓ/2⌋ = 1`.**
T's DAG already carries `k2_le_ell_div_two` and `N2_le_k2_mul_M` as named nodes (both absent from T1's
shipped DAG and added by the T adjudicator). **The allocation's parenthesis and U's route text are
corrected here; a Stage 7 or Cycle 2 seat that compiled `N_2 ≤ M` would be compiling a false
statement.** This is the single most dangerous inherited literal in the cycle.

**D4 — `hyp-eligible ⟹ α ≥ ?`.** `C-T3-F` proves `α ≥ 3` by pure `ℕ` arithmetic with no graph
hypothesis; `C-T1-F` (A-2) and `C-T3-U` ((E)) independently prove `α ≥ 4` from `Δ_0 = n−1 > 0` hence
`x ≥ 1`, given `2 ≤ |V|`. Neither supersedes the other. **Ruling: `α ≥ 3` is what (RC) consumes (it is
exactly what excludes `P_3`) and is the compiled form (U1 `alpha_ge_three_of_eligible`, U3 item (f));
`α ≥ 4` is the form of record for the STRICT Tier 1′ `ℓ = 2` branch, where `a = α − 2 ≥ 2` is exactly
what buys strictness.** Both are STATED and critic-attributed. No conflict.

**D5 — what `(★)` actually carries.** Three independent hypothesis-map corrections converge and one
of them corrects the run's own semantic contract. (i) `α = ℓ + a` is **`(★)`-free** (`C-T2-F` F2b,
verified on 985 trees of which 655 non-residual; corroborated by the T adjudicator on the non-residual
paths); `(★)` is needed only for the second conjunct, that `M = i_α(G)` counts the maximum independent
subsets of `D` (`K_{1,3}`: `M = 3`, `D`-count 1; `P_6`: `M = 4`, `D`-count 2). (ii) "No interior vertex
is adjacent to a leaf" is listed in `SEMANTIC-CONTRACT.md` §3 among the `(★)`-consequences; the U
adjudicator shows it follows from the definitions of `L`, `C`, `D` alone (if `d ∈ D` were adjacent to
a leaf `v`, `d` is `v`'s unique neighbour, so `λ(d) ≥ 1` and `d ∈ C`). **The contract over-attributes
it**; U2's hypothesis map inherited the over-attribution and F3's load-bearing map was told `(★)`
carries it. (iii) The corona factorization of `T2` §2.2 is tagged "`hyp-tree` only" and needs
`hyp-alpha` (`K_2` witness: the right-hand side gives `1 + 4z + 3z²` against the true `1 + 2z`).
**Ruling: all three corrections are adopted. `(★)` carries exactly `M`'s characterization, the forced-
neighbour lemma and the family pruning `L5″`; it carries nothing else in the DAG.** Items (i) and
(iii) are critic-attributed and STATED; item (ii) is adjudicator-attributed and STATED.

**D6 — `ℓ = 2` with a `λ = 2` support.** T rules the statement of record is **(iv′)** — for a finite
tree with `|L| = 2` and some `s` with `λ(s) = 2`: `V = {v_1, s, v_2}`, `G ≅ P_3`, `α = 2`, with
`2 ≤ α` a **conclusion, not a hypothesis** — because `λ(s) = 2` already exhibits two distinct leaves
adjacent to `s`, and because `C1-ALLOCATION.md` item 9(e) states U3's Lean target without
`2 ≤ indepNum`. F's portfolio contains the same theorem independently: `C-F3-U`'s forest lemma
(`ℓ(F) = 2` and a `λ = 2` support ⟹ `F ≅ P_3 ⊔ m·K_1`) has the tree statement as its `m = 0` case, and
the F adjudicator notes that neither the critic nor F3 recognized it as T3's chartered object. U3
**compiled** item 9(e) sorry-free, and `C-U3-T` compiled the sharper eligible-class form
`card_C2_eq_zero_of_eligible`. **Ruling: (iv′) is the statement of record; the Lean route of record is
the adjacency-closure argument (`{v_1, s, v_2}` is closed under `G.Adj`, then connectivity), not T3's
nested `induce`; connectivity must be consumed explicitly — `P_3 ⊔ K_1` is the witness where the
closure fails while `(★)` still holds (`α = 3`, `S = 0`), and 207 such acyclic disconnected witnesses
exist at order ≤ 7.** Three orientations, one statement, no conflict.

**D7 — the deletion injection / occupancy bound.** T (AG-T2), F (Group F-B) and U (U-A, U-B) each
name it contract-ready, each with the same statement, and all three independently require the same
thing: **the Andriantiana–Razanajatovo Misanantenaina–Wagner (2020) attribution must travel on the
claim's face** (`SOLUTION-CONTRACT.md` fence 7), and it is absent from every shipped artifact. The T
adjudicator explains why the omission is structural rather than careless: the alias check was scoped
to the 363 registry claims, where prior art does not appear. **Ruling: no fence is crossed — the bound
is re-proved in-run by the `A ↦ A.erase u` injection and never imported — but the attribution line is
a hard registration precondition.** The sharp form is stronger than any seat was asked for:
`C-U2-F`'s `fibreInequalitySharp` carries **no hypothesis at all**, not even `|U| ≤ ℓ`, and U2's signed
form is a two-line corollary.

**D8 — U1's `signBound` is not the allocation's bound.** As compiled it omits the `−(ℓ−4)N_2` term
while the sorry ledger, the DAG node and the doc-comment all certify item 1(f). It is weaker than
1(f) for `ℓ ≥ 5`, coincides at `ℓ = 4`, and is **strictly stronger** for `ℓ ≤ 3`, where the cited
derivation cannot reach it — and at `ℓ = 2` the compiled right-hand side is identically `0`, so the
node **is** (RC) on a non-empty fibre of the eligible residual class (`P_11`, `P_13`). The U
adjudicator resolved the paired critics' difference correctly: `C-U1-F`'s `W_III ≥ N_2` at `ℓ = 3` is
the exact requirement and `C-U1-T`'s `N_2 = 0` is sufficient but not necessary; both are moot once the
node is restated. **Ruling: `node-sign-bound` is stated at item 1(f)'s shape in `ℤ` with the `ℓ ≥ 4`,
`ℓ = 3`, `ℓ = 2` finishes as three separate named nodes; U1's compiled `signBound` is NOT inherited as
item 1(f), and the DAG edge `node-alpha-ge-three → node-sign-bound` is removed in favour of `ℓ ≥ 2`.**

**D9 — how independent are the budget-identity derivations?** T rules that T2's §3 is the same
size-equation algebra as T1's `L4`, not a second mechanism, and that a synthesis must not sell it as
two independent proofs. I adopt that and add the cross-orientation fact only this seat can see:
**the budget identity does have genuinely independent derivations, but across orientations, not within
T** — `C-F2-U`'s Attack 8 (in the F portfolio, on a different instrument, and stronger: it derives the
exhaustive three-family classification **a priori** from "a sum of three naturals equal to 1 has
exactly one term equal to 1") and `C-U2-T`'s compiled exact `ℤ` identity (in the U portfolio,
localized to `hpartition` and `hBcard` **alone** — no independence, no graph hypothesis, no `(★)`).
T2's genuinely distinct mechanism is §2.2–§2.3, the corona factorization and top-coefficient
extraction, which is the second derivation of `α = ℓ + a` and `M`.

**D10 — the budget as `≤ 1` versus `= 1`.** U2 compiled only `Σ(λ−1) + (a − |B∩D|) ≤ 1`, the `h ≥ 0`
shadow, which is satisfied by `0` and `1` alike and therefore cannot recognize family (I) (the `h = 1`
case). `C-U2-T` closed it with the exact identity. **Ruling: the `= 1` identity supersedes the `≤ 1`
form as the input to the classification; the seat met its charter (item 8(d) asks only for `≤ 1`) and
the gap is between the charter and `SEMANTIC-CONTRACT.md` §4.**

**D11 — family (I) is `A_C = ∅`, and this is the cycle's strongest result.** T proves it through
`L5″` (forced neighbour forbids a `λ = 1` support in `A_C` when `A_D` is maximum in `D`); F proves it
four times independently (`C-F1-T` (C), `C-F1-U`, `C-F2-T` Steps C–D, `C-F2-U` Corollary FI) and
verifies it needs no `hyp-eligible` (extended to the 18 ineligible residual trees and to all 1,487
residual trees of orders ≤ 14, 11,972 family-(I) members). **Six independent derivations across two
orientations.** Its consequences are large: family (I) has constant weight `ℓ−1 ≥ 1`, family (II)
constant weight `ℓ−4`, and **only family (III)'s weight `ℓ − 2|A|` ever varies or goes negative** —
which relocates the entire term-wise difficulty of the problem and refutes the r24 record's
realization claim structurally rather than by census.

**D12 — `T1`'s `L5` is false as stated, and the repair is mandatory.** `L5` asserts family (II) has
"exactly one `s ∈ A_C` with `λ(s) = 2` **and no other** `s ∈ A_C`" and bills the whole classification
as pure `ℕ` arithmetic from `L4`; supports with `λ = 1` contribute `λ−1 = 0` and are invisible to the
budget. Both T1 critics found it; the T adjudicator replayed it and found **322 arithmetic escapees**
at orders ≤ 12 (31 at ≤ 10, minimal witness at order 7, `w(B) = ℓ−4−2j` strictly below `ℓ−4`), of
which **zero are residual**. **Ruling: `L5 → L5′` (arithmetic trichotomy, from `L4`) + `L5″` (pruning,
consuming `hyp-residual` through forced neighbour). The mathematics loses nothing — T1's own DAG
already routes the singleton through `family_II_support_singleton [L8] L5, L6` — but `hyp-residual` is
load-bearing at exactly the step `L5` labels "no new hypothesis", and a Stage 7 informal audit run
against the unrepaired `L5` would be auditing a false lemma against a true declaration.**

**D13 — the census figures, reconciled not averaged (Gate ruling 4 discharged).** The F adjudicator
settled it on its own evidence: over orders 4–17, **16,424 eligible residual = 290 flat + 16,134
non-flat**, and **16,442 residual with `α ≥ 2` = 16,424 + 18 ineligible** (all of order ≤ 11). F1's
295 flat-residual drops the eligibility filter; `295 − 290 = 5` is exactly `P_3`, `K_{1,3}`, `K_{1,4}`,
`K_{1,5}` and the order-6 double star. **Ruling: the master ledger's 16,424 and the r24 C6 TD-6's
16,134 are two different populations of one instrument, not rival measurements; F1's 16,424 is the
run's figure of record per Gate ruling 4.** The eligible-residual orders 7–12 column
`4, 5, 17, 39, 80, 167 = 312` is reproduced by seven independent instruments across all three
orientations and is the contract's figure of record.

**D14 — the frozen `first_strict_descent` boundary.** F1 reported one disagreement with the literal
`crossingIndex`; both its critics replayed the unmodified script and reported its own output
`reference-evaluator mismatches: 2` — the loop `range(max(0, len(poly) − 1))` never reaches the pair
`(α, α+1)`, so it returns `None` on `K_1` **and** `K_2`. **Ruling: two disagreements, both at `α = 1`
and therefore outside `hyp-alpha`; no r23/r24/r25 result that used an `α ≥ 2` tree is affected. A note
for the controller, not a correction record, and no sealed file is edited.**

**D15 — controller errata, confirmed run-wide.** **R26-E-b** (`P_7` is NOT eligible: `α = 4`, `x = 2`,
`x + 2 = 4 > 3 = α − 1`; its numbers `(α, x, S) = (4, 2, −4)` are correct; the first eligible odd path
is `P_11`) is independently confirmed by T1, T2, all four path-scanning T critics, F1, F3, all six F
critics and the T, F and U adjudicators' own instruments. **R26-E-a** (the `bind-shared-packages`
command rejects scratch roots; the intended symlink bind is what the seats performed) is re-ruled
accepted by the U adjudicator on identical facts for U1, U2, U3 and all six U critics, with the shared
Mathlib HEAD `905b95818eb32af7874a58b427f50c1711a5e96c` equal to `mathlib_rev` in
`sources/mathlib-binding/PIN.json`. Both errata stand.

**D16 — T3's Strike-3 quotation.** The phrase "inside the Mathlib package directory you may grep for
lemma names" is attributable to no sealed control file; the controller's capsule design note
`R26-N-13` records that the seat dispatch **wrappers** for T3/U1–U3 granted that wording beyond the
sealed DISPATCH files, with no mathematical effect. **Ruling: strike the quotation marks and the
attribution to a sealed document; the act stays in grant on the worker brief's own wording; T3's
"Read-boundary disclosure: None" is not disturbed.**

---

## Exact established results

Graded per `SOLUTION-CONTRACT.md` §4, at the literal scope of `SEMANTIC-CONTRACT.md` §§1–3 and subject
to every fence of §3. Nothing below transfers status to the all-rank aggregate, `E993-BETA-AGG`, the
transport, the common-leaf condition, TREE, FOREST, TRANSFER or Erdős #993. Statements first made or
repaired at a review stage are **STATED** and need an isolated second read before registration; the
column says which.

### Tier 1 — `E993-R26-TOP-RANK-RESIDUAL-SIGN` (RC)

| | |
|---|---|
| Statement | For every finite ordinary tree `G` with `hyp-tree`, `hyp-alpha` (`2 ≤ α`), `hyp-eligible` (`x + 2 ≤ α − 1`) and `hyp-residual` `(★)`: `S(G, α−1) ≤ 0`. |
| Grade at the close of Stage 6 | **`proved_informal`** |
| Hypotheses consumed | all four; `hyp-eligible` only through `α ≥ 3` (Gate ruling 5 keeps it verbatim in the statement of record) |
| Attribution | candidate architecture: the research packet's lane 05 (`sources/literature-packet/agents/05-RC-CANDIDATE-PROOF.md`), an input under attack and never cited as evidence (Gate ruling 2). Derivation route-attributed to **T1** (`L0`–`L11`); the mandatory `L5 → L5′+L5″` repair **critic-attributed to `C-T1-F` and `C-T1-U`**; independently re-derived by `C-T1-F`, `C-T1-U`, the T adjudicator, and by this synthesis at the hinge and the finish; the family expansion (B3) is r24 critic `C-T1-U`; the occupancy bound is Andriantiana–Razanajatovo Misanantenaina–Wagner (2020), **re-proved in-run**; the flat law is r24 route A1; the forced-neighbour **statement** is the packet's, every in-run **proof** of it is derived (six times over). |
| Second read | **REQUIRED** before registration (the repaired chain is STATED) |

### Tier 1′ — `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT`

**`proved_informal`, in a form STRICTLY STRONGER than the contract's own Tier 1′ wording:
`S(G, α−1) < 0` on the ENTIRE eligible top-rank residual class, with no `ℓ = 2` exception.**
`ℓ ≥ 4`: `ℓ(ℓ−2)M ≥ 8M > 0`. `ℓ = 3`: `−S ≥ 2M > 0`. `ℓ = 2`: `hyp-eligible ⟹ α ≥ 4 ⟹ a ≥ 2`, and on
that class `G ≅ P_{2a+3}` with `S = −(a−1)(a+2) < 0`. Critic-attributed: `C-T1-F` (A-3) for the general
argument, `C-T2-U` and `C-T2-F` (A2) jointly for the even-path lemma, `C-T2-F` (A1) for the exact
`ℓ = 2` closed form, `C-T1-F` (A-2) and `C-T3-U` ((E)) jointly for `α ≥ 4`. Verified by the T
adjudicator on `P_5 … P_25` term for term and by the F adjudicator's independent `S(P_{2k+1}) =
−(k−2)(k+1)`. **All four components are STATED; isolated second reads required; do not register this
cycle.** Secondary to (RC) and never a substitute for it.

### Tier 2 — `E993-R26-C6-B3-FAMILY-I-REALIZATION-CORRECTION`

The correction record, as ruled by the F adjudicator and adopted here in full:

- *What the r24 record says* (C6 synthesis B3/TD-6; C6 T adjudication Ruling 2 and inventory item 6;
  critic `C-T1-U`): family-(I) weights `ℓ−1−2|A_S|` "flip … realized by 1,420 eligible residual trees
  of orders 7–16, first at order 9".
- *The realization statement is* **REFUTED** — completely within its own stated range by exhaustive
  replay on four independent instruments (`P_c = P_d = 0` on all 7,247 eligible residual trees of
  orders 7–16, 128,908 shell members, 0 unclassified), and **universally** by the theorem that every
  family-(I) member has `A_C = ∅` and weight `ℓ−1 ≥ 1` (six independent derivations). It is not merely
  unobserved; it is structurally impossible at every order. `REFUTED` does not regress.
- *What reproduces 1,420*: **`P_b` — the induced graph on the multiplicity-1 supports `C_1` has an
  independent set of size `> (ℓ−1)/2`** — exactly 1,420 over orders 7–16, first at order 9, on four
  independent instruments plus the controller's withheld pre-run replay. `P_a` (`|C_1| > (ℓ−1)/2`)
  gives 1,486, overcounting by 66 because some `C_1` supports are mutually tree-adjacent.
  `bounded_computation`.
- *The order-9 first occurrence*: there are exactly **two** `P_b` isomorphism classes, both `ℓ = 4`
  with two independent multiplicity-1 supports, matching the r24 prose. F2 printed one
  (`i = (1,9,28,38,24,8,1)`, shell 8, `S = −20`); `C-F2-U` supplied the other
  (`i = (1,9,28,37,22,7,1)`, shell 7, `S = −18`), which the F adjudicator found isomorphic to the
  controller's pre-run witness. **The two replays never disagreed; they printed two members of a
  two-element set. The record must name both classes.**
- *Provenance*: **gap, and wider than F2 stated.** `adj_engine.py` and `scan.py` implement no family
  classification, no `A_D`/`A_C`/`A_S`/`C_1` object and none of the four predicates; `scan_4_17.json`
  is `scan.py`'s output. The gap covers **both** inventory item 6 (the 1,420 figure) **and** inventory
  item 5 (the three-family expansion the r24 adjudication says it implemented and checked on 312
  trees). Item 5's *content* is independently true (verified by F2, `C-F2-T`, `C-F2-U` and the F
  adjudicator); only its provenance is missing.
- *Error class*: **predicate substitution on the evidence**, recorded as an **inference** about an
  instrument that does not survive, never as a certified account of the adjudicator's act. The
  substitution originates in critic `C-T1-U`'s antecedent sentence (a `P_a`-shaped structural count of
  `|C_1|` offered as evidence of realization, with no shell membership at all), which the r24
  adjudicator broadened and supplied a number for. The correction attaches to both sentences. The
  brief's alternative label "prose" is rejected: `P_b` and `P_c` are different mathematical predicates
  that provably never coincide on this class.
- *Operative consequence*: **TD-6's research prescription — "any proof must bound the multiplicity-1
  support count against `ℓ` inside the class" — is VOID.** By family-(I) emptiness, `A_C = ∅` on every
  realized family-(I) member however large `C_1` is; **no bound on `|C_1|` is needed anywhere**. A
  successor inheriting TD-6 unamended would spend a cycle on a non-problem. The sign-flip phenomenon
  is real and belongs to **family (III)**, whose weight `ℓ − 2|A|` is the only one that varies.
- *Readiness*: **NOT ready. STATED at Stage 5.** The F adjudicator changed F2's draft materially on
  five points and formally on two. **Isolated second read required before registration; no sealed r24
  file is edited, and all 79 source digests still match.**

### Tier 3 — the lemmas at their own scope

| # | Lemma | Hypotheses | Grade / attribution | Second read |
|---|---|---|---|---|
| L-1 | **Forced neighbour**: under `(★)`, every maximum independent `J ⊆ D` meets `N(s)` for every `s ∈ C_1` | `hyp-tree`, `hyp-alpha`, `(★)` | `proved_informal`; statement is the packet's (fence 7); **six independent in-run proofs** — `T1 L6`, `T2 §3`, `C-F1-T` (B), `C-F1-U` (Attack 5), `C-F2-T` (Step B), `C-F2-U` (Lemma FN) | critic proofs STATED |
| L-2 | **Budget identity** `(a−|A_D|) + Σ_{s∈A_C}(λ(s)−1) + h = 1`, every term in `ℕ`, with `h ≥ 0` a lemma; **`L5′`** (arithmetic trichotomy, a priori exhaustive, `a−1` shell empty at `a = 0`) and **`L5″`** (pruning: `A_C = ∅` in (I), `A_C = {s*}` in (II)) | identity: none new; `h ≥ 0`: independence; `L5″`: `(★)` via L-1 | `proved_informal`; identity route-attributed `T1 L4`/`T2 §3`; **a-priori exhaustiveness critic-attributed `C-F2-U` (Attack 8)**; **the `L5′`/`L5″` split critic-attributed `C-T1-F` and `C-T1-U`**; compiled as an exact `ℤ` identity by `C-U2-T` conditional on `hpartition`, `hBcard` alone | **REQUIRED** |
| L-3 | **Family (I)**: `A_C = ∅`, `w = ℓ−1`, `(v,J) ↦ (L∖{v}) ∪ J` a bijection, `|Fam I| = ℓM`, `W_I = ℓ(ℓ−1)M`; **Family (II)**: `A_C = {s*}` with `λ(s*) = 2`, `w = ℓ−4`, `|Fam II| = N_2`, `W_II = (ℓ−4)N_2` | `hyp-tree`, `hyp-alpha`, `(★)`; **not** `hyp-eligible` | `proved_informal`; six independent derivations for (I), three for (II) (`C-F1-U`, `C-F2-T` finding 4, `C-F2-U` §2) plus `T1 L7`–`L8` | critic proofs STATED |
| L-4 | **Family (III) parametrization**: `(J', A) ↦ (L ∖ {v_s : s ∈ A}) ∪ A ∪ J'` is a bijection from `{(J', A) : J' ∈ I_{a−1}(D), A ∈ I(U(J'))}` onto family (III), image weight `ℓ − 2|A|`, empty at `a = 0`; hence `W_III = Σ_{J'} Σ_{A ∈ I(U(J'))}(ℓ − 2|A|)` | `hyp-tree`, `hyp-alpha`, `(★)` | `proved_informal`, **route-attributed `T1 L9`**, attacked by `C-T1-F` and `C-T1-U` and re-derived by the T adjudicator; **named as the open node by the F adjudicator, which had no proof in its portfolio — closed run-wide here and re-derived by this synthesis**; verified computationally with 0 failures on 677 trees (F) and 312 (T) | **REQUIRED** |
| L-5 | **Deletion injection**: for any finite graph and `U : Finset V`, `2 Σ_{A ∈ I(U)}|A| ≤ |U|·|I(U)|`; corollary `Σ_{A∈I(U)}(ℓ−2|A|) ≥ (ℓ−|U|)|I(U)| ≥ 0` in `ℤ` when `|U| ≤ ℓ`; sharp form `((ℓ:ℤ) − |U|)·|I(U)| ≤ Σ(ℓ − 2|A|)` with **no hypothesis at all** | **none** — no tree, no connectivity, no `(★)` | `proved_informal` **and machine-checked sorry-free** (U2 `deletionInjectionBound`, axioms exactly `[propext, Classical.choice, Quot.sound]`); informal derivations `T3` (v) (sharpest informal statement) and `C-F1-T` (D); `C-U1-F`'s variant statement-identical by kernel `rfl`; **sharp form critic-attributed `C-U2-F`** | sharp form STATED |
| L-6 | `ℓ ≥ 2` for trees with `α ≥ 2` (and `n ≥ 3`) | `hyp-tree`, `hyp-alpha` (connectivity load-bearing) | `proved_informal` (`T3` (i)) **and compiled** (U3) | no |
| L-7 | **(iv′)** `ℓ = 2` with a `λ = 2` support forces `V = {v_1, s, v_2}`, `G ≅ P_3`, `α = 2` — **`2 ≤ α` a conclusion, not a hypothesis** | `hyp-tree` (connectivity) | `proved_informal`; hypothesis correction **critic-attributed jointly `C-T3-F` and `C-T3-U`**; independently derived in F by `C-F3-U`; **compiled** by U3 (item 9(e)) and sharpened to the eligible class by `C-U3-T` (`card_C2_eq_zero_of_eligible`) | hypothesis correction STATED |
| L-8 | **Leaf/support disjointness** at `α ≥ 2`; `λ = 0` on `L ∪ D`; and (stronger) `K_2` component ⟹ `(★)` fails for ANY finite simple graph, hence `(★) ⟹ L ∩ C = ∅` without `hyp-tree` | `hyp-tree`+`hyp-alpha`, or `(★)` alone for the stronger form | `proved_informal`; tree form `T3` (ii), **compiled twice** (`C-U3-T` `disjoint_leafSet_supportSet`, `C-U3-F` `leafSet_disjoint_supports`); the `(★)`-only form **route-attributed F3** ((b).1, (b).2) and re-derived by `C-F3-T`, `C-F3-U` and the F adjudicator | the F3 form's grade is EARNED at Stage 4 |
| L-9 | `α = ℓ + a` with `a = α(G[D])`, and the mutually inverse `S ↦ S∖L` / `J ↦ L ∪ J`, so `M = i_α(G)` counts the maximum independent subsets of `D` | **`α = ℓ + a`: `hyp-tree`, `hyp-alpha` only — `(★)`-FREE.** `M`'s characterization: additionally `(★)` | `proved_informal`, **doubly derived by mechanism** (`T1 L3`/`T3 (vi)` directly; `T2 §2.3` by the corona top coefficient, once `C-T2-U`'s no-cancellation step is inserted) and again independently in F (`C-F2-T` Step A, `C-F2-U` Preliminaries). **No Lean declaration states it anywhere in the cycle — this is the gate node.** | hypothesis split STATED (`C-T2-F` F2b) |
| L-10 | Disjoint leaf fibres, `Σ_s λ(s) = ℓ`, `|C_1| ≤ ℓ`, `j·|C_j| ≤ ℓ` for every `j`, hence `k_2 ≤ ⌊ℓ/2⌋`; and `N_2 ≤ k_2·M` | **(iii) at NO hypotheses**; `N_2 ≤ k_2 M` from `N_2`'s definition | `proved_informal`; `T3` (iii) with the hypothesis correction **critic-attributed**; **compiled twice** (`C-U3-T`, `C-U3-F`); `N_2 ≤ k_2 M` adjudicator-derived (F cross-route 2(e)) and carried as a node by T | **REQUIRED** for the hypothesis-free form and for `N_2 ≤ k_2 M` |
| L-11 | `hyp-eligible ⟹ α ≥ 3` (hypothesis-free) and `⟹ α ≥ 4` (given `2 ≤ |V|`) | none / `2 ≤ |V|` | `proved_informal`, critic-attributed (`C-T3-F`; `C-T1-F` A-2 and `C-T3-U` (E) jointly); **`α ≥ 3` compiled** (U1 `alpha_ge_three_of_eligible`, U3 item (f)) | `α ≥ 4` STATED |
| L-12 | `C(G)`'s two contract characterisations (`{s_v : v ∈ L}` and `{s : λ(s) > 0}`) are equal | none | `proved_informal`, critic-attributed `C-T3-U` (F3); **compiled twice** (`C-U1-T` `supportSet_eq_image_support`, `C-U1-F` `supportSet_eq_image`) | STATED |

### Further exact results, outside the contract's Tier list

| # | Result | Grade / attribution |
|---|---|---|
| X-1 | **The exact remainder identity** `−S = ℓ(ℓ−2)M + (ℓ−4)N_2 + W_III` | `proved_informal`; route-attributed `T2 §3` and independently **critic-attributed `C-T1-F` (A-1)**; verified as an exact integer identity with 0 failures by five instruments (T adjudicator on 330 residual trees, F adjudicator on 677, U adjudicator on 677, `C-F1-T` and `C-F1-U` on all 16,424 to order 17). This is the step that converts the inequality into an equality and names the slack. |
| X-2 | **Every even path `P_{2k}`, `k ≥ 2`, fails `(★)`** (witness `{v_2,…,v_{2k}}`, size `k = α`, omitting the leaf `v_1`); hence `ℓ = 2` + `(★)` ⟹ odd path | `proved_informal`, critic-attributed jointly `C-T2-U` (proof of record) and `C-T2-F` (A2). This is what kills `T2` §6's `a = 1 ⟹ m = 1` step, where `P_6` gives closed-form `S = 0` against a literal `S = +2`. STATED. |
| X-3 | On the `ℓ = 2` residual class with both supports of leaf-degree 1: `G ≅ P_{2a+3}`, `M = 1`, `N_2 = 0`, `W_III = (a−1)(a+2)`, hence **`S = −(a−1)(a+2)`**; equivalently `S(P_{2k+1}) = −(k−2)(k+1)` | `proved_informal`, critic-attributed `C-T2-F` (A1), independently `C-F1-T` and `C-F1-U` in the path form; verified on `P_5 … P_25` and on `P_3 … P_17`. STATED. |
| X-4 | **`S = 0 ⟺ G ≅ P_5`** on the residual class with `α ≥ 2`; and **`P_3` is the unique residual tree with `α = 2`, hence the unique residual `S > 0`** | `proved_informal` once X-2 is inserted (route-attributed `T2 §6`, `conditional` as written); the `P_3` uniqueness critic-attributed `C-T1-F` (A-4) — trees are bipartite so `α ≥ n/2`, `α = 2 ⟹ n ≤ 4`, and `P_4` fails `(★)`. Ownership of the `P_3` item overlaps F3's charter. STATED. |
| X-5 | **A maximum independent set contains no support, from `(★)` alone** — no `hyp-tree`, no `hyp-alpha`, no `hyp-eligible` | **Compiled sorry-free** by the U adjudicator (`R26AdjU.maxIndep_leafDegree_eq_zero`, axioms `[propext, Classical.choice, Quot.sound]`), **adjudicator-derived and STATED**. It sizes the gate node correctly: the first `(★)`-consuming step of L-9 is twelve lines of Lean. |
| X-6 | `(RI)` holds on residual trees and on residual **forests**, and fails on every non-residual tree tested — i.e. on the tested bounds **(RI) is equivalent to `(★)` on trees and survives the loss of `hyp-tree`** | `bounded_computation`, critic-attributed jointly `C-F3-T` and `C-F3-U` (312/677 residual eligible, 18 residual ineligible, 655/1,591 non-residual, 545 residual forests, 1,416 non-residual forests). **No status transfers to `C5LA1.topRankResidualIdentity`, whose hypotheses are what they are; a forest version would need its own statement, contract and alias check.** A candidate theorem, not a theorem. |

### Bounded computations (corroboration only; `SOLUTION-CONTRACT.md` §3.3 — none carries proof weight)

Exhaustive census of 81,137 tree isomorphism classes to order 17; **16,424 eligible residual trees**
(orders 7–12: 4, 5, 17, 39, 80, 167 = 312; orders 7–15: 3,244; orders 4–17: 16,424 = 290 flat +
16,134 non-flat) with the entire structural battery at **zero failures** — (RI), forced neighbour, the
budget identity in `ℕ`, family exhaustiveness (0 unclassified in 128,908 shell members),
`|Fam I| = ℓM`, family-(I) `A_C = ∅`, family-(II) singleton and `|Fam II| = N_2`, `N_2 ≤ k_2 M`,
`k_2 ≤ ⌊ℓ/2⌋`, `|C_1| ≤ ℓ`, the fibre inequality at the correct index set, the exact identity, the
bound, and **the sign `S ≤ 0`**. Max `M = 9` at order 17. `P_3` is the unique residual `S > 0` and
`P_5` the unique residual `S = 0`; the maximum eligible `S` is `−12` at orders ≤ 12. Exactly four
trees with `α ≥ 2` and `S > 0` exist at orders ≤ 14 (`P_3`, `P_4`, `P_6`, and an order-6 tree with
`S = +1`), none beyond order 6, and all but `P_3` fail `(★)`. 33 in-scope adversarial witnesses to
order 54; the critic-derived `comb_pairs` family to order 53 with `M = 2^k` (at order 43: `M = 256`,
`S = −102,016`, `N_2 = 704`, `W_III = 18,432`, the exact identity closing to the digit on two
instruments); 64,569 eligible non-residual trees with 0 positives; 2,246 residual forests to order 14
with 0 positives. **Reproduced across five to seven independent instruments.** Per fence 3 none of this
certifies anything universal, and — on the T adjudicator's ruling, which I adopt run-wide — **the
312-tree census must not count toward the `proved_informal` grade of (RC)**; that grade rests on the
derivation plus independent re-derivation alone.

### Statuses unchanged by construction (no status transfer — fence 1)

| Object | Status after Cycle 1 |
|---|---|
| `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (all-rank literal aggregate) | **OPEN, unchanged.** (RC) is the `p = α−1` instance restricted to the eligible residual class; every other rank and the whole non-residual class are untouched. The word "sub-case" is struck from `T3` §4 precisely because it licenses the transfer this fence forbids. |
| `E993-BETA-AGG` | **OPEN, unchanged.** It needs the ordinary-to-RTree transport, never attempted this cycle. |
| the ordinary-to-RTree transport | **Not attempted, unchanged.** No `RTree` object appears in any of the nine returns, eighteen critiques or three adjudications. |
| the common-leaf condition | **Unchanged.** |
| TREE | **Unchanged.** |
| FOREST | **Unchanged.** The forest results (X-6, the `P_3 ⊔ m·K_1` closed form, `K_2` ⟹ `¬(★)`) are informational and carry no status to FOREST. |
| Erdős #993 | **Unchanged.** |
| `E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` | **REFUTED, and not reopened.** `crossingIndex`/`first_strict_descent` is used only as the definition of `x`, never as a maximizer claim. |

All three adjudicators checked fence 1 independently across all twenty-seven artifacts and all three
found it clean; I confirm from the adjudications' own text and from the frozen registry sweep.

---

## Refuted or narrowed mechanisms

**Refuted.**

1. **The r24 C6 B3/TD-6 realization statement** ("family-(I) weight `ℓ−1−2|A_S|` flips … realized by
   1,420 eligible residual trees of orders 7–16, first at order 9") — **REFUTED** as a claim about
   membership of `I_{α−1}(G)`: completely within its own stated range by exhaustive replay on four
   instruments, and **universally** by family-(I) emptiness. The recovery of the number 1,420 by a
   different, well-defined, true predicate (`P_b`) does not restore the false one. **B3's identity is
   NOT refuted; TD-6's obligation is NOT discharged — it is narrowed to family (III).**
2. **TD-6's research prescription** to bound `|C_1|` against `ℓ` inside the class — **VOID**.
3. **`N_2 ≤ M` unscoped** — **FALSE** on both the residual class (53 failures of 695 to order 13) and
   the eligible residual class (118 of 1,469 to order 14, first at order 9). Only `N_2 ≤ k_2·M`
   survives, and the `ℓ = 3` use is safe only through `k_2 ≤ 1`.
4. **`T1`'s `L5` as written** — 322 arithmetic escapees at orders ≤ 12, none residual. Replaced by
   `L5′` + `L5″`. The shipped DAG node `family_classification [L5] pure arithmetic from L4` is struck
   and replaced by `budget_shapes` (arithmetic) and `family_support_pruned` (consumes `hyp-residual`).
5. **`T2` §6's `a = 1 ⟹ m = 1` step** — `⌈m/2⌉ = 1` admits `m = 2`; the omitted `P_6` evaluates to
   `S_closed = 0` on §6's own algebra while the literal `S = +2`. Repaired by X-2.
6. **`comb_of_spiders`** — retired with a reason, not as an unexplained negative: each `λ = 1` support
   has exactly one interior neighbour (its own hub), so forced neighbour requires every maximum
   independent `J ⊆ D` to contain every hub; the hubs form a path, so `(★)` fails necessarily at every
   size for `k ≥ 2`. The general obstruction is now named.
7. **`connected_induce_compl_pair` as a DAG step** — off-framework. `G.induce ↥Sᶜ` is a different
   vertex type, which `SEMANTIC-CONTRACT.md` §1 forbids for this run's counting layer. Retained as a
   spare part; a successor must not bill it as progress toward a "tree minus its leaves" induction.
8. **"full `IsTree` on the two-leaf-deleted subgraph"** — `IsTree` extends `Connected` =
   `Preconnected` + `Nonempty`, and for `K_2` the complement of the two degree-one vertices is empty.
   The corrected form is compiled (`C-U3-F` `isTree_induce_compl_pair`).
9. **U1's compiled `signBound` as item 1(f)** — rejected (D8). **The DAG's terminal edge
   `node-alpha-ge-three → node-sign-bound`** — rejected; the node the assembly consumes is `ℓ ≥ 2`, and
   that node does not exist in the draft.
10. **The budget `≤ 1` form as an input to the family classification** — rejected; it is satisfied by
    `0` and `1` alike and cannot recognize family (I).
11. **`hL1` as a premise of `familyOneInjection`** — rejected (inert; two independent compiled proofs
    without it). The real arithmetic obligation, `a + (ℓ−1) = α − 1`, lives at the call site.
12. **`(★)` as the carrier of `hNoEdge`** — rejected; it follows from the definitions of `L`, `C`, `D`.

**Narrowed or struck, content retained** (the full lists are in the three adjudications; these are the
items a Stage 7 or Cycle 2 seat must not inherit):

- `T1`: `L0`'s billing as *the* `ℕ`-subtraction audit (`ℓ−2`, `ℓ−4`, `α−1` absent); "Debt: none of
  `L0`–`L11` has an unclosed step" → "after the `L5` repair"; §4's claim that `SEMANTIC-CONTRACT.md`
  asserts `P_7` eligible (that file has no `P_7` and no fixed-point table — the mislabel is in
  `control/C1-ALLOCATION.md` item 2 and the worker brief); §4's leg (iii) citing the packet's
  order-≤12 check as evidence (struck under Gate ruling 2); the obligation-(3) prediction about F2's
  error class; the incomplete import list; the report digest that is true of the run but not
  recomputable from the shipped artifact (integer keys through a JSON round trip — string-key it).
- `T2`: the displayed `h = (a−|A_D|) + Σ(λ−1)` (with the budget identity it gives `2h = 1`); §2.2's
  "(`hyp-tree` only)"; §2.3's circular `(★)` justification and its `(★)` tag over `α = ℓ + a`;
  "`proved_conditional`" (not a §4 grade); §5's "the unique odd `n`"; "symbol by symbol" agreement with
  `T1` (D9); "timings … discarded" (`t2_driver.stderr.log` persists, uninventoried).
- `T3`: "cross-checked against `SEMANTIC-CONTRACT.md`'s stated values"; "producing byte-identical
  output" at both locations (633 B parseable vs 638 B with an appended `RC 0` that fails to parse —
  struck on the T adjudicator's own replay); the lemma-(v) coverage sentence (three named subsets per
  class, not every subset); "sub-case"; "Used by T1's DAG verbatim"; the Strike-3 quotation (D16).
- `F1`: the vacuous fibre row (D2); "one disagreement, exactly `K_1`" (two); "(7,247+ witnesses)"
  (restate with the exact population: 7,247 = eligible residual orders 7–16; 7,265 = residual with
  `α ≥ 2` to order 16; 32,364 = eligible to order 16); "CONFIRMED, not merely un-falsified" (a census
  cannot confirm a universal — moot, the statement is a theorem); "every count above is reproduced by
  one consolidated script"; "295 flat-residual" (290 are eligible).
- `F2`: "coincidental key-order/format match" (engineered — `f2_run.py` reproduces `scan.py`'s
  non-default `indent=1` and key order after reading it; restate as **numeric** agreement); the two
  pointers to an unshipped interactive session log (both claims true on critic evidence); the clause
  leaning on T3's *obligation* rather than a derivation; the `f2_run.py` import list.
- `F3`: "or in the seven targeted adversarial constructions" (eight named; three never evaluated; and
  `K_2 ⊔ P_3` has `S = +2` — **not a counterexample and not offered as one**, it satisfies `hyp-alpha`
  alone); "minimal hypothesis set" (the hypotheses are droppable without a positive only **one at a
  time**); the claimed independent second verification of the evaluator digest inside `verify_seal.py`
  (no such check exists in the script); "`(RI)` no longer holds (not tested — never invoked)" —
  replaced by X-6; part (a)'s "argument from the bound" is **undelivered**, and as quoted omits
  `ℓ = 3`.
- `U1`: the sorry-ledger row, DAG node text and doc-comment certifying item 1(f) for `signBound`;
  "`expected_statement` … the exact statement of §2" (true of the contract text, false of the shipped
  declaration, which uses fully-qualified `C5LA1.` names); `lean_binding.source_relpath` and
  `def-top-rank`'s `lean_name: "Nat.sub"` as schema defects; "two further DAG nodes" (three named);
  the `compiled`/`missing_bridge` labels presented as §4 grades; "no other VerityOS path was read".
- `U2`: "matching item 8 (a)–(d) exactly in content" (true for (a), (b), (d); false for (c), delivered
  in its cardinality-consequence form only); "digests of every Lean file" (omits `AxiomsCheck.lean`);
  the warning count (four, not two); "evidentiary strength equal to what a `formally_verified` award
  would certify" → **kernel-equivalent, not award-equivalent** — the governed award adds the fidelity
  review, and it is exactly that layer where U2's two substantive gaps surface.
- `U3`: "maximally general" for lemma (c) (the sharp form is compiled twice); "four auxiliary lemmas"
  (five; twelve declarations in all); "several use only a strict subset" of the permitted axioms
  (exactly one does); the §3.5-for-§3.2 citation; "no other VerityOS file was read".

**Fence audit, run-wide.** Fence 1: no status transfer anywhere, checked independently by three
adjudicators. Fence 2: `P_3` and `P_5` are excluded by `hyp-eligible`, never by `(★)`, and
`hyp-eligible` is never dropped from any statement of record; the two routes that consume it only
through `α ≥ 3` say so. Fence 3: with the narrowings above, no sentence lets a census carry proof
weight, and no larger census is a deliverable of this run. Fence 4: **no counterexample is proposed
anywhere**; every positive-`S` object in the cycle fails at least two of the four hypotheses and
carries its fence on its face; no positive summand inside a nonpositive `S` is offered as one. Fence
5: all 79 source digests match; no sealed r24 file was edited. Fence 6: no refuted mechanism reopened.
Fence 7: attribution travels correctly in the adjudications, and the **one gap** — the ARMW-2020 line
on the occupancy bound — is a registration precondition named by all three orientations.

---

## Headline verdicts

```text
headline_resolved: no
```

The run's headline is (RC) **formally verified** at the `SOLUTION-CONTRACT.md` §2 statement under the
governed workflow. A governed formal award does not exist before Stage 7; all nine returns, all
eighteen critiques and all three adjudications declare the flag negative, and so does this synthesis.

**Verdicts by target.**

| Target | Verdict at the close of Stage 6 |
|---|---|
| **Tier 1 — (RC)** `E993-R26-TOP-RANK-RESIDUAL-SIGN` | **`proved_informal`** with a closed statement-level dependency DAG, at the exact scope of the four C5-LA1 hypotheses. **Registry status remains OPEN** — a grade is not a closure, and registration awaits an isolated second read of the repaired chain or the Stage 7 formal award. |
| **Tier 1′ — strict** `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT` | **`proved_informal`**, in the strictly stronger form `S < 0` on the entire eligible class with no `ℓ = 2` exception. All components critic-derived and STATED; **not registrable this cycle**. |
| **Tier 2 — the B3 correction record** | The realization claim is **REFUTED** (universally); `P_b = 1,420` first at order 9 with **two** order-9 classes is `bounded_computation`; the provenance gap covers r24 C6 T-adjudication inventory items **5 and 6**; TD-6's `|C_1|` prescription is **void**. The record is **STATED at Stage 5** and **NOT ready for registration** — isolated second read required. |
| **Tier 3 — L-1 … L-12** | All twelve `proved_informal` at the scopes tabulated above; L-5, L-6, L-7, L-8 (tree form), L-10, L-11 (`α ≥ 3`) and L-12 additionally **machine-checked sorry-free in ungoverned scratch projects** with axioms exactly `[propext, Classical.choice, Quot.sound]`; **L-9 has no Lean statement anywhere and is the gate node**; L-4 is the node F named open and T closed. |
| `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | **OPEN, unchanged by construction.** |
| `E993-BETA-AGG` | **OPEN, unchanged by construction.** |
| the ordinary-to-RTree transport | **Not attempted, unchanged by construction.** |
| TREE | **Unchanged by construction.** |
| FOREST | **Unchanged by construction.** |
| Erdős #993 | **Unchanged by construction.** |

**Formal status, stated separately and with no transfer in either direction.** Nothing in this cycle
is `formally_verified`. The only kernel-verified object in play is the inherited r24 award
`C5LA1.topRankResidualIdentity` (RI), whose receipts `C-T1-U` audited inside the authorized `sources/`
grant (`axiom_policy passed`, `incomplete_proof_scan passed`,
`source_sha256_before = after = 0933211d…696b63b`, axioms exactly `[propext, Classical.choice,
Quot.sound]`) and whose statement the T adjudicator confirmed matches term for term with all four
hypotheses verbatim. Every seat-compiled fragment is `proved_informal` per `C1-STAGE1-GATE.md` Ruling
7 — machine-checked in an ungoverned scratch project is **kernel-equivalent, not award-equivalent**.

---

## Lean awards

**Ruling on the closed-DAG test.** The mathematics of (RC) is `proved_informal` with a **closed**
statement-level dependency DAG (Reconciliation D1 and the finish re-derived there). **Every remaining
open node is a Lean-engineering node whose mathematics is proved**, and I name them: `node-alpha-eq-
ell-plus-a` (L-9, proved four times informally, stated in Lean nowhere); `node-forced-neighbour` (L-1,
proved six times, typed with `sorry` in U1); `node-family-classification` (L-2/`L5′`+`L5″`, proved,
compiled only as the conditional `ℤ` identity by `C-U2-T`, never typed as the trichotomy);
`node-family-I/II-weights` (L-3, proved, never typed); `node-family-III-bijection` and the `W_III`
sum (L-4, proved, never typed); `node-sign-bound` and the three finish branches (proved, typed
**wrongly** in U1); and the single Lean definition site for `supportSet`, `interior`, `aVal`, `C₁`,
`C₂`, `N₂`, `U`, `w`, which does not exist sorry-free anywhere. **None of these is a mathematical
research problem; each is a formalization obligation of known size, and the U adjudicator's own
twelve-line probe (X-5) sizes the heaviest gate.** Therefore Stage 7 is funded, and it is funded as
the award attempt `SOLUTION-CONTRACT.md` §5(c) and the charter's objective describe.

### C1-LA1 — the (RC) award (the run's objective)

**Exact statement** (`SOLUTION-CONTRACT.md` §2, unnarrowed; the synthesis does not narrow it):

```lean
theorem topRankResidualSign (G : SimpleGraph V) [DecidableRel G.Adj] (hTree : G.IsTree)
    (hAlpha : 2 ≤ G.indepNum) (hEligible : crossingIndex G + 2 ≤ G.indepNum - 1)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S) :
    aggregate G (G.indepNum - 1) ≤ 0
```

in the run's own namespace (`R26LA1`), with `crossingIndex` and `aggregate` the C5-LA1 definitions,
composed with the verified (RI) in the SAME project and definitions.

**Hypotheses.** All four verbatim. `hEligible` is retained in the statement of record per
`C1-STAGE1-GATE.md` Ruling 5 **even though the proof consumes it only through `α ≥ 3`**; the proof
must say so at the step that uses it. No hypothesis may be dropped, weakened or reordered.

**Fences on the face of the award.** §3.1 — no status transfer to the all-rank aggregate,
`E993-BETA-AGG`, the transport, the common-leaf condition, TREE, FOREST, TRANSFER or Erdős #993.
§3.2 — `P_3` and `P_5` are excluded by `hyp-eligible`, not by `(★)`. §3.3 — no census carries any
weight in the award; the 16,424-tree census, the order-54 adversarial families and the order-53
`M = 2^k` witnesses are corroboration only. §3.4 — no counterexample exists or is proposed. §3.5 —
no sealed r24 file is edited. §3.6 — no refuted mechanism is reopened. §3.7 — attribution travels:
packet lane 05 for the candidate architecture; r24 critic `C-T1-U` for the family expansion (B3); r24
route A1 for the flat law; the packet for the forced-neighbour **statement**; **Andriantiana–
Razanajatovo Misanantenaina–Wagner (2020) for the occupancy bound, re-proved in-run and never
imported**; the r26 seats and critics for their derivations, named per node.

**Axiom and method policy** (from `SOLUTION-CONTRACT.md` §2, restated because it is award-defining):
permitted axioms exactly `propext`, `Classical.choice`, `Quot.sound`; no `sorry`, `admit`,
`native_decide`, `axiom`, and no `decide` over an enumeration standing in for a universal step. The
proof must go through structural bijections and integer counting lemmas on the actual definitions; an
abstract inequality whose hypotheses encode the conclusion is not an award.

**Excluded conclusions** (an award that states any of these is not this award): the strict form
`S < 0`; the equality characterization `S = 0 ⟺ P_5`; any statement at a rank other than `α−1`; any
statement on the non-residual class; any forest statement; any `RTree` statement; any restatement of
(RI); any fixed-band, bounded or censused result; `N_2 ≤ M`; and the all-rank aggregate.

**The DAG the formalizer compiles, in order** (nodes named, hypotheses named, all on the contract
carrier `indepSetsAvoiding G Wᶜ` and never on `SimpleGraph.induce`):

```
DEFINITION LAYER (sorry-free, in one module, before anything else)
  R26LA1.supportSet, interior, aVal, C₁, C₂, N₂, U, w
  (λ = C5LA1.leafDegree, L = C5LA1.leafSet, support, indepSetsAvoiding, indepSetCount,
   forwardDifferenceDel, crossingIndex, aggregate, H, R reused from C5-LA1 by name)

STRUCTURE
  leaf_support_disjoint             L-8    hyp-tree, hyp-alpha        [connectivity]
  leaf_degree_sum_eq_card           L-10   NO HYPOTHESES
  c_eq_support_image                L-12   none
  leaf_card_ge_two                  L-6    hyp-tree, hyp-alpha        [connectivity]
  k2_le_ell_div_two                 L-10   none
  eligible_imp_alpha_ge_three       L-11   none
  maxIndep_no_support               X-5    (★) alone
  alpha_eq_ell_add_a                L-9    hyp-tree, hyp-alpha        (★)-FREE     ** GATE **
  max_indep_eq_leaf_union_D         L-9    + hyp-residual
  M_eq_card_maxIndep_D              L-9    + hyp-residual
  forced_neighbour                  L-1    hyp-tree, hyp-alpha, hyp-residual

COUNTING
  h_nonneg                          L-2    independence of B          ** own node **
  budget_identity (= 1, not ≤ 1)    L-2    pure Finset.card once h_nonneg is split out
  budget_shapes (= L5′)             L-2    arithmetic only; a−1 shell EMPTY at a = 0
  family_support_pruned (= L5″)     L-2    forced_neighbour ⟹ hyp-residual
  family_I_weight                   L-3    W_I = ℓ(ℓ−1)M
  family_II_weight                  L-3    W_II = (ℓ−4)N₂
  family_III_bijection              L-4    outer index I_{a−1}(D), NEVER the maximum shell
  deletion_injection                L-5    none
  fibre_nonneg                      L-5    deletion_injection, |U(J')| ≤ |C₁| ≤ ℓ
  N2_le_k2_mul_M                    L-10   k2_le_ell_div_two          ** NOT N₂ ≤ M **

FINISH (three separate named nodes, not one)
  ell_two_lambda_two_imp_alpha_two  L-7    hyp-tree, ℓ=2, ∃s λ(s)=2   [connectivity; no hyp-alpha]
  finish_ell_ge_four / ell_three / ell_two
  R26LA1.topRankResidualSign        TARGET finish ∘ C5LA1.topRankResidualIdentity
```

**Repairs the adjudications require, binding on the Stage 7 brief.**

1. `L5 → L5′ + L5″`. The informal-audit input must carry the repaired trichotomy; auditing the
   unrepaired `L5` would audit a false lemma against a true declaration.
2. `W_III`'s outer index is `I_{a−1}(D)`. A statement at the maximum shell is vacuous.
3. `N_2 ≤ k_2·M` with `k_2 ≤ ⌊ℓ/2⌋`, never `N_2 ≤ M`. The allocation's item 1(f) parenthesis and U's
   proposed `C2-U-03` target are corrected here.
4. Contract carrier discipline: every counting node states over `indepSetsAvoiding G Wᶜ`. `T1`'s
   `T[D]`, `T[U(J')]`, `α(T[D])`, `i_a(T[D])` and `I(T[U(J')])` translate as
   `I_k(T[D]) = indepSetsAvoiding G Dᶜ k` and `I(T[U(J')]) = ⋃_k indepSetsAvoiding G (U(J'))ᶜ k`.
   Three of T1's nodes are stated off-contract and `deletion_injection` is stated in a shape that
   cannot be applied at `U(J')` without a transport the carrier discipline exists to avoid.
5. Hypothesis map: `α = ℓ + a` is `(★)`-free; `M`'s characterization needs `(★)`; `hDL`/`hNoEdge` are
   definitional, not `(★)`-carried; the corona factorization needs `hyp-alpha`; L-10's (iii) needs no
   hypotheses; L-7 needs no `hyp-alpha`.
6. `node-sign-bound` is item 1(f)'s bound in `ℤ` with `ℓ ≥ 4`, `ℓ = 3`, `ℓ = 2` as three named nodes.
   Remove the edge `node-alpha-ge-three → node-sign-bound`; add `ℓ ≥ 2`, L-7 and L-8.
7. `expected_statement` in the theorem contract must be the **exact text of the shipped declaration**
   (fully-qualified `C5LA1.` names if the declaration uses them), with its digest recomputed; add
   `N₂`, `U(J')`, `C₁`, `W_I/W_II/W_III` to `definitions:`.
8. The `ℕ`-subtraction audit must cover `α−1`, `ℓ−2` and `ℓ−4` as well as `α−ℓ`, `a−|A_D|`, `λ(s)−1`
   and `ℓ−Q(A_C)−|B∩L|`; every inequality crossing zero is stated in `ℤ` with explicit casts; the
   `a−1` shell is **proved** empty at `a = 0` by the budget-term case, not declared empty by
   truncation.
9. The `ℓ = 2` closure uses the adjacency-closure argument with connectivity consumed explicitly, or
   `C-U3-T`'s compiled `card_C2_eq_zero_of_eligible`; not T3's nested `induce`.
10. Drop `hL1` from `familyOneInjection`; the real obligation `a + (ℓ−1) = α − 1` lives at the call
    site.
11. Every fence-7 attribution on the face of the claim, **including the ARMW-2020 line**, which no
    shipped artifact carries.

**Byte-identical carry list** (the formalizer may carry these files unchanged into the governed Stage 7
project; **byte-identical transport only — no editing, no reformatting, no renaming of declarations;
a file may be placed at a different module path since that does not change its bytes**):

| # | Source (run-root-relative) | SHA-256 | Carry |
|---|---|---|---|
| 1 | `sources/r24/c5-la1/LeanProject/LeanProof/Main.lean` (32,876 B) — the frozen (RI) award source, identical to `LeanProof/C5LA1.lean` in all three scratch projects | `0933211d8f02acd867e91547d4a2b09d13fcc3ea178e192e385acc33b696b63b` | **MANDATORY**, as module `LeanProof/C5LA1.lean` |
| 2 | `sources/r24/c5-la1/LeanProject/lakefile.toml` (237 B) | `45d0ca58145784d5f29322ff21a1335e350c38e72afe8d5396d9c9910b94ff49` | **MANDATORY** seed |
| 3 | `sources/r24/c5-la1/LeanProject/lake-manifest.json` (3,559 B) | `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c` | **MANDATORY** seed |
| 4 | `sources/r24/c5-la1/LeanProject/lean-toolchain` (25 B) | `2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273` | **MANDATORY** seed |
| 5 | U2 `scratchpad/c1-U2/LeanProject/LeanProof/Main.lean` — 7 declarations, **sorry-free**, axioms `[propext, Classical.choice, Quot.sound]`, rebuilt by the U adjudicator | `c382707596674822e0b78135414cdd3320e0bc56f9f558fee78e438794b1043b` | **CARRY** (counting core) |
| 6 | U3 `scratchpad/c1-U3/LeanProject/LeanProof/Main.lean` — 12 declarations, **sorry-free**, twelve `#print axioms` lines reproduced character-for-character by the U adjudicator | `fb54fa05563238ba77167cefd1d30fd85baa0135a36d24518284e2380b6fa332` | **CARRY** (tree structure) |
| 7 | U2 `…/LeanProof/AxiomsCheck.lean` (328 B) — `#print axioms`/`#check` driver | `07e441455fdef6d6c581f7a9dc21dd4d3c29ae21bdb0adeb61865bb69ff51d4d` | optional |
| 8 | `C-U1-T` fragment `CriticU1T.lean` — `sign_of_signBound`, `supportSet_eq_image_support` | `9a632414…f12bcb0f75` (recorded truncated in the sealed U adjudication) | CARRY after full-digest verification |
| 9 | `C-U1-F` fragment `CriticF.lean` — `deletionInjection_proved` (statement-identical to U1's by kernel `rfl`), `aggregate_nonpos_of_signBound`, `supportSet_eq_image` | `d7e367ca…d4c566316a320fd9f` | CARRY after full-digest verification |
| 10 | `C-U2-T` fragment `CriticT.lean` — `budgetIdentity`, `slack_nonneg`, `budgetExact`, `familyOneInjection'`, `famOneInjOn`, `famOneImageCard`, `famOneImageSubset` | `5fafeb14…a605a9c7428043600e` | **CARRY** after full-digest verification — this is the exact `= 1` budget |
| 11 | `C-U2-F` fragment `CritF.lean` — `fibreInequalitySharp`, `familyOneInjectionNoL1`, `familyOneWeightPointwise`, `familyOneWeightSum` | `4ce9a7a5…6bede86c0db73712edfb4` | **CARRY** after full-digest verification — the sharp fibre bound |
| 12 | `C-U3-T` fragment `CriticU3T.lean` — `leafDegree_eq_zero_of_not_mem_supportSet`, `card_C2_eq_zero_of_eligible`, `disjoint_leafSet_supportSet`, `two_mul_card_C2_le_card_leafSet` | `1dba1d5b…d0a928125a24074a993` | **CARRY** after full-digest verification — the `ℓ = 2` finish |
| 13 | `C-U3-F` fragment `CriticF.lean` — `isTree_induce_compl_pair`, `interior_leafDegree_eq_zero'`, `leafSet_disjoint_supports`, `two_mul_card_C2_le` | `1963b75b…68664723e2e582b52a` | CARRY after full-digest verification |

**Not carried, and why.** U1's `LeanProject/LeanProof/Main.lean`
(`c8f29ef012bef4f7c3aa11f8d88eb15ac162babf58a6a3be901387dad609eb84`) carries **five `sorry`s** — four
after `C-U1-F`'s proof of `deletionInjection` — and a **wrongly stated** `signBound`; carrying it
byte-identically would import `sorryAx` into the award project and a mis-stated node into the
contract. Its four sorry-free declarations (`mem_supportSet_iff`, `support_mem_supportSet`,
`sum_leafDegree_eq_card_leafSet`, `alpha_ge_three_of_eligible`) are re-derived in the award project,
not transported. U1's `LeanProof.lean` root (`2bd5c1ec…2cf3a`) and U3's root
(`f4dfdef8320a735eab53d24f4b47d3b60bcb474ffd2c84c77f24ae2fc75fcf31`, which is byte-identical to the
frozen 22-byte seed) are superseded by the award project's own root. The U adjudicator's probe X-5
(`AdjProbe.lean`) is **adjudicator-derived and STATED**; the formalizer re-proves it (twelve lines)
rather than carrying it, so no adjudicator statement enters the award unread.

**Carry discipline.** Three incompatible spellings of `supportSet` exist across the corpus
(`R26LA1.supportSet` as a filter in U1, `R26CritT.suppSet`, `R26CritU3T.supportSet` as an image), and
both U1 critics proved the filter and image forms equal. If two carried modules collide on a name,
**the formalizer does not edit the carried bytes**: it re-derives the colliding declaration in the
award module and records the collision as a carry finding. Before the first build, every carried
fragment's **full** SHA-256 is recomputed and recorded; items 8–13 are recorded truncated in the
sealed adjudication and must not be carried on a prefix match alone.

**Readiness ruling for C1-LA1.** `no award attempted` does **not** apply: the informal DAG is closed,
the smallest unproved lemma does not exist in the mathematics, and every open node is a Lean-
engineering node whose mathematics is proved (named above). **Stage 7 is funded as a bounded
formalization attempt at the §2 statement.** The binding obligation, named identically by T1, both T1
critics and the T adjudicator, and confirmed from the formal side by the U adjudicator, is the pair
`family_III_bijection` + `fibre_nonneg` restated on the contract carrier, atop the definition layer
and the gate node `alpha_eq_ell_add_a`. **The formalizer is instructed to compile in the order above
and to report at the gate node**, because everything conditional in the compiled corpus (U-D, U-E)
becomes unconditional the moment it closes.

### C1-LA2 — the deletion injection and the sharp fibre inequality

Named by all three orientations independently (T `AG-T2`, F Group `F-B`, U `U-A`/`U-B`), with the same
statement and the same single precondition.

**Exact statements.**

```lean
def indepPowerset (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) : Finset (Finset V) :=
  U.powerset.filter fun A => G.IsIndepSet (A : Set V)

theorem deletionInjectionBound (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) :
    2 * ∑ A ∈ indepPowerset G U, A.card ≤ U.card * (indepPowerset G U).card

theorem fibreInequalitySharp (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) (ℓ : ℕ) :
    ((ℓ : ℤ) - U.card) * (indepPowerset G U).card ≤ ∑ A ∈ indepPowerset G U, ((ℓ : ℤ) - 2 * A.card)
```

**Hypotheses:** none beyond finiteness — no tree, no connectivity, no `hyp-alpha`, no `hyp-eligible`,
no `(★)`. **Attribution on its face:** Andriantiana–Razanajatovo Misanantenaina–Wagner (2020),
**re-proved in-run** by the `A ↦ A.erase u` injection and never imported (fence 7); the compiled form
route-attributed to U2, the sharp form critic-attributed to `C-U2-F`, informal derivations `T3` (v)
and `C-F1-T` (D), statement identity with `C-U1-F`'s variant verified in the kernel by `rfl`.
**Excluded conclusions:** nothing about `S`, about trees, or about (RC); its *use* at `U(J')` belongs
to C1-LA1, not here. **Readiness: compiled sorry-free today with the permitted axioms and rebuilt
independently by the U adjudicator; the governed workflow has only to run over it.** Registration is
blocked on the attribution line alone. The F adjudicator's caveat is adopted: its informal derivation
is single-sourced within F, so the Stage 7 informal auditor gives it a second reader's eye.

### C1-LA3 — the tree-structural core

**Content.** U3's twelve sorry-free declarations covering `C1-ALLOCATION.md` item 9 (a)–(f), plus the
critic-compiled extensions `L ∩ C = ∅`, `λ ≡ 0` on `L`, `j·|C_j| ≤ ℓ` hence `k_2 ≤ ⌊ℓ/2⌋`, and
`card_C2_eq_zero_of_eligible`. **Reconciliation with T3, which the U adjudicator could not perform
from inside its capsule and routed to me: T3's six informal lemmas and U3's twelve compiled
declarations are the same facts; the award carries ONE derivation of each — the compiled one — with
T3's informal proofs and Mathlib anchors (verified by both T3 critics at file and line against the
pinned v4.32.2 project) as the informal-audit input.** **Repairs, binding:** state lemma (c) in the
sharp form (`interior_leafDegree_eq_zero'` / `leafDegree_eq_zero_of_not_mem_supportSet`), which drops
the inert `¬ IsGraphLeaf` hypothesis; drop the `IsTree` corollary of `connected_induce_compl_pair` and
carry `C-U3-F`'s corrected form; record (iii) at **no** hypotheses and (iv′) without `hyp-alpha`; do
not carry `connected_induce_compl_pair` as a DAG step. **Excluded conclusions:** nothing about `S`,
`W_III`, the families or (RC). **Readiness: compiled sorry-free today; governed close only.**

### Proposals reconciled and NOT funded as separate award groups

- **T `AG-T3` / F `E1` — `α = ℓ + a` and the maximum-set bijection.** Contract-ready as mathematics
  and the single most consequential open Lean node, but it has no reuse outside this program and it is
  the **first** node C1-LA1's formalizer compiles. **Ruling: it is a named milestone INSIDE C1-LA1
  (the gate node), not a separate group. If Stage 7 reaches the gate and no further, the controller
  may register it as the cycle's salvage award at the exact statement in the DAG above.**
- **F Group `F-A` — forced neighbour and the family (I)/(II) structure.** The strongest-evidenced
  result of the cycle (six independent derivations of family-(I) emptiness) and the structural core of
  the Tier 2 refutation. It consumes `(★)` and lives inside C1-LA1. **Ruling: inside C1-LA1; second
  salvage candidate after the gate node; its Tier-3 registration is proposed below on the informal
  grade.**
- **F Group `F-D` / F3 (b).1–(b).2 — `K_2` component ⟹ `(★)` fails.** Correct, Lean-trivial, but not
  on the (RC) DAG (the tree case falls out of connectivity). **Informational; not an award group.**
- **U `U-D` (budget) and `U-E` (family (I) injection).** Conditional on `hpartition`/`hBcard` and on
  `|JS| = M`, all of which the gate node discharges. **Inside C1-LA1.**
- **U `U-F` — U1's skeleton.** **Not an award.** Four open sorries, a wrongly stated node, a DAG that
  does not reach its own conclusion, and an `expected_statement` that does not match its declaration.
- **Tier 1′ (strict), X-4 (`S = 0 ⟺ P_5`), X-3 (the `ℓ = 2` closed form), X-6 ((RI) ⟺ `(★)`).** All
  rest on critic- or adjudicator-derived steps first stated at Stage 4 or 5 with no isolated second
  read. **Not funded as awards this cycle.**

**Explicitly not awards, restated because the protocol asks:** the 16,424-tree census, the order-54
and order-53 adversarial families, the flat law `S = −ℓ(ℓ−2) − k_2(ℓ−4)` (a fixed-subclass law at
`D = ∅`), the `T_m` values, the odd-path closed form, and (RI) itself — a fixed-band or bounded result
never qualifies, and a repackaged identity never qualifies.

---

## Progress and stop-gate ruling

```text
material_progress: yes
```

```text
plateau: no
```

**Against the Stage 1 baseline** — (RC) OPEN on the non-flat class, proved informally only on the flat
subclass and on the `T_m` family, r24 registering no claim, the master ledger recording it as
"otherwise exactly as open as after r24 Cycle 4" — Cycle 1 delivers:

1. **A complete informal proof of (RC) on the whole eligible top-rank residual class** — not a
   subclass, not a family, not a census — with a closed statement-level DAG, derived at the exact
   C5-LA1 scope without citing the packet as evidence, independently re-derived four times (two
   critics, the T adjudicator, this synthesis at the hinge and the finish).
2. **The exact remainder identity** `−S = ℓ(ℓ−2)M + (ℓ−4)N_2 + W_III`, which converts the inequality
   into an equality and names the slack.
3. **Two of the three families converted from censused regularity to theorem with constant weights**
   (`W_I = ℓ(ℓ−1)M`, `W_II = (ℓ−4)N_2`), six independent derivations for family (I) and three for
   family (II), and the whole term-wise difficulty **relocated** to family (III).
4. **The budget identity and the exhaustiveness of the trichotomy proved a priori**, and the false
   `L5` caught and repaired before it could reach a Stage 7 informal audit.
5. **A refutation of a sealed-record claim** (the r24 B3/TD-6 realization statement), first bounded and
   then structural, with the number's true predicate identified on four independent instruments and
   the provenance gap widened to two inventory items — and **TD-6's research prescription shown void**,
   which saves a successor a wasted cycle.
6. **23 seat declarations and 32 critic declarations compiled sorry-free** with exactly the permitted
   axioms and rebuilt independently by the U adjudicator, where the cycle began with zero Lean
   coverage of (RC) beyond the frozen (RI) module — including the occupancy bound (fence 7 discharged
   in Lean), the fibre inequality in a **sharper hypothesis-free form than the charter asked for**, the
   budget as an exact `ℤ` identity localized to two cardinality premises, and the tree-structural
   Tier-3 layer.
7. **Two architecture defects caught before they could propagate into a Stage 7 contract** (the
   `signBound` statement; the DAG's missing terminal node), and U1's sorry count reduced from five to
   four by a critic proof whose statement identity was verified in the kernel.
8. **A load-bearing allocation obligation caught undischarged and then discharged at the correct index
   set**, where the inequality turns out to be **tight** (minimum fibre 0, minimum slack 0).
9. **`N_2 ≤ M` shown false** and correctly scoped — a false lemma removed from the inherited program.
10. **Three record corrections**: `P_7` ineligible (erratum R26-E-b, confirmed by every instrument in
    the cycle); the frozen `first_strict_descent` boundary defect (two disagreements, both `α = 1`);
    and the census reconciliation `16,424 = 290 + 16,134`, discharging Gate ruling 4.
11. **A corrected hypothesis map**, including one correction to the run's own semantic contract.

**Stop gate (`SOLUTION-CONTRACT.md` §5), applied run-wide.**

- **(a) — (RC) formally verified at the §2 statement: NOT MET.** No governed formal award exists at
  Stage 6; every compiled fragment is in an ungoverned scratch project (`C1-STAGE1-GATE.md` Ruling 7).
  **The run does not end here.**
- **(b) — an in-scope counterexample per §3.4: NOT MET, decisively.** Five independent census
  instruments, 16,424 eligible residual trees to order 17, eight adversarial families to order 54, two
  critic-derived families to order 53, and every falsification attempt by six critics and three
  adjudicators: **not one in-scope counterexample**. Every positive-`S` object anywhere in the cycle
  (`P_3`, `P_4`, `P_6`, one order-6 tree, `K_2 ⊔ P_3`, `K_2 ⊔ P_4`) fails at least two of the four
  hypotheses, and `P_3` — the unique residual positive — is excluded by `hyp-eligible` and is provably
  the only one.
- **(c) — (RC) proved informally with a closed dependency DAG, Stage 7 blocked on a bounded, named
  formalization obligation: MET.** **The mathematics of (RC) is `proved_informal` at the close of
  Stage 6.** The obligation is bounded and named to the node: the definition layer, the gate node
  `alpha_eq_ell_add_a`, then `family_III_bijection` + `fibre_nonneg` on the contract carrier.
- **Plateau: NO.** A plateau requires evidence of no material progress on the proof, the formalization
  or the correction record. The proof moved from "open on the non-flat class" to "informally proved on
  the whole class"; the formalization went from zero compiled coverage to 55 sorry-free declarations
  with the remaining obligation named to the node; and the correction record went from an inherited
  terminal debt to a drafted, adjudicated refutation with the number's true predicate identified.

**Is Cycle 2 needed at all if Stage 7 closes the award? No.** `C1-STAGE1-GATE.md` Ruling 10 and the
authorization are explicit: if Cycle 1's synthesis funds the (RC) award and Stage 7 closes it
`formally_verified`, **the run ENDS at the Cycle 1 close**, and the controller's final analysis and
publication follow. The portfolio below is written for the other branch and is moot on that one.

---

## Next-cycle portfolio

Nine routes, three per orientation. **This portfolio applies only if Stage 7 does NOT close the award
at the `SOLUTION-CONTRACT.md` §2 statement.** If Stage 7 closes it, the run ends and this section is
moot; what a **successor run** (not this one) would then inherit is stated at the end. Every route
stays inside the charter; nothing here attacks the all-rank aggregate, the transport, FOREST or #993.
Each route's model and topology follow `AUTHORIZATION.md` unchanged.

**Explicitly not funded at any orientation:** a larger no-counterexample census (fence 3, and a
deliverable this run's contract excludes); any reopening of `comb_of_spiders`; any use of `N_2 ≤ M`;
any `SimpleGraph.induce`-based counting layer; and any reopening of a refuted mechanism.

### Orientation T (prove)

- **`C2-T-01 RC-INFORMAL-PROOF-OF-RECORD-AND-SECOND-READ`.** One `INFORMAL-PROOF.md` at the governed
  workflow's informal-audit granularity (claim ledger per step) carrying `L5′`+`L5″` in place of `L5`,
  the corrected hypothesis map, the `ℕ`-subtraction audit extended to `α−1`, `ℓ−2`, `ℓ−4`, the carrier
  restatement, `k2_le_ell_div_two` / `N2_le_k2_mul_M` / `eligible_imp_alpha_ge_three` lifted into the
  DAG, the `ℓ = 2` closure by adjacency closure with connectivity consumed explicitly, every struck
  literal of the three adjudications removed, and every fence-7 attribution on the face of the claim;
  **plus the isolated second read of the repaired (RC) chain** that registration requires. *Closes in
  one cycle:* the audit input Stage 7 requires and the second read (RC) needs before it can be
  registered at `proved_informal`.
- **`C2-T-02 RC-STAGE7-BLOCKER-MATHEMATICS-ON-THE-CONTRACT-CARRIER`.** Take the node Stage 7 reported
  blocked and supply the Lean-shaped informal proof on `indepSetsAvoiding G Wᶜ`: in particular
  `family_III_bijection` as an explicit `Finset` bijection with its inverse written down, the `a = 0`
  emptiness by the budget-term case rather than by `ℕ` truncation, and `fibre_nonneg` stated so that it
  applies at `U(J')` without a transport. *Closes in one cycle:* the two heaviest formal nodes'
  mathematics in the exact shape the formalizer consumes.
- **`C2-T-03 RC-STRICTNESS-AND-EQUALITY-PACKAGE`.** Assemble X-2 + X-3 + L-11(`α ≥ 4`) + Tier 1′ +
  X-4 into one package with an **isolated second read of each critic-derived step**, and decide whether
  the run carries the sharpened Tier 1′ (`S < 0` on the entire eligible class) or the contract's weaker
  wording. *Closes in one cycle:* Tier 1′ in a form stronger than the contract states, at the cost of
  one new structural node, sharing every DAG node but the last with (RC).

### Orientation F (falsify)

- **`C2-F-01 FAMILY-III-PARAMETRIZATION-AND-ADVERSARIAL-FIBRES`.** Attack the bijection and the fibre
  bound where they are **tight**: the equality case is `ℓ = |U(J')| = 2`, realized on every eligible
  odd path at arbitrary order, so an adversary has a real target at unbounded size. Search for an
  eligible residual tree with `|U(J')|` large relative to `ℓ`, with deletion-injection slack 0 at
  `|U(J')| = ℓ`, or with a family-(III) fibre driven negative. *Closes in one cycle:* either the last
  attackable surface of the (RC) DAG, or the first object where the bound is not merely tight but
  false.
- **`C2-F-02 ADVERSARIAL-WITNESSES-WITH-M>1-AND-C₁≠∅`.** The one genuinely open adversarial direction
  the cycle produced: every `M > 1` construction found so far has `C_1 = ∅` (`comb_pairs`, `M = 2^k`)
  and every construction with `C_1 ≠ ∅` and `D ≠ ∅` has `M = 1` or fails `(★)`. Find a high-order
  eligible residual tree with **both**, and run the full battery on it. *Closes in one cycle:* either
  the first structural stress on the `ℓ(ℓ−2)M` versus `(ℓ−4)N_2 + W_III` balance, or a proof that the
  two features are incompatible under `(★)` — itself a lemma the proof can use.
- **`C2-F-03 TIER-2-SECOND-READ-AND-HYPOTHESIS-MAP-CLOSURE`.** (i) Carry the correction record through
  its **isolated second read** in the form ruled above (both order-9 classes named; the provenance gap
  at inventory items 5 and 6; the error class as an inference; TD-6 narrowed to family (III) and its
  `|C_1|` prescription void), registering nothing until the controller acts on this synthesis.
  (ii) State the hypothesis map over **subsets** of `{hyp-tree, hyp-eligible, (★)}` rather than one
  hypothesis at a time, with the four known tree positives and two known forest positives as fixed
  points; decide whether four is the complete tree list; and decide whether X-6 ((RI) ⟺ `(★)` on trees,
  and (RI)'s survival on residual forests) is a **theorem** — if it is, it is the sharpest available
  statement of what `(★)` is for, it belongs to whoever proves it, and it must never be inferred from
  the r24 award, whose hypotheses include `hyp-tree`. *Closes in one cycle:* the Tier 2 obligation and
  two decided questions in place of an informational map.

### Orientation U (formal)

- **`C2-U-01 RC-LEAN-DEFINITION-SITE-BIJECTION-AND-FORCED-NEIGHBOUR`.** Fix the definition site once
  (`supportSet` as the filter **and** the image with the two proved equal; `interior`; `aVal`; `C₁`,
  `C₂`, `N₂`, `U`, `w`) in a sorry-free module, then compile `α = ℓ + a`, the maximum-set bijection and
  `M = |{J ⊆ D : indep, |J| = a}|`, and the forced-neighbour lemma. *Closes in one cycle:* the gate
  node — and closing it makes every conditional lemma in the compiled corpus unconditional at the
  intended instantiation and discharges `hpartition`/`hBcard` outright. Inputs already compiled: L-8,
  L-10, X-5 (STATED), U2's `isIndepSet_union_of_no_cross_adj`.
- **`C2-U-02 RC-LEAN-FAMILY-CLASSIFICATION-AND-SUMS`.** From `C-U2-T`'s exact `ℤ` budget identity,
  compile the **exhaustive** trichotomy (including the proof that no fourth case occurs and that the
  `a−1` shell is empty at `a = 0`), then `W_I = ℓ(ℓ−1)M`, `W_II = (ℓ−4)N_2`, and `W_III` **indexed by
  the `a−1` shell**. *Closes in one cycle:* the Lean-level exact identity
  `−S = ℓ(ℓ−2)M + (ℓ−4)N_2 + W_III`, which is the whole content of (RC) modulo the finish.
- **`C2-U-03 RC-LEAN-FINISH-SPLIT-AND-CONTRACT-REPAIR`.** Rebuild the theorem contract against the
  shipped declaration (fully-qualified `expected_statement` with its digest recomputed; `N₂`, `U(J')`,
  `C₁`, `W_I/W_II/W_III` added to `definitions:`; the three missing Tier-3 nodes added; the edge
  `node-alpha-ge-three → node-sign-bound` removed); restate `node-sign-bound` as item 1(f)'s bound with
  `ℓ ≥ 4`, `ℓ = 3`, `ℓ = 2` as three named nodes; carry `C-U3-T`'s `card_C2_eq_zero_of_eligible` as the
  compiled `ℓ = 2` finish; and compile **`N_2 ≤ k_2·M` with `k_2 ≤ 1` at `ℓ = 3` — not `N_2 ≤ M`,
  which is false** (this corrects the U adjudicator's own proposed route text). *Closes in one cycle:*
  the contract defect that would otherwise fail a Stage 7 fidelity review, and the `ℓ ≤ 3` corner.

**If Stage 7 closes the award, a successor run (not this one) inherits:** the governed (RC) award and
its receipts; Tier 1′ in the sharpened form, `proved_informal` with four critic-derived components
awaiting isolated second reads; the Tier 2 correction record, STATED and awaiting its second read, with
TD-6 narrowed to family (III) and its `|C_1|` prescription void; the twelve Tier-3 lemmas at the
scopes tabulated above, of which seven are compiled; `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` still
OPEN at every other rank and on the whole non-residual class, and `E993-BETA-AGG` still OPEN behind a
transport never attempted — **the ordinary-to-RTree transport is the next real frontier, and nothing
in r26 touched it**; X-6 as a candidate theorem about what `(★)` is for; the forbidden literal
`N_2 ≤ M`; the carrier discipline; and the record-hygiene items listed under Registrations.

---

## Registrations

Every registration and scope update the controller should make at the close, each with its grade and
attribution on its face. **Per `SOLUTION-CONTRACT.md` §4 and `C1-STAGE1-GATE.md` Ruling 6, a statement
first made or materially changed by an adjudicator or by this synthesis is STATED and is not registered
without an isolated second read.** The "2nd read" column is binding.

| # | Key / update | Grade | Attribution on its face | 2nd read |
|---|---|---|---|---|
| **R-1** | `E993-R26-TOP-RANK-RESIDUAL-SIGN` — (RC) at the four C5-LA1 hypotheses | **`proved_informal`**; registry status stays **OPEN** until Stage 7 closes it `formally_verified` or the second read lands | packet lane 05 (architecture, under attack, not evidence); derivation **route T1**; `L5′`/`L5″` repair **critics `C-T1-F`, `C-T1-U`**; re-derived by `C-T1-F`, `C-T1-U`, adjudicator T, this synthesis; ARMW 2020 for the occupancy bound re-proved in-run; r24 critic `C-T1-U` for B3; r24 route A1 for the flat law | **YES** |
| **R-2** | `E993-R26-C6-B3-FAMILY-I-REALIZATION-CORRECTION` — the Tier 2 correction record as ruled above | realization claim **`REFUTED`** (universal); `P_b = 1,420`, first at order 9, two order-9 classes: **`bounded_computation`**; structural core `proved_informal` | route **F2**; refutation widened and re-ruled by **adjudicator F**; four independent instruments plus the controller's withheld pre-run replay (a controller record, not evidence); both order-9 classes from F2 and `C-F2-U` | **YES — materially changed at Stage 5 on five points** |
| **R-3** | `E993-R26-DELETION-INJECTION` — the occupancy bound and the sharp fibre inequality (C1-LA2) | **`proved_informal`** (machine-checked, ungoverned); upgrades to **`formally_verified`** only if Stage 7's governed close covers it | compiled **route U2**; sharp form **critic `C-U2-F`**; informal `T3` (v), `C-F1-T` (D); `rfl`-identity with `C-U1-F`'s variant. **Registration BLOCKED until the Andriantiana–Razanajatovo Misanantenaina–Wagner (2020) line travels on its face** | **YES** for the sharp form |
| **R-4** | `E993-R26-TREE-STRUCTURAL-CORE` — L-6, L-7(iv′), L-8, L-10, L-11(`α ≥ 3`), L-12 (C1-LA3) | **`proved_informal`** (seven of them machine-checked) | compiled **route U3**; extensions **critics `C-U3-T`, `C-U3-F`** (two derivations each — one carried, not two); informal **route T3** with hypothesis corrections **critics `C-T3-F`, `C-T3-U`**; (iv′) independently in F via `C-F3-U` | **YES** for the hypothesis-free (iii), for (iv′) and for `N_2 ≤ k_2 M` |
| **R-5** | `E993-R26-FAMILY-I-EMPTY-AC` — forced neighbour, family (I) `A_C = ∅` with `w = ℓ−1` and `|Fam I| = ℓM`, family (II) singleton with `w = ℓ−4` and `|Fam II| = N_2`; **not** `hyp-eligible` | **`proved_informal`** | **six independent in-run derivations** across two orientations (`T1 L6`–`L8`, `C-F1-T`, `C-F1-U`, `C-F2-T`, `C-F2-U`); the statement of forced neighbour is the packet's (fence 7), every proof is in-run. This is the theorem that makes the Tier 2 refutation structural | **YES** (critic-attributed) |
| **R-6** | `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT` — Tier 1′ in the sharpened form (`S < 0` on the entire eligible class) | **`proved_informal`** | critics `C-T1-F` (A-3, A-2), `C-T2-U` + `C-T2-F` (A2), `C-T2-F` (A1), `C-T3-U` ((E)) | **YES — DO NOT REGISTER THIS CYCLE**; four components, none second-read |
| **R-7** | Scope note on `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | **OPEN, unchanged** | record that the `p = α−1` instance **restricted to the eligible residual class** is now `proved_informal` in-run, with **no status transfer**; the word "sub-case" is not used | no (a note, not a claim) |
| **R-8** | Scope note on `E993-BETA-AGG` | **OPEN, unchanged** | transport never attempted in r26 | no |
| **R-9** | Terminal-debt update: **TD-6** narrowed to family (III); its prescription to bound `|C_1|` against `ℓ` declared **VOID** | derived from R-5 | adjudicator F, adopted here | **YES** (travels with R-2) |
| **R-10** | Forbidden literal: **`N_2 ≤ M` is FALSE** on both the residual and the eligible residual class; only `N_2 ≤ k_2·M` survives, and the `ℓ = 3` use only through `k_2 ≤ 1` | `proved_informal` for `N_2 ≤ k_2 M`; `bounded_computation` for the counterexample counts | counterexamples critics `C-F2-T`, `C-F3-T`, resolved by adjudicator F; the `k_2 ≤ 1` derivation is **adjudicator-derived (F)** and STATED | **YES** |
| **R-11** | Census reconciliation of record (Gate ruling 4 discharged): **16,424 eligible residual (orders 4–17) = 290 flat + 16,134 non-flat; 16,442 residual with `α ≥ 2` = 16,424 + 18 ineligible**; 312 at orders 7–12, 3,244 at 7–15 | `bounded_computation` | route F1 (figure of record), split by `C-F2-T` and `C-F2-U`, hinge verified by adjudicator F; reproduced by seven instruments | no (arithmetic reconciliation, five parties) |
| **R-12** | Errata confirmed run-wide: **R26-E-b** (`P_7` is NOT eligible; first eligible odd path is `P_11`) and **R26-E-a** (scratch binding by symlink) | record | confirmed independently by every census instrument in the cycle | no |
| **R-13** | Instrument note (not a correction record, no sealed file edited): the frozen `first_strict_descent` returns `None` on **`K_1` and `K_2`**, both `α = 1`, so **no r23/r24/r25 result using an `α ≥ 2` tree is affected** | record | route F1 (mechanism), corrected to two cases by `C-F1-T` and `C-F1-U` | no |
| **R-14** | Contract errata candidates: (i) `SEMANTIC-CONTRACT.md` §3 over-attributes "no interior vertex is adjacent to a leaf" to `(★)` — it follows from the definitions of `L`, `C`, `D`; (ii) §4 and `C1-ALLOCATION.md` item 1(d) leave `W_III`'s outer index unfixed — it is the `a−1` shell; (iii) `C1-ALLOCATION.md` item 1(f)'s "`ℓ = 3` (`N_2 ≤ M`)" must read through `k_2 ≤ 1` | record corrections to the run's own control files; **sealed members are never edited** — carried as errata | (i) adjudicator U; (ii) adjudicator U (CR-7); (iii) adjudicator F + this synthesis | **YES** for all three |
| **R-15** | Record-hygiene items for the controller: the Stage 3 admission's `read_boundary_disclosure` flag for F1/F2 is a phrase match, not the record; the Stage 4 disclosures file omits all six F critics; the Stage 3 disclosure record should be amended to carry U1 and U3 (the R26-E-a read class); T1's report digest is not recomputable from the shipped artifact (string-key the hashed dict); T1's and F2's import lists are incomplete; `scratchpad/c1-T3/verify_output_n9.json` (638 B, unparseable) should be superseded by the parseable replay artifact (633 B) as the artifact of record; `t2_driver.stderr.log` is uninventoried | record | adjudicators T, F, U | no |
| **R-16** | Alias and registry discharge: the run-local registry is byte-identical to the frozen authority (363 identities); the U adjudicator's routed item (i) is **DISCHARGED**; both r26 candidate keys are new; zero alias collisions on three independent sweeps | record | controller facts + adjudicator F's independent sweep + this synthesis | no |

**Nothing in this synthesis registers anything.** Registration is the controller's act at the close,
and every row marked **YES** must pass an isolated second read first. **Statements first made by an
adjudicator or by me and therefore STATED:** the `k_2 ≤ 1` route to the `ℓ = 3` finish (F); the `W_III`
outer-index clarification (U, CR-7); the `hNoEdge` over-attribution (U); `R26AdjU.maxIndep_leafDegree_
eq_zero` (U, X-5); the reconciliation that closes F's and U's open nodes run-wide and the independent
re-derivation of the family-(III) parametrization and the finish (this synthesis, Reconciliation D1);
the ruling that the budget identity's genuinely independent derivations are cross-orientation, not
within T (this synthesis, D9); and the T3/U3 reconciliation for C1-LA3 (this synthesis).

---

## Continuation ruling

```text
continue: yes
```

`continue: yes` means Cycle 2 runs **unless Stage 7 closes the award**. The stop gate found no decisive
event at Stage 6: (RC) is not formally verified (a governed award cannot exist before Stage 7), there
is no in-scope counterexample, and there is no evidence-backed plateau — the opposite is on the record
on all three of the tracks §5 names. `SOLUTION-CONTRACT.md` §5(c) is met, and read literally it says
CONTINUE to the next cycle with Stage 7 the only funded lane unless the synthesis funds more.

**What this synthesis funds.** Stage 7 as the sole funded lane of the Cycle 1 close, running the
governed workflow under the canonical run id, with the formalizer, informal auditor and fidelity
reviewer at Claude Opus 5 high per the authorization, in **one project** containing the byte-identical
C5-LA1 module and the carried sorry-free fragments, in this order: (1) governed close of **C1-LA2**
and **C1-LA3**, which are compiled today and need only the workflow, the ARMW-2020 attribution and the
two C1-LA3 repairs; (2) the definition layer and the **gate node** `alpha_eq_ell_add_a`, reporting at
the gate; (3) the `(★)`-consuming spine (forced neighbour, the trichotomy, the family weights, the
family-(III) bijection and the fibre bound on the contract carrier); (4) the three finish nodes; (5)
**C1-LA1** at the §2 statement composed with (RI). If Stage 7 closes C1-LA1 `formally_verified`, the
run ENDS at the Cycle 1 close per `C1-STAGE1-GATE.md` Ruling 10, the next-cycle portfolio is moot, and
the controller's final analysis and publication follow — publication being outward-facing, it remains
Ashton's call unless pre-authorized. If Stage 7 stalls, whatever it closed stands as the cycle's
awards and Cycle 2 runs the nine routes above.

**What this synthesis does not do.** It registers nothing, edits no sealed member, changes no claim
status in any registry, and transfers no status to `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`,
`E993-BETA-AGG`, the transport, the common-leaf condition, TREE, FOREST, TRANSFER or Erdős #993 — all
of which stand exactly where Stage 1 found them.

---

## Artifact inventory

**Deliverable (the only file written outside my scratch):**
`cycles/cycle-1/stage6/SYNTHESIS.md` (this file), run-root-relative.

**Scratch,** entirely under `scratchpad/c1-S/`. No `/tmp`, no `mktemp`, no `TMPDIR`, no session
scratchpad. Nothing under `control/`, `sources/`, `cycles/` (outside this deliverable), or any seat's,
critic's or adjudicator's directory was created, modified or read; every manifest digest and all 79
source digests still verify after my work, which is the check.

| File (under `scratchpad/c1-S/`) | Role | Import list |
|---|---|---|
| `verify.py` | dispatch-capsule inner-seal recomputation and all 12 member `bytes`+`sha256` checks | `hashlib`, `json`, `os` |

Two further checks were run inline as heredocs from the run root and are not shipped as files: the
Stage 5 packet manifest's inner-seal recomputation and all 31 member digests; and the 79-entry
`control/SOURCE-DIGESTS.json` re-hash plus the field-scoped read of its `files` and `ORIGINS` records
(`hashlib`, `json`, `os`). Both are reproducible from the replay block below.

**Replay** (deterministic, run-root-relative, every job foreground):

```
R=<run root>
python3 $R/scratchpad/c1-S/verify.py     # dispatch seal d52e8fe4...c16f4e, 12/12 members
  # stage 5 manifest inner seal ec0de291...dd43e, 31/31 members
  # control/SOURCE-DIGESTS.json: 79/79 files re-hash, 0 mismatches
  # seals throughout: SHA-256 of canonical JSON minus seal_sha256,
  # sort_keys=True, separators=(",",":"), UTF-8, no trailing newline.
```

**Files read.** The two VerityOS boot files; the sealed dispatch capsule and its twelve members; the
`files` and `ORIGINS` records of `control/SOURCE-DIGESTS.json` under the run-root authority grant.
Bytes of 79 frozen source files and 31 Stage 5 packet members were streamed into `hashlib` and never
opened into context. **No raw return, no critique, no seat/critic/adjudicator scratch, no
`control/controller-prerun/` file, no prior synthesis, no research-packet directory, no other
experiment root, no external source, no network, no package install.** No recursive search was run
above any granted directory; no `find`, `grep`, `rg`, `ls -R` or globbed `cat` was run at all.

**Background jobs: none.** No job was ever started in the background. Every computation ran in the
foreground of a single tool call and completed before this file was written; nothing was detached,
nothing was polled, and nothing was killed — by pattern or by PID. There is nothing running at this
write.

Reread before close. The four flag lines of record appear exactly once each
(`headline_resolved` and `continue` under `## Headline verdicts` and `## Continuation ruling`,
`material_progress` and `plateau` under `## Progress and stop-gate ruling`); the model disclosure line
appears exactly once, in the header block; the twelve protocol headings appear exactly once each and
in the protocol's order; and no literal filesystem path outside the run root is quoted anywhere.
