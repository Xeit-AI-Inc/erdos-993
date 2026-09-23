---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c3-la1-formalizer-sonnet-20260921
critic_id: c3-la1-fable-informal-20260921
attestation_id: c3-la1-informal-pass-20260921
claim_sha256: 078b54fffde8dc5cb72e6aea8adf2d54d72cde3bd8da204286eccde9fb35b618
---

# Informal Proof Integrity Audit

**Boot acknowledgment.** This seat is operating within VerityOS. Booted before
substantive work per `CLAUDE.md` and `identity/startup-protocol.md`: read
`verity.md` (the constitution), `identity/startup-protocol.md` (the startup
sequence), and `skills/proof-integrity-audit/skill.md` (the governing skill),
as directed by `control/C3-STAGE7-INFORMAL-AUDITOR-BRIEF-LA1.md` §0. No other
VerityOS subsystem was loaded; this is a bounded proof-integrity audit scoped
entirely to the sealed award capsule and the Lean run named in the brief.

**Model disclosure.** Seat: independent informal proof-integrity reviewer,
`c3-la1-fable-informal-20260921`, kind
`independent-mathematical-proof-integrity-reviewer`. Chartered model/effort:
**Claude Opus 5, effort high**, per the dispatch record — **this seat cannot
self-inspect its own runtime model or effort setting; the chartering is stated
here on dispatch-record authority, not on introspection.** Child delegation:
none used (forbidden by the brief and honored). This seat is not the artifact
producer and edited no contract, Lean source, informal proof, or receipt; its
only writes are `INFORMAL-AUDIT.md` and its own scratch under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-uniform-residual-no-recovery-dre-2026-09-20/scratchpad/c3-s7-informal-LA1/`.

**Read boundary honored.** Read: the Lean run
`runs/lean-2026-09-21-c3-catalan-gap-monotone-ratio/`
(`THEOREM-CONTRACT.yaml`, `INFORMAL-PROOF.md`, `CAPSULE-VERIFICATION.json`,
`FORMALIZER-REPORT.md`, `EVIDENCE/` including
`generate_gamma_witnesses.py`, `axioms-all-38-declarations.txt` and
`originating-source/Main.lean`, and `LeanProject/LeanProof/Main.lean`); the
sealed capsule `control/c3-stage7-capsules/C3-LA1-PACKET-MANIFEST.json` and its
nine members (of which `cycles/cycle-3/stage6/SYNTHESIS.md` `## Lean awards`
Award group 1, `cycles/cycle-3/stage5/adjudicators/U/ADJUDICATION.md`
`## Lean readiness`, and the two U3 critiques were read at statement level);
`SEMANTIC-CONTRACT.md`; `SOLUTION-CONTRACT.md` §§3–6 and
`SOLUTION-CONTRACT-ADDENDUM-1.md` §A2; and Mathlib sources
(`Mathlib/Combinatorics/Enumerative/Catalan/Basic.lean`,
`Mathlib/Data/Nat/Choose/Central.lean`) for API meaning. Nothing else.

**Digest gate.** Recomputed by this seat with `shasum -a 256`:

| artifact | expected | recomputed | match |
|---|---|---|---|
| `THEOREM-CONTRACT.yaml` | `c812154b…d23ac` | `c812154b5c773bed711f2423f0fe2f212a9c1ff697d681c0fc88d6ea470d23ac` | yes |
| `INFORMAL-PROOF.md` | `5dca79e4…fbace` | `5dca79e4b81568c23949ca70b33d546d4d185b0a627dc0d2e6413974e47fbace` | yes |
| `LeanProject/LeanProof/Main.lean` | `f1243faf…f9031` | `f1243faf4e0d92753a5c90ed056a5885ed44a9c5f10568eac31f9423baff9031` | yes |
| capsule seal (compact key-sorted JSON minus `seal_sha256`, no trailing newline) | `aa6e4161…5b25ea` | `aa6e41616cd5656958d0e7b90b7f03fd2d6df03bf64e4a12512d738ec57b25ea` | yes |
| all 9 capsule members | per manifest | all 9 recomputed byte-for-byte | yes |
| `lean_binding.expected_statement` | `67fe40be…d7773f` | `67fe40be210430be9bca214b0ee022a910d2cb95c5149819fe6e4c9b93d7773f` | yes |
| `EVIDENCE/generate_gamma_witnesses.py` | `1ce10891…10b52bb` | `1ce108918ba5bd427f94868c18b7f25d6cecfbcae32abce458b111a7410b52bb` | yes |
| `EVIDENCE/originating-source/Main.lean` | `e5785f1c…e43a18` | `e5785f1c707e28fc4190a159ac8f5d5b10914ce619857c821bdd28db9fe43a18` | yes |

`claim_sha256`: recomputed by this seat as
`sha256(" ".join(theorem.informal_statement.split()))` =
`078b54fffde8dc5cb72e6aea8adf2d54d72cde3bd8da204286eccde9fb35b618` — **equals
the brief's stated value**.

---

## Intended Claim

The intended claim is exactly the contract's `theorem.informal_statement`
(claim of record, digest above):

> For the Catalan-dominance gap `Gamma(tau,k) = catalan(k+1) −
> sum_{j=1}^{tau} C(tau,j)*(catalan(k−j) if j<=k else 0)` (`catalan` Mathlib's
> Catalan-number function, the guard an integer zero-extension convention of
> record): (1) for every `tau>=1` and `k>=tau`,
> `Gamma(tau,k)*catalan(k+2) < Gamma(tau,k+1)*catalan(k+1)` (the ratio
> `Gamma(tau,k)/catalan(k+1)` strictly increases in `k`, stated
> denominator-free); (2) hence from any base `0<Gamma(tau,K)` with `tau<=K`,
> `0<Gamma(tau,k)` for every `k>=K`; (3) with the seven explicit bases
> `K(1..7) = 0,2,3,4,6,12,70`, i.e. `Gamma(tau,k)>0` for every `k>=K(tau)` at
> `tau=1..7`; and (4) `Gamma(tau,k)<0` for every `tau>=8` and `k>=tau`. A
> theorem about Catalan integers, uniform in `tau` with explicit thresholds.
> Not a graph theorem; not fixed-band; not uniform in `d` (`d` does not occur).

`INFORMAL-PROOF.md` (digest `5dca79e4…`) is audited as the proof of exactly that
claim, at statement-level granularity, under
`skills/proof-integrity-audit/skill.md` (Single Problem scale, one prover/critic
cycle plus a separate critic pass, as the skill's Scale Modes prescribe for a
result that will be propagated).

**Claim/declaration correspondence, one-for-one.** The Lean terminal
declaration `Erdos993G1.U3.catalanGap_monotone_ratio_award` (ENTRY 38, the only
`theorem` in the project) is the four-part conjunction, and its hypotheses match
the claim literally:

| claim conjunct | Lean hypotheses | match |
|---|---|---|
| (1) `tau>=1`, `k>=tau` | `∀ τ k : ℕ, 1 ≤ τ → τ ≤ k → …` | exact |
| (2) `tau<=K`, base `0<Gamma τ K`, `k>=K` | `∀ τ K : ℕ, 1 ≤ τ → τ ≤ K → 0 < Gamma τ K → ∀ k, K ≤ k → …` | see note below |
| (3) `K(1..7) = 0,2,3,4,6,12,70` | seven conjuncts with thresholds `0,2,3,4,6,12,70` | exact |
| (4) `tau>=8`, `k>=tau` | `∀ τ k : ℕ, 8 ≤ τ → τ ≤ k → Gamma τ k < 0` | exact |

Note on (2): the claim's conjunct (2) opens with "hence", continuing the `tau`
binder that conjunct (1) has already scoped at `tau>=1`, so under the intended
reading the hypotheses are one-for-one. Under the alternative (uncharitable)
reading in which (2) is separately quantified over all `tau`, the claim would be
strictly *stronger* than the Lean declaration by the single case `tau = 0` — and
this seat verified that that case is **also true** (`Gamma(0,k) = catalan(k+1) >
0` for every `k`, the index set `Finset.Icc 1 0` being empty; critic check CP2).
So under neither reading is anything asserted that is not true; recorded as an
imprecision with zero mathematical force, not a defect.

The definition matches literally: `Finset.Icc 1 τ` is `{1,…,τ}` (empty at
`τ = 0`), `Nat.choose τ j` is `C(tau,j)`, the guard is
`if j ≤ k then (catalan (k - j) : ℤ) else 0`, and the whole expression is in
`ℤ`. Mathlib's `catalan : ℕ → ℕ` is the standard Catalan sequence
(`catalan 0 = 1`, `catalan (n+1) = ∑ i : Fin n.succ, catalan i * catalan (n-i)`;
`catalan_eq_centralBinom_div : catalan n = n.centralBinom / (n+1)`;
`Nat.centralBinom n = (2*n).choose n`) — confirmed by reading the Mathlib
sources, and the auditor's own evaluator `Cat_n = C(2n,n)/(n+1)` was
cross-validated against the recurrence-generated sequence for `n = 0..324`.

---

## Claim Ledger

Every definition, lemma and inference step of `INFORMAL-PROOF.md`, checked
literally against `LeanProject/LeanProof/Main.lean` (entry numbers are the
`VERITYOS ENTRY` registrations). Evidence codes: **E** = exact-integer
recomputation by this seat's own evaluator; **D** = derivation re-done by hand
by this seat; **S** = literal source check against the Lean declaration or
Mathlib. Verdicts follow the skill's taxonomy.

| # | claim (informal §) | Lean entry | evidence | verdict |
|---|---|---|---|---|
| D1 | `Gamma τ k = Cat_{k+1} − Σ_{j∈Icc 1 τ} C(τ,j)·[j≤k]·Cat_{k−j}`, `ℤ`-valued, `noncomputable` (§1) | 1 `Gamma` | S | verified — literal match to the claim and to the synthesis' elaborated copy-out |
| D2 | `catalan` is Mathlib's Catalan-number function (§1) | Mathlib | S | verified (definition + `catalan_eq_centralBinom_div` + `centralBinom` read in source) |
| D3 | The `if j ≤ k` guard is a **convention of record** cited from `SEMANTIC-CONTRACT.md`'s integer zero-extension, **not** derived from Addendum §A2, which is silent for `k<j` (§1) | 1 doc-comment | S | verified — §A2 read: it writes `Γ(τ,k)=Cat_{k+1}−Σ_{j=1}^{τ}C(τ,j)Cat_{k−j}` with no `k<j` provision; `SEMANTIC-CONTRACT.md` "Conventions (binding)" carries "`coeff` is zero at negative integer indices (integer zero extension)". The guard is a **definitional stipulation, not a derived fact**, and the proof says so. Synthesis condition (ii) satisfied |
| D4 | Without the guard (truncated `ℕ` subtraction) `K(1)` would be `1`, not `0`; the guard is what decides `K(1)=0` (§1) | — | E | verified: unguarded `Γ(1,0) = Cat_1 − C(1,1)·Cat_0 = 1−1 = 0` (not `>0`), unguarded `Γ(1,1) = 2−1 = 1 > 0` |
| D5 | `Gamma τ 0 = 1` for every `τ` (§1) | 7 `Gamma_zero` | E, S | verified for `τ = 0..40`; Lean proves it for all `τ` by killing every summand via `if_neg` |
| H1 | `(hτ : 1 ≤ τ)` and `(hk : τ ≤ k)` are load-bearing, not decorative; 25 violations at `k<τ` (§2) | 11, 12, 19–25, 31 | E | verified — see Reproduced Evidence R4; count reproduced exactly on the record's window |
| H2 | `τ = 1` sits outside `monotone_ratio`'s domain because `K(1)=0<τ=1`, so it is handled by `gamma_one_pos` (§2, §3.6) | 10, 19 | S, E | verified — `gamma_pos_1` routes through `gamma_one_pos`, not `gamma_pos_of_base` |
| L1 | `0 < catalan n` (implicit, used throughout) | 2 `catalan_pos` | D, S | verified from `succ_mul_catalan_eq_centralBinom` + `centralBinom_pos` |
| L2 | `(n+2)·Cat_{n+1} = (4n+2)·Cat_n`, no division (§3.1) | 3 `catalan_mul_recurrence` | D, E, S | verified — composition of Mathlib's `succ_mul_catalan_eq_centralBinom (n)`, `(n+1)`, and `Nat.succ_mul_centralBinom_succ n`, then cancelling `(n+1)`; both Mathlib statements read in source and quoted correctly; identity checked for `n = 0..300` |
| L3 | **Strict log-CONVEXITY** `Cat_{n+1}² < Cat_n·Cat_{n+2}` — name and direction (§3.2, §6) | 4 `catalan_strict_logConvex` | D, E, S | verified. Direction is convexity (increasing ratio), the reverse of the originating name. The originating source (digest `e5785f1c…`) does name it `catalan_strict_logConcave` at its line 52 with the identical statement; the rename is carried through this run's source and prose with no residue. Checked `n = 0..300`: the convex inequality holds at every `n` and the concave one at none. Synthesis condition (i) satisfied |
| I1 | Proof of L3: apply L2 at `n` and `n+1`, clear by `(n+2)(n+3)`, reduce to `(4n+2)(n+3) < (4n+6)(n+2)` (⟺ `12 > 6`) (§3.2) | 4 | D | verified — LHS `4n²+14n+6`, RHS `4n²+14n+12`; the Lean `lhs_eq`/`rhs_eq`/`hcoef` chain is exactly this |
| L4 | Cross inequality `Cat_{a+1}·Cat_b < Cat_a·Cat_{b+1}` for `a<b` (§3.3) | 5 `catalan_cross_strict` | D, E, S | verified — `Nat.le_induction` on `b` from `a+1`; base is L3 at `a`; step multiplies `ih` by `Cat_{b+1}`, `hlc` by `Cat_a`, chains, cancels `Cat_b>0`. Checked for all `0 ≤ a < b ≤ 120`; equality at `a=b` confirms `a<b` is needed |
| L5 | `Gamma_unfold` drops the guard under `hk : τ ≤ k` (§3.4) | 6 | S | verified — `j ≤ τ ≤ k` makes `if_pos` available for every `j ∈ Icc 1 τ`; this is the first place `τ ≤ k` enters |
| I2 | Cross-multiplied difference collapses to `Σ_{j=1}^{τ} C(τ,j)·(Cat_{k−j}Cat_{k+2} − Cat_{k+1−j}Cat_{k+1})` (§3.4) | 11 `expand` | D | verified by hand: with `A=Cat_{k+1}`, `B=Cat_{k+2}`, RHS−LHS `= (B−S_{k+1})A − (A−S_k)B = B·S_k − A·S_{k+1}`, then `Finset.sum_mul` termwise. Matches the Lean `expand` exactly |
| I3 | Each summand is strictly positive: reindex L4 at `(k−j, k+1)` and use `k−j+1 = k+1−j` for `j ≤ k` (§3.4) | 11 `hbracket_pos` | D, S | verified. `C(τ,j) > 0` needs `j ≤ τ` (`Nat.choose_pos hj.2`); the bracket needs `j ≤ k`, obtained as `j ≤ τ ≤ k` — **this is the second and essential place `τ ≤ k` enters**. (Margin: the prose "valid since `j ≤ k` gives `k − j < k + 1`" over-attributes — `k−j < k+1` holds for all `j` in `ℕ`; `j ≤ k` is what licenses the index shift `k−j+1 = k+1−j`. Imprecision, no force) |
| I4 | The index set `Finset.Icc 1 τ` is nonempty because `τ ≥ 1`, so `Finset.sum_pos` applies (§3.4) | 11 | S, E | verified — and load-bearing: at `τ = 0` the sum is empty and the monotone ratio **fails for every `k`** (critic check CP3) |
| T1 | `monotone_ratio (τ k) (1≤τ) (τ≤k) : Γ(τ,k)·Cat_{k+2} < Γ(τ,k+1)·Cat_{k+1}` — conjunct (1) (§3.4) | 11 | D, E, S | verified with reproduced evidence (R3) |
| T2 | `gamma_pos_of_base` — conjunct (2): induction on `k` from `K`, using T1 and `Cat_{k+1}>0` (§3.5) | 12 | D, E, S | verified. The step needs `τ ≤ k`, supplied as `τ ≤ K ≤ k`. `0<Γ(τ,k)` and `0<Cat_{k+2}` give `0 < Γ(τ,k)Cat_{k+2} < Γ(τ,k+1)Cat_{k+1}`, then divide by `Cat_{k+1}>0` |
| B2–B7 | `gamma_base_τ`: `0 < Γ(2,2), Γ(3,3), Γ(4,4), Γ(5,6), Γ(6,12), Γ(7,70)` (§3.6) | 13–18 | E, S | verified — values `2, 4, 5, 18, 16848, 1327331792479871686755508212156357075`, all `>0`, all reproduced exactly (R2). The `Gamma_unfold` side conditions `2≤2, 3≤3, 4≤4, 5≤6, 6≤12, 7≤70` all hold |
| L6 | `Cat_n ≤ Cat_{n+1}` (§3.6 chain) | 8 `catalan_le_succ` | D, E | verified (`n+2 ≤ 4n+2`), checked `n = 0..300` |
| L7 | `Cat_n < Cat_{n+2}` (§3.6) | 9 `catalan_strict_two_step` | D, E | verified, checked `n = 0..300` |
| T3 | `gamma_one_pos : 0 < Γ(1,k)` for every `k` — the `K(1)=0` case (§3.6) | 10 | D, E, S | verified. `k=0`: guard off, `Γ(1,0)=Cat_1=1`. `k≥1`: `Γ(1,k)=Cat_{k+1}−Cat_{k−1} > 0` by L7 at `k−1` (`k−1+2=k+1` needs `k≥1`). Checked `k=0..200` |
| P1–P7 | `gamma_pos_τ` — conjunct (3), the seven `K(1..7)` thresholds (§3.6) | 19–25 | E, S | verified — `gamma_pos_1 = gamma_one_pos`; `gamma_pos_{2..7} = gamma_pos_of_base τ K(τ) … gamma_base_τ`, with `1≤τ` and `τ≤K(τ)` discharged by `norm_num` and true in each case (`2≤2, 3≤3, 4≤4, 5≤6, 6≤12, 7≤70`) |
| L8 | `Cat_{m+1} < 4·Cat_m` (§3.7) | 26 `catalan_succ_lt_four_mul` | D, E | verified from L2 (`4m+2 < 4(m+2)`), checked `m = 0..300` |
| L9 | `Cat_{m+i} < 4^i·Cat_m` for `i ≥ 1` (§3.7) | 27 `catalan_pow_bound` | D, E | verified by `Nat.le_induction` from L8, checked `m = 0..60, i = 1..60` |
| L10 | `Cat_{k+1} < 4^{j+1}·Cat_{k−j}` for `j ≤ k` (§3.7) | 28 `catalan_cross_lower` | D, S | verified — L9 at `m = k−j`, `i = j+1`, with `(k−j)+(j+1) = k+1` requiring `j ≤ k`. (Margin: §3.7's prose states this lemma without its `j ≤ k` hypothesis; the Lean carries it and the use site satisfies it via `j ≤ τ ≤ k`. Imprecision, no force) |
| L11 | `Σ_{j=1}^{τ} C(τ,j)·4^{τ−j} + 4^τ = 5^τ` (§3.7) | 29 `binom_five_pow_split` | D, E, S | verified — `add_pow` at `(1+4)^τ`, peel the `j=0` term; checked `τ = 0..60` |
| L12 | `5·4^τ ≤ 5^τ` for `τ ≥ 8` (§3.7) | 30 `five_pow_ge` | D, E | verified by induction; checked `τ = 8..200`; base `5·4^8 = 327680 ≤ 390625 = 5^8` |
| I5 | L12 **is** Addendum §A2's criterion `(5/4)^τ − 1 < 4 ⟺ τ ≤ 7`, used at the complementary threshold (§3.7) | 30 | D, E | verified — `(5/4)^τ − 1 ≥ 4 ⟺ (5/4)^τ ≥ 5 ⟺ 5^τ ≥ 5·4^τ`, exactly complementary to `τ ≤ 7`. A2's literals reproduced: `τ=7 → 61741/16384 < 4`; `τ=8 → 325089/65536 > 4` |
| I6 | Ceiling chain: from L10, `Cat_{k+1}·4^{τ−j} < Cat_{k−j}·4^{τ+1}`; sum with `C(τ,j)`; `4^{τ+1} ≤ 5^τ − 4^τ` by L11+L12; cancel `4^{τ+1}` (§3.7) | 31 | D | verified by hand, step for step against the Lean `hterm`/`hsum_lt`/`hlhs`/`hrhs`/`hbound`/`calc` chain. `4^τ + 4^{τ+1} = 5·4^τ ≤ 5^τ` is exactly the `hbound` `omega` step |
| T4 | `gamma_neg_of_ge_eight (τ k) (8≤τ) (τ≤k) : Γ(τ,k) < 0` — conjunct (4) (§3.7) | 31 | D, E, S | verified with reproduced evidence (R5) |
| M2–M7 | Minimality witnesses `Γ(2,1)=0`, `Γ(3,2)=−1`, `Γ(4,3)=−4`, `Γ(5,5)=−14`, `Γ(6,11)=−1563`, `Γ(7,69)=−799363812466329793611557404284949737` (§4) | 32–37 `gamma_min_2..7` | E, S | verified — all six reproduced exactly (R6). `Γ(2,1)=0` is a **plateau**, correctly flagged as such; `Γ(τ,K−1) ≤ 0` is the correct minimality statement and is what the record asserts |
| M8 | The `τ=2,3,4` witnesses sit at `k<τ`, outside `Gamma_unfold`'s domain, and are decided from the raw definition; `τ=5,6,7` go through `Gamma_unfold` (§4) | 32–37 | S, E | verified — `(2,1),(3,2),(4,3)` have `k<τ` and use `unfold Gamma`; `(5,5),(6,11),(7,69)` have `τ≤k` and use `Gamma_unfold`. The guard fires for exactly those three (critic check CP9) |
| M9 | The witnesses certify the **minimality** half: `K(τ)` is least (§4) | 32–37 | D, E | verified as an inference: `Γ(τ,K−1) ≤ 0` plus `Γ(τ,k)>0` for all `k ≥ K` pins `K` as the least such threshold. `K(1)=0` is least vacuously. **Scope note, not a defect:** `gamma_min_2..7` are compiled, kernel-registered lemmas but are **not** bound into the terminal conjunction, and the claim of record asserts only the sufficiency reading ("i.e. `Gamma(tau,k)>0` for every `k>=K(tau)`"). So the claim does not overclaim, and anyone citing minimality must cite `gamma_min_2..7` individually, never the award theorem |
| A1 | Alias: `gamma_pos_4`, after unfolding, states the same inequality as frozen ENTRY 149 `Erdos993G1.ThirdWide.catalan_gap_pos`; **not** imported, re-derived from scratch (§5) | 22 | S | verified — `Main.lean` has exactly one `import Mathlib`; `ThirdWide`, `indepCount`, `coeff`, `delta`, `stratum` occur nowhere; the DAG closes on pinned Mathlib alone. Synthesis condition (iv) satisfied (registered as alias, not dependency) |
| A2 | Correction to the originating source: the rename, with the fence-hazard rationale (§6) | — | S | verified — `SOLUTION-CONTRACT.md` §3 does read "Galvin's non-log-concave trees (no log-concavity premise, ever)"; the audited object is a **proved** arithmetic fact about `Cat_n`, never a premise, never applied to `i_k(F)`, so no fence is breached — the stated rationale is exactly right, and both Stage 4 critics and the Stage 5 adjudicator reached the same ruling |
| A3 | Part 6 of the originating file (`exists_subsuperset_card_eq_five`, `cover_pad_to_five`) is not carried (§7) | — | S | verified — neither name occurs in `Main.lean`. Originating file has **33** declarations (this seat counted them; a doc-comment line beginning "theorem —" is the usual off-by-one trap); `33 − 2 + 6 + 1 = 38` = this run's registered entry count. Synthesis conditions (vi) and (vii) satisfied |
| T5 | Terminal conjunction `catalanGap_monotone_ratio_award` is exactly the four parts (§8) | 38 | S | verified — the anonymous constructor `⟨monotone_ratio, gamma_pos_of_base, ⟨gamma_pos_1..7⟩, gamma_neg_of_ge_eight⟩` matches the right-nested `∧` structure component for component; it is the only `theorem` in the project; the statement is byte-identical to `lean_binding.expected_statement` (digest `67fe40be…`) |

**Ledger total: 38 rows, covering 54 individual claims (three rows are the
grouped families `B2–B7`, `P1–P7`, `M2–M7`, each audited member by member).
Verified with reproduced evidence: 38 / 38 rows, 54 / 54 claims. False /
unsupported gap / citation mismatch / hallucination risk / disputed / blocked:
0. Imprecise-but-true margin notes: 3 (I3, L10, and the conjunct-(2) binder
scope), each carrying zero mathematical force and each recorded above rather
than waived.**

---

## Reproduced Mathematical Evidence

All arithmetic is exact-integer. The evaluator was written by this seat from
scratch at
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-uniform-residual-no-recovery-dre-2026-09-20/scratchpad/c3-s7-informal-LA1/gamma_eval.py`;
no prior evaluator was imported.
`Cat_n` is computed as `C(2n,n)//(n+1)` with a hand-written multiplicative
binomial (no `math.comb` in the primary path) and cross-validated against an
independently built recurrence list `(n+2)Cat_{n+1} = (4n+2)Cat_n` for
`n = 0..324` — the two agree at every index. Outputs, in the same directory:
`gamma_eval.out`, `critic_pass.out`.

- **R1 — the table.** `Γ(τ,k)` computed for `τ = 1..12`, `k = 0..200` (2,412
  exact values), as the brief requires. `Γ(τ,0) = 1` for `τ = 0..40`.
- **R2 — `K(1..7)`.** Taking `K(τ)` as the **least** `K` with `Γ(τ,k) > 0` for
  every `k ≥ K` (scan to `k = 200`), this seat computes
  `K(1..7) = 0, 2, 3, 4, 6, 12, 70` — **exactly the record's seven literals**.
  Base values: `Γ(1,0)=1`, `Γ(2,2)=2`, `Γ(3,3)=4`, `Γ(4,4)=5`, `Γ(5,6)=18`,
  `Γ(6,12)=16848`,
  `Γ(7,70)=1327331792479871686755508212156357075`. Predecessors, where
  `K ≥ 1`: `Γ(2,1)=0`, `Γ(3,2)=−1`, `Γ(4,3)=−4`, `Γ(5,5)=−14`,
  `Γ(6,11)=−1563`, `Γ(7,69)=−799363812466329793611557404284949737` — all `≤ 0`,
  so each `K(τ)` is least. `Γ(1,k) > 0` for every `k = 0..200`, confirming
  `K(1) = 0`.
- **R3 — denominator-free monotonicity inside the domain.** `Γ(τ,k)·Cat_{k+2} <
  Γ(τ,k+1)·Cat_{k+1}` holds for **every** `1 ≤ τ ≤ k ≤ 199` with `τ ≤ 12` —
  each check compares rank `k` to rank `k+1`, so the sweep covers the whole
  `k ≤ 200` table: zero violations. Stress-widened to `τ ≤ 40`,
  `τ ≤ k ≤ 120`: zero violations.
- **R4 — failure at `k < τ`, and the count of 25.** Over the record's window
  `0 ≤ k < τ ≤ 12` this seat finds **exactly 25** violating pairs:
  `(1,0), (2,0), (3,0), (4,0), (4,1), (5,0), (5,1), (6,0), (6,1), (7,0),
  (7,1), (8,0), (8,1), (9,0), (9,1), (9,2), (10,0), (10,1), (10,2), (11,0),
  (11,1), (11,2), (12,0), (12,1), (12,2)` — matching the T critic's
  "25 counterexample pairs with `0 ≤ k < τ ≤ 12`" and the synthesis' and
  adjudicator's "25 violations". The count is window-dependent (19 at `τ ≤ 10`,
  29 at `τ ≤ 13`, 61 at `τ ≤ 20`), so the figure is sound **only** as stated on
  that window; this seat states the window explicitly. The record's specific
  calls also reproduce: `(4,1)` is an **equality** failure
  (`Γ(4,1)·Cat_3 = −10 = Γ(4,2)·Cat_2`, a non-strict failure a weaker `≤`
  statement would hide), and `(5,0)`, `(5,1)` fail outright.
- **R5 — the `τ ≥ 8` ceiling to `k = 300`.** `Γ(τ,k) < 0` for every `τ = 8..16`
  and every `k = τ..300`: zero exceptions (2,601 pairs). `Γ(8,8) = −5943`.
  `τ ≤ k` is load-bearing here too: for `τ = 8..12` the only `k ≤ 300` with
  `Γ(τ,k) ≥ 0` is `k = 0` (`Γ(τ,0) = 1`).
- **R6 — the six minimality witnesses.** All six values reproduced exactly, and
  again through a structurally different second evaluator built on the
  recurrence:
  `Γ(2,1)=0` (plateau), `Γ(3,2)=−1`, `Γ(4,3)=−4`, `Γ(5,5)=−14`,
  `Γ(6,11)=−1563`,
  `Γ(7,69)=−799363812466329793611557404284949737`.
- **R7 — the Addendum criterion.** `(5/4)^τ − 1 < 4 ⟺ τ ≤ 7`, verified cleared
  of division as `5^τ < 5·4^τ` for `τ = 0..20`: true exactly for `τ ≤ 7`.
  Boundary: `5^7 = 78125 < 81920 = 5·4^7`; `5^8 = 390625 > 327680 = 5·4^8`.
  §A2's rational literals reproduced: `(5/4)^7 − 1 = 61741/16384`,
  `(5/4)^8 − 1 = 325089/65536`. `five_pow_ge` (`5·4^τ ≤ 5^τ`) verified for
  `τ = 8..200`; `binom_five_pow_split` verified for `τ = 0..60`.
- **R8 — the Catalan facts.** Recurrence, strict log-**convexity** (and the
  absence of log-concavity), the cross inequality, `Cat_{m+1} < 4Cat_m`,
  `Cat_{m+i} < 4^i Cat_m`, `Cat_n < Cat_{n+2}`, `Cat_n ≤ Cat_{n+1}` — all
  verified over the ranges in the ledger, zero exceptions.
- **R9 — condition (vi) literals.** `C(142,71) =
  372641034574519600278163693967644731577200` has **42** digits (the
  originating return's "41" is indeed wrong and is corrected here);
  `catalan 71 = C(142,71)/72` is exact.
- **R10 — the shipped generator replays.** `EVIDENCE/generate_gamma_witnesses.py`
  (digest `1ce10891…`) run by this seat: all assertions pass, output consistent
  with this seat's independent table. This is a reproducibility check on the
  producer's evidence, not a substitute for the independent computation above.

Total independent checks executed and passed: **44 in the main pass, 22 in the
critic pass, 66 in total, 0 failures** (each check is an all-quantified sweep
over the ranges named above, not a single spot value). Every computation was
run in the foreground; no background job was started, and none was left running
at close.

---

## Independent Critic Pass

Run as a separate pass over this seat's own ledger
(`scratchpad/c3-s7-informal-LA1/critic_pass.py`), attempting to break each row
rather than confirm it. Findings:

- **CP1 — the named failure pairs.** Confirmed `(4,1)` is an equality (not a
  strict) failure and `(5,0)`, `(5,1)` fail outright. The ledger's H1 row
  survives.
- **CP2 — the conjunct-(2) binder.** Attacked the possible hypothesis mismatch
  in claim conjunct (2). Result: the stronger reading is still true
  (`Γ(0,k) = Cat_{k+1} > 0`), so no unsound assertion exists either way.
  Downgraded from candidate defect to recorded imprecision.
- **CP3 — is `1 ≤ τ` really load-bearing?** At `τ = 0` the monotone ratio fails
  at every `k` in `0..59` (both sides equal: the empty sum makes
  `Γ(0,k)Cat_{k+2} = Cat_{k+1}Cat_{k+2} = Γ(0,k+1)Cat_{k+1}`). `1 ≤ τ` is
  genuinely necessary, exactly as §2 claims.
- **CP4 — is `τ ≤ K` really load-bearing in `gamma_pos_of_base`?** Searched for
  `(τ,K)` with `K < τ`, `Γ(τ,K) > 0`, and `Γ(τ,k) ≤ 0` for some `k > K`. Found
  11, the first being `(τ,K,k) = (2,0,1)`: `Γ(2,0)=1>0` but `Γ(2,1)=0`. The
  hypothesis is not removable.
- **CP5 — sharpness at the `τ=7/τ=8` boundary.** `τ = 7` is genuinely outside
  the ceiling regime (`Γ(7,70) > 0`), and the ceiling argument genuinely fails
  there (`5·4^7 = 81920 > 78125 = 5^7`). The threshold is not an artifact of a
  loose bound.
- **CP6 — does the minimality inference hold?** For each `τ = 2..7` there is a
  `k < K(τ)` with `Γ ≤ 0`, and it is `k = K(τ)−1` in every case. The inference
  "`Γ(τ,K−1) ≤ 0` plus permanent positivity from `K` ⟹ `K` least" is sound.
- **CP7 — the `k = 0` spike (the one trap worth naming).** `Γ(τ,0) = 1 > 0` for
  **every** `τ`, so the *first* `k` with `Γ(τ,k) > 0` is `0` at every `τ`,
  including `τ ≥ 8` where `Γ` is negative from `k = τ` onward. `K(τ)` must
  therefore be read as the **least permanently-positive threshold**, never as
  "the first positive `k`". The record reads it correctly — the adjudicator
  writes "the least rank from which positivity is permanent", the claim states
  conjunct (3) as the sufficiency form "`Γ(τ,k)>0` for every `k ≥ K(τ)`", and
  `INFORMAL-PROOF.md` §1 states `Γ(τ,0)=1` for every `τ` up front. No defect;
  recorded because a downstream reader who conflated the two would misstate the
  result.
- **CP8 — second evaluator.** All 13 headline values (seven bases, six
  witnesses) recomputed through a structurally different Catalan generator
  (recurrence-built list rather than closed form); full agreement.
- **CP9 — does the guard fire where the proof says?** Inside conjunct (3) the
  guard fires at exactly one place, `τ = 1, k = 0` (the only `τ` with
  `K(τ) < τ`); among the witnesses it fires at exactly `(2,1), (3,2), (4,3)`.
  Both match §1 and §4 precisely.
- **CP10 — §A2 rational literals.** Reproduced exactly.

**Critic-pass conclusion: no ledger row was broken; no verdict was revised
downward; three imprecisions were confirmed as imprecisions rather than
defects. Prover and critic verdicts agree on all 38 rows with independent
evidence, which is the skill's condition for closing a claim.**

---

## Scope and Fence Check

- **It is what it says it is.** The claim is a theorem about Catalan integers,
  uniform in `τ` with explicit thresholds. `Main.lean` declares `Gamma` itself
  and imports only `Mathlib`. No graph notion enters anywhere: `SimpleGraph`,
  `Graph`, `indepCount`, `coeff`, `delta`, `stratum` — **zero occurrences**.
- **Not fixed-band; not uniform in `d`.** The symbol `d` does not occur as a
  variable in the claim, the Lean source, or the proof; both the claim and
  `INFORMAL-PROOF.md` §7 say so explicitly.
- **Not packaged as `c(d) = min(d,5)`.** The string appears in
  `INFORMAL-PROOF.md` exactly once, inside the §7 exclusion list, and nowhere
  in `Main.lean`. The synthesis' "**It must never be packaged, quoted or
  registered as `c(d) = min(d,5)`**" is honored.
- **No transfer.** Nothing is stated or implied about forests, covers,
  matchings, `Δ_k`, `i_k`, `x(F)`, Tier 1, Tier 2, Tier 3, the diagnostic band,
  FOREST, TREE, TRANSFER, `E993-BETA-AGG`, or Erdős #993. Every one of those
  terms occurs in `INFORMAL-PROOF.md` only inside the §7 exclusion paragraph,
  and none occurs in `Main.lean`. (The substring `993` in `Main.lean` is the
  inherited namespace `Erdos993G1.U3` only — a name, not a claim.)
- **The log-concavity fence.** `SOLUTION-CONTRACT.md` §3 fences "no
  log-concavity premise, ever". The audited object is strict log-**convexity**,
  is **proved** (never assumed), and is never applied to any independence
  sequence. No fence is breached, and the originating misnomer is removed: the
  only occurrence of `logConcave` anywhere in `Main.lean` is the condition-(i)
  rename note in the Part-1 doc comment, and `INFORMAL-PROOF.md` carries it
  only in §6, which records the correction.
- **Sufficiency vs. minimality.** The `K(1..7)` literals are stated in the claim
  of record as the **sufficiency** half, which is the correct scope. The
  minimality witnesses are present as six kernel-registered lemmas
  (`gamma_min_2..7`) but are deliberately **not** part of the terminal
  conjunction — so the award theorem must not be cited for minimality.
- **Alias, not dependency.** `gamma_pos_4` re-derives frozen ENTRY 149
  `Erdos993G1.ThirdWide.catalan_gap_pos` independently; nothing frozen or
  awarded is imported or re-declared. Confirmed by source inspection.
- **Hypotheses one-for-one.** `1 ≤ τ` and `τ ≤ k` in conjuncts (1)–(3),
  `8 ≤ τ` and `τ ≤ k` in conjunct (4), matching the Lean declaration; see the
  Intended Claim table and its note on conjunct (2).
- **Grade.** `INFORMAL-PROOF.md` claims no grade; `FORMALIZER-REPORT.md`
  correctly states **compiled-candidate**, not `formally_verified`, with the
  fidelity audit and canonical close still outstanding. This audit discharges
  only the informal proof-integrity step; it makes no kernel, fidelity, or
  promotion claim, and it is not an approval to register any grade.
- **Out of scope for this seat, reported not adjudicated.** The formalizer's
  `## Incident` (a forbidden `lake clean` that deleted the shared Mathlib build
  cache, self-reported in full, with the source checkout and pinned revision
  intact and the post-recovery 38-declaration axiom sweep byte-identical to the
  pre-incident one) is an operational matter for Ashton and the kernel/fidelity
  seats. It bears on artifact provenance, not on the mathematics audited here,
  and this seat takes no position on it beyond noting that it changes no
  statement in the ledger above.

---

## Verdict

**passed**

The informal proof in `INFORMAL-PROOF.md` (digest
`5dca79e4b81568c23949ca70b33d546d4d185b0a627dc0d2e6413974e47fbace`) is a
correct and complete proof of exactly the claim of record
(`claim_sha256 078b54fffde8dc5cb72e6aea8adf2d54d72cde3bd8da204286eccde9fb35b618`).
All 38 claim-ledger rows (54 individual claims) are verified with reproduced
evidence; none is false,
unsupported, a citation mismatch, disputed, or blocked. Every definition
matches the Lean source literally; every numeric literal — `K(1..7) =
0,2,3,4,6,12,70`, the six minimality witnesses, `C(142,71)`'s 42 digits, the
§A2 boundary — was recomputed independently in exact integers and matched
exactly; the denominator-free monotonicity holds without exception on
`1 ≤ τ ≤ k ≤ 200` and fails at exactly the 25 pairs with `0 ≤ k < τ ≤ 12` that
the record cites; the `τ ≥ 8` ceiling holds without exception for `τ = 8..16`,
`k = τ..300`; the log-convexity rename is correct in both name and direction;
the zero-extension guard is properly declared as a convention of record and is
load-bearing exactly where the proof says it is; and the claim asserts nothing
fenced.

Three prose imprecisions are recorded rather than waived — the `j ≤ k`
over-attribution in §3.4, the omitted `j ≤ k` hypothesis in §3.7's statement of
`catalan_cross_lower`, and the binder scope of claim conjunct (2). Each was
attacked in the critic pass, each is true under every reading tested, and none
supports any inference in the proof. They are not defects and do not qualify
the verdict. No defect was softened into a pass, and this seat repaired
nothing.
