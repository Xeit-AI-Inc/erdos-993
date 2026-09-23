---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c4-la1-formalizer-sonnet-20260921
critic_id: c4-la1-fable-informal-20260921
attestation_id: c4-la1-informal-pass-20260921
claim_sha256: 0f7b818cbfa9a604105e50bcfe31c0bf5dd97c6682acdaf0e141f9d9b826bfc3
---

# Informal Proof Integrity Audit

**VerityOS boot acknowledgment.** Operating within VerityOS. This session booted
by reading `verity.md`, `identity/startup-protocol.md`, and
`skills/proof-integrity-audit/skill.md` (the three reads §0 of the brief
authorizes). Per the startup protocol's task-type map this is experiment /
project work, so the loaded subsystem is `experiments/` — specifically the run
root `experiments/erdos-993-uniform-residual-no-recovery-dre-2026-09-20` and, of
it, only the files enumerated in §1 of
`control/C4-STAGE7-INFORMAL-AUDITOR-BRIEF-LA1.md`. No durable VerityOS record
(memory, decisions, knowledge, skills, modules, identity, writing, logs,
reports) was read or written. Nothing outside the read boundary was opened: no
other award run, no other return, critique or adjudication, no manuscripts, no
master ledger, no repositories, no network.

**Model disclosure.** Chartered Claude Opus 5, effort `high`. The Agent
transport that dispatched this seat exposes no effort parameter and this seat
cannot self-inspect its own runtime model or effort setting; the disclosure is
stated on dispatch-record authority, exactly as the brief's header requires.
Child delegation forbidden — no sub-agent was launched. This seat is **not** the
artifact producer: no contract, Lean source, informal proof or receipt was
edited, and nothing was repaired. The only files written are
`scratchpad/c4-s7-informal-LA1/INFORMAL-AUDIT.md` (this file) and the auditor's
own scratch beside it, all by absolute path under the run root; no `/tmp`, no
`mktemp`, no `TMPDIR`. No `lake clean`, `lake update` or `elan` was run (no Lean
build was needed — this audit is of the mathematics, not the kernel). All
computations ran in the foreground; nothing was detached.

**Auditor instruments** (written from scratch for this audit; no prior evaluator
imported, standard library + numpy only, exact integers / `fractions.Fraction`
throughout, no floats in any counting or certificate path):

| instrument | SHA-256 |
|---|---|
| `scratchpad/c4-s7-informal-LA1/audit_core.py` | `b2482db973b997a7032e004796010d2eeda10927c489e289bb0dc0a5ae17765b` |
| `scratchpad/c4-s7-informal-LA1/graph_checks.py` | `e6278573715f5690998baa00d8da3b67e582c0599731d87f9e3a66843195783c` |
| `scratchpad/c4-s7-informal-LA1/search_violation.py` | `ba939211721a9083e17bf3aef230a4ccf815ef3d9f230a4b5c51cc54be0271e9` |
| `scratchpad/c4-s7-informal-LA1/critic_pass.py` | `463451525422ede188d4981a1c4799955a8e2bacbbaf26c1f9c7f0934faa6eed` |
| `audit_core.out.json` | `5baaab14e8adeb08ea3259b9a35206f85421d47c6ad2206ddf2173a7d97b5300` |
| `graph_checks.out.json` | `401e0380ada285dceb43c61521c5c2fe96a8cf127e58774a65d6b34363f05163` |
| `search_violation.out.json` | `c9a3b7f3ed23fe075b1d0eb5a019ad0470ebb254c4a5fdd627933ebcce05fdae` |
| `critic_pass.out.json` | `6cd981259a001562c75f8d31dc3a936b6337436f52ac7999889ba5e5bd393854` |

**Read-boundary integrity, verified before any mathematics.** The three pinned
digests in the brief reproduce exactly:
`THEOREM-CONTRACT.yaml` = `6f15b1aa61b511dd22d342da416d56d697b2a17bf67568c7fe33943201d71082`;
`INFORMAL-PROOF.md` = `617db49f8e7745d28cdab0b35bbb71fb14e4dc7df76b3e729f080a7ae907ed3f`;
`LeanProject/LeanProof/Main.lean` = `827a0c45190bde25bef16cd5362a6963a3995836c68eb940d78548fa18917cb6`.
The sealed capsule `control/c4-stage7-capsules/C4-LA1-PACKET-MANIFEST.json`
verifies: all nine member files match their recorded byte counts and digests,
and the seal recomputes to
`35afbd977270d08597d3c4ebbe744f5255de4be0628ebf93bb118d1d68c35f2f` under the
algorithm `CAPSULE-VERIFICATION.json` declares (SHA-256 of the compact
key-sorted JSON of the manifest minus `seal_sha256`, no trailing newline) — I
recomputed it against six candidate canonicalisations and exactly that one
matches.

## Intended Claim

The intended claim is exactly the contract's `theorem.informal_statement`:

> For every d >= 3, every finite type X, every finite simple graph G on X with
> Nat.card X = 3*d, and every matching of size m(d) = (3*d+1)/2 - 1 in G
> (realised by an injective f : Fin m(d) x Bool -> X with
> G.Adj (f (i,false)) (f (i,true)) for every i), Erdos993G1.delta G (d : Z) <= 0,
> where delta/coeff/indepCount are the G1 definitions counting actual
> independent-set sizes with integer zero extension. No crossing hypothesis, no
> acyclicity, no cover; uniform in d with no horizon; rank r = d and order 3*d
> only.

**`claim_sha256` recomputation (mandated).** With whitespace collapsed to single
spaces (`" ".join(s.split())`, 512 characters; the stored string is already in
that normal form), the SHA-256 is

```
0f7b818cbfa9a604105e50bcfe31c0bf5dd97c6682acdaf0e141f9d9b826bfc3
```

which **equals** the value the brief pins. Recorded in this file's front matter.

**Hypothesis-for-hypothesis correspondence with the Lean declaration** (brief
§4, last clause). The Lean statement in `Main.lean` normalises character-for-
character to the contract's `expected_statement`, whose own SHA-256 recomputes
to the contract's `expected_statement_sha256`
(`d753f988e3315dfbb39a7d2aa0ac10c689740308f893918656de9b0f5efd80c5`), and both
are byte-identical (modulo line wrapping) to the statement of record in
`cycles/cycle-4/stage6/SYNTHESIS.md` "## Lean awards", Award group 1, and to
`cycles/cycle-4/stage5/adjudicators/U/ADJUDICATION.md` "## Lean readiness",
Candidate B. One-for-one:

| informal statement | Lean declaration | verdict |
|---|---|---|
| every `d >= 3` | `(d : ℕ) (hd : 3 ≤ d)` | matches |
| every finite type `X` | `{X : Type u} [Finite X]` | matches |
| finite simple graph `G` on `X` | `(G : SimpleGraph X)` | matches |
| `Nat.card X = 3*d` | `(hn : Nat.card X = 3 * d)` | matches |
| matching of size `m(d) = (3*d+1)/2 − 1`, realised by an injective `f` adjacent in pairs | `(f : Fin ((3*d+1)/2-1) × Bool → X) (hf : Function.Injective f) (he : ∀ i, G.Adj (f (i,false)) (f (i,true)))` | matches |
| `Erdos993G1.delta G (d : ℤ) ≤ 0` | same | matches |

No hypothesis in the Lean declaration is absent from the informal statement and
none is added. Injectivity on `Fin m × Bool` yields `2m` distinct endpoints, and
adjacency in pairs then yields `m` pairwise vertex-disjoint edges — i.e. a
genuine matching of size `m(d)` — which is exactly the reading the informal
statement's parenthetical gives.

*Contract-metadata observation (not a claim defect, recorded for the
controller):* the contract's `quantifiers` array binds `d` to
`domain_id: "domain-x"`, the vertex-type domain (`lean_type: Type u`), although
`d : ℕ`. No ℕ domain is declared, so the binder had nowhere correct to point.
The `informal_statement`, `hypotheses`, `conclusion` and `lean_binding` are all
correct; only this one metadata row is mis-typed, and it is carried forward into
the rendered `EVIDENCE/THEOREM-CONTRACT.md`. It changes nothing mathematical.

## Claim Ledger

Every definition, lemma and inference step of `INFORMAL-PROOF.md` at
statement-level granularity. Verdict vocabulary is the skill's. Throughout:
`r = d`, `n = |V(G)| = 3d = 2r + d`, `m = m(d)`, `K = 2m − d`, `M = image f`,
`S(k,j) = {S ⊆ V : S independent, |S| = k, |S ∩ M| = j}`, `a_j = |S(d,j)|`,
`b_j = |S(d+1,j)|`.

| # | § | claim | depends on | evidence | verdict |
|---|---|---|---|---|---|
| L01 | 1 | `indepCount`, `coeff`, `delta` as quoted | — | diffed verbatim against `SEMANTIC-CONTRACT.md` lines 9–14; identical, and identical again to `Main.lean` ENTRY 1 | verified |
| L02 | 1 | `FirstWide.stratum G M k j = (G.indepSetFinset k).filter (fun S => (S ∩ M).card = j)` | L01 | identical to `Main.lean` ENTRY 2 (the `by classical; exact` wrapper is definitional) | verified |
| L03 | 2,4 | `m(d) = (3d+1)/2 − 1 = ⌈3d/2⌉−1` in ℕ; `= 3e+1` (odd `d=2e+1`), `= 3e−1` (even `d=2e`) | — | recomputed both forms for `d = 1..400` | verified |
| L04 | 2,4 | `K = 2m − d = 4e+1` (odd), `= 4e−2` (even) | L03 | recomputed `d = 1..400`; `K + d = 2m` holds in ℕ (Lean's additive `hK`) | verified |
| L05 | 2 | `n = 3d = 2r + d` at `r = d`; `2m ≤ n` (so such graphs exist) | L03 | recomputed `d = 1..400` | verified |
| L06 | 2 | `\|M\| = 2m` for `M = image f` | L01 | Lean `matching_endpoints_card`; `card_image_of_injective` on `Fin m × Bool` | verified |
| L07 | 3 | partition `i_k = Σ_{j=0}^{m} \|S(k,j)\|` | L06, L10 | fibering `S ↦ \|S∩M\|` over `[0,m]`; needs `\|S∩M\| ≤ m` (L10). Reproduced numerically on all 69 explicit graphs | verified |
| L08 | 3 | cardinality emptiness: `S(k,j) = ∅` if `n + j < 2m + k` | — | `\|S ∪ M\| = 2m + k − j ≤ n`. Re-derived; equivalent to `2d + j − 2m < 0`, i.e. `r + j − K < 0` | verified |
| L09 | 3 | index emptiness: `S(k,j) = ∅` if `j > k` | — | `S ∩ M ⊆ S` | verified |
| L10 | 3 | matching emptiness: `S(k,j) = ∅` if `j > m` | L06 | one endpoint per matched edge for an independent `S` | verified |
| L11 | 3 | **outside incidence at the Lean breadth**: for *any* `M` with `\|M\| = 2m` (not only `image f`) and any `r` with `n = 2r+d`, `(r+1−j)·\|S(r+1,j)\| ≤ (r+j−K)·\|S(r,j)\|` in ℕ with ordinary truncation | L08 | double count `(T,v)`, `T ∈ S(r+1,j)`, `v ∈ T∖M`: exactly `r+1−j` per `T`; `(T,v) ↦ (T∖{v},v)` injective into `S(r,j) × V`; each `A` receives `≤ \|V∖(M∪A)\| = n − (2m+r−j) = r+j−K`. **Truncation is safe without a case split**: the injection lands in `S(r,j)`, so if `S(r,j)=∅` the pair count is `0` outright. Lean `matching_outside_incidence` carries exactly `hM : M.card = 2*m`, `hK : K + d = 2*m`, `hn : Nat.card X = 2*r + d` — no matching structure | verified |
| L12 | 3 | **inside incidence**: for `M = image f` and `j+1 ≤ m`, `(j+1)·\|S(r+1,j+1)\| ≤ 2(m−j)·\|S(r,j)\|` | L06, L10 | double count `(T,v)`, `v ∈ T∩M`: exactly `j+1` per `T`; each `A ∈ S(r,j)` meets exactly `j` matched edges, and the partner of any met endpoint is adjacent to `A`, so `v` lies among the `2(m−j)` endpoints of unmet edges. Genuinely uses the matching. Matches Lean `matching_inside_incidence` (`hj : j + 1 ≤ m`) | verified |
| L13 | 4 | odd live `a ∈ {2e, 2e+1}` | L08,L09,L10 | derived independently: `n+j < 2m+k ⟺ j < 2e` at `k=2e+1`; `j > k` caps at `2e+1`. Checked `d = 3..400` | verified |
| L14 | 4 | odd live `b ∈ {2e+1, 2e+2}` | L08,L09,L10 | `j < 2e+1` (card) and `j > 2e+2` (index) at `k=2e+2`. Checked `d = 3..400` | verified |
| L15 | 4 | even live `a ∈ {2e−2, 2e−1, 2e}` | L08,L09,L10 | `j < 2e−2` (card), `j > 2e` (index) at `k=2e`. Checked `d = 4..400` | verified |
| L16 | 4 | even live `b ∈ {2e−1, 2e, 2e+1}` | L08,L09,L10 | `j < 2e−1` (card), `j > 2e+1` (index) at `k=2e+1`. Checked `d = 4..400` | verified |
| L17 | 4 | inside `[0,m]` only the card- and index-emptiness facts are needed; the matching budget "never fires ahead" because `d+1 ≤ m` — odd `⟺ e ≥ 1`, even `⟺ e ≥ 2`, exactly the hypothesis boundary | L03 | verified for every dead `j ∈ [0,m]` at both ranks, `d = 3..400`; and `d+1 > m` at `d = 1, 2`, so the claim's own boundary note is exact | verified |
| L18 | 5 | odd dual `μ_{2e} = μ_{2e+1} = λ_{2e+1} = 1/(2e+2)`, all else `0` | L11,L12,L13,L14 | exact `Fraction` re-solve of the full live column system, `d = 3..400`; nonnegative and index-legal | verified |
| L19 | 5 | even dual `μ_{2e−2} = (2e−2)/((2e+1)(2e−1))`, `λ_{2e−1} = λ_{2e} = 3/(2(2e+1))`, `μ_{2e−1} = (4e−1)/(4e(2e+1))`, `μ_{2e} = 1/(2e+1)` | L11,L12,L15,L16 | same, `d = 4..400` | verified |
| L20 | 5 | the printed literals: odd `coef_a(2e)=1`, `coef_a(2e+1)=(2e+1)/(2e+2)`, `coef_b(2e+1)=coef_b(2e+2)=1`; even `coef_a(2e−2)=(4e²−4)/(4e²−1)`, all other live `coef_a = 1`, all live `coef_b = 1` | L18,L19 | every literal recomputed exactly from `coef_b(j)=λ_j(r+1−j)+[j>0]jμ_{j−1}`, `coef_a(j)=λ_j(r+j−K)+[j<m]2(m−j)μ_j` for `d = 3..400`; all agree | verified |
| L21 | 6 | **odd cleared certificate**: `O: b₁ ≤ a₁`, `I1: (2e+1)b₁ ≤ 2(e+1)a₀`, `I2: (2e+2)b₂ ≤ 2e·a₁`, plus `a₁ ≥ 0`, all with weight `1`, collect to `(2e+2)(b₁+b₂) ≤ (2e+2)(a₀+a₁)`, hence `Δ_d ≤ 0` | L11,L12,L13,L14 | collected symbolically in exact polynomial arithmetic in `e`: coefficients `(a₀,a₁,b₁,b₂) = (2e+2, 2e+2, −(2e+2), −(2e+2))`; re-checked numerically `e = 1..600` | verified |
| L22 | 6 | **even cleared certificate**: `wOa=wOb=12e'²+42e'+36`, `wIc=8e'²+24e'+16`, `wId=8e'²+26e'+21`, `wIe=8e'²+28e'+24`, `slack(A0)=12e'+24`, `D=16e'³+96e'²+188e'+120`; the six collected atom coefficients each equal `D` | L11,L12,L15,L16 | collected symbolically: `A0,A1,A2 ↦ D`; `B0,B1,B2 ↦ −D`, exactly; re-checked numerically `e' = 0..600`. All weights `≥ 0` and `D > 0` for `e' ≥ 0` (checked `e' = 0..2000`) | verified |
| L23 | 6 | the integer weights are `D·λ_j`, `D·μ_i` for `D = 4e(2e−1)(2e+1)` rewritten in `e'` | L19,L22 | `4(e'+2)(2e'+3)(2e'+5) = 16e'³+96e'²+188e'+120` exactly; each of the five weights equals `D·λ`/`D·μ` as a `Fraction` for `e = 2..401` | verified |
| L24 | 6,7 | the raw coefficients named (`O:(1,1)`; `I1:(2e+1, 2e+2)`; `I2:(2e+2, 2e)`; `Oa:(2,1)`; `Ob:(1,2)`; `Ic:(2e'+3, 2e'+6)`; `Id:(2e'+4, 2e'+4)`; `Ie:(2e'+5, 2e'+2)`) are the true `(r+1−j)`,`(r+j−K)`,`(i+1)`,`2(m−i)` values, and the side condition `j+1 ≤ m` holds at every inside index used | L11,L12 | recomputed for every `d = 3..400`; all agree, all side conditions hold | verified |
| L25 | 7 | **no hidden lower bound on `e`**: `d=3` is `e=1` odd, `d=4` is `e=2` (`e'=0`) even, and every step is legal there | L17,L21,L22,L24 | literal instantiation at `e=1` and `e'=0`: every raw coefficient legal, `b`-top `≤ m` in both, all weights `≥ 0`, `D > 0`. The Lean branch hypotheses are exactly `1 ≤ e` / `2 ≤ e` and no step strengthens them | verified |
| L26 | 8 | `(3d+1)/2−1 = 3e+1` (odd) / `3e−1` (even); `Nat.even_or_odd'` split; `f` transported by `Fin.cast` composed with `Prod.map`, injectivity and adjacency transported along the same cast | L03 | arithmetic recomputed `d = 3..400`; the Lean terminal theorem performs exactly this and nothing else | verified |
| L27 | 9 | the `[Finite X] → [Fintype X]` bridge is `classical; letI := Fintype.ofFinite X`, the Cycle 1 award's idiom; not a gap | — | present in `Main.lean` at lines 493 and 596. **The prose overstates the location** — see F2(b) | verified with a recorded prose defect |
| L28 | 10 | attribution: incidence family = seat U4 (`U-C4-04`); the `r = d` dual = critic-attributed `C-U4-T` re-derivation (7), corroborated by `C-U4-F`; live-window derivation, cleared certificates, `Fin.cast` assembly and Lean engineering = this Stage 7 session | — | `RETURN.md` §5.4/§5.5 are the incidence proofs verbatim; `C-U4-T` §(7) is the dual used, literal-for-literal; `C-U4-F` F7 independently derived. Correct as stated — see the critic pass X1 | verified |
| L29 | 11 | fidelity item 2: the informal outside-incidence text is written at the Lean statement's breadth (arbitrary `M` of card `2m`) | L11 | the §3 text does say "for *any* `M : Finset X` with `M.card = 2*m`"; `matching_outside_incidence` indeed never uses the matching. Satisfies the U adjudicator's recorded repair | verified |
| L30 | 12 | scope exclusions and excluded margin literals | — | see "Scope and Fence Check" | verified |
| L31 | 13 | evidence digests: the generator checks "both parities' live windows and cleared-integer certificate identities for `d = 3..400`" | L13–L16, L21, L22 | replayed byte-identically, but the live-window **lower** endpoints are hard-coded, not derived — see F1 | **imprecise citation; the underlying mathematics is independently verified** |

## Reproduced Mathematical Evidence

Nothing below is taken on the producer's word. Every number was recomputed with
the auditor's own instruments.

**(a) Both dual families against the full live column system, `d = 3..400`.**
For each `d` the live windows were derived from the three emptiness facts (not
copied from the proof), the dual of §5 was built from its closed form, and the
full column system was checked in exact `Fraction` arithmetic: `λ, μ ≥ 0`;
`coef_b(j) ≥ 1` at every live `b`; `coef_a(j) ≤ 1` at every live `a`; and every
index carrying a nonzero weight has nonnegative untruncated `(r+1−j)` and
`(r+j−K)`, so no truncation is being abused. **398/398 `d` pass, zero failures.**
Every printed literal of §5 reproduces exactly (e.g. `d=3`: `coef_a = {2:1,
3:3/4}`, `coef_b = {3:1, 4:1}`; `d=4`: `coef_a = {2:4/5, 3:1, 4:1}`,
`coef_b = {3:1, 4:1, 5:1}`).

**(b) The cleared integer identities, symbolically and numerically.**
Odd branch: with each fact read as its slack form, `1·O + 1·I1 + 1·I2 + 1·(a₁≥0)`
collects to `(2e+2)·(a₀+a₁−b₁−b₂)` — exact equality of polynomials in `e`, not an
inequality that happens to hold. Even branch: `wOa·Oa + wOb·Ob + wIc·Ic +
wId·Id + wIe·Ie + slack·A0` collects to `D·(A0+A1+A2) − D·(B0+B1+B2)` with every
one of the six atom coefficients equal to `D` exactly. Both re-checked
numerically (odd `e = 1..600`, i.e. `d = 3..1201`; even `e' = 0..600`, i.e.
`d = 4..1204`), a superset of the declared `d = 3..400`. All weights are
nonnegative and `D > 0` on the full declared range, so each is a **valid
nonnegative combination of the named incidence facts** — for **every** `e`, with
no hidden lower bound: the odd branch is legal from `e = 1` (`d = 3`) and the
even branch from `e' = 0` (`d = 4`). I additionally confirmed that the integer
weights are precisely `D·λ_j`, `D·μ_i` of the §5 dual with
`D = 4e(2e−1)(2e+1) = 16e'³+96e'²+188e'+120`, so §5 and §6 are the same
certificate cleared, not two independent assertions.

**(c) Live windows by brute force on explicit graphs.** 69 explicit graphs of
order `3d` carrying an `m(d)`-matching at `d = 3, 4, 5` — the bare comparators
`m(d)K₂ ⊔ pK₁`, six densities of random augmentation with multiple seeds, an
outside-dominating graph and a "ladder" join between consecutive matched pairs.
For each: the strata were computed from the literal definition, the partition
identity `i_k = Σ_j |S(k,j)|` confirmed, the set of **nonempty** strata confirmed
to lie inside the claimed live window, **both** incidence inequalities confirmed
at **every** `j ∈ [0,m]` (live or dead), `Δ_d ≤ 0` confirmed, and the cleared
certificate re-evaluated on the actual stratum numbers and confirmed to be an
exact identity there. **69/69 pass, zero errors.** On the bare comparators the
nonempty strata equal the live windows exactly, and all three odd-branch
incidence facts are simultaneously **tight** (`d=3`: `a = {2:24, 3:32}`,
`b = {3:32, 4:16}`; `O: 32 ≤ 32`, `I1: 96 ≤ 96`, `I2: 64 ≤ 64`; the entire slack
`224 − 192 = 32` comes from the `a₁` padding step, which is therefore genuinely
load-bearing and not cosmetic).

**(d) Adversarial search for a violation of `Δ_d ≤ 0`.** WLOG the matching is
the fixed set `{0,1},{2,3},…` (relabelling is an isomorphism and `Δ_d` is
isomorphism-invariant), so the space is exactly the graphs of order `3d`
containing it. At `d = 3` (order 9, 4-matching, 32 free edge slots) I ran:
**exhaustively, all 15,033,173 graphs** obtained by adding any set of **at most
8** further edges (`Σ_{k≤8} C(32,k)`) — the sparse regime, which is where
`i_{d+1}` is largest and where any violation would have to live; **60,000,000**
uniform random graphs drawn across the whole density range; and **1,500**
steepest-ascent hill-climbing restarts over single-edge flips. Maximum `Δ_3`
found: **0**, attained only degenerately where `i_3 = i_4 = 0`; the maximum over
graphs with `i_3 > 0` is **−1**. The running maximum over the exhaustive sparse
sweep is **−8** at every extra-edge count `0..8`, attained at `4K₂ ⊔ K₁`. The
same search at `d = 4` (559,737 exhaustive + 12,000,000 random + 200 restarts)
and `d = 5` (4,852 exhaustive + 1,200,000 random + 25 restarts) also found no
violation. **No counterexample exists at any scale I could afford.**

**(e) The fence — the matching size is load-bearing.** With `m(d) − 1` matching
edges the comparator `(m(d)−1)K₂ ⊔ (3d − 2(m(d)−1))K₁` on `3d` vertices has
`Δ_d > 0` for every `d = 3..120`: e.g. `d=3`, `i_3 = 63`, `i_4 = 66`, `Δ_3 = +3`;
`d=4`, `321 → 360`, `Δ_4 = +39`; `d=5`, `1452 → 1520`, `Δ_5 = +68`. Its
`m(d)`-matching counterpart satisfies `Δ_d ≤ 0` at every one of those `d`
(`d=3: −8`, `d=4: −8`, `d=5: −112`). The hypothesis is therefore not decorative:
one fewer matching edge flips the sign.

**(f) Is `3 ≤ d` necessary?** Settled **exhaustively**, not by sampling. At
`d = 1` (`m = 1`, order 3): all 7 graphs of order 3 carrying a 1-matching have
`Δ_1 ≤ 0`, max `−1`. At `d = 2` (`m = 2`, order 6): all 32,576 graphs of order 6
carrying a 2-matching have `Δ_2 ≤ 0`, max `0` (attained at `K₆`, where
`i_2 = i_3 = 0`). So the *conclusion* happens to remain true below the
hypothesis — the theorem is not false at `d = 1, 2`. But the hypothesis is
necessary for **this proof**: at `d = 1, 2` one has `d + 1 > m(d)`, the top live
`b` index escapes the partition's own `[0,m]` range, the matching-budget
emptiness fact starts firing ahead of the index one, the window shape the
argument depends on degenerates (at `d=2` the `b` side has two live columns, not
three), and the even certificate's `e' = e − 2 ≥ 0` substitution is unavailable.
`INFORMAL-PROOF.md` §4 states this boundary correctly and does not over-claim:
it says only that the theorem "does not apply" below it, never that the
conclusion fails. Independently, `C-U4-F`'s own `d = 2` sweep over the 8,192
graphs containing a fixed 2-matching also reports `max Δ_2 = 0`, agreeing with
mine.

**(g) Definitions checked literally against the Lean source.** `indepCount`,
`coeff`, `delta` in §1 are byte-identical to `SEMANTIC-CONTRACT.md` and to
`Main.lean` ENTRY 1. `stratum` matches ENTRY 2. The `Fin ((3*d+1)/2 − 1) × Bool
→ X` encoding is the one audited above. The `[Finite X]` bridge is present where
it is needed. The two branch lemmas carry hypotheses `he : 1 ≤ e` and
`he : 2 ≤ e` and nothing stronger; every arithmetic side condition is discharged
by `omega` from those alone, which I confirmed by reading each `have`.

**(h) Replay of the producer's own generator.** Copied out (never run in place),
`EVIDENCE/verify_bottom_rank_certificate.py` reproduces
`EVIDENCE/bottom-rank-certificate.out.json` **byte-identically**
(`3f38f4f08e364a7fd7edbf67a008a941ac0e64ee9098c2325f6aa6e9ea6bfce1`), 398 rows,
`all_checks_passed: true`, and its internal payload digest recomputes. It is
deterministic and carries no wall-clock, PID or host field. See F1 for what it
does **not** check.

## Independent Critic Pass

Run over the auditor's own ledger before closing, attacking the rows rather than
re-confirming them (`critic_pass.py`). All six attacks were answered.

**X1 — is the dual the proof uses actually `C-U4-T`'s, and is §5's attribution
sentence true?** I transcribed `C-U4-F`'s F7 vector from its own `d`-indexed
text and tested both vectors independently for `d = 3..200`. Result: **both are
feasible at every `d`**; they are **identical on the even branch**
(`C-U4-F`'s `μ_{d−1} = (1−λ_d)/d` is `C-U4-T`'s `(4e−1)/(4e(2e+1))`, and
`μ_{d−2} = (d−2)/((d−1)(d+1))` is `(2e−2)/((2e+1)(2e−1))`); and they are
**distinct on the odd branch** (`C-U4-F` takes `λ_d = 2/(d+1)`,
`μ_{d−1} = 2e/((2e+2)(2e+1))` against `C-U4-T`'s `1/(2e+2)`, `1/(2e+2)`). That is
exactly what §5 asserts, and §5's statement that it uses `C-U4-T`'s vector
throughout is borne out by §6's coefficients. Attribution is **not** inflated.

**X2 — can a stratum outside the claimed live window be nonempty?** 1,400
randomised graphs at `d = 3, 4` across the full density range, testing every
`j ∈ [0,m]` at both ranks directly. Zero occurrences. The windows are not merely
"the ones the emptiness facts permit"; nothing outside them was ever populated.

**X3 — can either incidence inequality fail at a *dead* `j`, where the proof
does not use it but the Lean lemma still asserts it?** Same sweep, every
`j ∈ [0,m]`, both inequalities, ℕ truncation read literally. Zero failures. And
`Δ_d ≤ 0` held on all 1,400.

**X4 — is the soundness direction right, or is the chain reversed somewhere?**
32,000 adversarial nonnegative stratum vectors at `d = 3..12`, constructed to
saturate the incidence bounds and otherwise arbitrary. The chain
`Σ b ≤ Σ coef_b·b ≤ Σ coef_a·a ≤ Σ a` held on every one. The direction is
correct and the nonnegativity of `a_j, b_j` (automatic, they are cardinalities)
is the only extra ingredient.

**X5 — does either branch secretly need a stronger `e`?** Literal instantiation
at the exact boundary. Odd `e = 1` (`d = 3`, `m = 4`, `K = 5`): `O = (1,1)`,
`I1 = (3,4)`, `I2 = (4,2)`, both inside side conditions `j+1 ≤ m` hold, `b`-top
`= 4 = m`. Even `e' = 0` (`d = 4`, `m = 5`, `K = 6`): `Oa = (2,1)`, `Ob = (1,2)`,
`Ic = (3,6)`, `Id = (4,4)`, `Ie = (5,2)`, weights `(36,36,16,21,24)`, `D = 120`,
`slack = 24`, all three side conditions hold. **No hidden `e ≥ 2` on the odd
branch and no hidden `e' ≥ 1` on the even branch.**

**X6 — is the order hypothesis load-bearing, or is `3d` incidental?** Keeping the
same matching size `m(d)` but raising the order to `3d + k`: `d=3` order 10 gives
`Δ = +16`, order 11 `+63`, order 12 `+141`; `d=4` order 13 gives `+102`, order 14
`+321`, order 15 `+698`. The `Nat.card X = 3*d` hypothesis is essential, and the
claim's "order `3*d` only" fence is the right one.

**Defects the critic pass raised, all recorded and none mathematical:**

**F1 (evidence-citation overstatement — the most material finding).**
`INFORMAL-PROOF.md` §4 says "Both boundary computations are re-verified for
`d = 3..400` by `EVIDENCE/verify_bottom_rank_certificate.py`", and §13 describes
that script as "checking both parities' live windows". `FORMALIZER-REPORT.md`
§(iv) repeats it as "the live-window boundary arithmetic of both parities from
first principles". **The script does not do this.** Reading it: `check_odd`
computes the live sets as `{j : not (j < 2*e or j > r)}` and `check_even` as
`{j : not (j < 2*e−2 or j > r)}` — the **lower** endpoints are written in as the
very literals the proof claims, and the script never defines `n` at all, so it
cannot have applied the cardinality-emptiness fact `n + j < 2m + k` that
produces them. Only the index budget (`j > k`) and the matching budget (the
`range(m+1)` bound) are genuinely exercised; the assertions
`live_a == {2e, 2e+1}` etc. are tautological in their lower endpoint. The
**mathematics is nevertheless correct**: I derived all four lower endpoints from
`n + j < 2m + k` myself for `d = 3..400` (ledger L13–L16) and confirmed them by
brute force on explicit graphs (evidence (c)) and by the randomised sweep (X2).
So this is a defect in the corroborating artifact and in three sentences
describing it, not in the proof. The controller should have the producer either
correct the script to compute `n = 3d` and apply the cardinality fact, or
correct §4/§13 and the report to say what the script actually checks.

**F2 (prose-versus-source mismatches in the mechanization narrative, three of
them; none mathematical).**
(a) §6 odd branch says "the Lean proof supplies it via `linarith` directly from
the four `have`s, with no explicit multiplier needed";
`Main.lean:577` is `nlinarith [hOz, hI1z, hI2z, ha1nonneg]`. (`linarith` cannot
close that goal, whose two sides are products of the symbolic factor `2e+2` with
the stratum sums; `linarith` appears only at line 579 for the final assembly
from `hdelta/hA/hB/hfinal`.) `FORMALIZER-REPORT.md` repeats the same error. The
mathematical content — a four-term, unit-weight combination — is exactly right
and I verified it symbolically (L21).
(b) §9 says the bridge sits "at the top of each branch lemma **and the terminal
theorem**". `Fintype.ofFinite` occurs exactly twice, at lines 493 and 596, i.e.
in the two branch lemmas only; the terminal theorem has no `classical` and no
`letI` and needs neither, since it only dispatches to lemmas that already take
`[Finite X]`.
(c) §3 states the outside-incidence lemma "for ... any `r,j`"; the Lean lemma
requires `hn : Nat.card X = 2*r + d`, so `r` is determined by `n` and `d` and is
not free. §3's own proof line silently uses `|V| = 2r+d`, so the argument is
sound; the quantifier phrasing is loose.

**F3 (self-reference inaccuracy in the fence paragraph; errs on the safe
side).** §12 excludes the terminal-margin literals `3/(d²−4)` and `1/(d−1)` and
says "they appear above (§5, ... in the critic's re-derivation)". They do **not**
appear in §5, nor anywhere else in `INFORMAL-PROOF.md` except that exclusion
sentence itself. (They appear in `C-U4-T` §(7) and `C-U4-F` F7, which §5 cites.)
The effect is that the document fences literals it never states — which is the
safe direction — but the cross-reference is wrong.

**No defect was found in any mathematical step.** Every one of L01–L30 closes
verified with reproduced, independent evidence; L31 is a citation defect, not a
mathematical one. I record F1–F3 rather than softening or repairing them, and I
have not touched the producer's files.

## Scope and Fence Check

- **Not the Tier 3a schema.** §12 states in terms that the theorem is **not**
  `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN`. The claim is a single closed
  statement at `r = d` and order `3d`; it neither instantiates nor implies the
  schema, and no schema language appears anywhere outside the exclusion.
- **Rank.** Nothing is asserted at any rank other than `r = d`. The two branch
  lemmas conclude `delta G ((2e+1 : ℕ) : ℤ) ≤ 0` and `delta G ((2e : ℕ) : ℤ) ≤ 0`
  respectively and nothing else; the incidence lemmas are stated at a general
  `r`, but they are *hypotheses about strata*, not sign claims, and the theorem
  instantiates them only at `r = d`. Nothing is said about `d < r < K(d)` or
  about `r ≥ K(d)`.
- **Terminal-margin literals excluded.** `3/(d²−4)` and `1/(d−1)` are never
  asserted; they occur exactly once each, inside the §12 sentence that excludes
  them. This matches the synthesis ("excluded from the award until the
  controller supplies a definition of record for 'terminal margin'") and
  `C-U4-T`'s own caveat that "terminal margin" is undefined in its capsule. See
  F3 for the inaccurate cross-reference, which does not weaken the fence.
- **No transfer.** `firstDescent`/`x(G)`, forests, residuals, G1 tuples, Tier 1,
  Tier 2, the diagnostic band, FOREST, TREE, TRANSFER and Erdős #993 occur in
  the document **only** in §1's "no other G1 definition is touched" and §12's
  exclusion list — I grepped every occurrence of each term and read its context.
  Nothing is transferred, implied or bridged.
- **No sharpness claim.** §12 says "No sharpness claim." This is *stricter* than
  the synthesis, which permits "no sharpness claim beyond the recorded
  comparator fact that `m(d)−1` fails". The proof therefore under-claims rather
  than over-claims. (My evidence (e) confirms the comparator fact itself, which
  the proof does not assert.)
- **Attribution as the synthesis requires.** Incidence family → seat U4; the
  `r = d` dual → critic-attributed `C-U4-T` re-derivation (7), corroborated by
  `C-U4-F`; the window derivation, cleared certificates and Lean engineering →
  this Stage 7 session. I checked each against the sealed capsule members. The
  §5 claim about `C-U4-F`'s odd-branch vector being distinct is true (X1).
- **Fidelity item 1** ([Finite X] bridge) is disclosed in §9, as the U
  adjudicator required, with the location error noted at F2(b).
- **Fidelity item 2** (outside incidence widened to an arbitrary `M` of card
  `2m`) is carried in §3 and §11 at the Lean statement's actual breadth. I
  confirmed `matching_outside_incidence` takes only `hM : M.card = 2*m` and
  never uses the matching, so the widening is true and strengthens the informal
  result.
- **Hypotheses match the Lean declaration one-for-one** — table under "Intended
  Claim". `3 ≤ d` is necessary for the argument (window shape, partition range,
  `e' ≥ 0` substitution) though not for the truth of the conclusion at
  `d = 1, 2`, which I settled exhaustively (evidence (f)); §4 states this
  boundary without over-claiming.
- **No `sorry`, `admit`, `native_decide`**; axioms exactly `propext`,
  `Classical.choice`, `Quot.sound` per `EVIDENCE/axioms.txt`. (Noted only for
  completeness — the kernel gate is not this seat's.)
- **Observation for the controller, outside my mathematical charter.**
  `FORMALIZER-REPORT.md` discloses that the producer ran `pip3 install sympy`,
  a network access its own brief prohibited. My verdict does not rest on any
  producer script: every number in this audit was recomputed with my own
  standard-library-plus-numpy instruments, so the mathematical conclusion is
  independent of that lapse. The compliance question is the controller's.

## Verdict

**passed**

The mathematics of `INFORMAL-PROOF.md` is a correct and complete proof of the
contract's informal statement — for every `d ≥ 3`, every finite simple graph of
order `3d` carrying a matching of size `m(d) = (3d+1)/2 − 1` has `Δ_d ≤ 0` — at
statement-level granularity. The strata partition, the three emptiness facts,
the live windows at `r = d` for each parity, both incidence inequalities at the
breadth the Lean lemmas actually have, the closed-form dual for each parity with
every `coef_a`/`coef_b` exact, and the cleared integer certificate for **every**
`e` on both branches (odd from `e = 1`, i.e. `d = 3`; even from `e' = 0`, i.e.
`d = 4`, with no hidden lower bound) all recompute exactly under an instrument
written from scratch for this audit. No counterexample survives an exhaustive
sweep of 15,033,173 order-9 graphs in the sparse regime plus 60,000,000 random
ones plus hill climbing, nor the corresponding searches at `d = 4, 5`. The claim
asserts nothing fenced.

Three defects are recorded and **not** softened: **F1**, the evidence generator
hard-codes the live-window lower endpoints instead of deriving them from the
cardinality-emptiness fact, so §4's and §13's citation of it — and
`FORMALIZER-REPORT.md` §(iv) — overstate what that artifact checks (the
underlying windows are correct; I derived them independently); **F2**, three
prose-versus-source mismatches in the mechanization narrative (`linarith` for
`nlinarith` on the odd branch, the `[Finite X]` bridge claimed in the terminal
theorem where it is absent, and "any `r,j`" where `r` is pinned by
`Nat.card X = 2r+d`); **F3**, §12's cross-reference to §5 for the excluded
terminal-margin literals, which do not appear there. None of the three touches
a mathematical step, and none changes the verdict; all three are corrections the
controller should route to the producer, since each is a statement about the
artifact that is not true of the artifact.
