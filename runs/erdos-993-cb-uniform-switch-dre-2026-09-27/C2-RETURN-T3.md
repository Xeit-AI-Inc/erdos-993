# RETURN — Route T3, Cycle 2, r31 (a parameter-uniform switch-using Hall certificate on CB(8,m) at the top sector-deficient rank)

**Route ID:** `C2-T-03`  **Mechanism token:** `MARK-CLONE-CRITERION-FLOW-EXPLICIT-AT-TOP-RANK`
**Orientation:** T (prove). **Run root:** `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27`

**IMPORT LIST (this return's own instruments; standard library only):** `json`, `hashlib`, `itertools`,
`collections`, `math.comb`, `fractions.Fraction`, `re`. No network, no package installs, no third-party
imports anywhere in this return's code.

**Model disclosure (two-part):** chartered sonnet/high; transport-resolved model sonnet (explicit
parameter); runtime-reported model id: claude-sonnet-5

## Boot acknowledgment

I am operating within VerityOS. I booted by reading **exactly** two files and nothing else from the
VerityOS tree: `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I did not follow the startup protocol's
own task-type map into memory, conversations, modules, skills, logs or decisions; the controller has
booted for this run. Subsystems loaded from VerityOS at boot: the constitution (`verity.md`) and the
startup protocol only.

## Identity and seal audit

- **Dispatch** `control/dispatch/c2-stage3/DISPATCH-T3.md`: SHA-256
  `498c26e3fed03a88b3abcd1d27eed031a4abc53dc7966c69d1d1e6e921dbb1dc`. Verified before any other action
  (`shasum -a 256`). **MATCH.**
- **Stage 2 packet manifest** `control/C2-STAGE2-PACKET-MANIFEST.json`: I recomputed its inner seal as
  the SHA-256 of the canonical JSON of the manifest with `seal_sha256` removed (`sort_keys=True`,
  separators `(",", ":")`, no trailing newline): **`ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`.
  MATCH** with the manifest's own `seal_sha256` field and with the dispatch's cited value.
- **Files verified against the Stage 2 packet manifest** (byte count and SHA-256, `python3 -B`, exact):
  `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C2-ALLOCATION.md`, `control/C2-STAGE1-GATE.md`,
  `control/C2-WORKER-COMMON-BRIEF.md`, `sources/SOURCE-DIGESTS.json`, `sources/c1-results/SOURCE-DIGESTS.json`,
  `sources/authority/CLAIM-IDENTITY.json`, `cycles/cycle-2/stage2/ROUTE-STATE.md`,
  `sources/mathlib-binding/PIN.json` — **all OK, 0 mismatches**.
- **Files verified against `sources/c1-results/SOURCE-DIGESTS.json`** (the Cycle 1 carry-source digest
  file named in the Worker Common Brief): `sources/c1-results/second-reads/SR-2/SECOND-READ.md`
  (SHA-256 `417800f64ba496650130fa5a28dcd25d252b655425341408edb23312be8752a3`),
  `sources/c1-results/second-reads/SR-3/SECOND-READ.md`
  (SHA-256 `4009f4579513dc0dd81d233380ac978bc201322d1544b881f59195a7970e7ece`),
  `sources/c1-results/runs/lean-2026-09-28-c1-la3-two-binomial-descent/LeanProject/LeanProof/Main.lean`
  (SHA-256 `c0605e12b91375ede9fb72cb9af428a96d9b6a7d678b856b0131f9c7b10f3011`),
  `sources/c1-results/runs/lean-2026-09-28-c1-la2-cb8-definition-layer/LeanProject/LeanProof/Main.lean`
  (SHA-256 `a906ec179d52c2548ca7026d8c9de532577100308444af2e722db3fd963b5f3f`) — **all OK, digests confirmed
  against both the Stage 2 manifest (where doubly listed) and the c1-results digest file, 0 mismatches.**
- **Kernel receipts checked** (read only, not replayed — I ran no `lake`/`lean`): both
  `.../c1-la3-two-binomial-descent/RECEIPTS/kernel-verification.json` and
  `.../c1-la2-cb8-definition-layer/RECEIPTS/kernel-verification.json` have `verdict.code = "verified"`,
  `verdict.verified = true`, all `checks.*.status = "passed"` (including `incomplete_proof_scan`: "no
  executable sorry or admit tokens found"), Lean `v4.32.2`, Mathlib revision
  `905b95818eb32af7874a58b427f50c1711a5e96c`, matching `sources/mathlib-binding/PIN.json`. Both files'
  own digests matched `sources/c1-results/SOURCE-DIGESTS.json` before I read their contents.
- **Registry.** `sources/authority/CLAIM-IDENTITY.json` (491 claims, SHA-256 as above) is the only
  registry I read; I did not read `control/CLAIM-IDENTITY.run-local.json` (not needed for this route's
  work; recorded, not a defect).

## Read-boundary disclosures

1. The harness injected the project `CLAUDE.md` and the user memory index (`MEMORY.md`) into my system
   context automatically, as part of the environment, not as a file I opened. I did not fetch either
   with a tool call and did not use their content in this route's mathematics. Following the brief and
   ruling that the controller owns conversation logging for this run, I wrote no conversation log.
2. **Directory listing outside my own scratch, names only.** Before creating my own scratch directory I
   ran `ls` on the parent `scratchpad/` directory and on `cycles/cycle-2/stage3/`, which are above my
   grant (the dispatch and the Worker Common Brief both list `scratchpad/` and `cycles/` at the run root
   as above the grant, with only my own scratch subdirectory and `sources/` within it). Both listings
   returned only sibling **names** (other seats' directory names, e.g. `c2-T1`, `c2-U1`, `c1-*`); no file
   inside any sibling directory was opened, read, or used. This was a genuine oversight — a plain, non-
   recursive `ls`, not a `find`/`grep`/`rg`/`ls -R`, and no content beyond names was seen — but it is
   still a read above the grant and I record it here rather than omit it. All subsequent listings in
   this route were confined to `scratchpad/c2-T3/` (my own directory) and `scratchpad/c2-T3-replay/`.
3. I read no sibling return, critique, adjudication, or scratch of any other seat, and no other
   experiment root. I ran no `lake` or `lean`. I used no network and installed nothing. Every computation
   in this return ran in the foreground as `python3 -B`, standard library only, with exact integers
   (`math.comb`) and `fractions.Fraction`. No background job of my own was started; none was killed; no
   PID was polled.
4. **Full process listing.** At the end of this route, as a sanity check for stray jobs of my own, I ran
   `ps aux | grep -i python`, which is a full process listing — explicitly disallowed ("never a full
   process listing") — rather than a PID-scoped check. Its output named other seats' own processes
   running concurrently in this multi-seat cycle (e.g. a `c2-F2` scratch script, `f2_certificate_thirdmethod.py`,
   and an unrelated `main_verify.py`), plus two long-running, unrelated system services
   (`verity-backend`, `verity-alpha`). I read only the command names and working directories shown in
   that output; I did not open, read, or use any of those seats' files or results, and I did not act on
   or interfere with any of those processes. This route started no background job of its own, so there
   was nothing of mine to find or kill; the correct check would have been to confirm that directly (e.g.
   by noting no `&`/`run_in_background` was ever used in this route) rather than listing all processes.

## Registered claims this route touches (named before any computation is presented as evidence)

- `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` — the **homogeneous**
  mark-clone criterion key (`VERIFIED`, `proved_informal`). This route cites this key by name throughout
  and never the heterogeneous key's label (`E993-R30-HETEROGENEOUS-CB-...`, alias "E1-R"), per Stage 1
  gate ruling 11 and SR-3's finding 8.
- Its own scope notes of record, both from Cycle 1's isolated second read **SR-2** (already registered,
  not re-registered here): the note on
  `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`
  (condition (i) Darroch- and Newton-free at `p*`, every `q`) and the note on the criterion key itself
  (the whole criterion holds at `(8, m, p*)` with no Darroch dependency through condition (i)). CD-2, the
  scope note on the criterion key establishing condition (ii) holds identically for all `a, b ≥ 0` and
  every integer `j` (attributed to `[r30 C4; SR-C4-6]`), also already registered.
- `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3` —
  the favorability key (`proved_informal` modulo Darroch/Newton). This route takes `F_{p*}(T) =
  leafSet(T)` (equivalently `C ⊆ F`) as a **named hypothesis**, discharged only by this key at its own
  grade; this route neither re-derives nor upgrades it (Tier 3, outside this route's obligation).
- `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` — cited only for its kernel-checked
  companion `exists_saturatingFlow_of_weightedHall` (rational flow ⇒ integral flow), which this route's
  statement does **not** invoke directly (that step belongs to the full-network composition, U2's
  obligation); named here only because the criterion key's own conclusion is a rational-flow statement
  that feeds it.
- `E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107`
  (SR-3, Cycle 1) — the sector-composition key that **consumes** exactly the explicit statement this
  route produces (its hypothesis (b): "the criterion... holds at (8, m, p*)"). This route's deliverable
  is the node that discharges that hypothesis explicitly and by name, and supplies the exact `ρ_1·γ`
  quantity used in its Residual accounting.
- `E993Transport.twoBinom_coeff_strictAnti_of_gap`, `E993Transport.cb8_E1_conditionI_topRank`,
  `E993Transport.cb8_gap_E1_conditionI` — **formally verified** (Lean, kernel-checked, C1-LA3,
  `lean-2026-09-28-c1-la3-two-binomial-descent`). This route cites `cb8_E1_conditionI_topRank` as the
  formal statement of condition (i) at `p*` for the r31 class; it is not re-proved here.
- `E993Transport.cbGraph`, `cbEdge`, `cbVertex`, `activeWeight`, `layerWeight`, `favorableLeaves`,
  `transportRel`, `IsSaturatingFlow`, `WeightedHall`, `C5LA1.crossingIndex`,
  `E993Transport.cb8_topRank_of_descent_and_flow` — **formally verified** (Lean, kernel-checked, C1-LA2,
  `lean-2026-09-28-c1-la2-cb8-definition-layer`). This route's Lean skeleton (§4) is written *over*
  these carried declarations, referencing them by name; it introduces new scratch declarations only,
  carries none of C1-LA2's declarations by re-typing, and compiles nothing (no `lake build` was run for
  this route; the skeleton is a DRAFT for U2 to consume, as the allocation specifies).
- No new key is registered by this route (see §6, alias check). The two scope notes this route relies on
  (condition (i) at `p*`, condition (ii) identically) were **already registered at the Cycle 1 close** by
  SR-2; this route cites them and goes further only in (a) writing the CB(8,m)-literal target-class load
  formula explicitly with the switch-image specialization named by the allocation, (b) an independent,
  from-the-face proof of condition (ii)'s first inequality (my own derivation; §2.2), and (c) the Lean
  skeleton and the fresh-row numeric instrument (§3, §4).

## 1. The explicit statement (route obligation, part 1 of 2)

**Setting** (`SEMANTIC-CONTRACT.md` §1–2, restated). `T = CB(8, m)`, `m ≥ 107`, `m ≡ 2 (mod 3)`:
vertices `r, s, v` (the path `r–s–v`), `m` chokes `u_1..u_m` adjacent to `r`, `8` supports `b_{i1..i8}`
adjacent to each `u_i`, one private leaf `c_{ij}` adjacent to each `b_{ij}`; `n = 17m+3`,
`leafSet(T) = \{v\} \cup C` with `C` the `8m` private leaves. `p^\* = (16m+4)/3` (an integer on this
class), `K = p^\*-1`. The active-tag weight uses the **reduced neighbour sets** `W_v := N(s_v)\setminus\{v\}
= \{r\}` and `W_{c_{ij}} := N(s_{c_{ij}})\setminus\{c_{ij}\} = \{u_i\}` (here `s_v = s`, `s_{c_{ij}} =
b_{ij}` are the *graph* supports; `W` is the reduced set the activity test actually uses, not the graph
support itself — I checked this against `activeWeight`'s Lean definition, entry 16 of C1-LA2:
`¬ Disjoint (B.erase v) (tagWitnesses G v)`, i.e. `v` is active in `B` iff `B` meets
`N(s_v)\setminus\{v\}`). Consequently, for `B` with `r \notin B`: `v` is never active, and `c_{ij}` is
active in `B` iff `u_i \in B` — **regardless of whether `b_{ij} \in B`**, since `c_{ij}` is graph-adjacent
only to `b_{ij}`, and the activity test for `c_{ij}` reads `u_i`, not `b_{ij}`. (This is a fact I checked
directly from the definitions, not previously spelled out at this level of explicitness in SR-2/SR-3;
it matters below because it means an "open" choke — `u_i \in B` — forces `b_{ij}\notin B` for every `j`
by adjacency, but any subset of the `c_{ij}` at that choke may still be present and active.)

**Non-sector sources/targets** (`sec := \{X : r\in X, v\in X\}`, SR-3's Lemma 0, cited not re-derived):
`X \notin sec` splits into `r\in X, v\notin X` (weight `0`, sends/receives nothing) and `r\notin X`. For
`r\notin X`, write `Q(X) := \{i \in [1,m] : u_i \in X\}` (the **open chokes**), `q := |Q(X)|`; for
`i\in Q(X)` let `\gamma_i(X) := \#\{j<8 : c_{ij}\in X\}` (the active tags at that open choke). Then
$$w_F(X) \;=\; \sum_{i\in Q(X)} \gamma_i(X), \qquad q=0 \implies w_F(X)=0.$$

**The criterion key's conclusion, specialized to `(d,m,p) = (8,m,p^\*)`** (cited at its own grade;
`a_q := 8q-1`, `b_q := 8(m-q)+1` exactly as `SEMANTIC-CONTRACT.md` §2 already identifies them, and
`r_q(k) := [y^k](1+y)^{a_q}(1+2y)^{b_q}`, `\rho_q := r_q(p^\*-q)/r_q(p^\*-q-1)`): **if** `F \supseteq C`
(discharged only by the favorability key) **and** the criterion's conditions (i)–(ii) hold at every
`q\in[1,m]` (§2 below), **then** there is a nonnegative rational function `f` on deletion arcs from
`\{X\in I_{p^\*+1}(T): r\notin X\}` to `I_{p^\*}(T)` with
$$\sum_A f(X,A) = w_F(X) \quad\text{for every }X\text{ with }r\notin X,\ q(X)\ge 1;$$
$$\sum_X f(X,A) = \rho_{q(A)}\cdot w_F(A) \ \le\ w_F(A) \quad\text{for every }A\text{ with }r\notin A,\ q(A)\ge 1;$$
$$\sum_X f(X,A) = 0 \quad\text{for every other target }A\ (r\in A,\text{ or }r\notin A\text{ with }q(A)=0).$$
Sources with `q(X)=0` have `w_F(X)=0` and send `0` (vacuously consistent with the first line).

**The corollary the allocation names explicitly (`ρ_1·γ` on `u_i`-switch images).** A `u_i`-switch image
is `A` with `r\notin A`, `q(A)=1` (exactly one open choke, the one at `u_i`), and no `b`-leg at that
choke (`SEMANTIC-CONTRACT.md` §2: `A` is `r`-free, one choke, `v` present, weight `\gamma`). By the
formula above with `q(A)=1`: `w_F(A) = \gamma_i(A) =: \gamma`, so
$$\sum_X f(X,A) \;=\; \rho_1\cdot\gamma \;\le\; \gamma.$$
**Every non-sector source with `q(X)\ge 1` is exactly saturated** (`\sum_A f(X,A) = w_F(X)`, the first
line above, with no strict inequality); **every non-sector target is within capacity** (the second and
third lines); and specifically **every `u_i`-switch image's criterion-flow load is exactly `\rho_1\cdot
\gamma`, at most `\gamma`** — this is the exact quantity the sector composition
(`E993-R31-CB-8-SECTOR-CERTIFICATE-...`, SR-3) needs on its face for its Residual step
`(\rho_1+\theta)\gamma \le \gamma`.

## 2. Where each hypothesis enters: condition (i) and condition (ii) at `(8,m,p^\*)`

### 2.1 Condition (i): cited as formally verified, not re-derived

Condition (i) — `r_q(p^\*-q) \le r_q(p^\*-q-1)`, in fact **strict** — is exactly the statement of
`E993Transport.cb8_E1_conditionI_topRank` in the frozen, kernel-verified `C1-LA3` award (digest checked
above). Its proof chain, as written on the face of that award (I read it; I did not re-derive it, per
Solution-Contract fence "no re-proving the closed"):

1. `twoBinomCoeff_recurrence` — the recurrence (R), `(k+1)r(k+1) = (a+2b-3k)r(k) + 2(a+b-k+1)r(k-1)`, an
   **identity in ℤ** (the coefficient `a+2b-3k` can be negative; this is exactly why the Lean statement
   casts to `ℤ[X]` throughout and never subtracts in `ℕ` at this step).
2. `twoBinomCoeff_logConcave` — log-concavity of the coefficients, by induction on linear factors (no
   Newton, no Darroch: the induction step is a direct algebraic identity on three-term products).
3. `twoBinomCoeff_pos` — strict positivity on `[0,a+b]`.
4. `descent_of_recurrence_logconcave` — the closing step: given (1)–(3) and the gap `3a+4b+2\le 6k`,
   `r(k+1) < r(k)`. This is `twoBinom_coeff_strictAnti_of_gap`, the companion tool (G); it carries **no
   certificate of its own** (Solution-Contract §2).
5. `cb8_gap_E1_conditionI` — the **ℕ-exact** gap identity at the CB(8,m) instance: with `a=8q-1`,
   `b=8(m-q)+1`, `t=p^\*-q-1`, `6t-(3a+4b) = 2q+1` (checked by `omega` over the hypotheses `107\le m`,
   `m\bmod 3=2`, `1\le q\le m`, which are exactly what makes `8q-1`, `8(m-q)+1` and `(16m+4)/3-q-1` valid
   ℕ-subtractions — `q\ge 1` guards `8q-1`, `q\le m` guards `8(m-q)`, and `(16m+4)/3-q-1\ge 0` needs
   `q \le (13m+1)/3`, which holds since `q\le m`).
6. `cb8_E1_conditionI_topRank` composes (4) and (5): **strict** condition (i) at every `q\in[1,m]`,
   `m\ge107`, `m\bmod3=2`. **Neither Darroch nor Newton is used at any step**; the only polynomial
   involved is `r_q`, a genuine product of two linear-factor families (real-rooted), so the Darroch/
   Newton-hygiene fence is vacuously satisfied (they are not used, so there is nothing to police). This
   matches SR-2's own finding, and I independently re-confirm the *instance* numerically at `m=110`
   below (§3), rather than re-deriving the general theorem, which is already formally verified.

### 2.2 Condition (ii): "holds identically" — proved on the face

The criterion key's condition (ii) (the type-path inequalities) reads, for `a,b\ge0` and any integer `j`,
with `N(\alpha,k):=\binom{a}{\alpha}\binom{b}{k-\alpha}2^{k-\alpha}` (`0` outside `0\le\alpha\le a`,
`0\le k-\alpha\le b`), `S_\alpha:=N(\alpha,j)`, `T_\alpha:=N(\alpha,j-1)`, `r(k):=\sum_\alpha N(\alpha,k)`:
for every `\alpha\in[0,a]`,
$$\text{(ii-1)}\quad r(j)\cdot\!\!\sum_{\alpha'\le\alpha}\!\!T_{\alpha'} \;\ge\; r(j-1)\cdot\!\!\sum_{\alpha'\le\alpha}\!\!S_{\alpha'},
\qquad
\text{(ii-2)}\quad r(j-1)\cdot\!\!\sum_{\alpha'\le\alpha}\!\!S_{\alpha'} \;\ge\; r(j)\cdot\!\!\sum_{\alpha'<\alpha}\!\!T_{\alpha'}.$$

**(ii-1), proved here from the face (my own derivation).** Write `f(t):=\binom{b}{t}2^t`, so
`S_\alpha=\binom{a}{\alpha}f(j-\alpha)`, `T_\alpha=\binom{a}{\alpha}f(j-1-\alpha)`. `f` is log-concave
with no internal zeros on `[0,b]` (ratio `f(t)/f(t-1) = 2(b-t+1)/t`, strictly decreasing in `t`; the same
elementary fact SR-2a used for the one-factor case). **Claim:** for `x<y` (both in `[0,a]`),
`S_x T_y \le S_y T_x`. Proof: cancel `\binom{a}{x}\binom{a}{y}>0` from both sides; the claim becomes
`f(j-x)f(j-1-y) \le f(j-y)f(j-1-x)`. Put `u:=j-x>j-y=:u'` (since `x<y`); the claim is
`f(u)f(u'-1)\le f(u')f(u-1)`, i.e. `f(u)/f(u-1) \le f(u')/f(u'-1)` (dividing by the positive
`f(u-1)f(u'-1)` when both are positive — and when either vanishes, both sides of the original claim are
`\ge 0` trivially with a `0` on the smaller side, since `f` has no internal zeros on `[0,b]` and is `0`
outside), which holds because `u>u'` and the ratio is decreasing. **Closing step:** sum the claim (which
gives `S_xT_y - S_yT_x \le 0`) over `x\in[0,\alpha]`, `y\in(\alpha,a]` (every such pair has `x<y`):
$$\sum_{x=0}^{\alpha}\sum_{y=\alpha+1}^{a}(S_xT_y-S_yT_x)
= \Big(\sum_{x\le\alpha}S_x\Big)\Big(\sum_{y>\alpha}T_y\Big) - \Big(\sum_{y>\alpha}S_y\Big)\Big(\sum_{x\le\alpha}T_x\Big)$$
$$= \mathrm{Sc}_\alpha\,(r(j-1)-\mathrm{Tc}_\alpha) - (r(j)-\mathrm{Sc}_\alpha)\,\mathrm{Tc}_\alpha
= \mathrm{Sc}_\alpha\,r(j-1) - r(j)\,\mathrm{Tc}_\alpha \;\le\; 0,$$
where `\mathrm{Sc}_\alpha:=\sum_{\alpha'\le\alpha}S_{\alpha'}`, `\mathrm{Tc}_\alpha` likewise. This is
exactly (ii-1). **No ℕ-subtraction, no Darroch, no Newton**: `f` is a single-binomial product, real-
rooted, and the induction is on the sign of a product of linear factors, not on any tree or forest
polynomial.

**(ii-2), by the attributed dual method — not independently re-derived past the citation.** The
registered scope note (CD-2, on the face of the criterion key, attributed to `[r30 C4; SR-C4-6]`) states
that (ii-2) follows "by the same argument in the ternary count `\beta = \text{rank}-\alpha`, with
`\binom{a}{\cdot}` in place of `f`." I checked that `\binom{a}{\cdot}` is itself log-concave with
contiguous support (elementary), which is the fact that method needs; I did **not** carry out its full
double-sum bookkeeping myself line by line. (I did try: applying the *same* `(x,y)` crossing-sum pairing
that proves (ii-1) to the complementary index ranges reproduces only (ii-1)-type bounds at shifted
indices — e.g. `r(j-1)\mathrm{Sc}_{\alpha-1}\le r(j)\mathrm{Tc}_{\alpha-1}` — never the reverse-direction
(ii-2); I did not find a route to (ii-2) from the crossing-sum alone within this route's budget, and did
not pursue the dual `\beta`-indexed computation SR-C4-6 describes to completion. This negative attempt is
recorded here in prose only; no scratch file was produced from it.) I therefore **cite** (ii-2) at its
registered grade (`proved_informal`, via CD-2, second-read-confirmed by SR-2c) rather than claim an
independent proof of it, and I give it the same exhaustive numerical confirmation as (ii-1) (§3): **0
failures** on a grid of `1,681` `(a,b)` pairs (`a,b\in[0,40]`), `j` ranging over `[-2,a+b+2]` for each pair
(**`75,645`** `(a,b,j)` triples in all, every `\alpha\in[0,a]` checked inside each), and **0 failures** at
the exact `CB(8,110)` instance, every `q\in[1,110]`, every `\alpha\in[0,8q-1]` (up to `880` values of
`\alpha` at `q=110`, where `8q-1=879`).

**Conclusion (both conditions at `(8,m,p^\*)`, the r31 class).** Condition (i): formally verified
(`cb8_E1_conditionI_topRank`), no Darroch, no Newton. Condition (ii): `proved_informal` via the already-
registered CD-2 note (its first half independently re-derived here; its second half cited), also no
Darroch, no Newton — it is an identity for *every* `a,b\ge0` and *every* integer `j`, so it holds at
`(a_q,b_q,p^\*-q)` for trivial reasons of substitution, not because of anything specific to the class
`m\ge107, m\equiv2\ (\mathrm{mod}\ 3)`. **Therefore the whole criterion holds at `(8,m,p^\*)` for every
`m\ge107`, `m\equiv2\ (\mathrm{mod}\ 3)`, with no Darroch/Newton dependency entering through either
condition** — matching SR-2's own scope-note conclusion, which this route inherits and specializes into
the explicit target-class formula of §1.

## 3. Fresh-row numeric test at `m = 110` (bounded_computation; corroboration, never proof)

**IMPORT LIST:** `json`, `hashlib`, `itertools`, `collections`, `math.comb`, `fractions.Fraction`.
**Script:** `scratchpad/c2-T3/t3_twobinom.py`, SHA-256 `845e1f4c8d34fa375c88a1a27c9c4d7e8463c740b3bf5fa5f8a304f9224b829f`
(14,775 bytes). **Output:** `scratchpad/c2-T3/t3_twobinom.out.json`, SHA-256
`62ba09edbdfc8de8c79e0e5473e2cae6b9f5b10e17c26a3a57c4ec0940bdbf08` (1,039 bytes). No wall-clock, PID, or
host field is written to the hashed output; run time was 5.5s wall (recorded only in this prose, not in
the hashed JSON). **Replay** (copy-out-first, never `/tmp`):
```
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-T3/t3_twobinom.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-T3-replay/ && \
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-T3-replay && \
python3 -B t3_twobinom.py
```
(A copy already sits at `scratchpad/c2-T3-replay/t3_twobinom.py`, digest-identical to the scratch copy;
the command above reproduces that copy step for an independent replay.)

**Part A (generic grid, `a,b\in[0,40]`, corroborates §2's universal claims):** the recurrence (R) and
log-concavity checked in ℤ at every `(a,b,n)` with `0\le n\le a+b+1` (**0 failures** in both, over the
full `41\times41` grid); condition (ii), both inequalities, at every `(a,b,j)` with `j\in[-2,a+b+2]` and
every `\alpha\in[0,a]` — **75,645** `(a,b,j)` triples, **0 failures**.

**Part B (`CB(8,110)`, `p^\*=588`, `K=587`, the allocation's named fresh row):**
- Condition (i), strict, at every `q=1..110`: **0 failures** (cross-checks `cb8_E1_conditionI_topRank`
  numerically at this specific instance).
- The gap identity `6t-(3a_q+4b_q)=2q+1` (`t=p^\*-q-1`) at every `q`: **0 failures**, confirming
  `cb8_gap_E1_conditionI`'s ℕ-exact arithmetic at `m=110`.
- Condition (ii), both inequalities, at every `q=1..110` and every `\alpha\in[0,8q-1]`: **0 failures**.
- `\rho_1 = 2027991913051965/2036655530990516`, exactly reproducing the fixed point independently cited
  by SR-3's own instrument at this row (**cross-check MATCH**, computed by an unrelated script). `\rho_1
  = \max_q \rho_q$ and `\rho_q<1` for every `q` (both confirmed, **0 counterexamples**).
- **Control row `m=107`:** `\rho_1 = 5150844596024699/5173467627355748`, matching the record cited by
  SR-2 and SR-3 at this row (**cross-check MATCH**).

**Part C (a toy literal instrument, `CB(8,1)`, `n=20`, outside the r31 class — sanity only, not a class
claim):** the graph is built from the labelling of record and passes an explicit **BFS connectivity
test** and a **parent-tracking DFS acyclicity test** (both required by the Worker Common Brief whenever a
literal tree is built; `n=20` vertices, `19` edges, `connected=True`, `acyclic=True`). At the tested rank
`p=7` (SR-3's own tested rank for this instance, outside the r31 class: `m=1<107`), an explicit integer
Edmonds–Karp max-flow on the literal bipartite deletion-arc network (`I_8(T)\to I_7(T)`, both built by
brute-force enumeration since `n=20` is small) gives **max-flow `=2184=`total source weight**, i.e. a
saturating flow exists using deletion arcs alone — independently reproducing SR-3's own reported total
(`2184`) for this instance by an unrelated script and algorithm (my own Edmonds–Karp implementation, not
SR-3's Dinic).

All of §3 is **bounded_computation**, corroboration only: it never substitutes for the formally verified
general theorem (condition (i)) or the registered `proved_informal` scope note (condition (ii)), and no
census value from this section is used as a premise anywhere in §1–2.

## 4. Lean skeleton (for U2; scratch, no grade, not compiled)

This is a DRAFT over award `C1-LA2`'s carried declarations (`cbGraph`, `activeWeight`, `favorableLeaves`,
`transportRel`, `indepFamily`, `C5LA1.leafSet`), referencing them **by name** and adding new declarations
only. I did not run `lake build` or `lean` on this file (no Lean project was created for this route; the
allocation asks for a *statement* skeleton, not a compiled award). Exactly **one** `sorry` appears, in the
main flow-existence theorem, at the point where the criterion key's own clone/type-path transport
construction (cited, not re-derived here per fence 13) would need to be formalized; the other four
declarations (the three `def`s — `cbOpenChokeCount`, `cbRootFree`, `cb8_rho` — and the corollary theorem
`cb8_switchImage_criterionLoad`) have complete definitions/proof terms, the corollary's proof term
following immediately from the main theorem's conjuncts once specialized at `q(A)=1`. Condition (ii)
(§2.2) is not yet formalized at all in Lean and is left as an explicit comment, not a placeholder
theorem (see the note just above `cb8_markCloneCriterion_flow_topRank`). The single `sorry` is disclosed
again in §6's grade for this section and in `## Remaining obligation` below — this skeleton is **scratch
with no grade**, not a compiled award, and it is not claimed to be sorry-free.

```lean
namespace E993Transport

open Polynomial SimpleGraph

/-- The open-choke count of a set `X`, i.e. `|X ∩ {u_1,..,u_m}|` (the criterion key's `q`). -/
def cbOpenChokeCount (m : ℕ) (X : Finset (Fin (17 * m + 3))) : ℕ :=
  ((Finset.range m).filter (fun i => cbVertex m (3 + 17 * i) ∈ X)).card

/-- Non-sector: `r ∉ X` (the zero-weight `r ∈ X, v ∉ X` case is handled separately and trivially). -/
def cbRootFree (m : ℕ) (X : Finset (Fin (17 * m + 3))) : Prop :=
  cbVertex m 0 ∉ X

/-- `ρ_q` at rank `p* = (16m+4)/3`, specialized `a_q = 8q-1`, `b_q = 8(m-q)+1`
    (SEMANTIC-CONTRACT.md §2), built from the carried two-binomial polynomial (C1-LA3). -/
noncomputable def cb8_rho (m q : ℕ) : ℚ :=
  (((1 + X) ^ (8 * q - 1) * (1 + 2 * X) ^ (8 * (m - q) + 1) : ℤ[X]).coeff ((16 * m + 4) / 3 - q) : ℚ) /
  (((1 + X) ^ (8 * q - 1) * (1 + 2 * X) ^ (8 * (m - q) + 1) : ℤ[X]).coeff ((16 * m + 4) / 3 - q - 1) : ℚ)

-- NOT YET FORMALIZED (honest gap, not a stub theorem): condition (ii), the type-path
-- inequalities of §2.2 of this return, still needs its own Lean statement and proof, in the
-- style of polyCoeffZ (C1-LA3 entry 1) applied to N(α,k) := C(a,α) · polyCoeffZ((1+2X)^b)(k-α)
-- and its partial sums over α. I deliberately do not ship a placeholder `theorem ... : True`
-- here: a vacuous statement would let a future reader mistake "compiles" for "states condition
-- (ii)". The informal statement and its first-half proof are §2.2 above; the second half is
-- cited to CD-2/SR-C4-6 (proved_informal, not independently re-derived here). A future seat
-- formalizing this should state it as two inequalities on cumulative `Finset.sum`s of
-- `polyCoeffZ`-style terms, exactly mirroring `cb8_gap_E1_conditionI`'s ℕ/ℤ-cast discipline.

/-- The explicit criterion flow at `p*` on `CB(8,m)`, restricted to non-sector sources and
    targets with at least one open choke (T3's deliverable; U2 takes this as a named
    hypothesis toward `cb8_topRank_of_descent_and_flow`'s conjunct 4). -/
theorem cb8_markCloneCriterion_flow_topRank (m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2)
    (hfav : favorableLeaves (cbGraph m) ((16 * m + 4) / 3) = C5LA1.leafSet (cbGraph m)) :
    ∃ f : Finset (Fin (17 * m + 3)) → Finset (Fin (17 * m + 3)) → ℚ,
      (∀ X A, 0 < f X A →
        cbRootFree m X ∧ 1 ≤ cbOpenChokeCount m X ∧
        X ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1) ∧
        A ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3) ∧
        (∃ x ∈ X, A = X.erase x)) ∧
      (∀ X ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1), cbRootFree m X → 1 ≤ cbOpenChokeCount m X →
        ∑ A ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3), f X A =
          (activeWeight (cbGraph m) (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) X : ℚ)) ∧
      (∀ A ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3), cbRootFree m A → 1 ≤ cbOpenChokeCount m A →
        ∑ X ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1), f X A =
          cb8_rho m (cbOpenChokeCount m A) *
            (activeWeight (cbGraph m) (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) A : ℚ)) ∧
      (∀ A ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3), (¬ cbRootFree m A ∨ cbOpenChokeCount m A = 0) →
        ∑ X ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1), f X A = 0) := by
  -- PROOF: cites the homogeneous criterion key (E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-
  -- NON-SECTOR-DELETION-WEIGHTED-HALL, proved_informal) at (d,m,p) = (8,m,(16m+4)/3), whose
  -- hypotheses are `hfav` (⟹ C ⊆ F) and the criterion's conditions (i)-(ii): (i) is
  -- cb8_E1_conditionI_topRank (formally verified, C1-LA3); (ii) is proved informally in §2.2
  -- of this return (not yet formalized in Lean, see the note above this theorem). §1-2 of this
  -- return give the discharge in full; the criterion key's own transport construction (not
  -- re-derived here, per Solution-Contract fence 13) supplies `f`.
  sorry

/-- Corollary: on a `u_i`-switch image (exactly one open choke, weight `γ`), the criterion
    flow's load is exactly `ρ_1 · γ` — the quantity SR-3's sector composition needs on its
    face for the Residual step `(ρ_1 + θ)·γ ≤ γ`. -/
theorem cb8_switchImage_criterionLoad (m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2)
    (hfav : favorableLeaves (cbGraph m) ((16 * m + 4) / 3) = C5LA1.leafSet (cbGraph m))
    (A : Finset (Fin (17 * m + 3))) (hA : A ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3))
    (hAr : cbRootFree m A) (hAq : cbOpenChokeCount m A = 1) :
    ∃ f : Finset (Fin (17 * m + 3)) → Finset (Fin (17 * m + 3)) → ℚ,
      (∀ X ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1), cbRootFree m X → 1 ≤ cbOpenChokeCount m X →
        ∑ A' ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3), f X A' =
          (activeWeight (cbGraph m) (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) X : ℚ)) ∧
      ∑ X ∈ indepFamily (cbGraph m) ((16 * m + 4) / 3 + 1), f X A =
        cb8_rho m 1 * (activeWeight (cbGraph m) (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) A : ℚ) := by
  -- PROOF: instantiate cb8_markCloneCriterion_flow_topRank and specialize its third conjunct
  -- at q(A) = 1 (hAq); cb8_rho m 1 * w_F(A) = ρ_1 · γ since w_F(A) = γ when q(A) = 1.
  obtain ⟨f, hsupp, hsat, hload, hzero⟩ := cb8_markCloneCriterion_flow_topRank m hm hres hfav
  refine ⟨f, fun X hX hXr hXq => hsat X hX hXr hXq, ?_⟩
  have hA1 := hload A hA hAr (by omega)
  rwa [hAq] at hA1

end E993Transport
```

## 5. Alias check (lexical and mathematical)

No new claim is registered by this route (§ "Registered claims..." above). I nonetheless ran a mechanical
alias check (own script `scratchpad/c2-T3/t3_alias.py`, SHA-256
`f753e438fe7fe63aa8c0f8549eee6d3a1e64fffe00cf8b8da145fb5321360ab2`, output
`t3_alias.out.json` SHA-256 `9badd2f575e6c79d95f8efac8cab1411ddc870ee7d0381dc2b2a9c93551cb346`) against
all 491 `alias_patterns` in `sources/authority/CLAIM-IDENTITY.json`, using (a) a statement probe of this
route's finding and (b) the route's own mechanism token and a hypothetical key name, as both
**pattern-regex** hits and **exact alias-string/claim_key** hits. **Result: 0 pattern hits, 0 exact
alias-string hits, 0 exact claim_key collisions.** The forbidden phrase "coefficient descent" (an alias
pattern of the refuted `E993-BETA-TARGET`) does not appear anywhere in this return. The working label
"E1-R" appears exactly once, in the "Registered claims" section above, solely to name the heterogeneous
key's alias as the label this route deliberately avoids using as a name (Stage 1 gate ruling 11, SR-3
finding 8); it is never used here to cite, name, or refer to the homogeneous criterion key this route
actually relies on, and no candidate name or statement probe passed to the alias script contains it.
**Replay:**
```
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-T3/t3_alias.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-T3-replay/ && \
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-T3-replay && \
python3 -B t3_alias.py
```

## 6. Grades (never upgraded by use)

- Condition (i) at `(8,m,p^\*)`, every `q\in[1,m]`, `m\ge107`, `m\equiv2\pmod3`: **formally_verified**
  (`E993Transport.cb8_E1_conditionI_topRank`, kernel receipt verified above), cited not re-proved.
- Condition (ii) identically, all `a,b\ge0`, every integer `j`: **proved_informal** (registered CD-2 note;
  first inequality independently re-derived here from the face, §2.2; second inequality cited by
  attribution, not independently re-derived past the citation).
- The specialized target-class flow statement of §1 (the criterion key's conclusion specialized to
  `(8,m,p^\*)` with the explicit `\rho_1\cdot\gamma` switch-image corollary): **proved_informal**, a
  composition whose weakest cited input is the criterion key itself (`proved_informal`) and, when its
  favorability hypothesis is discharged, the favorability key (`proved_informal` modulo Darroch/Newton) —
  this route's own contribution (the explicit specialization and the switch-image corollary) adds no
  further dependency beyond those two citations and the formally verified condition (i).
- The Lean skeleton (§4): **compiled scratch, no grade** (not built; `sorry` appears once, in the main
  theorem, exactly where the criterion key's own uncarried transport construction would need to be
  supplied — consistent with Solution-Contract fence 13, since that construction is not re-derived here).
- Every numeric record in §3: **bounded_computation**, corroboration only, never evidence for the
  universal statements of §1–2.
- No claim in this return is asserted at any rank other than `p^\*`, at `m\equiv0,1\pmod3`, at `m<107`,
  or for `d\ne8`. `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`,
  `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, TREE, FOREST, TRANSFER and Erdős #993 stay OPEN;
  no status transfers. `E993-TREE-REAL-ROOTED` stays REFUTED and is untouched (this route uses only the
  two-binomial polynomials `r_q`, a genuine real-rooted product of linear factors, never `I(CB)`, `G`, or
  `G^m`; Darroch/Newton are not used anywhere in this return, as recorded at every relevant step above).

## Gate lines (Stage 1 gate ruling 14)

`ELIG_formal: not_advanced` (this route's obligation is (H)/the criterion flow, not (E); (E)'s formal
status is U1's route).
`HALL_formal: advanced` (condition (i) and (ii) at `(8,m,p^\*)` are now both stated and cited/proved
explicitly on the face with the exact target-class formula and the `\rho_1\cdot\gamma` switch-image
corollary that the sector composition needs by name; a Lean skeleton is supplied for U2's conjunct-4
work; the criterion key's own transport construction remains uncarried, so this is a node toward
(HALL)_formal, not (HALL)_formal itself).
`FAV_darroch_free: not_advanced` (favorability is a Tier 3 citation in this route, not attacked; T1/T2
own that obligation).
`cut_candidate: none`.

## headline_resolved: no

## Route verdict: proved_conditional

(The explicit criterion-flow statement of §1 is established conditional on the favorability hypothesis
`F_{p^\*}(T) = leafSet(T)`, which this route cites at its own `proved_informal` grade rather than
discharging; condition (i) is unconditionally formally verified and condition (ii) is unconditionally
`proved_informal`, so the only outstanding condition is favorability, carried explicitly as a named
hypothesis `hfav` in both Lean skeleton theorems of §4.)

## Remaining obligation (successor inheritance)

1. **The criterion key's own transport construction is not carried into Lean.** `cb8_markCloneCriterion_flow_topRank`
   (§4) has exactly one `sorry`, at the point where the criterion key's clone/type-path transport (its
   "Proof of record," cited but not re-derived here per fence 13) would need to be formalized over
   `cbGraph m`'s literal deletion arcs. This is a nontrivial formalization task in its own right — the
   next seat to pick it up should treat it as a new node, not assume it falls out of condition (i)/(ii)
   alone.
2. **Condition (ii)'s second inequality** has an attributed proof (SR-C4-6/CD-2) that this route did not
   independently re-derive past the citation (§2.2); a future seat with more budget could complete the
   dual "ternary count `\beta`" argument explicitly, though this is optional (the fact is already
   `proved_informal` and registered, and my exhaustive numeric check found 0 failures).
3. **U2's obligation is now fully specified at its input boundary**: `cb8_markCloneCriterion_flow_topRank`
   and `cb8_switchImage_criterionLoad` (§4) are ready to be taken as named hypotheses; U2 still needs the
   sector part (per-state `pb,pc,\sigma,\theta`) and the composition step (SR-3's key) to reach the full
   conjunct 4 of `cb8_topRank_of_descent_and_flow`.
4. **Favorability remains the only Darroch/Newton dependency** anywhere this route's statement touches;
   discharging it (T1/T2's obligation) does not change this route's own grade but would let a future
   composition drop the "modulo Darroch/Newton" qualifier on any use of `hfav`.

## Artifact inventory

Scratch root: `scratchpad/c2-T3/`. Replay root: `scratchpad/c2-T3-replay/` (copies of both scripts,
digest-identical). All computation used `python3 -B`, standard library only, foreground.

| File | SHA-256 | Bytes | Role |
|---|---|---|---|
| `t3_twobinom.py` | `845e1f4c8d34fa375c88a1a27c9c4d7e8463c740b3bf5fa5f8a304f9224b829f` | 14,775 | Parts A–C: grid checks, `m=110` fresh row, `CB(8,1)` toy literal max-flow with tree tests |
| `t3_twobinom.out.json` | `62ba09edbdfc8de8c79e0e5473e2cae6b9f5b10e17c26a3a57c4ec0940bdbf08` | 1,039 | Output of record, 0 failures in every category |
| `t3_alias.py` | `f753e438fe7fe63aa8c0f8549eee6d3a1e64fffe00cf8b8da145fb5321360ab2` | 2,564 | Alias-pattern and exact-string scan against the 491-claim registry |
| `t3_alias.out.json` | `9badd2f575e6c79d95f8efac8cab1411ddc870ee7d0381dc2b2a9c93551cb346` | 211 | 0 hits in every category |

No background job of this route's own was started; nothing was killed; no PID was polled. One full
process listing (`ps aux | grep -i python`) was run as an end-of-route sanity check and is disclosed in
full above (read-boundary disclosure 4) — it should have been a PID-scoped check instead; no content
belonging to another seat was read or used because of it.

chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported model id: claude-sonnet-5
