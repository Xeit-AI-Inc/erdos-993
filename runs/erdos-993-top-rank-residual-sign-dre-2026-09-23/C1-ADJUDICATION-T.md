# Orientation Adjudication

Isolated Stage 5 adjudicator of origin orientation **T** (prove), Cycle 1, r26
(`erdos-993-math-dre-20260923-r26-top-rank-residual-sign`). Portfolio: the returns of seats `T1`,
`T2`, `T3` and their six cross-orientation critiques (`C-T1-F`, `C-T1-U`, `C-T2-F`, `C-T2-U`,
`C-T3-F`, `C-T3-U`).

**Boot acknowledgment.** I am operating within VerityOS. This session booted by reading EXACTLY the
two authorized files and nothing else from the VerityOS root:
`/Users/ashtonsperry/VerityOS/verity.md` (the root constitution) and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (the identity subsystem's startup
protocol). Subsystems loaded: the constitution and the identity startup protocol only. The startup
protocol's own task-type map was deliberately not followed into `memory/`, `knowledge/`,
`conversations/`, `modules/`, `skills/`, `logs/`, `decisions/`, `operations/`, `projects/`,
`writing/` or `inbox/` — the dispatch fixes the read boundary at those two files, and the controller
has booted for the run. No conversation record was created or appended: this seat's dispatch confines
every write to one deliverable path and one scratch directory, and `conversations/` lies outside the
grant.

**Model disclosure.** chartered opus/high; transport-resolved model opus (explicit parameter); the
seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

**Read-boundary disclosure.** None. Every file read this session is one of: the two boot files above;
the 24 members enumerated by my capsule `control/c1-adjudicator-capsules/T-PACKET-MANIFEST.json`;
`sources/r24/r23-evaluator/ordinary_tree.py` lines 160–209 (frozen run-root authority under
`sources/`, expressly authorized, read to reconstruct the `t_family` fixed points); and two files
copied out of the inventoried scratch of return `T3` into my own scratch
(`scratchpad/c1-T3/verify_output_n9.json`, `scratchpad/c1-T3-replay/verify_output.json`), which the
dispatch authorizes copy-out-first for replay. No `find`, `grep`, `rg`, `ls -R` or glob `cat` was run
rooted above a granted directory; the one `ls -1` was of my own scratch subdirectory. I did not read
another orientation's portfolio, another adjudication, a prior synthesis, the research packet's own
directory, another experiment root or any external source. No network, no package installs, standard
library only, exact integers, no Lean build. No background job was started at any point in this
session; every computation ran in the foreground under an explicit `timeout`, so there is no job to
kill by PID and no process listing was taken.

---

## Identity and seal audit

**Capsule seal (reported as required).** `control/c1-adjudicator-capsules/T-PACKET-MANIFEST.json`,
inner seal recomputed as SHA-256 over the canonical JSON of the manifest with `seal_sha256` removed
(`json.dumps(..., sort_keys=True, separators=(",",":"))`, UTF-8, no trailing newline):

```
declared = 848add3cce0a3d247c99ea76b735f8b027b44270f81530942bfa7ac2f136a9fd
computed = 848add3cce0a3d247c99ea76b735f8b027b44270f81530942bfa7ac2f136a9fd
match    = True
```

**Capsule seal cited: `848add3cce0a3d247c99ea76b735f8b027b44270f81530942bfa7ac2f136a9fd`.**

All **24/24** capsule members verify on disk by both `bytes` and `sha256`; `file_count` (24) equals
the listed count; **0 mismatches, 0 missing**. This includes the three returns
(`T1` `7ef1b39f…0bc93b25`, 30,883 B; `T2` `7c9c6def…1ef26e300`, 39,079 B; `T3` `14e5d705…dcd31f8300e`,
36,957 B) and all six critiques.

**Stage manifests (every inner seal recomputed, every member re-hashed).**

| Manifest | Declared inner seal | Recomputed | Members | Digest failures |
|---|---|---|---|---|
| `control/C1-STAGE2-PACKET-MANIFEST.json` | `c97e121561a7b63cef93312f22f60cfa2097b916f264bfb8ebff52cb68ee9de3` | identical | 96 | 0 |
| `control/C1-STAGE3-PACKET-MANIFEST.json` | `86571d275c1b158757f81106d929450b052d819891899b2d6991e7e93df68a40` | identical | 32 | 0 |
| `control/C1-STAGE4-PACKET-MANIFEST.json` | `7169114907fdb1f2ab3845ba07183ffa808114d588add7ccc05d15eadf92ab2c` | identical | 57 | 0 |

The Stage 2 value agrees with the value each of the three returns reports and with every critic's
recomputation. The Stage 3 packet manifest was **not** a critic-capsule member — several critics
disclosed that they could authenticate it only through its digest in the Stage 4 dispatch manifest
(`C-T2-F`, `C-T2-U`, `C-T3-U`). It **is** a member of my capsule; I recomputed its inner seal
directly and it matches, so that disclosed limitation is discharged at this stage and is not a
finding against any critic. The controller has already recorded the capsule-design defect and its
Cycle 2 correction.

**Admission records.** `control/C1-STAGE3-ADMISSION.json`: 9 expected, 9 observed, 9 admitted, 0
findings, `source_seal` equal to the verified Stage 2 seal; the three T returns carry the route IDs
and mechanism tokens `C1-ALLOCATION.md` assigns (`C1-T-01`/`RC-FULL-PROOF-LEAN-READY`,
`C1-T-02`/`RC-ALTERNATIVE-DERIVATION-AND-STRICTNESS`, `C1-T-03`/`RC-TREE-STRUCTURE-LEMMAS`) and each
declares the headline flag negative. `control/C1-STAGE4-ADMISSION.json`: 18 expected, 18 admitted, 0
findings; all six critiques of my orientation carry `verdict: retained_narrowed` and likewise declare
the headline flag negative. Every critique's byte count and digest in the admission record matches my
capsule's entry for the same file.

**Read-boundary disclosures, re-ruled.** `control/C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json` files
three items (F3, U2, U1) — **none against a seat of my orientation**, which is consistent with `T1`,
`T2` and `T3` each declaring "None". `control/C1-STAGE4-READ-BOUNDARY-DISCLOSURES.json` files four
items against critics of my orientation (`C-T1-F`, `C-T1-U`, `C-T2-F`, `C-T2-U`) plus one against
`C-T3-F`. I re-rule each, and I concur with the controller on all five:

- **`C-T1-F`, `C-T1-U`, `C-T2-F` (process-table exposure).** A `pgrep -fl` / `ps` taken to discharge
  the kill-background-jobs duty printed sibling critics' command lines, including heredoc fragments.
  No sealed content and no sibling file was read. **No effect on independence.** Each disclosed it
  unprompted, which is the behaviour the protocol wants; the instrument, not the intent, was wrong.
- **`C-T2-U` (incident `R26-I-1`).** A pattern `pkill -f "python3 -"` instead of a literal PID, which
  may have terminated critic `C-U2-F`'s process, plus the same incidental command-line exposure. The
  controller records that `C-U2-F` returned complete and attributes no lost result to it. I re-rule:
  a **protocol lapse, self-disclosed, with no recorded mathematical consequence and none traceable
  in `C-T2-U`'s own findings** — every `C-T2-U` result I checked I reproduced myself. It does not
  reduce the weight I give that critique. The kill-by-literal-PID rule is correctly carried to
  Cycle 2, and this adjudication observed it by starting no background job at all.
- **`C-T3-F` (hashing Stage 3 members).** Bytes of eight sibling returns were streamed into
  `hashlib` without being displayed. **Hashing is not reading**; I concur, and I note that the
  Cycle 2 correction (recompute the inner seal from the manifest's own listed digests) is the right
  one and is what I did.
- **`C-T1-F` / `C-T1-U` (replay-induced reads).** T1's replayed generators themselves opened
  `control/CLAIM-IDENTITY.run-local.json` and the 79 files under `sources/`. **Ruled in-grant**: the
  dispatch authorizes copy-out-first replay of inventoried generators, and a generator's own reads
  are part of the replay. `sources/` is expressly authorized; the run-local registry is a Stage 2
  member whose content neither critic used for its own registry work (`C-T1-U` used the authorized
  `sources/authority/CLAIM-IDENTITY.json` instead). No finding.
- **`C-T3-U` (digest-only touches).** Two non-capsule files hashed but not read, submitted for my
  ruling. **Ruled in-grant** on the same basis as `C-T3-F`'s item; the purpose (authenticating the
  Stage 3 manifest through a sealed declaration, and confirming the two registry copies are
  byte-identical) is exactly duty 1, and no content entered context.

**Controller facts record** (`control/C1-STAGE5-CONTROLLER-FACTS-T.json`), weighed as one more
replay and not as authority. Its three orientation facts are consistent with my own replay: the
`P_7` eligibility mislabel (erratum `R26-E-b`) is real and was caught by T1 and T2 within my
portfolio; the fixed-point *numbers* the controller quoted (`P_3 +2`, `P_5 0`, `P_7 −4`) are all
numerically correct — I reproduce every one. Erratum `R26-E-a` (the `bind-shared-packages` defect)
touches no seat of my orientation. Capsule design note `R26-N-13` is load-bearing for one ruling
below (see `C-T3-F` Strike 3). The controller's pre-dispatch reading of the candidate argument is
recorded as prior, not evidence, and I have given it no weight.

**Adjudicator's own instrument.** Because the protocol tells me to weigh replays above self-reports,
I did not adjudicate on the returns' and critics' numbers. I built
`scratchpad/c1-adj-T/adj_instrument.py` from `SEMANTIC-CONTRACT.md` §§1–4 and the frozen definitions
alone — free-tree generation by leaf-addition closure with centre-rooted AHU canonical forms (a
generator sharing no mechanism with T1's, T2's Prüfer pipeline or T3's); `is_tree` by an explicit
`|E| = n−1` **and** BFS-connectivity test on every generated object; `i_k(G−D)` as
`indepSetsAvoiding`; `Δ_k` in `ℤ`; `x` as the first STRICT descent; `(★)` by enumerating every
maximum independent set; and `aggregate` through the literal favorable filter `Δ_p(G−v) < 0` and the
literal deletion sets `H_v = {v, s_v}`, `R_v = N[s_v]` — **never through (RI)**. Standard library
only (`itertools`, `json`, `hashlib`, `sys`, `collections`, `math`). Results, orders 1–12:

| Quantity | My instrument | Agrees with |
|---|---|---|
| Isomorphism-class counts, orders 1–12 | `1,1,1,2,3,6,11,23,47,106,235,551` | A000055; every seat and critic |
| Residual trees with `α ≥ 2` | **330** | T1, `C-T1-F`, `C-T1-U`, `C-T2-F`, `C-T2-U`, `C-T3-F`, `C-T3-U` |
| Eligible residual trees, orders 7–12 | **4, 5, 17, 39, 80, 167 = 312** | the contract's figure of record and every instrument that reached it |
| Fixed points | `P_3 +2`, `P_5 0`, `P_7 −4`, `T_1 −14`, `T_2 −47` | all |
| `P_7` eligible? | **no** (`x+2 = 4 > 3 = α−1`) | erratum `R26-E-b`; T1 §4; T2 §8 |
| First eligible odd path | **`P_11`** (`α=6, x=3`) | T1, T2, all four path-scanning critics |
| Budget-identity failures over every `B ∈ I_{α−1}` on all 330 | **0** | all |
| Uncategorized shells (outside families I/II/III) on the residual class | **0** | all |
| Forced-neighbour failures on all 330 | **0** | all |
| `W_I = ℓ(ℓ−1)M`, `W_II = (ℓ−4)N_2`, `W_III = Σ_{J'}Σ_{A∈I(U(J'))}(ℓ−2\|A\|)` | **0 failures** | all |
| `α = ℓ + a`, `M` = #(maximum independent subsets of `D`) | **0 failures** | all |
| `k_2 ≤ ⌊ℓ/2⌋`, `N_2 ≤ k_2 M`, every fibre `≥ 0` | **0 failures** | all |
| `S_literal = ℓM − (W_I+W_II+W_III)` | **0 failures** | all |
| `S_literal = −ℓ(ℓ−2)M − (ℓ−4)N_2 − W_III` | **0 failures** | T2 §3; `C-T1-F` A-1 |
| Unique `S > 0` on the residual class | **`P_3`** only | all |
| Unique `S = 0` on the residual class | **`P_5`** only | all |
| Max `S` over the 312 eligible | **−12** | `C-T1-U`, `C-T2-U` |
| Min `α` over the 846 eligible trees of orders ≤ 12 | **5** | `C-T3-U` F4 |
| Trees of orders 2–12 with `x = 0` | **0** | `C-T1-F` A-2; `C-T3-U` (E) |

Every census literal of record in this orientation is therefore backed by a seventh, independent
instrument. None of it is proof of anything universal (`SOLUTION-CONTRACT.md` §3.3) and I carry none
of it into a grade.

---

## Route-by-route decisions

### `T1` — `C1-T-01 RC-FULL-PROOF-LEAN-READY`

**Decision: retained, narrowed on five points; the derivation of `(RC)` stands after one repair.**

Both paired critics independently re-derived `L0`–`L11` from the semantic contract with their own
instruments, attacked every bijection, quantifier and `ℕ`-subtraction the attack brief names, and
attempted a counterexample; neither broke the mathematics. I re-derived the chain myself and confirm
it. The critics **agree** on the one real defect and on its remedy; there is no paired-critic
disagreement on this route that needs breaking. Claim by claim:

1. **`L5` is false as stated. UPHELD (both critics; `C-T1-F` F-1, `C-T1-U` F1).** `L5` asserts family
   (II) has "exactly one `s ∈ A_C` with `λ(s) = 2` **and no other `s ∈ A_C`**" and bills the whole
   classification "pure `ℕ`-arithmetic from `L4`". The gloss that "every term inside the `Σ_{s∈A_C}`
   group" is 0 is applied to the group that *equals* 1; supports with `λ = 1` contribute `λ−1 = 0`
   and are invisible to the budget. **My replay:** searching every free tree of orders ≤ 12 I find
   **322 shells** `B ∈ I_{α−1}(G)` with every budget term a nonnegative natural number summing to 1,
   `|A_D| = a`, `Σ(λ−1) = 1`, `h = 0` and `|A_C| ≥ 2` — i.e. outside all three of `L5`'s literal
   families; **31** of them at orders ≤ 10. The minimal witness is at order 7, edges
   `{0–1, 0–2, 0–3, 1–4, 1–5, 2–6}`, `B = {1,2,3}`, `A_C = {1,2}` with `λ = (2,1)`, `w(B) = −2`.
   **Zero of the 322 is residual.** The correct arithmetic statement is `SEMANTIC-CONTRACT.md` §4's
   own wording, which `L5` narrowed and broke.
   **Ruling.** Replace the single node with the two the critics supply:
   - **`L5′` (arithmetic only, from `L4`):** every `B ∈ I_{α−1}(G)` is in exactly one of
     **(I)** `|A_D| = a`, `λ(s) = 1` for every `s ∈ A_C`, `h = 1`; **(II\*)** `|A_D| = a`, exactly one
     `s* ∈ A_C` has `λ(s*) = 2` and every other `s ∈ A_C` has `λ(s) = 1`, `h = 0`;
     **(III)** `|A_D| = a − 1` (hence `a ≥ 1`; provably empty at `a = 0`), `λ(s) = 1` on `A_C`,
     `h = 0`.
   - **`L5″` (pruning; consumes `hyp-tree`, `hyp-alpha`, `hyp-residual` through `L3` and `L6`):** in
     (I) and (II\*) `A_D` is a *maximum* independent subset of `D`, so forced-neighbour forbids
     `A_C ∩ C_1 ≠ ∅`; hence `A_C = ∅` in (I) and `A_C = {s*}` in (II\*). Only then do `w = ℓ−1` and
     `w = ℓ−4` follow.

   I adopt `C-T1-U`'s sharper reading of the stake over `C-T1-F`'s "confined to `L5`'s English":
   on the escapee shape `w(B) = ℓ − 4 − 2j` with `j ≥ 1` extra `λ = 1` supports, **strictly below**
   `ℓ − 4` (confirmed on the order-7 witness: `ℓ = 4`, `j = 1`, `w = −2 = ℓ−4−2`). Had the shape
   survived, `W_II` would be more negative than `(ℓ−4)N_2` and the finish would fail. So
   `hyp-residual` is load-bearing at exactly the step `L5` labels "no new hypothesis" — this is more
   than prose. **The proof itself loses nothing**: T1's own shipped DAG already routes the singleton
   through `family_II_support_singleton [L8] L5, L6`.

2. **`L9`, `L10`, `L11` (`ℓ ≥ 4`, `ℓ = 3`, `ℓ = 2`), `L0`'s four audited subtractions, and the `a = 0`
   emptiness of family (III): attacked by both critics and by me; all stand.** The family-(III)
   bijection is two-sided (adjacency among supports is handled because `A` is independent *in the
   induced graph on* `U(J')`); the deletion injection is re-proved in-run from the finite-graph
   definition; `k_2 ≤ 1` at `ℓ = 3` gives `N_2 ≤ M`; `ℓ ≤ 1` cannot occur. 0 failures in my replay
   on 312/312 and on every fibre.

3. **`L0`'s billing. NARROWED (`C-T1-U` F2).** The step audits `α − ℓ`, `a − |A_D|`, `λ(s) − 1`,
   `ℓ − Q(A_C) − |B∩L|` but omits `ℓ − 2`, `ℓ − 4` and `α − 1`, which `SEMANTIC-CONTRACT.md` §5 names
   as the truncation hazards and which are precisely the quantities that go negative in the two
   branches the finish depends on. Content retained; the title "the `ℕ`-subtraction audit" is
   narrowed until the three are added. Credit stands for the `a − 1` shell, which `L5` *proves*
   empty at `a = 0` rather than declaring it empty.

4. **§4's `P_7` finding: correct; two literals struck, one framing narrowed.**
   - **STRUCK (`C-T1-U`):** "contradicts the fixed-point table in `SEMANTIC-CONTRACT.md`,
     `C1-WORKER-COMMON-BRIEF.md` and `C1-ALLOCATION.md`, which **all** assert `P_7` … is
     **eligible**." I read the digest-verified `SEMANTIC-CONTRACT.md` in full: it contains **no
     occurrence of `P_7` and no fixed-point table**. The mislabel is in `control/C1-ALLOCATION.md`
     (item 2, which I read: "`P_7` (`S = −4`, eligible)") and — on erratum `R26-E-b`'s authority —
     in `control/C1-WORKER-COMMON-BRIEF.md` and the T2 dispatch. Narrow the literal to those.
   - **STRUCK (`C-T1-F` F-8):** leg (iii) of the finding, which cites
     `sources/literature-packet/RC-CANDIDATE-CHECK.json` as one of three converging evidential legs.
     `C1-STAGE1-GATE.md` ruling 2 says "No seat cites the packet's proof, review or **order-≤12
     check** as evidence." Reading it is permitted; citing it evidentially is not. The finding is
     unharmed: legs (i) (hand derivation from the path recursion) and (ii) (T1's own brute force)
     carry it, and four independent instruments plus mine confirm it.
   - **NARROWED (`C-T1-U`):** §4's framing as "one discrepancy found" by this route overstates its
     standing. Erratum `R26-E-b` records that T1, T2, F3 and F1 each caught it; it is a correct
     finding, independently reached, but not novel to T1 at Stage 4.

5. **Remaining-obligation item (3): NARROWED (`C-T1-F` F-9).** The mathematical content — under
   `(★)` every family-(I) member has `A_C = ∅`, so a *realized* negative family-(I) weight cannot
   occur on the residual class — is correct and I verified it (0 family-(I) members with `A_C ≠ ∅`
   on all 330 residual trees). The prediction of which error class F2 will find is F2's object and
   the F adjudicator's ruling, and is outside my portfolio. Keep the lemma; delete the prediction.
   The fence is not crossed: T1 never quotes the "1,420 realized" statement as fact.

6. **Certification.** Both critics reproduced the three script digests, `OVERALL_VERIFICATION_PASS`,
   the 79/79 source-digest check, and the report digest `24bf5e34…28dc1` from their own working
   directories. **Two hygiene findings upheld:** the import list for `rc_verifier.py` is incomplete
   (`typing`, `__future__` omitted — both standard library, so the substantive claim survives and
   only the enumeration is corrected); and the report digest is **not recomputable from the shipped
   artifact** because the hashed dict has integer keys that a JSON round trip turns into strings
   (`C-T1-F`). The number is true of the *run* — two critics reproduced it by re-executing — but not
   checkable against the *file*. String-key the hashed dict.

7. **Grade.** `proved_informal` for `(RC)` at the exact scope, **after the `L5` repair**, is
   supported. Both critics supplied the independent re-derivation `SOLUTION-CONTRACT.md` §4 requires
   before that grade can be weighed, and I have supplied a third. **The 312-tree census must not
   count toward the grade** (both critics; §4's ladder does not list it as a criterion) — the grade
   rests on the derivation plus independent re-derivation. T1's line "Debt: none of `L0`–`L11` has an
   unclosed step" is **narrowed** to "no unclosed step after the `L5` repair"; as the return stands,
   `L5` rests on a justification that is not available.

### `T2` — `C1-T-02 RC-ALTERNATIVE-DERIVATION-AND-STRICTNESS`

**Decision: retained, narrowed; §6 is rejected as a complete proof of its own statement and is
`conditional` until one critic-supplied lemma is inserted; `(RC)` itself is untouched by the gap.**

The two paired critics converged, independently and with the same witness, on the same principal
defect — the strongest convergence anywhere in my portfolio.

1. **§6's `a = 1` case is not proved. UPHELD (`C-T2-F` F1 and `C-T2-U` F1, independently).** §6 sets
   `a := α(G[D]) = ⌈m/2⌉` with `m := |D|` and then labels its case "`a = 1` (`m = 1`, `D = {d}`)".
   `⌈m/2⌉ = 1` admits `m ∈ {1, 2}`. The omitted shape is `P_6`, a path whose two supports each carry
   exactly one leaf — it satisfies every degree constraint §5 derives in the `{1,1}` branch, and
   nothing in §5 or §6 excludes it. **The omission is not benign, and my own replay settles why.**
   On `P_6`: `α = 3`, `ℓ = 2`, `a = α(G[D]) = 1`, `M = i_α(G) = 4` while the number of maximum
   independent subsets of `D` is 2; `N_2 = 0` and `W_III = 0` (its only `(a−1)`-subset is `J' = ∅`,
   with `U(∅) = {s_1, s_2}` and fibre `2^2(2−2) = 0`), so the closed form returns **`S_closed = 0`**
   while the literal aggregate is **`S(P_6, 2) = +2`**. `P_6` is exactly a place where the route's own
   identity fails, and the only thing that kills it is `(★)`, which §6 never invokes at that point.
   I also confirm the same divergence on `P_8`, `P_10`, `P_12` (literal `−2, −12, −30` against
   closed-form `−4, −14, −32`), all non-residual — so `(★)` is load-bearing for the identity itself,
   not only for the family pruning. **Ruling: §6's theorem as written is not a complete proof; grade
   `conditional` on the missing exclusion.**
   **Repair, critic-attributed.** `C-T2-U`'s even-path lemma is the statement of record: *for
   `P_{2k}`, `k ≥ 2`, the set `{v_2, v_4, …, v_{2k}}` is independent, has size `k = α`, and omits the
   leaf `v_1`; hence every even path fails `(★)`.* I verified `P_4, P_6, P_8, P_10, P_12, P_14, P_16`
   non-residual by full enumeration of maximum independent sets. `C-T2-F`'s A2 states the same
   conclusion ("`(★)` and `ℓ = 2` force odd order, so `m = 2a − 1`") in equivalent form. **Both
   critics derived it independently in the same stage; I record it as critic-attributed jointly to
   `C-T2-U` and `C-T2-F`, with `C-T2-U`'s proof the one of record** because it exhibits the witness
   set explicitly and uses no graph hypothesis beyond the path shape. With it inserted, the `{1,1}`
   branch is odd paths only, `m = 2a − 1`, `a = 1 ⟺ m = 1 ⟺ G ≅ P_5`, and **§6's theorem and its
   Corollary close.** My census corroborates the conclusion: among 330 residual trees with `α ≥ 2` to
   order 12, `P_5` is the unique `S = 0` and `P_3` the unique `S > 0`.

2. **The gap does not propagate to Tier 1. UPHELD (`C-T2-F` F6), and I confirm.** §5's `ℓ = 2` bullet
   defers the sign to §6, so on the face of the return `(RC)` inherits the gap. It need not: in the
   `{1,1}` partition every support has `λ = 1`, so `C_2 = ∅`, `N_2 = 0`, and
   `S = −ℓ(ℓ−2)M − (ℓ−4)N_2 − W_III = 0 + 0 − W_III ≤ 0` by the fibre bound alone; in the `{2}`
   partition `G ≅ P_3`, which `hyp-eligible` excludes. That is exactly the finish
   `C1-ALLOCATION.md` item 1(f) prescribes. **(RC) at `ℓ = 2` is independent of §6.** The damage is
   confined to Tier 1′ and the equality characterization.

3. **The displayed algebraic line in §3 is false as printed. STRUCK (both critics, F3/F2).**
   `h = (a − |A_D|) + Σ_{s∈A_C}(λ(s) − 1)` together with the budget identity gives `2h = 1`. The
   correct rearrangement is `h = 1 − (a − |A_D|) − Σ_{s∈A_C}(λ(s) − 1)`. The identity below it is
   right — I re-derived it symbolically and verified budget exhaustiveness with 0 failures over every
   `B ∈ I_{α−1}` of all 330 residual trees — but a formalizer reading §3 literally is led into a
   contradictory goal. Struck.

4. **Two hypothesis-attribution errors. UPHELD (`C-T2-F` F2), and I reproduce the witness.**
   - §2.2's heading "(`hyp-tree` only)" is **false**: the corona factorization needs the
     leaf/support partition to be a partition, i.e. no two adjacent leaves, i.e. `hyp-alpha`.
     Witness `K_2`: `L = C = {0,1}`, and the §2.2 right-hand side evaluates to `1 + 4z + 3z²`
     against the true `I(K_2; z) = 1 + 2z`. I computed both. Restate as "`hyp-tree` and `hyp-alpha`
     (through Lemma 2.2)".
   - §2.3 attaches "`(★)` for the top-coefficient collapse" to the **conjunction** `α = ℓ + a` and
     `M = …`. **`α = ℓ + a` is `(★)`-free** (it follows from `|B| = |B∩L| + |A_C| + |A_D| ≤
     (ℓ − Q(A_C)) + |A_C| + a ≤ ℓ + a` with equality attained at `L ∪ J`); `(★)` is needed only for
     the second conjunct, that `M = i_α(G)` counts the maximum independent subsets of `D`, which
     fails on non-residual trees (`K_{1,3}`: `M = 3`, `D`-count 1; and `P_6`: `M = 4`, `D`-count 2,
     which I computed). `C-T2-F` verified `α = ℓ + a` on 985 trees with `α ≥ 2` to order 12 of which
     655 non-residual; I corroborate on the non-residual paths `P_4 … P_12`. **This is the single
     most consequential hypothesis-map correction in my portfolio for the Lean statement**, because
     a development that inherits the return's tags will carry `(★)` into a lemma that does not need
     it and mis-scope the one that does.

5. **§2.3's top-coefficient argument. STRUCK as a justification (both critics, F4/F5).** The
   parenthetical "`(★)` being TRUE for the fixed `G` under study means no maximum independent set of
   that shape exists" argues the term's absence from the set's absence. The sound argument is the
   preceding clause plus a step the return never states: degree `ℓ + a` **is attained** by `A = J`,
   **all coefficients are nonnegative so nothing cancels**, and a degree-`(ℓ+a)` term with `A_C ≠ ∅`
   would be a maximum independent set containing a support and omitting its leaf, which `(★)`
   forbids. `C-T2-U`'s phrasing is the one a formalizer should take.

6. **Smaller literals. STRUCK / NARROWED as the critics rule.** §6's hypothesis line ("`(★)` not yet
   assumed … beyond what's needed" followed immediately by "Under `hyp-tree`, `hyp-alpha`, `(★)`") is
   incoherent — the hypotheses are exactly the three, and `hyp-eligible` is correctly **not** among
   them, which is what makes the Corollary non-circular; that should be stated positively. §5's "the
   unique odd `n`" is false — every odd `n ≥ 5` gives a residual `ℓ = 2` path (I verified `P_5 … P_25`).
   §6's "strictly decreasing … on **both sides** of `a = 1`" has no other side inside the `{1,1}`
   family. §6's `a ≥ 2` bullet writes `S = −0 − 0 − W_III` without saying the middle zero is
   `(ℓ−4)N_2 = −2N_2` vanishing because `C_2 = ∅`. §2.2's citation of "3 additional non-flat stress
   trees (§7.2)" points at a replay-command block. Obligation 6's "(§3, `N_2 = 1`, `a = 0`)"
   mis-cites §3. §7.4's "`Δ_{x−1} ≥ 0` … checked in code by `crossing_index`'s own scan invariant" is
   definitional, not a check. §7.1's "timings went to stderr only, **discarded**" is inaccurate:
   `t2_driver.stderr.log` (100 B, `2fef4b63…a140f91`) persists in the seat's scratch, uninventoried,
   and carries the payload digest — both critics found it and `C-T2-U` reproduced it byte-for-byte.
   The *hashed payload* claim is unaffected and is backed.

7. **"`proved_conditional`" is not a grade. STRUCK (both critics).** `SOLUTION-CONTRACT.md` §4's
   ladder is `formally_verified` > `proved_informal` > `conditional` > `bounded_computation` >
   `conjecture`; `conditional` there means "explicit surviving premise", which misstates the route's
   own position. The grade the body earns for `(RC)` is **`proved_informal`** with Stage 7
   outstanding, which is what the return's own Grades table says; §6 as written is **`conditional`**
   on the even-path exclusion.

8. **Certification.** Both critics replayed `t2_engine.py` + `t2_driver.py` copy-out-first and
   obtained byte-identical output (`7555afaa…5bce87f5`) and the payload self-digest
   (`5f1561e8…d0dfd3`). The package is deterministic and carries no wall-clock, PID or host field. The
   disclosed background `O(2^n)` sweep left no output and supports no claim; both critics accept it
   as disclosed and I concur — the one claim it could have supported (the `P_3…P_81` eligibility
   scan) three instruments including mine reproduced independently from `i_k(P_n) = C(n−k+1, k)`.
   `C-T2-U`'s F4 stands: the return skipped the mandated 312-tree eligible fixed point and never
   computed an eligible census; that check is discharged by the critics and by me, **not** by the
   return.

### `T3` — `C1-T-03 RC-TREE-STRUCTURE-LEMMAS`

**Decision: retained, narrowed; all six lemmas are correct, two hypothesis sets are wrong in the
conservative direction, three certification literals are struck.**

Both critics independently re-derived all six lemmas with their own instruments and their own
enumerations, tested them three orders beyond the return's own check (987 tree classes, orders 1–12),
and extended lemmas (iii) and (v) to all simple graphs at small order (33,867 graphs to order 6;
1,099 graphs to order 5 with every vertex subset) — **0 failures everywhere**. Both verified every
Mathlib anchor at the cited file **and line** against the pinned `v4.32.2` project. I found no
mathematical error either.

1. **Lemma (iii) is stated with an unused hypothesis. UPHELD (both critics, F1/F2).** The proof uses
   only "a leaf has degree 1" and the definitions; **it holds for every finite simple graph with no
   hypotheses at all**. Drop `hTree`. This raises the lemma's Tier 3 standing and makes U3 item (d)
   a strictly stronger, more reusable statement at no cost.

2. **Lemma (iv) is over-hypothesised, and as recorded it does not discharge the run's own Lean
   target. UPHELD (both critics, F2/F1) — and this is the material one.** `λ(s) = 2` exhibits two
   distinct leaves adjacent to `s`, so `s ∉ {v_1, v_2}`, so `n ≥ 3` and `Nontrivial V` follow from
   the lemma's own hypotheses; `hyp-alpha` is never needed. `C1-ALLOCATION.md` item 9(e) states U3's
   Lean target as `G.IsTree → (leafSet G).card = 2 → leafDegree G s = 2 → G.indepNum = 2` with **no**
   `2 ≤ indepNum`. **T3's (iv) as written does not supply that statement.** `C-T3-U` adds the
   decisive corroboration that T3's own generator tests the ungated form (`check_lemma_iv` does not
   gate on `alpha >= 2`), so the script verifies something strictly stronger than the prose it ships
   to corroborate. **Ruling: the statement of record is (iv′) — for a finite tree with `|L| = 2` and
   some `s` with `λ(s) = 2`: `V = {v_1, s, v_2}`, `G ≅ P_3`, `α(G) = 2`, with `2 ≤ α` a conclusion,
   not a hypothesis.** Hypothesis correction critic-attributed jointly to `C-T3-F` and `C-T3-U`.

3. **`hyp-eligible ⟹ α`: a genuine paired-critic disagreement on strength, resolved claim by claim,
   not averaged.** `C-T3-F` F4 proves **`α ≥ 3`** by pure `ℕ` arithmetic with *no* graph hypothesis
   (`α ≤ 2 ⟹ α − 1 ≤ 1 < 2 ≤ x + 2`). `C-T3-U` F4 statement (E) proves **`α ≥ 4`** using
   `Δ_0 = i_1 − i_0 = n − 1 > 0` for `n ≥ 2`, hence `x ≥ 1`, hence `α − 1 ≥ 3`. `C-T1-F` A-2, in the
   T1 portfolio, reaches `α ≥ 4` by the same route, independently. **Both are true and neither
   supersedes the other:** `α ≥ 3` is hypothesis-free; `α ≥ 4` holds whenever `2 ≤ |V|`, which
   `hyp-alpha` supplies. **My replay:** no tree of orders 2–12 has `x = 0`, and the minimum `α` over
   the 846 eligible trees of orders ≤ 12 is **5**. **Ruling: the `α ≥ 4` form is the one of record**,
   because the strict Tier 1′ finish at `ℓ = 2` needs `a = α − 2 ≥ 2` and the extra unit is exactly
   what buys it; the hypothesis-free `α ≥ 3` form is recorded as the weaker, more portable version.
   Attribution: `α ≥ 3` to `C-T3-F`; `α ≥ 4` jointly to `C-T1-F` (A-2) and `C-T3-U` ((E)), two
   critics in different portfolios reaching it independently in the same stage. Both are **STATED**,
   critic-attributed, and need an isolated second read before registration. **Consequence: T3's own
   remaining-obligation 2a is discharged** — U3 item (f) is no longer a live dependency for T1's
   `ℓ = 2` finish at the informal level.

4. **Strike 1 (`C-T3-F`): §6's "cross-checked against `SEMANTIC-CONTRACT.md`'s stated values" for
   `P_3`, `P_5`, `P_7`. STRUCK, and I verify the ground.** I read the digest-verified
   `SEMANTIC-CONTRACT.md` in full: it contains no occurrence of `P_3`, `P_5` or `P_7` and states no
   `α` for any of them. The values are in `control/C1-ALLOCATION.md` item 2 and the worker brief. The
   three `α` values survive — I reproduced them.

5. **Strike 2 (`C-T3-F`): "producing byte-identical output" at both locations. STRUCK — and this is
   the one paired-critic disagreement on this route, which I resolve on replay.** `C-T3-F` strikes
   the literal with evidence; `C-T3-U` records it as "not independently checkable by me". **I checked
   it.** Copying both artifacts out first into my own scratch:
   `scratchpad/c1-T3-replay/verify_output.json` is **633 bytes**, digest
   `acc57356947a606b4263ca53e1c35af82f7809f2ca00ca98051e9aabdda6f70b`, and parses as JSON;
   `scratchpad/c1-T3/verify_output_n9.json` is **638 bytes**, digest
   `364ac01769d0e85b54690e92074ca812cc0d3626a4d115f76f3d7d43ea41e092`, is a strict superset carrying
   an appended `RC 0` line, and **fails to parse** (`Extra data: line 35 column 1`). The two outputs
   are **not** byte-identical; `C-T3-F` is right and its finding is upheld on my own replay. This is
   a return-code echo redirected into an inventoried artifact — the hygiene class the worker brief
   forbids — and the return never names the source-location artifacts at all. **The mathematics is
   unaffected:** the script is byte-identical across the two directories, both critics and I obtain
   the replay artifact exactly, and the internal report-body digest `45556fdd…c339` recomputes. Both
   critics also note the replay recipe omits the stdout redirection the digest requires; `C-T3-U`
   reproduced the digest by adding it.

6. **Strike 3 (`C-T3-F`): the quotation "inside the Mathlib package directory you may grep for lemma
   names", attributable to no file in that critic's grant, referred to me to settle.** I can settle
   it, though not the way the critic expected: `control/dispatch/c1-stage3/DISPATCH-T3.md` is not a
   member of my capsule either, so I did not read it. **The controller facts record settles it**
   (capsule design note `R26-N-13`): "The seat dispatch **wrappers** (Agent prompts) for T3/U1–U3
   granted Mathlib grep / manual bind wording **beyond the sealed DISPATCH files**; no mathematical
   effect." Weighing that as one more replay, and corroborating it by the sentence's absence from
   every capsule member I can read (`SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`,
   `C1-ALLOCATION.md`, `C1-STAGE1-GATE.md`, the adjudicator protocol): **ruling — the wording came
   from T3's Agent-prompt wrapper, not from a sealed control file. Strike the quotation marks and the
   attribution of "explicitly permitted" to a sealed document; the act stays inside the grant on the
   worker brief's own wording (Mathlib readable for API meaning, searches bounded by the grant, the
   Mathlib project within it); T3's "Read-boundary disclosure: None" is not disturbed.**

7. **Microgap in the two characterisations of `C(G)`. UPHELD and CLOSED (`C-T3-U` F3).** The
   semantic contract defines `C(G)` twice (`{s_v : v ∈ L}` and `{s : λ(s) > 0}`) and asserts their
   equality; the return uses the `λ > 0` form and then, in (iv) Step 1, writes "every leaf's support
   lies in `C(G)` by definition", which under the adopted definition needs `support_spec` (ENTRY 19)
   and `adj_iff_support_eq` (ENTRY 20). `C-T3-U` closes it unconditionally. The same elision in
   (vi) Step 3 is repaired by the same step.

8. **Lemma (v) coverage. NARROWED (`C-T3-U` F5).** §6 says the script "tests lemmas (i)–(vi) against
   every finite ordinary tree of order 1–9", but `check_lemma_v` tests exactly three subsets `U` per
   class (`D`, `C`, `V`) — and the load-bearing instance for T1 step (e) is `U = U(J) ⊆ C_1`, which
   is not generally among them. The sentence must read "for three named subsets `U` per class". The
   statement survives: both critics tested it over every subset of every class to order 12 and over
   every graph to order 5.

9. **Attribution. UPHELD (both critics, F7/F6): a registration precondition.** `E993-R26-DELETION-
   INJECTION` is mathematically clean — the injection is *proved*, nothing is imported — but
   `2 Σ_{A ∈ I(U)} |A| ≤ |U|·|I(U)|` **is** the occupancy bound `avi(H) ≤ |V(H)|/2` that
   `SOLUTION-CONTRACT.md` fence 7 names as Andriantiana–Razanajatovo Misanantenaina–Wagner (2020),
   and neither §5(v) nor the §7 alias table carries that line. The alias check was scoped to the 363
   registry claims, where the prior art does not appear, so the omission is structural, not careless.
   **Not a fence crossing — no status was imported — but the key may not be registered until the
   attribution travels on its face.**

10. **Smaller narrowings.** "the all-rank literal aggregate of which (RC) is the top-rank sub-case"
    (`C-T3-F` F6) should read "the `p = α−1` instance restricted to the residual class"; the
    unqualified word "sub-case" is exactly the wording that later licenses a `SOLUTION-CONTRACT.md`
    §3.1 status transfer, though the return's next sentence prevents any damage. "Used by T1's DAG
    … verbatim" (`C-T3-U` F7) is a claim about a sibling return T3 could not read; its warrant is
    `C1-ALLOCATION.md` item 1, which it matches accurately — restate as "the allocation's DAG for
    T1". The import list names `heapq` as top-level when it is imported inside `pruefer_decode`
    (a superset, i.e. the honest direction). The headline flag token occurs twice in the return
    (§4 inline, §9 as the flag line of record) — cosmetic; the Stage 3 admission rule was satisfied
    and admission found nothing.

11. **Fixed-point obligation. NARROWED (`C-T3-F` F10).** §6 reports `α` and `ℓ` only, with no `x`,
    `S` or eligibility, and declares the `x`/`Δ_k`-per-row requirement "not applicable". The
    declaration is defensible — T3's mechanism is tree-structural and it flagged rather than skipped
    silently — but the fixed-point check as shipped exercises neither the first-strict-descent
    convention nor the aggregate, so it cannot catch the error class those fixed points exist to
    catch. **Credit where it is due: because the return makes no eligibility statement about `P_7` at
    all, it is the one seat in my portfolio that does not repeat the controller's mislabel.** The gap
    is closed by the critics and by me, not by the return.

12. **Route verdict `proved`, at T3's own scope (the six lemmas), is retained.** It says nothing
    about `(RC)`, and the return is explicit that it does not prove, weaken or bound it.

---

## Cross-route reconciliation

Six items that only a reader of all three returns and all six critiques can settle.

1. **The "322" and the "31" are the same object at different order bounds — not a disagreement.**
   `C-T1-F` reports 322 triples `(G, B, A_C)` escaping `L5`'s literal families over trees of order
   ≤ 12; `C-T1-U` reports 31 shells over order ≤ 10, with the minimal witness at order 7. My
   instrument returns **322 at orders ≤ 12 and 31 at orders ≤ 10**, with `C-T1-U`'s exact minimal
   witness (order 7, edges `{01,02,03,14,15,26}`, `B = {1,2,3}`, `A_C = {1,2}`). Both critics are
   right; the counts are reconciled, not averaged, and **0** of them is residual in either range.

2. **The "83" and the "34" family-(II) witnesses are likewise the same object at different bounds.**
   `C-T2-F` A3 reports 83 residual trees with `N_2 > 0` and `a ≥ 1` to order 12; `C-T2-U` reports 34
   to order 11. Both name the **same minimal witness** at order 8, edges
   `{01, 02, 03, 14, 15, 26, 67}` (`ℓ = 4`, `a = 1`, `M = 1`, `N_2 = 1`, `k_2 = 1`, `W_III = 8`,
   `S = −16`). Consistent. T2's own remaining-obligation item 6 is **discharged** by either.

3. **T1 and T2 do *not* give two independent derivations of the budget identity, and the returns'
   and critics' language should be narrowed accordingly.** `C-T2-F` F7 and `C-T2-U` both flag T2's
   "agree **symbol by symbol**" as a claim about a sibling return T2 could not check; both defer it
   to the adjudicator. **I settle it.** The two routes *do* reach the same identity
   `−S = ℓ(ℓ−2)M + (ℓ−4)N_2 + W_III` with the same named quantities, and the family definitions
   coincide with `SEMANTIC-CONTRACT.md` §4 term for term. But **T2's §3 budget derivation is the same
   size-equation algebra as T1's `L4`, not a generating-function derivation** — it substitutes
   `|B| = |A_C| + |A_D| + |B∩L| = ℓ + a − 1` into `h := ℓ − Q(A_C) − |B∩L|`, which is exactly T1's
   step. T2's genuinely distinct mechanism is **§2.2–§2.3** (the corona factorization
   `I(G;z) = Σ_A z^{|A|}(1+z)^{ℓ−Q(A)}` and the top-coefficient extraction giving `α = ℓ + a` and
   `M`), which `C-T2-F` verified coefficient-by-coefficient on 985 trees and `C-T2-U` on 32.
   **Ruling: mechanism-independent at §2.2–§2.3; algebraically the same at §3.** The convergence at
   §3 is still strong evidence — the two seats wrote in isolation and seven instruments agree
   numerically — but it is *convergent*, not mechanism-independent, and a synthesis must not sell it
   as two independent proofs of the budget identity.

4. **Four accounts of the `ℓ = 2` branch; one dominates.** T1's `L11a` (path classification by the
   degree-sum equality, then `P_3`); T2's §5/§6 (path classification, then the `a`-case split);
   `C-T1-F`'s A-3 (`a = α − 2 ≥ 2` from `α ≥ 4`, delete one element of a maximum `J`, giving
   `W_III ≥ 2` hence `S ≤ −2`); and `C-T2-F`'s A1 (an **exact** closed form). **A1 dominates:** on
   the `ℓ = 2` residual class with both supports of leaf-degree 1, `G ≅ P_{2a+3}`, `M = 1`,
   `N_2 = 0`, and `W_III = 2(C(a+1,2) − 1) = (a−1)(a+2)`, hence `S = −(a−1)(a+2)`. **I verified this
   exactly on `P_5 … P_25`: `0, −4, −10, −18, −28, −40, −54, −70, −88, −108, −130`, term for term.**
   A1 subsumes A-3 (which gives only `W_III ≥ 2`) and makes both the `a = 1` equality and the
   `a ≥ 2` strictness immediate, replacing §6's existence argument with a count. A1 depends on the
   even-path lemma (item 2 of the T2 decision) and, for the *eligible* conclusion, on `α ≥ 4`.
   **The `ℓ = 2` package of record is: even-path lemma (`C-T2-U`) + `α ≥ 4` (`C-T1-F` A-2 /
   `C-T3-U` (E)) + closed form (`C-T2-F` A1).** All three are critic-attributed, all three are
   STATED, and all three need an isolated second read before registration.

5. **Four proofs of "`ℓ = 2` and some `λ(s) = 2` forces `P_3`"; the shortest for Lean is not the
   route's.** T1's `L11a` uses the degree-sum equality plus a path classification; T3's lemma (iv)
   uses **two nested** `Connected.induce_compl_singleton_of_degree_eq_one` steps (a subtype of a
   subtype, with `Fintype (neighborSet ·)` instances re-derived at each level — `C-T3-F` names this
   as the only real Lean cost in the six lemmas); `C-T1-U`'s F4 replaces the path classification with
   one leaf deletion and a reuse of `leaf_card_ge_two`; `C-T3-F`'s remaining-obligation 2 observes
   that after `deg(s) = 2` and `N(s) = {v_1, v_2}`, the set `{v_1, s, v_2}` is closed under `G.Adj`,
   so connectivity alone gives `V = {v_1, s, v_2}` with **no second `induce` at all**. **Ruling: the
   statement of record is (iv′) (no `hyp-alpha`, so U3(e) is discharged), and the Lean route of
   record is the adjacency-closure argument, with `C-T1-U`'s leaf-deletion variant as the fallback.
   T3's nested `induce` should not be the shape that goes to Stage 7.** `C-T1-F`'s F-4 adds the
   correct warning that whichever route is taken must consume **connectivity** explicitly — the
   degree sum is `2(n−1)` for a tree and `2(n−c)` for a forest, and `C-T3-F` exhibits `P_3 + K_1` as
   the witness where the closure fails. I verified it: on `P_3 + K_1` the isolated vertex is not a
   leaf under `IsGraphLeaf` (degree 0), `(★)` **holds** (unique maximum set `{1,2,3}`), and yet
   `α = 3 ≠ 2` and `V ≠ {v_1, s, v_2}`. 207 such acyclic disconnected witnesses exist at order ≤ 7.

6. **Overlaps between the three routes are corroboration, not duplication, with one exception.** The
   deletion injection is proved four times over (T1 `L10`, T2 §3, T3 (v), plus both T3 critics) by
   the same argument; **T3's (v) is the sharpest statement** (arbitrary finite graph, over a
   `Finset U`, no tree hypothesis) and is the one to carry. The forced-neighbour lemma has exactly
   two route derivations (T1 `L6`, T2 §3, the same contradiction) — T3 explicitly excludes it from
   scope, so `C-T2-U`'s remaining-obligation 6 ("cross-route confirmation is still owed … an
   adjudicator should compare the two statements") is **discharged here: the two statements are
   identical and both proofs are correct.** `α = ℓ + a` and the maximum-set bijection *are*
   genuinely doubly derived — T1 `L3` and T3 (vi) by the direct bijection, T2 §2.3 by the
   generating function's top coefficient — which is the one place in this orientation where two
   mechanisms independently deliver the same structural fact.

---

## Established results

Established **at this orientation's evidence grade**, at the literal scope of `SEMANTIC-CONTRACT.md`
§§1–3 and subject to every fence of `SOLUTION-CONTRACT.md` §3. Nothing below transfers status to the
all-rank aggregate `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN — other ranks and the whole
non-residual class untouched), to `E993-BETA-AGG` (OPEN, `RTree` carrier, transport never attempted),
to the common-leaf condition, TREE, FOREST, TRANSFER or Erdős #993. All three routes and all six
critics checked this fence independently and all found it clean; I confirm from the returns' and
critiques' own text. Nothing here is registered: everything is **STATED** at Stage 5 and needs the
isolated second read `SOLUTION-CONTRACT.md` §4 requires.

| # | Result | Hypotheses consumed | Grade / attribution |
|---|---|---|---|
| **E1** | **(RC): `S(G, α−1) ≤ 0`** for every finite ordinary tree with the four C5-LA1 hypotheses | `hyp-tree`, `hyp-alpha`, `hyp-eligible` (only through `α ≥ 3`), `(★)` | `proved_informal`, route-attributed to `T1` (chain `L0`–`L11` with `L5 → L5′+L5″`); independently re-derived by `C-T1-F`, `C-T1-U` and by this adjudication; `T2` reaches the same conclusion by a mechanism independent at §2.2–2.3 |
| **E2** | The exact remainder identity `−S = ℓ(ℓ−2)M + (ℓ−4)N_2 + W_III` | as E1 | `proved_informal`; route-attributed to `T2` §3 and, independently, **critic-attributed to `C-T1-F` (A-1)**; verified by me as an exact integer identity on 330/330 residual trees, 0 failures |
| **E3** | `α = ℓ + a` with `a = α(G[D])`; and `M = i_α(G)` counts the maximum independent subsets of `D`, via the mutually inverse `S ↦ S∖L` / `J ↦ L ∪ J` | **`α = ℓ + a`: `hyp-tree`, `hyp-alpha` only** — `(★)`-free (`C-T2-F` F2b). **`M`'s characterization: additionally `(★)`** | `proved_informal`; doubly derived (`T1` `L3` / `T3` (vi) directly; `T2` §2.3 by the top coefficient, once the no-cancellation step of `C-T2-U` F5 is inserted) |
| **E4** | **Forced-neighbour:** under `(★)`, every maximum independent `J ⊆ D` meets `N(s)` for every `s ∈ C_1` | `hyp-tree`, `hyp-alpha`, `(★)` | `proved_informal`; `T1` `L6` and `T2` §3, identical statements and proofs (reconciliation item 6); 0 failures on 330 in my replay |
| **E5** | **Budget identity** `(a−|A_D|) + Σ_{s∈A_C}(λ(s)−1) + h = 1`, every term in `ℕ`, with `h ≥ 0` a *lemma*; plus the corrected trichotomy **`L5′`** and the pruning **`L5″`** | identity: `L1`, `L3` (no new hypothesis). `h ≥ 0`: independence of `B`. `L5′`: arithmetic. **`L5″`: `hyp-residual` via `L6`** | `proved_informal`; identity route-attributed to `T1` `L4`/`T2` §3; **the `L5′`/`L5″` split is critic-attributed to `C-T1-F` and `C-T1-U`** |
| **E6** | Exact family sums `W_I = ℓ(ℓ−1)M`, `W_II = (ℓ−4)N_2`, `W_III = Σ_{J'∈I_{a−1}(D)} Σ_{A∈I(U(J'))}(ℓ−2\|A\|)`; family (III) provably **empty** at `a = 0` | as E5 plus `L5″` | `proved_informal`, `T1` `L7`–`L9` / `T2` §3; 0 failures on 330 |
| **E7** | **Deletion injection:** for any finite graph and `U : Finset V`, `2 Σ_{A∈I(U)} |A| ≤ |U|·|I(U)|`; corollary `Σ_{A∈I(U)}(ℓ−2|A|) ≥ (ℓ−|U|)|I(U)| ≥ 0` in `ℤ` when `|U| ≤ ℓ` | **none** (no tree, no connectivity) | `proved_informal`; `T3` (v) is the sharpest statement; re-proved in-run, **not imported** (fence 7 satisfied). **Registration blocked until ARMW (2020) attribution travels on its face** |
| **E8** | Tree-structural inputs (i) `2 ≤ α ⟹ 3 ≤ n ∧ ℓ ≥ 2`; (ii) no two adjacent leaves, `L ∩ C = ∅`, `λ = 0` on `L ∪ D`; **(iii) at no hypotheses**: disjoint leaf fibres, `Σ_s λ(s) = ℓ`, `|C_1| ≤ ℓ`, `k_2 ≤ ⌊ℓ/2⌋`; **(iv′) without `hyp-alpha`**: `ℓ = 2 ∧ ∃s λ(s)=2 ⟹ V = {v_1,s,v_2} ∧ α = 2` | as tabulated; connectivity load-bearing in (i) and (iv′) | `proved_informal`, `T3`; **hypothesis corrections critic-attributed to `C-T3-F` and `C-T3-U`**; 0 failures on 987 classes to order 12 and on all graphs to order 6 for (iii) |
| **E9** | `hyp-eligible ⟹ α ≥ 3` (hypothesis-free) and `hyp-eligible ⟹ α ≥ 4` (given `2 ≤ |V|`, via `Δ_0 = n−1 > 0 ⟹ x ≥ 1`) | none / `2 ≤ |V|` | `proved_informal`, **critic-attributed**: `α ≥ 3` to `C-T3-F` (F4); `α ≥ 4` jointly to `C-T1-F` (A-2) and `C-T3-U` ((E)). `α ≥ 4` is the form of record |
| **E10** | **Every even path `P_{2k}`, `k ≥ 2`, fails `(★)`** (witness `{v_2,…,v_{2k}}`, size `k = α`, omitting the leaf `v_1`); hence `ℓ = 2` + `(★)` ⟹ odd path | `hyp-tree`, `(★)` | `proved_informal`, **critic-attributed jointly to `C-T2-U` and `C-T2-F` (A2)**; verified by me on `P_4 … P_16` |
| **E11** | On the `ℓ = 2` residual class with both supports of leaf-degree 1: `G ≅ P_{2a+3}`, `M = 1`, `N_2 = 0`, `W_III = (a−1)(a+2)`, hence **`S = −(a−1)(a+2)`** | `hyp-tree`, `hyp-alpha`, `(★)`, `ℓ = 2`, E10 | `proved_informal`, **critic-attributed to `C-T2-F` (A1)**; verified exactly by me on `P_5 … P_25` |
| **E12** | **`S(G, α−1) = 0 ⟺ G ≅ P_5`** on the residual class with `α ≥ 2` | `hyp-tree`, `hyp-alpha`, `(★)` (**not** `hyp-eligible`) | route-attributed to `T2` §6; **`conditional` as written**, `proved_informal` once E10 is inserted |
| **E13** | **Strict form (stronger than Tier 1′): `S(G, α−1) < 0` on the *entire* eligible top-rank residual class**, including `ℓ = 2` | the four hypotheses; needs E9 (`α ≥ 4`) and E10/E11 at `ℓ = 2` | `proved_informal`, **critic-attributed to `C-T1-F` (A-3)** with the `ℓ = 2` branch also exact from E11; `C-T1-U` F5 independently states the weaker Tier 1′ shape (`ℓ ≥ 3`) and defers ownership to `T2` |
| **E14** | `P_3` is the **unique** residual tree with `α = 2`, hence the unique residual tree with `S > 0` (trees are bipartite, `α ≥ n/2`, so `α = 2 ⟹ n ≤ 4`; `P_4` fails `(★)`) | `hyp-tree`, `(★)` | `proved_informal`, **critic-attributed to `C-T1-F` (A-4)**. This is F3's chartered item (a) as a theorem; **ownership deferred to F3 and the F adjudicator** |
| **E15** | Record correction: **`P_7` is NOT eligible** (`x = 2`, `α = 4`, `x+2 = 4 > 3 = α−1`); its `(α, x, S) = (4, 2, −4)` are correct; the first eligible odd path is **`P_11`** | — | `bounded_computation` for the scan, exact for the single case; caught by `T1` §4 and `T2` §8, = controller erratum `R26-E-b` |
| **E16** | `C(G)`'s two contract characterisations (`{s_v : v ∈ L}` and `{s : λ(s) > 0}`) are equal, via `support_spec` / `adj_iff_support_eq` | none | `proved_informal`, **critic-attributed to `C-T3-U` (F3)** |

**Compiled fragments (sorry-free or with `sorry`): none.** No seat of orientation T is a Lean seat;
`T1`, `T2` and `T3` compiled nothing, attempted no `lake` build, and each says so without hedging.
There is therefore **no `#print axioms` output, no kernel receipt and no `sorry` ledger to audit in
this portfolio**, which removes the largest certification-risk class this run has — and which is
also exactly why Lean readiness below is a "yes on the informal side, zero on the formal side"
ruling. The one formal object this orientation relies on, `(RI)` = `C5LA1.topRankResidualIdentity`,
is the r24 award; `C-T1-U` audited its receipts inside the authorized `sources/` grant
(`axiom_policy passed`, `incomplete_proof_scan passed`, `source_sha256_before = after =
0933211d…696b63b`, axioms exactly `[propext, Classical.choice, Quot.sound]`) and confirmed that the
statement T1 uses matches the kernel-verified declaration term for term with all four hypotheses
verbatim. **The composition base is sound and no seat misquoted it.**

**Bounded computations (corroboration only; `SOLUTION-CONTRACT.md` §3.3).** 330 residual trees with
`α ≥ 2` and 312 eligible residual trees (orders 7–12: 4, 5, 17, 39, 80, 167) at orders ≤ 12; no
eligible tree with `S ≥ 0`, maximum eligible `S = −12`; `P_3` the unique `S > 0` and `P_5` the unique
`S = 0` on the residual class; the flat law `S = −ℓ(ℓ−2) − k_2(ℓ−4)` on all 41 flat residual members
(and, I note, it *fails* on non-residual double stars with a `λ = 1` support — it is a residual-class
law, not a flat-graph law). **None of this carries any proof weight and none of it enters any grade
above.** Every route and every critic labelled its census correctly; the one residue — T1 §7 listing
"stress-tested against 312 … with zero failures" among the grounds for its grade — is corrected here
per both T1 critics.

---

## Rejected and narrowed mechanisms

**Rejected as stated (the mathematics survives in repaired form; nothing here is a refuted
mechanism in the `SOLUTION-CONTRACT.md` §3.6 sense).**

| Object | Ruling |
|---|---|
| `T1` `L5` as written — family (II) singleton "by pure `ℕ`-arithmetic from `L4`" | **REJECTED.** 322 arithmetic escapees at orders ≤ 12, 31 at ≤ 10, 0 residual; minimal witness order 7. Replaced by `L5′` + `L5″` |
| `T1` shipped DAG node `R26LA1.family_classification [L5] pure arithmetic from L4` | **STRUCK.** Replace with `R26LA1.budget_shapes` (arithmetic) and `R26LA1.family_support_pruned` (consumes `hyp-residual` via `forced_neighbour`) |
| `T2` §6's `a = 1 ⟹ m = 1` step | **REJECTED.** `⌈m/2⌉ = 1` admits `m = 2`; the omitted shape `P_6` evaluates to `S_closed = 0` on §6's own algebra while the literal `S = +2`. Repaired by E10 |
| `T2` §3's displayed `h = (a−|A_D|) + Σ(λ−1)` | **STRUCK** — with the budget identity it gives `2h = 1` |
| `T2` §2.2's heading "(`hyp-tree` only)" | **STRUCK** — needs `hyp-alpha`; `K_2` witness, RHS `1+4z+3z²` vs true `1+2z` |
| `T2` §2.3's "(★) being TRUE … means no maximum independent set of that shape exists" | **STRUCK as a justification** (circular phrasing); the no-cancellation step must be added |
| `T2` §2.3's `(★)` tag over `α = ℓ + a` | **NARROWED** — `(★)` covers only the `M` conjunct |
| `T2`'s route-verdict word `proved_conditional` | **STRUCK** — not on the §4 ladder; `proved_informal` for (RC), `conditional` for §6 as written |
| `T2` §5's "the unique odd `n`" | **STRUCK** — every odd `n ≥ 5` gives a residual `ℓ = 2` path |
| `T1` §4's "`SEMANTIC-CONTRACT.md` … asserts `P_7` eligible" | **STRUCK** — that file has no `P_7` and no fixed-point table; the mislabel is in `C1-ALLOCATION.md` item 2 and the worker brief |
| `T1` §4's leg (iii) (the packet's `RC-CANDIDATE-CHECK.json` as an evidential leg) | **STRUCK** under Gate ruling 2; legs (i)+(ii) and three independent instruments carry the finding |
| `T3` §6's "cross-checked against `SEMANTIC-CONTRACT.md`'s stated values" | **STRUCK** — mis-cited authority; the `α` values survive |
| `T3` §6's "producing byte-identical output" at both locations | **STRUCK on my own replay** — 633 B / `acc57356…` (parses) vs 638 B / `364ac017…` (`RC 0` appended, fails to parse) |
| `T3` §8's quotation "inside the Mathlib package directory you may grep for lemma names" as a sealed-document grant | **STRUCK as an attribution** (it is dispatch-wrapper wording, `R26-N-13`); the act stays in grant and the "None" disclosure stands |

**Narrowed (content retained).** `T1` `L0`'s billing as *the* `ℕ`-subtraction audit (`ℓ−2`, `ℓ−4`,
`α−1` absent); `T1`'s "Debt: none of `L0`–`L11` has an unclosed step" → "after the `L5` repair";
`T1` §4's novelty framing; `T1`'s obligation-(3) prediction about F2's error class; `T1`'s import
list; `T1`'s digest recipe (integer keys); `T2`'s "symbol by symbol" agreement with `T1` → agreement
at the identity and family sums, mechanism-independent only at §2.2–2.3; `T2`'s stderr-discarded and
stress-tree citations; `T3` (iii)'s and (iv)'s recorded hypothesis sets; `T3` §6's lemma-(v)
coverage sentence; `T3` §4's "sub-case" wording; `T3`'s "Used by T1's DAG verbatim" → "the
allocation's DAG for T1".

**Falsification attempts that failed (recorded so the perimeter is visible, and as bounded evidence
only).** `C-T1-F` F-10 attempted a counterexample under `SOLUTION-CONTRACT.md` §3.4 across all 312
eligible residual trees and every odd path to `P_41`: none. `C-T2-F`, `C-T2-U`, `C-T3-F`, `C-T3-U`
searched for a second `S = 0` witness, any `S > 0` beyond `P_3`, a family escapee on the residual
class, a forced-neighbour failure, a negative fibre, a broken bijection, a circular step, a smuggled
hypothesis, and a failure of `N_2 ≤ k_2 M` or `k_2 ≤ ⌊ℓ/2⌋`: none. My own instrument, built
independently, reproduces every one of those negatives. **No counterexample is claimed anywhere in
this orientation, no positive summand inside a nonpositive `S` is treated as one, and no null search
is offered as a proof** — fence 4 and fence 3 are clean on all three routes.

**Fences 1, 5, 6 across the portfolio.** No status transfer anywhere (fence 1): every route names
`E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` and `E993-BETA-AGG` as OPEN and untouched before any
census, and neither TREE, FOREST, TRANSFER, the common-leaf condition nor Erdős #993 is claimed for.
The sealed r24 record is untouched (fence 5): no route edits a sealed file, `T2` and `T3` never
mention the "1,420 realized" statement at all, and `T1`'s single fence-adjacent sentence is narrowed
above rather than allowed to stand as a Tier 2 finding — **that record is F2's object and the F
adjudicator's ruling, and nothing in my orientation should be read as bearing on it.** No refuted
mechanism is reopened (fence 6): pointwise β, support-fibre β, all-cut Hall, universal tree
log-concavity and `E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` appear nowhere, and both alias
checks (T1's field-scoped and T3's whole-record) plus three independent critic scans over all 363
identities return zero collisions. `E993-R26-TOP-RANK-RESIDUAL-SIGN` is confirmed a genuinely new
key and a proper restriction of the still-OPEN all-rank aggregate.

---

## Lean readiness

This is the cycle's central ruling for orientation T. I take `(RC)` at the **exact** statement of
`SOLUTION-CONTRACT.md` §2 — `R26LA1.topRankResidualSign` with `crossingIndex` and `aggregate` the
C5-LA1 definitions, all four hypotheses verbatim, conclusion `aggregate G (G.indepNum - 1) ≤ 0`,
composed with `C5LA1.topRankResidualIdentity` in the same project with the C5-LA1 source carried
byte-identically — and I ask the protocol's three questions.

**(a) A complete informal proof at statement-level granularity with a closed dependency DAG?
YES — after the `L5` repair, and only after it.** The DAG below is closed: every node's hypotheses
are named, no node is conditional on an unproved premise, no node is a census or a fixed-band result,
and the one dependency T1 declared "named, not borrowed" (`hyp-eligible ⟹ α ≥ 3`) is now closed by
E9. `(RI)` enters only as the r24 formally verified award, whose receipts `C-T1-U` audited. I
verified the chain myself, step by step, and separately on 312/312 by direct computation.

```
DEFINITION LAYER (absent from T1's shipped DAG — C-T1-U F3.1; seven new defs)
  R26LA1.C, R26LA1.D, R26LA1.a, R26LA1.C₁, R26LA1.C₂, R26LA1.N₂, R26LA1.U, R26LA1.w
  (λ = C5LA1.leafDegree, L = C5LA1.leafSet, support, indepSetsAvoiding, indepSetCount,
   forwardDifferenceDel, crossingIndex, aggregate, H, R are C5-LA1's and are reused by name)

STRUCTURE
  leaf_support_disjoint            E8(ii)   hyp-tree, hyp-alpha          [connectivity]
  leaf_degree_sum_eq_card          E8(iii)  NO HYPOTHESES
  c_eq_support_image               E16      none
  leaf_card_ge_two                 E8(i)    hyp-tree, hyp-alpha          [connectivity]
  k2_le_ell_div_two                E8(iii)  none                         ** missing from T1's DAG **
  eligible_imp_alpha_ge_four       E9       2 ≤ |V|                      ** missing from T1's DAG **
  alpha_eq_ell_add_a               E3       hyp-tree, hyp-alpha          (★)-FREE
  max_indep_eq_leaf_union_D        E3       + hyp-residual
  M_eq_card_maxIndep_D             E3       + hyp-residual
  forced_neighbour                 E4       hyp-tree, hyp-alpha, hyp-residual

COUNTING
  h_nonneg                         E5       independence of B            ** own node (C-T1-U F3.5) **
  budget_identity                  E5       L1, L3 — pure Finset.card once h_nonneg is split out
  budget_shapes  (= L5′)           E5       arithmetic only
  family_support_pruned (= L5″)    E5       forced_neighbour  ⟹ hyp-residual
  family_I_weight                  E6       W_I = ℓ(ℓ−1)M
  family_II_weight                 E6       W_II = (ℓ−4)N₂
  family_III_bijection             E6       on the CONTRACT CARRIER, not SimpleGraph.induce
  deletion_injection               E7       none — stated over indepSetsAvoiding G Wᶜ
  fibre_nonneg                     E7       deletion_injection, |U| ≤ ℓ
  N2_le_k2_mul_M                   E6       k2_le_ell_div_two            ** missing from T1's DAG **

FINISH
  ell_two_lambda_two_imp_alpha_two (iv′)    hyp-tree, ℓ=2, ∃s λ(s)=2     [connectivity; no hyp-alpha]
  finish_sign_bound                E1       all of the above; hyp-eligible used only via α ≥ 3
  R26LA1.topRankResidualSign       TARGET   finish_sign_bound ∘ C5LA1.topRankResidualIdentity
```

**(b) Compiled fragments covering named DAG nodes sorry-free? NONE — zero, from this orientation.**
`T1`, `T2` and `T3` are not Lean seats, none attempted a build, none ships a `.lean` file, a `lake`
log or a `#print axioms` output, and all three say so explicitly. `T3` states outright that it spent
its budget on six complete Mathlib-anchored informal proofs rather than a partial `sorry`-laden
skeleton; I record that as the right call for its charter and not as a debt it concealed. Whatever
compiled fragments exist in this cycle belong to seats `U1`–`U3`, which are outside my portfolio and
on which I say nothing.

**(c) Named open nodes.** *Mathematically:* **none** in the (RC) chain after the `L5` repair. Two
*neighbouring* statements carry named open steps until their critic-supplied lemmas are inserted and
second-read: E12 (`S = 0 ⟺ P_5`) needs E10; E13 (the strict form) needs E9 and E10/E11. *Formally:*
**every node above is open**, which is the whole of the debt.

### Award groups contract-ready

| Group | Exact statement | Hypotheses | Fences | Ready? |
|---|---|---|---|---|
| **AG-T1 — `(RC)`** | `theorem topRankResidualSign (G : SimpleGraph V) [DecidableRel G.Adj] (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) (hEligible : crossingIndex G + 2 ≤ G.indepNum - 1) (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) → S.card = G.indepNum → v ∈ S) : aggregate G (G.indepNum - 1) ≤ 0` | all four verbatim; `hyp-eligible` retained in the statement of record per Gate ruling 5 even though the proof consumes it only through `α ≥ 3` | §3.1 (no transfer to the all-rank aggregate, `E993-BETA-AGG`, transport, TREE/FOREST, #993); §3.2 (`P_3`/`P_5` excluded by `hyp-eligible`, not by `(★)`); §3.3 (the census carries no weight); §3.7 (lane 05 and r24 `C-T1-U` B3 attributions must travel) | **CONTRACT-READY as an informal statement-level DAG with a closed dependency graph. NOT formally ready: zero compiled nodes in this orientation.** This is the award group I name for my orientation |
| **AG-T2 — deletion injection** | For `U : Finset V` and `I(U) := U.powerset.filter (G.IsIndepSet ·)`: `2 * ∑ A ∈ I(U), A.card ≤ U.card * (I(U)).card`; corollary `(∑ A ∈ I(U), ((ℓ : ℤ) − 2 * A.card)) ≥ 0` when `U.card ≤ ℓ` | **none** | §3.7: **must carry Andriantiana–Razanajatovo Misanantenaina–Wagner (2020) on its face**; re-proved in-run, never imported | **CONTRACT-READY**, standalone with material reuse. Registration blocked on the attribution line only |
| **AG-T3 — `α = ℓ + a` and the maximum-set bijection** | `G.indepNum = (leafSet G).card + a` with `a = α(G[D])` (**`(★)`-free**); and, under `(★)`, `S ↦ S∖L` / `J ↦ L ∪ J` are mutually inverse, so `indepSetCount G ∅ G.indepNum` counts the maximum independent subsets of `D` | split as stated — this is the hypothesis-map correction of `C-T2-F` F2b | §3.1; carrier discipline: state over `indepSetsAvoiding G Dᶜ`, never `SimpleGraph.induce` | **CONTRACT-READY** |
| **AG-T4 — tree-structural set** | (i), (ii), **(iii) at no hypotheses**, **(iv′) without `hyp-alpha`** | as tabulated in E8; connectivity explicit in (i) and (iv′) | §3.1 | **CONTRACT-READY.** Per Tier 3 I recommend (iii) and (iv′) as standalone candidates (material reuse; (iv′) is the sole structural gate on the `ℓ = 2` branch) and (i), (ii) as living inside the (RC) proof |

**NOT ready, and why.** **Tier 1′ (the strict form, E13)** — true, and stronger than the contract's
own Tier 1′ wording (no `ℓ = 2` exception), but it rests on three **critic-derived** steps (E9, E10,
E11) each first stated at Stage 4 and none yet second-read; `SOLUTION-CONTRACT.md` §4 requires an
isolated second read before registration. **E12 (`S = 0 ⟺ P_5`)** — `conditional` as `T2` wrote it;
`proved_informal` only with E10 inserted. **E14 (`P_3` unique with `α = 2`)** — correct, but it is
F3's chartered item and ownership is deferred. **A fixed-band or bounded result never qualifies, and
a repackaged identity never qualifies**: I record explicitly that the 312-tree census, the flat law
`S = −ℓ(ℓ−2) − k_2(ℓ−4)` (a fixed-subclass law at `D = ∅`), the `T_m` family values and the odd-path
closed form E11 are **not** award candidates for `(RC)` — E11 is a genuine theorem on the `ℓ = 2`
class and is carried as such, not as a route to the general statement; and `(RI)` is the r24 award,
not this run's.

**The smallest unproved lemma.** There is none in the informal chain. **The smallest *unformalized*
node, and the binding obligation, is the pair `R26LA1.family_III_bijection` together with
`R26LA1.fibre_nonneg`, restated on the contract carrier.** All three of T1, `C-T1-F` and `C-T1-U`
independently identify these as the two most Lean-labour-intensive nodes (nested `Finset.sum` over a
`Finset`-indexed family of independent-set families), and I agree. `C-T1-U`'s carrier finding is what
makes them tractable and is the single most consequential correction to Lean readiness in my
portfolio: the return works with induced subgraphs `T[D]`, `T[U(J')]` and writes `α(T[D])`,
`i_a(T[D])`, `I(T[U(J')])`, but `SEMANTIC-CONTRACT.md` §1 is explicit that "every 'deletion' is a
deletion SET on the original type". The translation is `I_k(T[D]) = indepSetsAvoiding G Dᶜ k` and
`I(T[U(J')]) = ⋃_k indepSetsAvoiding G (U(J'))ᶜ k`, valid because a subset of `D` is independent in
the induced graph exactly when it is independent in `G`. **Three of T1's nodes are stated
off-contract and `deletion_injection` is stated in a shape that cannot be applied at `U(J')` without
a transport the carrier discipline was written to avoid.** Numerically identical; formally, this is
the difference between a DAG a formalizer can compile and one that pushes him into
`SimpleGraph.induce`.

**Overall Lean-readiness ruling for orientation T.** The informal side is **ready**: one closed DAG,
one award group at the exact §2 statement, every node's hypotheses named, every `ℕ`-subtraction
identified (once `ℓ−2`, `ℓ−4`, `α−1` are added to `L0`), the carrier discipline restatable, and the
definition layer enumerated. The formal side is **empty**: zero compiled nodes, zero receipts, zero
axiom outputs. `(RC)` is therefore in exactly the state `SOLUTION-CONTRACT.md` §5(c) describes —
proved informally with a closed dependency DAG, with Stage 7 blocked on a **bounded and now
precisely named** formalization obligation.

---

## Progress and plateau assessment

`material_progress: yes`

`orientation_plateau: no`

Entering Cycle 1, `(RC)` was OPEN on the non-flat class: proved informally only on the flat subclass
(`S = −ℓ(ℓ−2) − k_2(ℓ−4)`, r24 route-attributed) and on the `T_m` family (r24 critic-attributed),
with r24 registering no claim and the master ledger recording it as "otherwise exactly as open as
after r24 Cycle 4". Orientation T's Cycle 1 delivers, against that baseline:

1. **A complete informal proof of `(RC)` on the whole eligible top-rank residual class** — not a
   subclass, not a family, not a census — with a closed statement-level dependency DAG, derived from
   scratch at the exact C5-LA1 scope without citing the literature packet as evidence, and
   independently re-derived three times (both paired critics and this adjudication) on top of the
   route's own derivation. That is the move from "open on the non-flat class" to "informally proved
   on the whole class", and it is the material advance of the cycle.
2. **The exact remainder identity** `−S = ℓ(ℓ−2)M + (ℓ−4)N_2 + W_III` (E2), which converts T1's
   inequality into an equality and names the slack — the step that makes strictness reachable at all.
3. **The strict form (E13), stronger than the contract's own Tier 1′** — `S < 0` on the *entire*
   eligible class including `ℓ = 2`, where Tier 1′ asks only for `S ≤ 0`.
4. **The equality characterization (E12)**, identifying `P_5` as the unique zero and (E14) `P_3` as
   the unique positive on the residual class — the boundary of the theorem, located exactly.
5. **A corrected hypothesis map** (`α = ℓ + a` is `(★)`-free; the corona factorization needs
   `hyp-alpha`; (iii) needs nothing; (iv′) needs no `hyp-alpha`) and a **corrected classification**
   (`L5′`/`L5″`), both of which change what a Lean development must carry.
6. **Six tree-structural lemmas with exact Mathlib anchors verified at file and line**, which is the
   input layer a formalizer would otherwise have to build from nothing.
7. **A record correction** (E15, `P_7` ineligible) caught inside the orientation and confirmed by the
   controller as erratum `R26-E-b`.

Against the stop gate (`SOLUTION-CONTRACT.md` §5), at my orientation's evidence: **(a) is not met** —
`(RC)` is not formally verified; this orientation compiled nothing and there is no kernel receipt for
anything but the inherited `(RI)`. **(b) is not met** — no in-scope counterexample; every
falsification attempt by three critics and by me failed, and the only positive `S` anywhere in the
residual class is `P_3`, which `hyp-eligible` excludes and which E14 proves is the unique such tree.
**(c) is met at this orientation's evidence grade**: `(RC)` is proved informally with a closed
dependency DAG and Stage 7 is blocked on a bounded, named formalization obligation
(`family_III_bijection` + `fibre_nonneg` on the contract carrier, atop the definition layer). Read
literally, §5(c) says CONTINUE to the next cycle with Stage 7 the only funded lane unless the
synthesis funds more. **I record that reading for my orientation and leave the portfolio decision to
the neutral synthesis**, which alone sees all three orientations. A plateau would require evidence of
no material progress on the proof, the formalization or the correction record; the proof moved
decisively, the formalization obligation went from unnamed to exactly named, and the correction
record is F2's object and outside my portfolio. **No plateau.**

---

## Headline assessment

`headline_resolved: no`

`status: proved`

The run's headline is `(RC)` **formally verified** at the `SOLUTION-CONTRACT.md` §2 statement under
the governed workflow. No route, no critic and no adjudicator can produce that at Stage 5 — a
governed formal award does not exist before Stage 7 — and nothing in my portfolio compiled a single
line of Lean. Hence the negative headline flag above, exactly as all three returns and all six
critiques declare.

The verdict above is my ruling on `(RC)` **at this orientation's evidence grade**, which the protocol
defines as "a complete informal proof you have verified". I so rule on this basis and not on the
seats' say-so: the chain `L0`–`L11` with `L5` replaced by `L5′` + `L5″` is complete and closed; I
re-derived every step from the four hypotheses; I re-derived the identity `−S = ℓ(ℓ−2)M + (ℓ−4)N_2 +
W_III` and checked it as an exact integer identity on 330/330 residual trees with 0 failures; I
verified the budget identity, the trichotomy, the forced-neighbour lemma, the family weights and
counts, the fibre bound, `k_2 ≤ ⌊ℓ/2⌋`, `N_2 ≤ k_2 M` and the sign on all 312 eligible members with
0 failures, against the **literal** `aggregate` computed through the deletion sets and the favorable
filter, never through `(RI)`; I confirmed the composition base `(RI)` is the kernel-verified r24
declaration with its four hypotheses verbatim; and I confirmed the one dependency the routes declared
open (`hyp-eligible ⟹ α ≥ 3`) is closed. Two paired critics per route, working from their own
instruments and their own enumerations, attacked every bijection, quantifier, `ℕ`-subtraction, edge
case and fence, and attempted a counterexample; every one returned `retained_narrowed`, and every
defect they found is a statement, a citation or a hypothesis tag — **not one of them removes a step
from the proof.**

`proved` here means precisely: proved informally, at the literal scope of the four C5-LA1 hypotheses,
on the eligible top-rank residual class of ordinary trees, **unregistered**. It is not
`formally_verified`; the formal award is Stage 7's and this orientation has not begun it. Per
`SOLUTION-CONTRACT.md` §4, a statement first made or repaired at a review stage is **STATED** and
needs an isolated second read before registration — the repaired `(RC)` proof, and every
critic-derived result E9–E14 and E16, carry that requirement. And per fence 1, `proved` transfers
nothing: `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` remains OPEN at every other rank and on the
whole non-residual class, `E993-BETA-AGG` remains OPEN behind a transport never attempted, and the
common-leaf condition, TREE, FOREST, TRANSFER and Erdős #993 are untouched.

---

## Next-route allocation

The exact remaining obligation for orientation T, stated once: **compile the closed DAG above into
`R26LA1.topRankResidualSign` at the `SOLUTION-CONTRACT.md` §2 statement, composed with the
byte-identical C5-LA1 module, sorry-free, with axioms exactly `{propext, Classical.choice,
Quot.sound}` — beginning with the definition layer and the two heaviest nodes,
`family_III_bijection` and `fibre_nonneg`, restated on the contract carrier
(`indepSetsAvoiding G Wᶜ`) rather than on `SimpleGraph.induce`.** There is no remaining
*mathematical* obligation in the `(RC)` chain.

Three routes for Cycle 2 (the cycle keeps 3 per orientation), each with what it could close in one
cycle.

**`C2-T-01 RC-COUNTING-CORE-ON-CONTRACT-CARRIER` — the heaviest formal nodes.**
Build the `R26LA1` definition layer (`C`, `D`, `a`, `C₁`, `C₂`, `N₂`, `U`, `w`) with its definitional
lemmas, then compile sorry-free, on the C5-LA1 definitions and the contract carrier:
`deletion_injection` over `indepSetsAvoiding G Wᶜ` for an arbitrary avoid set; `fibre_nonneg` at
`|U| ≤ ℓ` in `ℤ`; `family_III_bijection`; `h_nonneg` as its own node; `budget_identity` as a pure
`Finset.card` identity; `budget_shapes` (`L5′`). *Closes in one cycle:* the two nodes every reader of
this portfolio independently names as the bottleneck, plus the definition layer without which no
other node can even be stated — i.e. the part of Stage 7 that is not routine.

**`C2-T-02 RC-INFORMAL-PROOF-OF-RECORD` — the document Stage 7 audits against.**
One `INFORMAL-PROOF.md` at the governed workflow's informal-audit granularity (claim ledger per step)
carrying: `L5′` + `L5″` in place of `L5`; the corrected hypothesis map (`α = ℓ + a` is `(★)`-free;
the corona factorization needs `hyp-alpha`; (iii) needs nothing; (iv′) needs no `hyp-alpha`); the
`ℕ`-subtraction audit extended to `α−1`, `ℓ−2`, `ℓ−4` with the `ℤ` casts declared at `ℓ = 2, 3`;
`k2_le_ell_div_two`, `N2_le_k2_mul_M` and `eligible_imp_alpha_ge_four` lifted into the DAG; the
`ℓ = 2` closure by the adjacency-closure argument with connectivity consumed explicitly; every
struck literal of this adjudication removed; and every fence-7 attribution on the face of the claim
(the packet's lane 05 for the candidate architecture, r24 critic `C-T1-U` for the family expansion
B3, ARMW 2020 for the occupancy bound, r24 route A1 for the flat law, the packet for the
forced-neighbour lemma). *Closes in one cycle:* the informal audit input Stage 7 requires — without
it the governed workflow would audit a false lemma (`L5`) against a true declaration — plus the
isolated second read that the repaired `(RC)` proof needs before registration.

**`C2-T-03 RC-STRICTNESS-AND-EQUALITY-PACKAGE` — Tier 1′ in full, and the boundary.**
Assemble E9 + E10 + E11 + E13 + E12 into one package with an isolated second read of each
critic-derived step: `hyp-eligible ⟹ α ≥ 4`; every even path fails `(★)`; the `ℓ = 2` closed form
`S = −(a−1)(a+2)`; hence `S < 0` on the *entire* eligible class with no `ℓ = 2` exception; hence
`S = 0 ⟺ G ≅ P_5` on the residual class with `α ≥ 2`. Decide whether the run carries the sharpened
Tier 1′ or the contract's weaker wording. *Closes in one cycle:* Tier 1′ in a form strictly stronger
than the contract states, at the cost of exactly one new structural node (the `ℓ = 2` fibre witness),
and it hands Stage 7 a stronger conclusion without enlarging the DAG — the strict statement and the
nonstrict one share every node but the last.

**Successor inheritance, stated as inheritance.** A successor inherits: a closed informal DAG for
`(RC)` and **zero** compiled nodes from this orientation; the `L5 → L5′+L5″` repair as mandatory
before anything downstream is compiled; the carrier restatement as mandatory before
`family_III_bijection` and `fibre_nonneg` are attempted; `(iv′)` and hypothesis-free `(iii)` as the
statements of record, since `(iv)` as `T3` recorded it does **not** discharge the allocation's U3(e)
target; five critic-derived results (E9–E11, E13, E16) and two more (E12, E14) that are STATED and
awaiting isolated second reads, with E14's ownership deferred to F3 and E13's overlapping `T2`'s
chartered strictness mandate; the `E993-R26-DELETION-INJECTION` attribution precondition; and the
record-hygiene items (string-key the hashed report dict, complete T1's import list, replace
`scratchpad/c1-T3/verify_output_n9.json` with the parseable replay artifact as the artifact of
record, correct the `P_7` label in any redispatch). Nothing in this orientation bears on the Tier 2
correction record — that is F2's object and the F adjudicator's ruling — and nothing bears on the
compiled fragments of `U1`–`U3`, which the U adjudicator sees and I do not.

---

## Artifact inventory

Deliverable: this file,
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-top-rank-residual-sign-dre-2026-09-23/cycles/cycle-1/stage5/adjudicators/T/ADJUDICATION.md`.
Scratch is confined to
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-top-rank-residual-sign-dre-2026-09-23/scratchpad/c1-adj-T/`.
Nothing under `control/`, `sources/`, `cycles/` (other than this file) or any seat's or critic's
scratch was modified; every manifest digest still verifies after my work, which is the check. Python
3 standard library only (`itertools`, `json`, `hashlib`, `sys`, `collections`, `math`); exact
integers; no floating point in any reported figure; no network; no package install; no `/tmp`, no
`mktemp`, no `TMPDIR`; no Lean build and no `lake` invocation; no wall-clock, PID or host field in
any output. **Every computation ran in the FOREGROUND under an explicit `timeout`. No background job
was started at any point in this session, so none is running at the time of this write and none
needed to be killed — by literal PID or otherwise — and no process listing was taken.**

| File (under `scratchpad/c1-adj-T/`) | Role |
|---|---|
| `verify_seal.py` | capsule inner-seal recomputation and all 24 member digest/byte checks. IMPORT LIST: `hashlib`, `json`, `os` |
| `seals.py` | Stage 2 / Stage 3 / Stage 4 packet-manifest inner seals and all 96 + 32 + 57 member digests. IMPORT LIST: `hashlib`, `json`, `os` |
| `adj_instrument.py` | this adjudication's independent instrument: leaf-addition free-tree generation with centre-rooted AHU canonical forms; explicit `|E| = n−1` **and** BFS acyclicity/connectivity test on every generated object; `indepSetsAvoiding`, `indepSetCount`, `Δ_k` in `ℤ`, `crossingIndex` as first STRICT descent, `indepNum`, `IsGraphLeaf`, `support`, `λ`, `C`, `D`, `(★)` by enumerating every maximum independent set, `H_v`, `R_v`, the favorable filter and the literal `aggregate` (never through `(RI)`); budget census, family classification, `W_I`/`W_II`/`W_III`, the fibre form of `W_III`, `N_2`, `k_2`, the closed form and the `L5`-escapee search. IMPORT LIST: `itertools`, `json`, `hashlib`, `sys`, `collections.deque` |
| `adj_report_n12.txt` | its orders-1–12 output (the table in `## Identity and seal audit`) |
| `adj_targets.py` | path family `P_3 … P_15` with `α`, `x`, `ℓ`, `a`, `M`, `N_2`, `W_III`, literal `S`, closed-form `S`, residual, eligible; and the `ℓ = 2` closed-form check `S = −(a−1)(a+2)` on `P_5 … P_25`. IMPORT LIST: `sys`, `json`, `adj_instrument` |
| `adj_tfam.py` | the frozen `t_family` fixed points `T_1`, `T_2` rebuilt from `sources/r24/r23-evaluator/ordinary_tree.py` lines 179–194 (read, never imported), and the flat law on 16 double stars. IMPORT LIST: `sys`, `adj_instrument` |
| `adj_misc.py` | `x ≥ 1` over all trees of orders 2–12; min `α` over the eligible class; the `K_2` corona witness (`1+4z+3z²` vs `1+2z`); the `P_3 + K_1` forest witness for lemma (iv)'s connectivity. IMPORT LIST: `sys`, `itertools`, `math`, `adj_instrument` |
| `replay-T3/c1-T3-replay__verify_output.json` | copied out of `scratchpad/c1-T3-replay/`; 633 B, `acc57356947a606b4263ca53e1c35af82f7809f2ca00ca98051e9aabdda6f70b`, parses |
| `replay-T3/c1-T3__verify_output_n9.json` | copied out of `scratchpad/c1-T3/`; 638 B, `364ac01769d0e85b54690e92074ca812cc0d3626a4d115f76f3d7d43ea41e092`, `RC 0` appended, **fails to parse** — the evidence for `C-T3-F` Strike 2 |

**Replay commands** (copy-out-first, in-root, foreground; never `/tmp`, never in place):

```
R=/Users/ashtonsperry/VerityOS/experiments/erdos-993-top-rank-residual-sign-dre-2026-09-23
python3 $R/scratchpad/c1-adj-T/verify_seal.py            # capsule seal + 24 members
python3 $R/scratchpad/c1-adj-T/seals.py                  # Stage 2/3/4 inner seals + 185 members
python3 $R/scratchpad/c1-adj-T/adj_instrument.py 12      # ~40 min; the orders-1-12 census and audit
python3 $R/scratchpad/c1-adj-T/adj_targets.py            # paths and the ell=2 closed form
python3 $R/scratchpad/c1-adj-T/adj_tfam.py               # T_1, T_2, flat law
python3 $R/scratchpad/c1-adj-T/adj_misc.py               # x>=1, K_2 witness, P_3+K_1 witness
# seals throughout: SHA-256 of canonical JSON minus seal_sha256,
# sort_keys=True, separators=(",",":"), UTF-8, no trailing newline.
```

Replayed copy-out-first from the portfolio's inventoried scratch: the two `T3` artifacts above (for
the Strike 2 ruling). I did not re-execute `T1`'s or `T2`'s generators — both were replayed
byte-for-byte by their paired critics from independent working directories, with digests reproduced
(`24bf5e34…28dc1` for `T1` by both critics; `7555afaa…5bce87f5` and payload `5f1561e8…d0dfd3` for
`T2` by both critics) — and I weighed those replays, together with my own from-scratch instrument,
above every self-report.

Reread before close. The four flag lines of record appear exactly once each, under the two headings
the protocol assigns them (`## Headline assessment`, `## Progress and plateau assessment`), and the
model disclosure line appears once, in the header block above.
