# Return — r31 Cycle 2, seat U1

Route `C2-U-01`, mechanism token `FORMAL-ELIG-TOP-PARENT-DESCENT`, orientation U (formal / structural).

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading EXACTLY
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other
VerityOS file (per the dispatch and the worker common brief, the controller has booted for the run; the startup
protocol's own map into memory, conversations, modules, skills, logs and decisions was not followed). Subsystems
loaded: the constitution and the startup protocol only.

**Model disclosure (two-part):** chartered sonnet/high; transport-resolved model sonnet (explicit parameter);
runtime-reported model id: `claude-sonnet-5`.

**IMPORT LIST** (every non-interactive script in this return; standard library only): `json`, `hashlib`, `fractions.Fraction`. No network, no package installs. Lean side: `import Mathlib` only (pinned shared project, read-only, manual symlink — no `lake update`/`lake clean`/`elan`).

## Digest verifications performed before use

- **Dispatch** `control/dispatch/c2-stage3/DISPATCH-U1.md`: SHA-256
  `2a5c3284c349f66e74e77fd724abc9535987272f0203e544cd4674bc8b649d81` — verified with `shasum -a 256` before reading.
  **MATCH.**
- **Stage 2 packet manifest seal**, `control/C2-STAGE2-PACKET-MANIFEST.json`: recomputed SHA-256 of the canonical JSON
  of the manifest without `seal_sha256` (`json.dumps(..., sort_keys=True, separators=(",",":"))`, no trailing newline)
  in `python3 -B`: `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`. This equals the recorded
  `seal_sha256` and the value in the dispatch. **Seal: MATCH.**
- **Sources read**, each checked against `sources/c1-results/SOURCE-DIGESTS.json` (schema
  `verityos.r31.source-digests.v1`) before reading:
  - `sources/c1-results/second-reads/SR-4/SECOND-READ.md` — MATCH (`112164b8…`)
  - `sources/c1-results/runs/lean-2026-09-28-c1-la3-two-binomial-descent/LeanProject/LeanProof/Main.lean` — MATCH (`c0605e12…`)
  - `.../FORMALIZATION-STATE.json` — MATCH (`6d59d4c3…`)
  - `.../THEOREM-CONTRACT.yaml` — MATCH (`33bc3c74…`)
  - `.../LeanProject/lakefile.toml` — MATCH (`45d0ca58…`)
  - `.../LeanProject/lake-manifest.json` — MATCH (`52a4d73c…`)
  - `.../LeanProject/lean-toolchain` — MATCH (`2bdc48ad…`)
  - All 7/7 match, 0 mismatches.
- **Mathlib pin** (`sources/mathlib-binding/PIN.json`): `mathlib_rev = 905b95818eb32af7874a58b427f50c1711a5e96c`. Verified
  against `git rev-parse HEAD` inside `/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages/mathlib`:
  identical. **MATCH.**
- **Registries** (read-only, for the alias check): `sources/authority/CLAIM-IDENTITY.json` (491 claims) and
  `control/CLAIM-IDENTITY.run-local.json` (497 claims), counts as stated by the gate.

## Controller fact CF-C2-G

The controller (mid-task) flagged that `control/C2-ALLOCATION.md` §U1 writes `G = (1+x)^8 + x(1+2x)^8`, which is the
factors swapped relative to the contract's object of record, `SEMANTIC-CONTRACT.md` §2: `G = (1+2x)^8 + x(1+x)^8`
(record `control/C2-STAGE3-CONTROLLER-FACT-G.json`, SHA-256 `7582bb5e0cc16778bdf702596f303559b9528ac953d5e1a4104bd8c7a5c408f3`,
verified before reading; controller fact, never evidence). **I already used the contract's correct `G`.** My Lean
definition is `cb8G := X * (1 + X) ^ 8 + (1 + 2 * X) ^ 8`, which is `x(1+x)^8 + (1+2x)^8` — algebraically identical to
the contract's `(1+2x)^8 + x(1+x)^8` (commuted addition), and written in that commuted order specifically so
`add_pow`'s index runs directly over the block index `j` (see node (1) below). I derived `G` directly from
`SEMANTIC-CONTRACT.md` §2 and SR-4a's own re-derivation ("If `r ∉ B`, the `s–v` edge gives `(1+2x)`... each choke gives
`(1+2x)^8` when `u_i ∉ B` and `x(1+x)^8` when `u_i ∈ B`... `G`"), never from the allocation's restated line. No rework
was needed.

## Registered claims named before any census (rule 3)

Before presenting any computation below as evidence, I name the one registered claim my Lean work bears on:
`E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE`
(SR-4d, grade `computer_assisted`, STATUS VERIFIED at the Cycle 1 close). This key's statement (a) is exactly
`(ELIG-top)(a)`: `i_{p*-1} < i_{p*-2}`. My Lean scratch formalizes this statement (and (E), which follows from it plus
`α = 9m+1` and `3p* < 2α+1`) as an integer/`Polynomial ℤ` theorem, **conditional on one explicitly named hypothesis**
(node (2) below). I do not re-confirm this key's grade and do not change it: my compiled Lean declarations are scratch
with no grade of their own (WORKER-COMMON-BRIEF item 8), and the universal certificate the key ultimately needs
(node (2)) is not discharged here. I also touch, as carried (not re-proved) infrastructure: the closed-form key's node
(`E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`, cited only for
the closed form, re-derived independently here, never its favorability content) and the formally verified Lean award
C1-LA3 (`sources/c1-results/runs/lean-2026-09-28-c1-la3-two-binomial-descent/`), carried byte-identically.

No new claim is proposed. Compiled Lean scratch carries no grade and is not registered (WORKER-COMMON-BRIEF item 8),
so the alias-check step is formally N/A; I still ran it as a sanity check (never skipped): a lexical scan of both
registries (491- and 497-claim files) for `PARENT-DESCENT`, `ELIG-TOP`, `CB8S5`, `FORMAL-ELIG`,
`CONDITIONAL-CONJUNCT`, `BLOCK-IDENTITY` inside any `key` field returned **0 hits** in either registry — no
accidental collision. Per gate ruling 11 I use "parent descent" only in `SEMANTIC-CONTRACT.md` §2's own established
sense (not as a proposed key fragment), never write "TOP-RANK" in any name, and never write the phrase "coefficient
descent".

## Scope and division of labor (read from C2-ALLOCATION.md before starting)

My load-bearing obligation (§U1): *"formalize (ELIG-top)(a) as an integer theorem about the closed-form polynomial,
in scratch, sorry-free: `i_{p*-1} < i_{p*-2}`... Nodes: (1) the block identity...; (2) the degree-50 `S_5` certificate
as a polynomial positivity statement...; (3) C1-LA3's (BD) for `j ≥ 6`... carry byte-identically; (4) the
composition. Name the link to `cbGraph`... as the remaining node — U3 owns it."*

Everything below is about the **closed-form polynomial** `cb8I m : ℤ[X]` of record (SEMANTIC-CONTRACT §2), never
about the literal graph `cbGraph` (award C1-LA2). Linking `cb8I`'s coefficients to `cbGraph`'s independence-polynomial
coefficients (and hence to `C5LA1.crossingIndex (cbGraph m)`) is explicitly U3's node, not mine, and I did not attempt
it. No network instrument, no (WID)/supply–capacity assertion, and no acyclicity/connectivity test appears in this
route: there is no literal graph or transport network in scope here (that is F1/F3/T3/U2/U3's territory); this is
stated explicitly rather than silently omitted.

## Lean project

`scratchpad/c2-U1/LeanProject/`, `lakefile.toml`/`lake-manifest.json`/`lean-toolchain` byte-copied from
`sources/c1-results/runs/lean-2026-09-28-c1-la3-two-binomial-descent/LeanProject/` (verified above); `.lake/packages`
bound by **manual symlink** to `/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages`
(never copied); `LeanProject/LeanProof/Main.lean` starts as a **byte-identical carry** of C1-LA3's `Main.lean`
(verified `diff` clean and SHA-256-equal before any edit), entries 1–21, with all of my new content appended strictly
after entry 21. `Snippets/*.lean.fragment` (entries 1–21) also copied byte-identically for the record. Always `cd`
into the project before `lake`/`lean`. No `lake update`, no `lake clean`, no `elan` invocation.

## Step-by-step derivation, naming where each hypothesis enters

**Node (1) — the block identity (`cb8_block_identity`, `cb8_coeff_diff`), unconditional, sorry-free.**

Definitions (all `noncomputable def`, `E993Transport` namespace):
- `cb8G : ℤ[X] := X * (1 + X) ^ 8 + (1 + 2 * X) ^ 8` — the contract's `G`, commuted (CF-C2-G above).
- `cb8I (m) : ℤ[X] := (1 + 2 * X) * cb8G ^ m + X * (1 + X) * (1 + 2 * X) ^ (8 * m)` — the closed form of record.
- `cb8P (m j) : ℤ[X] := (1 + X) ^ (8 * j) * (1 + 2 * X) ^ (8 * (m - j) + 1)` — the block polynomial, written to be
  syntactically identical to C1-LA3's carried `cb8_block_descent_topRank` statement (so node (3) below applies with no
  restatement).

`theorem cb8_block_identity (m : ℕ) : cb8I m = (∑ j ∈ Finset.range (m+1), (m.choose j : ℤ[X]) * X^j * cb8P m j) + X*(1+X)*(1+2*X)^(8*m)`.
Where each hypothesis/fact enters: none beyond `m : ℕ` — this is an unconditional polynomial identity. Proof: unfold
`cb8I`, `cb8G`; apply Mathlib's binomial theorem `add_pow : (x+y)^n = ∑_{k∈range(n+1)} x^k y^{n-k} · C(n,k)` to
`cb8G^m` with `x := X*(1+X)^8`, `y := (1+2X)^8` — writing `cb8G` in this commuted order makes the sum index `k` match
the block index `j` with no `Finset.sum_range_reflect`; distribute the outer `(1+2X)` into each term via `mul_pow`,
`pow_mul`, `pow_succ`/`ring` (lemma `cb8_term_eq`, a one-line `ring` after exponent normalization). Sorry-free;
`#print axioms` reports only `[propext, Classical.choice, Quot.sound]`.

`theorem cb8_coeff_diff (m L : ℕ) (hLm : m ≤ L) : (cb8I m).coeff L - (cb8I m).coeff (L+1) = (∑ j ∈ Finset.range (m+1), (m.choose j : ℤ) * ((cb8P m j).coeff (L-j) - (cb8P m j).coeff (L-j+1))) + (tail.coeff L - tail.coeff (L+1))`.
Where each hypothesis enters: `hLm : m ≤ L` is exactly what makes every term's ℕ-subtraction `L - j` (for `j ≤ m ≤ L`)
a true, non-truncating value, and likewise `L - j + 1 ≤ L + 1` needs no separate bound. Proof: take `.coeff L` and
`.coeff (L+1)` of `cb8_block_identity` via `congrArg`; push the coefficient through the sum (`finsetSum_coeff`) and
through each term (`cb8_term_coeff`: `((m.choose j : ℤ[X]) * X^j * cb8P m j).coeff k = (m.choose j : ℤ) * (cb8P m j).coeff (k-j)`
for `j ≤ k`, via `C_eq_natCast`, `coeff_C_mul`, `coeff_X_pow_mul` after rewriting `k` as `(k-j)+j` **only on the
target occurrence** — rewriting it everywhere corrupts the `k-j` already on the other side, the one real subtlety of
this lemma); recombine via `Finset.sum_sub_distrib`. Sorry-free, same three axioms.

**Node (3) — carried (BD) for `j ≥ 6` (`cb8_tail_blocks_nonneg`), unconditional, sorry-free.**

C1-LA3's `theorem cb8_block_descent_topRank (m j : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) (hj : 5 ≤ j) (hjm : j ≤ m)`
gives the **strict** descent `B_j(l+1) < B_j(l)` at `l = p*-2-j` for **every** `j ∈ [5,m]` — a superset of the `j ≥ 6`
the allocation names, carried byte-identically (entry 21, unmodified). Where each hypothesis enters: `hm`, `hmod` fix
the class; `hj : 5 ≤ j` is exactly the gap-sign threshold (`E1i`/`BD`'s gap `2j-8 ≥ 2`); `hjm : j ≤ m` keeps `m-j` a
true ℕ value. I apply it with `j ∈ [6, m]` (a strict sub-range of `[5,m]`, `hj := by omega` from `6 ≤ j`) to conclude
`0 ≤ Σ_{j∈Ico 6 (m+1)} C(m,j)·g_j` — nonnegative because each `C(m,j) ≥ 0` (`positivity`) and each `g_j > 0`
(`nlinarith` from the carried strict inequality). Sorry-free, same three axioms.

**Node (2) — the `S_5` certificate. NOT proved in this seat; the route's one blocked node.**

`cb8S5 (m) : ℤ := (∑_{j=0}^{5} C(m,j)·g_j(m)) + τ(m)` at `L = (16m+4)/3 - 2`, i.e. exactly SR-4's pooled certificate
(`sr4_cert.py`), stated as a Lean `def` over the same `cb8P`/`cb8I` objects as nodes (1)/(3). I did **not** attempt a
Lean proof of `∀ m, 107 ≤ m → m % 3 = 2 → 0 < cb8S5 m`; the reasons and the concrete split are below.

**Node (4) — the composition (`cb8_elig_top_a_conditional`), conditional on node (2), sorry-free.**

`theorem cb8_elig_top_a_conditional (m) (hm : 107 ≤ m) (hmod : m % 3 = 2) (hS5 : 0 < cb8S5 m) : (cb8I m).coeff ((16*m+4)/3 - 1) < (cb8I m).coeff ((16*m+4)/3 - 2)`.
Where each hypothesis enters: `hm`, `hmod` are passed through to node (3); `hS5` is the **only** non-structural
premise — granted it, the theorem is unconditional. Proof: instantiate `cb8_coeff_diff` at `L := (16m+4)/3-2`
(`hLm : m ≤ L` by `omega`, using `hm`); split the `range(m+1)` sum into `range 6` and `Ico 6 (m+1)`
(`Finset.sum_Ico_consecutive`); the first piece plus the tail is `cb8S5 m` by definition; the second piece is
`≥ 0` by node (3); `linarith` closes `Δ > 0` from `hS5 : cb8S5 m > 0` and the nonneg remainder. Sorry-free, same
three axioms.

**Axiom check** (`#print axioms`, all four): `E993Transport.cb8_block_identity`, `cb8_coeff_diff`,
`cb8_tail_blocks_nonneg`, `cb8_elig_top_a_conditional` each depend on exactly `[propext, Classical.choice, Quot.sound]`
— the three permitted axioms, no `sorry`, no `native_decide`, no `decide` over any enumeration standing in for a
universal step (the only `decide`-adjacent tactics used anywhere are `omega`, `ring`, `nlinarith`, `positivity`,
`linarith` on genuinely universally-quantified goals, never a finite stand-in).

**Compile times** (clean rebuild, `.lake/build` of this project removed first; shared Mathlib `.lake/build` untouched
— it is prebuilt, read-only, and not rebuilt by this project): `LeanProof.Main` **~26–27s**, `LeanProof` (the
top-level import) **~3.4–3.6s**; total wall time for a clean `lake build LeanProof` in this project **~31–34s** across
three repeated measurements. `set_option maxHeartbeats 1000000` (5× the 200000 default) is needed on
`cb8_block_identity` and `cb8_elig_top_a_conditional`; without it the first hits a deterministic `whnf` timeout at the
default budget. The file is 644 lines (entries 1–21 carried unchanged, plus 179 new lines: 1 header comment, 3 `def`s,
4 `private lemma`s/`theorem`s, 4 diagnostic `#print axioms` lines). It did **not** need to be split into more than one
file — node (2) is what is too large, and it is not attempted here at all, so no split of *this* file was needed;
splitting *node (2)* is discussed below as the successor's task.

## Independent numeric cross-check (bounded_computation, never evidence for the universal claim)

Two standard-library-only Python instruments under `scratchpad/c2-U1/`, built from scratch (direct polynomial
convolution on `cb8G`, independent of SR-4's falling-factorial/common-denominator method), to check that the Lean
objects `cb8I`, `cb8P`, `cb8S5` are faithful to SR-4's construction and to compute `x` and `Δ_L` independently at
named rows:

- `u1_cb8s5.py` (SHA-256 `c5210c763a2494cd5578a81a33be0d1ea17f2555b085b610aa8b3886df56419a`) computes `cb8S5(m)`
  block-by-block at `m ∈ {95, 107, 110, 113, 116, 119}`. Output `u1_cb8s5_out.json`
  (SHA-256 `757a5e0af144d3c265aca04bf0ea930fde852bfa254f765d55e99a06a80c7cfc`).
- `u1_cb8_delta_check.py` (SHA-256 `c4dad7fdfced5a5f66c0072eedf20b4ec6a16991c1cfe25e3be3977611e3c81b`) builds the
  **full** `cb8I(m)` polynomial (degree `9m+1`) at the same six rows, and independently computes: `α = deg(cb8I m)`;
  `x` = the actual first strict descent (`crossing_index`: least `k` with `i_{k+1} < i_k`, zero-extended above `α`,
  matching `C5LA1.crossingIndex`'s contract exactly, not a shortcut); `Δ_L := i_{L+1} - i_L` at `L = p*-2` (contract
  descent convention: `Δ_L < 0` ⟺ strict descent at `L`); `cb8S5(m)` recomputed via the same block construction as
  the first script, from the full polynomial this time (a second, independent code path); the eligibility bounds
  `x+2 ≤ p*` and `3p* < 2α+1`. Output `u1_cb8_delta_check_out.json`
  (SHA-256 `b5db1905e180afc97f5ac55b96314faffef653f8ecaa988ebe897015be8873c6`).

**Rows** (`x` and `Δ_L` with the difference index `L` on every row, `L = p*-2`):

| m | L (=p\*-2) | α | p\* | x | Δ_L = i_{L+1}−i_L | descends? | `0 < S_5`? |
|---|---|---|---|---|---|---|---|
| 95  | 506 | 856  | 508 | 506 | negative (hash `2c15a7de…`) | yes | **no** (S_5 hash `b64f2686…`, negative) |
| 107 | 570 | 964  | 572 | 570 | negative (hash `97793bc2…`) | yes | yes (S_5 hash `e07f8d15…`) |
| 110 | 586 | 991  | 588 | 586 | negative (hash `e59c92ae…`) | yes | yes (S_5 hash `74cb122b…`) |
| 113 | 602 | 1018 | 604 | 602 | negative (hash `8e10f5e1…`) | yes | yes (S_5 hash `9bbc113b…`) |
| 116 | 618 | 1045 | 620 | 618 | negative (hash `f63a488a…`) | yes | yes (S_5 hash `5128ec95…`) |
| 119 | 634 | 1072 | 636 | 634 | negative (hash `c4f20a3b…`) | yes | yes (S_5 hash `aaa47624…`) |

Every row independently reproduces SR-4's reported `(n, α, x, p*)` at `m = 95, 107, 110, 113` exactly (e.g.
`m=107 → α=964, x=570, p*=572`; `m=110 → α=991, x=586, p*=588`; `m=113 → α=1018, x=602, p*=604`) and its qualitative
findings (`x = p*-2` on the class rows checked, non-eligible-certificate sign flip at `m=95` outside the class). The
ratio `S_5/(-Δ_L)` (float, **explicitly non-evidentiary**, reported only to cross-read against SR-4's table) came out
`0.14170727870232777`, `0.16253730752085296`, `0.17593013014059003` at `m = 107, 110, 113` — matching SR-4's reported
`0.1417, 0.1625, 0.1759` to four decimals from a fully independent construction (direct convolution vs. SR-4's
falling-factorial/common-denominator method), which is strong (still bounded_computation, still not a proof)
corroboration that `cb8S5` as I defined it in Lean is the same object as SR-4's `S_5`.

**Replay** (copy-out-first; deterministic; no wall-clock/PID/host fields in any hashed output; `python3 -B` throughout):

```
S=/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-U1
mkdir -p ${S}-replay && cp $S/u1_cb8s5.py $S/u1_cb8_delta_check.py ${S}-replay/ && cd ${S}-replay
python3 -B u1_cb8s5.py > u1_cb8s5_out.json
python3 -B u1_cb8_delta_check.py > u1_cb8_delta_check_out.json
```

I ran this exact replay (into `scratchpad/c2-U1-replay/`, not `scratchpad/c2-U1/`) and confirmed byte-identical
SHA-256 digests for all four files against the originals above. Both scripts ran in well under one minute, in the
foreground; no background job was started, so none needed to be killed.

## Node (2), reported as the exact blocked node, with a concrete split (as the allocation invites)

I did not attempt a Lean proof of `∀ m, 107 ≤ m → m % 3 = 2 → 0 < cb8S5 m`. Reasons: SR-4c's own construction (the
object being formalized) is intrinsically the hardest step in the whole route — it re-expresses six binomial-product
coefficient differences as ratios to a common reference `R := C(B,L)·2^L` via falling factorials, combines them over
one common denominator `D_5(t)` of degree 46 (after `m = 3t+2`), and asserts that the resulting numerator `N_5(t)` is
an explicit degree-50 integer polynomial with all 51 shifted coefficients (`t = 35+u`) positive. Reproducing this
*derivation* (not just its numeric conclusion, which I did cross-check above) as a Lean `ring`/`field_simp` identity
between `cb8S5 m` and `N_5((m-2)/3) / D_5((m-2)/3)` is a substantial project on its own, separate from — and harder
than — nodes (1)/(3)/(4) above, and attempting it under this route's remaining time risked leaving it either
unfinished (a `sorry`, which is forbidden) or shipped as a false "complete" claim. I judged an honest partial return
with three of four nodes fully closed, sorry-free, and unconditionally correct — plus a strong independent numeric
cross-check of the fourth — more valuable than a rushed or incomplete attempt at the fourth.

**Concrete split for a successor**, in the order I would attempt it:

1. **Coefficient-extraction lemma.** For `a b l : ℕ`, `((1+X)^a * (1+2X)^b).coeff l = Σ_{i=0}^{l} C(a,i)·2^{l-i}·C(b,l-i)`
   (a finite convolution, `Polynomial.coeff_mul` over `Finset.Nat.antidiagonal` plus `Polynomial.coeff_pow`/binomial
   coefficients of `(1+X)^a` and `(1+2X)^b` individually — both already effectively computed inside C1-LA3's own
   `twoBinomCoeff_*` lemmas' proof of positivity/log-concavity, but not extracted as a standalone closed form there).
   For `cb8P m j` this gives `a_j(l) := Σ_{i=0}^{8j} C(8j,i)·2^{l-i}·C(8(m-j)+1, l-i)` (only 41 terms since `j ≤ 5`).
2. **Falling-factorial ratio lemmas.** Express each `C(8(m-j)+1, l-i)` as a ratio to the reference `C(B,L)` (`B = 8m+1`,
   `L` fixed) via `Nat.descFactorial`/`Nat.choose` identities, valid once `m = 3t+2` is substituted and every argument
   is shown nonnegative for `t ≥ 4` (SR-4's own range check, reproducible via `omega`/`Nat.choose_le_choose`-style
   bounds). This is where SR-4's "99-point identity guard" (checking degree ≤ 51 against ≥ 52 sample points) would
   need to become a genuine Lean derivation rather than a numeric cross-check — i.e. the ratio must be proved equal to
   an explicit rational-function-of-`t` expression by algebra, not confirmed at finitely many points.
3. **Common-denominator combination.** Multiply through by `D_5(t)` and simplify to the single polynomial identity
   `S_5(3t+2) · D_5(t) = N_5(t)` in `ℤ[t]` (a `ring`-closeable goal **only after** steps 1–2 have produced the exact
   symbolic form — `ring` cannot discover the falling-factorial manipulation itself).
4. **Positivity of the concrete numeral polynomial.** With `N_5(35+u)`'s 51 integer coefficients in hand (I confirmed
   their signs numerically above, matching SR-4's table), `0 < N_5(35+u)` for `u : ℕ` is `positivity`/`norm_num` on a
   sum of nonnegative terms with at least one strictly positive term — legitimate and inexpensive **once the
   coefficients are literal numerals from step 3**, and not a `decide` standing in for a universal claim (the
   generalization over `u : ℕ` is a genuine induction/positivity argument on a fixed polynomial, not an enumeration).

Steps 1–3 are the expensive ones; step 4 is cheap once reached. If step 3's single `ring` call is too large for one
declaration (plausible at degree 50 with 56-digit coefficients), the natural split is by block `j = 0..5` plus the
tail (six separate common-denominator lemmas, then one final `linarith`/`ring` combination), mirroring `cb8S5`'s own
six-term sum.

## Grades

All four Lean declarations above are **compiled scratch, no grade** (WORKER-COMMON-BRIEF item 8: "a seat's compiled
declarations are scratch (no grade)"). The registered key
(`E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE`)
they bear on remains at its recorded grade `computer_assisted`; nothing here changes it (no formal award closed).
The Python cross-checks above are `bounded_computation`, never evidence for the universal statement, per fence 7.

## Gate lines (ruling 14)

`ELIG_formal: advanced` — three of the four Lean nodes toward a formal, sorry-free proof of (ELIG-top)(a)/(E) are now
complete and unconditional; the fourth (node (2)) is isolated as the sole named remaining hypothesis, with a concrete
plan above. Not `blocked` (real, checked progress exists) and not fully closed (node (2) remains).
`HALL_formal: not_advanced` — this route touches no network, flow, or (HALL) object.
`FAV_darroch_free: not_advanced` — this route touches no favorability statement (T1/T2's territory); no Darroch or
Newton use occurs anywhere in this route either way.
`cut_candidate: none` — no deficient cut was sought or found (not this route's object).

## Fences checked

Fence 1 (one rank, the class only): every Lean statement is parameterized by `m ≥ 107`, `m % 3 = 2`, at the fixed
index `L = p*(m)-2`; nothing is claimed at any other rank or class. Fence 3 (Darroch/Newton hygiene): neither appears
anywhere in this file; the block-identity/composition route is pure polynomial-coefficient algebra. Fence 4
(template vs. network): N/A, no network instrument. Fence 5 (explicit `M_0`): `hm : 107 ≤ m` is the only threshold
used and it is the class endpoint itself, not an asymptotic approximation; no "for sufficiently large `m`" appears.
Fence 6 (refuted mechanisms stay refuted): none invoked (`E993-TREE-REAL-ROOTED` is not used; no real-rootedness claim
about `cb8I`, `cb8G`, or `cb8G^m` appears anywhere). Fence 7 (census discipline): the six-row numeric cross-check is
explicitly labeled `bounded_computation`, never evidence, throughout. Fence 8 (sealed roots): no sealed member was
edited; all carries are byte-identical copies into my own scratch. Fence 9 (attribution): the closed form and `α`:
r30 (T1, Cycle 6); the block identity's re-derivation, the tool (G)/(BD) for `j ≥ 5`, and their Lean carrier: C1-LA3
(formalizer `c1-la3-formalizer-opus-20260928`, chartered Claude Opus 5.5), carried byte-identically; the difference
identity, the `cb8S5` isolation, and the composition (nodes (1) difference-form, (4)): this seat, U1 (r31 Cycle 2,
Claude Sonnet 5); the CB family and lower-region context: Codex (GPT-6).

## Read-boundary disclosures

None. Every read in this session was either one of the two authorized VerityOS boot files, a file explicitly listed
in `control/C2-WORKER-COMMON-BRIEF.md`'s source list (verified against its digest file before reading), a file inside
this experiment's `scratchpad/c2-U1/` or `scratchpad/c2-U1-replay/` (my own scratch), or a `grep`/`git rev-parse`
confined to the Mathlib package directory (explicitly within the grant, per the brief: "`sources/`, the Mathlib
package directory and your own scratch directory are within it"). No `find`, `grep`, `rg`, or `ls -R` was run rooted
above any granted directory. No sibling return, critic, or adjudicator file was read. No network access, no package
install.

## headline_resolved: no

(The headline is Tier 1 `formally_verified` at full scope, or a confirmed eligible cut after two instruments and an
isolated second read — neither is a single route's product.)

## Route verdict: proved_conditional

Nodes (1), (3), (4) are proved, unconditional, sorry-free Lean declarations (scratch, no grade). Node (2) is granted
as an explicitly named hypothesis (`hS5 : 0 < cb8S5 m`); the terminal theorem `cb8_elig_top_a_conditional` is
therefore a genuine conditional proof of (ELIG-top)(a)/(E) about the closed-form polynomial, not yet a proof of the
unconditional statement and not yet linked to the literal graph `cbGraph` (U3's node).

## Remaining obligation

Written as what a successor inherits, in priority order:

1. **Node (2), the `S_5` certificate** (the run's single largest remaining formal gap on this route): a Lean proof of
   `∀ m, 107 ≤ m → m % 3 = 2 → 0 < E993Transport.cb8S5 m`, by the four-step split above (coefficient-extraction →
   falling-factorial ratio → common-denominator combination → numeral positivity), most naturally split into one
   sub-lemma per block `j = 0..5` plus the tail. The 51 shifted-coefficient signs are independently confirmed
   (bounded_computation, six rows, this return's replay) and match SR-4's table; what remains is the *symbolic*
   derivation connecting `cb8S5 m` to that concrete numeral polynomial, not the numeral polynomial's sign pattern
   itself.
2. **Once (2) closes:** `cb8_elig_top_a_conditional`'s hypothesis `hS5` discharges, giving an unconditional, sorry-free
   Lean theorem `∀ m, 107 ≤ m → m % 3 = 2 → (cb8I m).coeff ((16*m+4)/3-1) < (cb8I m).coeff ((16*m+4)/3-2)`
   (equivalently `(ELIG-top)(a)`) about the closed-form polynomial `cb8I`.
3. **The `cbGraph` link (U3's allocated node, not touched here):** even with (1)–(2) closed, this route's results are
   about `cb8I`/`cb8P`/`cb8G`, not yet about `C5LA1.crossingIndex (cbGraph m)` or `(cbGraph m).indepNum`. U3's
   independence-polynomial closed-form link is the remaining bridge to the Solution-Contract §2 terminal shape's
   conjunct 2 (`crossingIndex (cbGraph m) + 2 ≤ p*`).
4. My Lean file (`scratchpad/c2-U1/LeanProject/LeanProof/Main.lean`, 644 lines) is ready to be extended in place by a
   successor: `cb8G`, `cb8I`, `cb8P`, `cb8S5` and all four theorems are public (only `cb8_term_eq`/`cb8_term_coeff`/
   `cb8_tail_blocks_nonneg` are `private`, and only because nothing outside this file needs them); no renaming should
   be needed to attach node (2)'s proof once written.

## Artifact inventory

| File | SHA-256 | Role |
|---|---|---|
| `scratchpad/c2-U1/LeanProject/LeanProof/Main.lean` | `40789438145a68c3aaa84659437cd07f29bf575dd20a9b563ff4644dc067dcbe` | entries 1–21 carried byte-identically from C1-LA3; my additions (nodes 1,3,4 + `cb8S5`'s definition) appended after |
| `scratchpad/c2-U1/u1_cb8s5.py` | `c5210c763a2494cd5578a81a33be0d1ea17f2555b085b610aa8b3886df56419a` | block-by-block `cb8S5(m)` at 6 rows |
| `scratchpad/c2-U1/u1_cb8s5_out.json` | `757a5e0af144d3c265aca04bf0ea930fde852bfa254f765d55e99a06a80c7cfc` | its output |
| `scratchpad/c2-U1/u1_cb8_delta_check.py` | `c4dad7fdfced5a5f66c0072eedf20b4ec6a16991c1cfe25e3be3977611e3c81b` | full-polynomial `α`, `x`, `Δ_L`, `cb8S5(m)` cross-check at 6 rows |
| `scratchpad/c2-U1/u1_cb8_delta_check_out.json` | `b5db1905e180afc97f5ac55b96314faffef653f8ecaa988ebe897015be8873c6` | its output |

Scratch root: `scratchpad/c2-U1/`. Replay root: `scratchpad/c2-U1-replay/` (both Python scripts copied out and
re-run there; outputs byte-identical to the originals, confirmed above). No file was written under `sources/`, under
`cycles/` other than this `RETURN.md`, under any other experiment root, or under `/tmp`. All work ran in the
foreground; no background job was started, so none needed to be killed before this return.
