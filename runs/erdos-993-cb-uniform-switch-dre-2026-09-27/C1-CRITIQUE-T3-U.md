# Critique

Critic `C-T3-U` (orientation U, formal / structural), Cycle 1 Stage 4 of r31, assigned to seat `T3`: route `C1-T-03`, mechanism
`ELIG-TOP-BLOCK-MIXTURE-PARENT-DESCENT`, orientation T. Date 2026-09-27.

**Boot acknowledgment.** I booted VerityOS by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. As the dispatch directs, I did not follow the startup protocol's own map
into memory, conversations, modules, skills, logs or decisions. Read-boundary disclosures: (1) the harness injected the project
`CLAUDE.md` and the user's auto-memory index into my context without a fetch; I did not use either. (2) One of my own jobs, a
tree-DP replay over all 160 T3 rows, ran past the foreground timeout and the harness moved it to the background. I found its PID with
a name-targeted `pgrep -f compare_rows.py` (not a host-wide listing), inspected only that PID with `ps -p`, and killed it by literal
PID (62234, plus its wrapper 62231). I then reran the replay in the foreground on a 9-row sample, and only the sample is cited.
(3) I ran one lexical key search with Python `re` over `sources/authority/CLAIM-IDENTITY.json`, which is inside `sources/` and within
the grant. I ran no other search, and no search was rooted above the grant. No network, no installs. No background job is running at
the final write.

## Identity and seal audit

- Dispatch `control/dispatch/c1-stage4/DISPATCH-C-T3-U.md`: SHA-256 `5f44eb383f902db5b42d3d86c15c141a1b444bd12c74908da6b062036949eb1b`. **MATCH.**
- **Capsule seal** (`control/c1-critic-capsules/T3-PACKET-MANIFEST.json`, canonical JSON without `seal_sha256`, sort_keys, `(",", ":")`,
  no trailing newline): recomputed `b0aa7004fb0cf9e348c45fe8b7e1c5d589d40f457f6e622c70391e0960150706`. **MATCH.** All 14 member files
  match their listed SHA-256 and byte counts.
- Stage 4 dispatch seal: recomputed `86453c5c1eae81d5c1a8cf4759bcec530ccf1ca6a47c1b693d35dce430a2587b`. **MATCH.**
- Stage 3 seal: recomputed `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37`. **MATCH.** Its entries for
  `DISPATCH-T3.md` (`a3e678b7…25ff`) and `RETURN.md` (`76233c06…741`) agree with what the return and the capsule state.
- Stage 2 seal: recomputed `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc`. **MATCH.**
- Every digest the return lists appears in the Stage 2 manifest with the same value: the worker brief, both contracts, the
  allocation, the gate, `OBLIGATIONS.csv`, `CLAIM-IDENTITY.json` and its run-local copy.
- Return artifacts, copied out to `scratchpad/c1-crit-T3-U/replay/`: `gen_eligtop.py` `589d9e6f…d833`, `block_mixture_check.py`
  `19c2d45d…b58d` and `eligtop_rows.json` `853e3201…7613` all **MATCH** the return. The two block-check digests (`48bfbf4d…9903` for
  m=107 and `31c74b7c…b1` for the five-row batch) match the stored JSON outputs once the trailing newline is stripped.
- Route ID `C1-T-03` and mechanism token `ELIG-TOP-BLOCK-MIXTURE-PARENT-DESCENT` both appear verbatim in the return. Its model
  disclosure ("chartered sonnet/high … runtime-reported model id: claude-sonnet-5") is consistent with `C1-ALLOCATION.md`.
- Claim identity: the return registers nothing, which is correct. Its alias check is sound. My own lexical sweep of the 544 frozen
  keys, filtered on `-CB-|CBSTAR|DESCENT|ELIGIB|PARENT-DESCENT|ELIG-TOP|R31`, finds no key that states the CB(8,m) parent descent. The
  nearest keys are the favorability key and the E1 condition-(i) key. Both concern different polynomials (`Δ_p(T−v)` and the `r_q`),
  so neither is a mathematical alias.

## Independent re-derivation

I built my own instruments (Python standard library, exact integers and `fractions`). None of them calls the return's code.

1. **Literal tree DP** (`own/tree_dp.py`). It builds the literal CB(8,m) edge list, asserts `n−1` edges and connectivity, and computes
   `I(T)` by the generic rooted in/out recursion. It does not use the closed forms. It reproduces the §5 fixed points:
   `CB(8,95)`: `n=1618, α=856, x=506`; `CB(8,107)`: `n=1822, α=964, x=570`. It also checks the fresh rows `m=110` and `113`, where
   (ELIG-top)(a) holds.
   - The same recursion re-derives the carried closed form `I = (1+2x)G^m + x(1+x)(1+2x)^{8m}` symbolically. The choke subtree has
     out/in polynomials `(1+2x)^8` and `x(1+x)^8`; the root has out `(1+2x)G^m` and in `x(1+x)(1+2x)^{8m}`.
   - Sampled replay of the return's census (`own/compare_rows.py`) at `m ∈ {107,110,113,116,200,299,395,500,584}`: `i_{p*−2}` and
     `i_{p*−1}` agree exactly with T3's rows at every sampled `m`, and (a) holds. `x` is computed through `α`. `p* − x = 2` at
     `m = 107, 110, 113, 116`, so eligibility is tight there with `x = p*−2` exactly. `p* − x` is 3 at 200 and 8 at 584.
2. **Block identity** (step 1 of the return), checked against the literal DP: `Δ := i_{p*−2} − i_{p*−1} = Σ_{j=0}^{m} β_j + τ` holds
   exactly at `m = 107, 110, 113` (`own/crosscheck_out.json`). Here `β_j = C(m,j)[a_j(L−j) − a_j(L−j+1)]`, `L = p*−2`, and
   `τ = C(8m,L−2)2^{L−2} − C(8m,L)2^L`. T3 checked this identity only against its own closed-form evaluation; my check uses the
   literal tree.
3. **Steps 4–6, re-derived by hand:**
   - `l_j − μ_j = (j−4)/3`, with `μ_j = 4j + (2/3)(8(m−j)+1)` and `l_j = (16m−2)/3 − j`.
   - The `j=0` threshold: `(2B−1)/3 = l_0 + 1`. More precisely, `β_0 = −9R/(16m+1)` exactly, where `R := C(8m+1,L)2^L`.
   - The convolution identity `g_j(l) = Σ_i C(8j,i) g_0^{(B_j)}(l−i)` and its split point `i* = (13j−3)/3`.

   All three are correct.
4. **Replays, copy-out-first.** `block_mixture_check.py 107` reproduces its stored output byte for byte (`cmp` identical; SHA
   `48bfbf4d…`). `gen_eligtop.py 113 60`, run in an isolated subdirectory, reproduces the fixed points `x = 570, 506` and T3's first
   three census rows exactly.

## Attacks and findings

**A1. The mathematics of steps 1–6 is correct.** I found no ℕ-subtraction error, no inequality running the wrong way, and no
circularity. Newton's inequalities are used only on `P_j = (1+x)^{8j}(1+2x)^{8(m−j)+1}`, which is real-rooted with positive
coefficients. They are never applied to `I`, `G` or `G^m`, so fence 3 is respected.

**A2. Unbacked "EXACTLY" literal in step 4 (struck).** The return says `l_j − μ_j = (j−4)/3` was "verified to hold EXACTLY … of
exact-rational quantities". The generator actually computes `mu_j = A/2 + 2*B/3` in floating point and compares with
`abs(…) < 1e-9`, so the computational check was a floating-point check. I strike "EXACTLY" as a computational claim. The identity
itself is exact by the algebra, which I re-derived, so nothing downstream falls.

**A3. The tail term is wrong-signed and missing from the obligation.** `τ = t_{p*−2} − t_{p*−1} < 0` for every `m` in the class. My
exact sign certificate for `t ≥ 35` is in `own/blocks_certs.json`. Its size matches the `j=0` block:
`τ/R = L(L−1)/(4n(K'+1)) − K'/n`, with `n = 8m+1` and `K' = n − L`. The return's step 3 carries `τ`, but its remaining obligation
item 3 bounds only `|β_0| + |β_1| + |β_2|` against the positive blocks and leaves out `|τ|`. As written, that obligation is inexact.

**A4. Step 6 names the wrong mechanism (commentary, graded conjecture).** The "√j spread versus linear offset" heuristic is not what
makes the blocks `j ≥ 4` descend. The operative fact is the return's own step 4, `l_j ≥ μ_j` for `j ≥ 4`, combined with Darroch's
mode theorem. The contract permits Darroch on the real-rooted `P_j`, but the return never invokes it. The `j = 3` block is not settled
by Darroch (`l_3 = μ_3 − 1/3`) and needs an exact argument (see A7).

**A5. Grade vocabulary.** The return grades steps 1, 2, 4, 5 and 6 as "`proved`", which is not a grade in `SOLUTION-CONTRACT.md` §4.
Normalized, they are `proved_informal`, STATED at a worker stage, with an isolated second read still needed before registration. The
"exceptional set {0,1,2}" claim at `bounded_computation` (six rows) and the census at `bounded_computation` are both graded correctly.

**A6. The replay recipe is broken as written.** Both `cp` commands copy from `scratchpad/c1-T3-replay/…`, which is the empty target
directory, instead of `scratchpad/c1-T3/…`. The sentence "exactly reproducible by rerunning the commands below" points at commands
that do not follow it. With the source path corrected, the replays succeed (see the re-derivation, item 4). This is a recipe defect,
not a content defect. The `wall_seconds` field folded into `report_sha256` was already disclosed by T3 and is not cited as evidence.

**A7. Reconciliation the attack brief asked for (critic-derived).** Under T3's indexing (block `j` is
`C(m,j)x^j(1+x)^{8j}(1+2x)^{8(m−j)+1}`, and the coefficient pair is `(L−j, L−j+1)`), the exact signs for every `m ≥ 107`,
`m ≡ 2 (mod 3)`, are:
- `β_0, β_1, β_2 < 0` (ascending);
- `β_3, β_4, β_5 > 0`;
- `β_j > 0` for `j ≥ 6`;
- `τ < 0`.

The proof is in "Critic-derived advance" below. So "j = 0, 1, 2 ascend, j ≥ 3 descend" is the exact sign pattern. Darroch alone
certifies descent only for `j ≥ 4`, because `l_j ≥ μ_j` exactly when `j ≥ 4`. That explains a statement of the form "j ≥ 4 descend,
j ∈ {0,…,3} ascend" as a classification of what Darroch decides. Read as a sign statement under this indexing, "j = 3 ascends" is
false at every `m` in the class. I did not read the U3 or F3 returns, so this reconciliation is conditional on their using this block
indexing and this coefficient pair.

**A8. The composition (E) is not written on the return's face.** The allocation assigns it to T3. It is immediate: (a) gives
`x ≤ p*−2` because `k = p*−2` satisfies `i_{k+1} < i_k`. `α = deg I = 9m+1`: the leading term of `(1+2x)G^m` is `2x^{9m+1}` and the
tail has degree `8m+2`. Then `3p* = 16m+4 < 18m+3 = 2α+1`.

**Critic-derived advance (attributed to critic C-T3-U): (ELIG-top)(a) for every m ≥ 107, m ≡ 2 (mod 3).**

Write `m = 3t+2` with `t ≥ 35`. Then `n = 8m+1 = 24t+17`, `L = p*−2 = 16t+10`, `K' = n−L = 8t+7`, and `R = C(n,L)2^L`.

- *(i) Blocks j ≥ 6.* Normalize `P_j` to the law of a sum of `8j` Bernoulli(1/2) and `8(m−j)+1` Bernoulli(2/3) variables. This is a
  real-rooted, positive-coefficient block, so Darroch's theorem applies (named here per fence 3): every mode `k` satisfies
  `|k − μ_j| < 1`, hence `k ≤ ⌈μ_j⌉`. Since `l_j − μ_j = (j−4)/3 ≥ 2/3`, we get `⌈μ_j⌉ ≤ l_j`, so `l_j + 1` is past every mode.
  Newton's strict log-concavity then gives `a_j(l_j) > a_j(l_j+1)`, hence `β_j > 0`. The index bounds are met: `l_j ≥ (13m−2)/3 > 0`
  and `l_j + 1 ≤ 8m+1 = deg P_j`.
- *(ii) Blocks j ≤ 5 and the tail, exactly.* For `t ≥ 5`, every binomial ratio `C(n−8j, L−s)2^{−s}/C(n,L)` (with `s = j+i−e`) is a
  ratio of falling and rising factorials in `t`.
  - Hence `S_5(t) := (Σ_{j=0}^{5} β_j + τ)/R = N_5(t) / (Den_5(t)·5!·2^{47})`, where
    `Den_5(t) = Π_{q<40}(24t+17−q)·(16t+11)·Π_{q<5}(8t+8+q) > 0` and `N_5` is an integer polynomial of degree 50.
  - **All 51 coefficients of `N_5(35+u)` are positive.** The smallest has 70 digits. Therefore `S_5(t) > 0` for every real
    `t ≥ 35`.
  - Certificate: `own/eligtop_magnitude_cert.json`, SHA-256 `04aba2e0e1c80ed2a087686994a23df37c4e19fc4406fa69afdfca19ede66143`.
    `N_5` has SHA `9d96a139…0ddb`.
  - As a guard against coding slips, the rational identity was cross-checked against direct binomial sums at all 106 integers
    `t = 35..140`, with 0 mismatches.
- *(iii) Conclusion.* `Δ = R·S_5(t) + Σ_{j≥6} β_j > 0`. So `i_{p*−1}(CB(8,m)) < i_{p*−2}(CB(8,m))` for every `m ≥ 107` with
  `m ≡ 2 (mod 3)`, and (E) follows by A8. No `M_0` is needed beyond the class endpoint: the certificate starts at `m = 107` itself.
- *Margin.* The truncated sum `R·S_5` alone is 14.2%, 16.3% and 17.6% of `Δ` at `m = 107, 110, 113`. The relative margin
  `Δ/i_{p*−2}` at `m=107` is about `1.67·10⁻³`.
- *By-product: the exceptional set is exactly {0, 1, 2} for every m in the class.* Each of `β_0, …, β_5` gets its own
  shifted-coefficient sign certificate at `t ≥ 35`, and Darroch covers `j ≥ 6`. This settles T3's remaining obligation 2 (bounded at
  six rows) at the same grade.
- *Grade.* STATED at a review stage, so an isolated second read is required before any `E993-R31-` registration. I believe the
  mathematics is complete at `proved_informal`, modulo Darroch's mode theorem on the real-rooted blocks `P_j` (`j ≥ 6`), which is the
  same dependency class as the carried favorability and E1 keys. The certificate in (ii) is an exact, universal-in-`t` symbolic
  inequality, not a census. The r30 bounded record to `m = 2395` played no part.
- *Candidate key* (for the synthesis; not registered here, alias-checked lexically above):
  `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3`.

## Mechanism-equivalence and fence check

- One rank per tree and the class only: the return makes no claim outside `(CB(8,m), p*)`, `m ≥ 107`, `m ≡ 2 (mod 3)`. My advance is
  stated on the same scope. The certificate is negative at `t = 28..32`, so nothing is claimed below `m = 107`.
- Darroch/Newton hygiene: both the return and I apply them only to `P_j`, never to `I`, `G`, `G^m` or a forest polynomial. The struck
  r30 uniform argument (Darroch on `I`) is not revived: the mixture is controlled through an exact certificate over the blocks.
- Census discipline: T3's census `[107, 584]` (160 rows) is graded `bounded_computation`. It proves nothing universal and the return
  says so. No status transfers to (HALL), the primary aggregate, or any aggregate key. (L-S)_top is untouched.
- Fidelity: this is a coefficient-only route with no network, so (WID) and `F_{p*}` do not apply, and the return correctly declines
  them. `x` is computed through `α`, with the terminal difference counted.
- Attribution: the block decomposition, the step 4 identity, the `j=0` fact and the step 6 identity belong to seat T3. The exact
  truncation certificate, the tail analysis, the full exceptional-set proof and the reconciliation belong to critic C-T3-U. The
  closed forms are r30's and carried (re-derived here from the tree only as a fidelity check).

## Certification audit

- "Stage 2 seal MATCH" and every listed digest: backed.
- `rows_sha256`, the generator digests and the block-check digests: backed and replayed.
- "census 160 rows `[107,584]`, all hold": backed. The count is right, three rows were replayed with T3's own generator, and nine
  were replayed with my independent tree DP.
- Fixed points `x = 570, 506`: backed by two independent instruments.
- "`l_j − μ_j` verified EXACTLY": **struck** as a computational literal (A2). The algebraic identity stands.
- "proved" grades: **renormalized** to `proved_informal` (STATED) (A5).
- "exactly reproducible by rerunning the commands below": **struck**. The commands are misdirected and not "below" (A6). The corrected
  replays do reproduce.
- `report_sha256`: not evidence (disclosed by T3). Correct.
- Route verdict `bounded_evidence` and `ELIG_top: advanced`: fair for the return as filed.

## Verdict

The return is honest and correctly scoped, and its structural reduction is right. I narrow it by striking one computational
"exactly" literal and the broken replay sentence, renormalizing its grades to contract vocabulary, and recording its obligation's
omission of the negative tail term. The step it leaves open, the magnitude comparison, is closed above by the critic for the whole
class at `proved_informal` modulo Darroch on the real-rooted blocks. That needs an isolated second read before registration.

verdict: retained_narrowed
headline_resolved: no

`LS_top: not_advanced`
`ELIG_top: advanced`
`cut_candidate: none`

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

1. **Isolated second read** of the critic-derived advance. It should rebuild `N_5` from the stated formula with its own code, confirm
   the positivity of all 51 shifted coefficients, and re-check the range conditions (`t ≥ 5`) and the Darroch step for `j ≥ 6`. Only
   then may the synthesis register the candidate key.
2. **Discharge the Darroch dependency for the blocks `j ≥ 6`**, for the formal route (U3's lane). This means a Darroch-free proof
   that `a_j(l) > a_j(l+1)` for `l ≥ μ_j + 2/3` on `(1+x)^{8j}(1+2x)^{8(m−j)+1}`, or a formalization of Darroch's mode bound. The
   `j ≤ 5` part is already Lean-friendly: it is a polynomial identity plus coefficientwise positivity after the shift `t = 35 + u`.
3. (ELIG-top)(a) and (E) then stand at `proved_informal` (modulo item 2) for the whole class. The r31 headline still needs
   (L-S)_top and the formal terminal, which this route does not touch.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-T3-U/`.
Standard library only.

| Path | SHA-256 | Role |
|---|---|---|
| `own/tree_dp.py` | `84889a57049f77a603dd910ae3f3545324b78d4ec78f51906fd93bcc8a936cde` | literal CB(8,m) tree DP; fixed points |
| `own/compare_rows.py` | `2e359ee1b3c2a922a8a160825f9255f0a092f32a98845f9fbd4d642ede6c06a0` | sampled replay of T3 census (9 rows) |
| `own/compare_rows_out.json` | `8942f31217ef36abbcd83b6e8a0c5e8de6265e4e9e316e55035a16ab7a47df1b` | its output |
| `own/magnitude.py` | `e869e7eef28329a35b6a9a950ff44b878af31d33b73c1661097d1308efdbf288` | exact rational-function construction of `S_J(t)` |
| `own/run_magnitude.py` | `5d3becdf44019f11c644c72354a33a9c5a3197de7d7de452f739bda78cc0b97e` | first truncation search (J = 6, 8, 10) |
| `own/run_magnitude2.py` | `827521e3694d30b388cf1c0e73403ec66433f4a9f01c2f91ddf683ba1d884fde` | truncation certification (J=4 is non-positive at t = 35..44; J=5 and J=6 certify from t=35) |
| `own/magnitude_certs.json` | `ca81db3564552239c0ec558cb682288fa86b9c8ac43adac7649a7b641874a080` | J=5 summary |
| `own/run_blocks.py` | `7b11e4656a44f863f4c0d29fc3ec9c1ed04cafd620f1acd9b40968e9dbd16551` | per-block and tail sign certificates |
| `own/blocks_certs.json` | `a4b972df98c0c079d3141d3534b573fd814c780d03e6ea60902f37ecbbe25f99` | signs `β_0..β_5`, `τ` for all `t ≥ 35` |
| `own/run_crosscheck.py` | `76eae8dba9dd7a90e961dc312fb3ad3d42285a2ab8a71b81032a3acb3ba5e67a` | 106-point identity guard; block identity against the tree |
| `own/crosscheck_out.json` | `18521d59f2390e4f563e18ead5bf496367022e6a3717dbaf3e4e1b1dfe3448b8` | its output |
| `own/write_cert.py` | `1fe1183a8bfda8dc5eab2c67af9ad682688d6cdbbd08c42d575f5e89808e5d54` | writes the certificate |
| `own/eligtop_magnitude_cert.json` | `04aba2e0e1c80ed2a087686994a23df37c4e19fc4406fa69afdfca19ede66143` | **the certificate** (`N_5` and shifted coefficients) |
| `replay/*` | as listed in `## Identity and seal audit` | copy-out of T3's artifacts; `rep_107.json` `0f4f42c3…52b` byte-identical to T3's |
| `replay/gen_run/*` | `eligtop_rows.json` `c9a53b9761dd2a2f7165718e16851023e317c3731193bdb7319338e67683293e` | T3 generator replay, rows 107/110/113 identical |
