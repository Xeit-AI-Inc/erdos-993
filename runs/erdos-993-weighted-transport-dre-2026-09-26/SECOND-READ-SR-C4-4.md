# Second Read

**Read:** `SR-C4-4` (E-2′: the E1 criterion at `CB(8,108)/577` and `CB(7,144)/673` on a second instrument, and the whole-row
composition), r30 Cycle 4, 2026-09-27.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]
(The chartered model is Claude Opus 5.5 at high effort. The runtime reports its id verbatim as `claude-opus-5-5[1m]`. The
"transport-resolved" part is the protocol's template wording: this seat cannot see the dispatch parameter.)

**Boot.** I am operating within VerityOS. Boot reads: exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. No other VerityOS file was opened.

**Read-boundary and process disclosures (every deviation).**

1. The host injected the repository `CLAUDE.md` and the auto-memory index `MEMORY.md` into context at start. I did not open
   either file and did not act on them: no conversation log, no memory write, no inbox item. The binding protocol permits
   exactly one output file.
2. **Order of reads.** The dispatch said to read the protocol and the manifest FIRST, so I read
   `control/C4-SECOND-READ-PROTOCOL.md` in the same command as the manifest, before I recomputed the seal. The protocol is a
   capsule member, and its digest and byte count were verified immediately afterwards (seal audit below). No other member was
   read before the seal audit.
3. **Harness-persisted output.** One of my commands printed three registry-snapshot records (about 35 KB). The harness saved
   that stdout to its own file under `/Users/ashtonsperry/.claude/projects/-Users-ashtonsperry-VerityOS/<session>/tool-results/`.
   The harness wrote that file, not I, and I did not open it. Its contents came from a capsule member (the run-local snapshot).
   I re-printed the fields I needed, key by key.
4. All searches were `grep` on named capsule files: the synthesis, the adjudication, the critique, and the two controller-facts
   JSONs. No `find`, `grep` or `ls -R` was rooted above my grant. The only `find` was scoped to my own scratch directory, to check
   for `__pycache__`, and it found none.
5. I read the frozen reference files `C-T1-U/localflow.py` and `ADJ-T/dump_cert.py` (both capsule members, digest-verified) only
   to learn what the certificate's variable names mean. None of the seats' code was imported or executed. The certificate values
   `ADJ-T/cert_values.json` (a capsule member) were read as data by my own checker, which re-verifies their digest.
6. Nothing else was touched. No network, no installs, no Lean, no child agents, no background jobs, no kills. Every script ran
   in the foreground with `python3 -B`, standard library only, in exact integers and `Fraction`. Nothing was written outside
   `scratchpad/c4-sr-SR-C4-4/` and this file. One trivial shell error (`echo ======` parsed by zsh as a filename expansion) had
   no effect.

## Identity and seal audit

- **Capsule:** `control/c4-second-read/SR-C4-4-PACKET-MANIFEST.json`, stage `cycle-4-second-read-SR-C4-4`, run id
  `erdos-993-math-dre-20260926-r30-weighted-transport`.
- **Inner seal (recomputed):** `36ced5fc3f8bf88c342b74431018faf80ad6d0398bdadb14dc55f9aa96922a73`. This is the SHA-256 of the
  compact, key-sorted JSON of the manifest with `seal_sha256` removed, with no trailing newline. It matches the recorded
  `seal_sha256`.
- **Members:** all 60 (`file_count` 60) match their manifest SHA-256 and byte count (0 mismatches; `seal_audit.py`).
- **Frozen reference instruments:** all 35 `sources/c4-stage7-sources/{ADJ-T,C-T1-U}/…` capsule members also match
  `sources/c4-stage7-sources/SOURCE-DIGESTS.json` (SHA-256 and bytes; 0 mismatches). Every digest-listed file in those two seat
  directories is in the capsule.
- **Brief:** `control/C4-SECOND-READ-BRIEF-SR-C4-4.md` (`5c414095…`). It assigns statements SR-C4-4a, SR-C4-4b and SR-C4-4c.

## Statements read

- **SR-C4-4a.** The E1 criterion holds at `(8, 108, 577)` and `(7, 144, 673)`. The criterion is `max_q ρ_q ≤ 1` with the
  type-path inequalities, in SR-C3-3's cleared integer form as registered. Here `r_q(k) = [y^k](1+y)^{a_q}(1+2y)^{b_q}`, with
  `a_q = qd − 1` and `b_q = d(m−q) + 1`. This read is the second instrument.
- **SR-C4-4b.** The sector certificates at 577 and 673 (critic `C-T1-U`; T's checker): `θ* = 16/65097` and `16/138633`, checked
  against `1 − ρ_1`, with margins 10.6× and 12.9×.
- **SR-C4-4c (conditional on SR-C4-3).** If EST-4's composition is sound, then 4a + 4b give full (HALL) at 577 and 673. The
  switch arcs are load-bearing there (ratios 289/288 and 337/336). With the registered D3 part, (HALL) then holds at every
  eligible rank of those two rows.

The sources of record are these:

- the synthesis: EST-6, R-7, `## Registrations` item 2 (scope growth), and `## Headline verdicts` (HALL) note (ii);
- the T adjudication: R8, E-1 and E-2′;
- the `C-T1-U` critique: A8 and its (O3) paragraph;
- the registered keys, taken from the snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c4-stage2.json` (448 claims):
  - E1 `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`);
  - D1–D3 `E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK` (`computer_assisted`);
  - (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN).

## Independent re-derivation

I wrote every instrument myself, from `SEMANTIC-CONTRACT.md` §1 and the registered E1 statement. They are in
`scratchpad/c4-sr-SR-C4-4/`.

### 1. Row data and fidelity (`sr4_rows.py`, `sr4_fp_all.py`)

Each row is checked on two sides.

- **Side A** is generic. It builds the literal adjacency of `CB(d,m)`: path `r–s–v`, chokes `u_i ~ r`, supports `b_ij ~ u_i`,
  private leaves `c_ij ~ b_ij`. It then:
  - tests `IsTree` (edges `= n − 1` and connected);
  - runs a generic forest independence-polynomial DP on the original carrier with a deletion set;
  - computes `α` and `x`, where `x` is the first strict descent scanned through rank `α` with the terminal difference included;
  - derives `F_p` from `Δ_p(T − leaf) < 0` for **every leaf, one by one** (`sr4_fp_all.py`, with no orbit argument);
  - computes `S(T, p) = Σ_{v∈F} [q_v(p) − q_v(p−1)]`, with `q_v(j) = i_j(H_v) − i_j(R_v)` computed on the deletion sets
    `{v, s_v}` and `N[s_v]`.
- **Side B** is my own closed form, built from the case split `r ∈ B` / `r ∉ B` with `F` = all leaves:
  - `Wt(y) = y²(1+2y)^M + (1+2y)·m·d·y²(1+y)^{d−1}·β^{m−1}`, where `β = (1+2y)^d + y(1+y)^d` and `M = dm`;
  - supply `= [y^{p+1}]Wt` and capacity `= [y^p]Wt`.
- `I(T)` from Side A equals the closed form `(1+2y)β^m + y(1+y)(1+2y)^M`, coefficient by coefficient.

**Asserted before any other output:** nonempty eligibility, and supply − capacity = S (WID fidelity).

| row | `n` | `α` | `x` | window `{p : x+2 ≤ p, 3p < 2α+1}` | leaves | `|F_p|` (leaf by leaf) | `S` | supply / capacity digits | `3p − 2M` | `R_K/R_{K−1}` |
|---|---|---|---|---|---|---|---|---|---|---|
| `CB(8,108)/577` | 1839 | 973 | 575 | `[577, 648]` | 865 | 865 | `< 0`, 413 digits | 415 / 415 | 3 | **289/288** |
| `CB(7,144)/673` | 2163 | 1153 | 671 | `[673, 768]` | 1009 | 1009 | `< 0`, 483 digits | 485 / 485 | 3 | **337/336** |

- `Δ_x(T) < 0` and `Δ_{x−1}(T) ≥ 0` hold at both rows, and `IsTree` passes.
- The supply and capacity SHA-256 values (of their decimal strings) are in `rows.json`.
- `Δ_p(T − leaf)` takes exactly two distinct values at each row (the arm leaf `v`, and the private leaves), both negative.

### 2. The E1 criterion (`sr4_e1.py`)

**Formulas, taken literally from E1's registered text.**

- For `q ∈ [1, m]`: `a = qd − 1` and `b = d(m−q) + 1`.
- `N_q(α,k) = C(a,α)·C(b,k−α)·2^{k−α}`, and 0 outside the ranges.
- `j = p − q` in the integers.
- `S_α = N_q(α, j)`, `T_α = N_q(α, j−1)`, `r_q(j) = Σ S_α` and `r_q(j−1) = Σ T_α`.

**Conditions checked, in exact integers.**

- (i) `r_q(j) ≤ r_q(j−1)`.
- (ii) For every `α ∈ [0, a]`:
  - `r_q(j)·Σ_{≤α} T ≥ r_q(j−1)·Σ_{≤α} S`;
  - `r_q(j−1)·Σ_{≤α} S ≥ r_q(j)·Σ_{<α} T`.

**Independent cross-check.** At every `q`, `r_q` also comes from a second expansion,
`(1+2y)^b = ((1+y)+y)^b ⇒ r_q(k) = Σ_t C(b,t)·C(a+b−t, k−t)`, and the two agree.

**Validation fixture.** The registered E1 scope says the criterion fails at `CB(1,7)/10` with `ρ_7 = 50/27`. My code reproduces
the failure and the value `50/27` exactly.

| row | (i) all `q` | (ii) all `q, α` | `max_q ρ_q` (at `q`) | `ρ_1` exact | `1 − ρ_1` | `ρ_m` | `ρ_q` monotone |
|---|---|---|---|---|---|---|---|
| `(8,108,577)` | yes (108) | yes | 0.99739585 (`q=1`) | `88964996559682/89197279304167` | `232282744485/89197279304167` | `14663/17353` | strictly decreasing |
| `(7,144,673)` | yes (144) | yes | 0.99851025 (`q=1`) | `361507351101341/362046708578535` | `539357477194/362046708578535` | `7685/8464` | strictly decreasing |

**The criterion holds at both rows.**

**Literal laboratories** (`sr4_lab.py`, `sr4_lab2.py`; lab model `F` = all leaves). My criterion code was also tested against a
literal network, test C below. At all 13 laboratories where my code says the criterion holds, including 6 switch-necessary ones:

- targets were capped at exactly `ρ_q·w_F` on `r`-free targets with `q ≥ 1`, and at 0 elsewhere;
- the literal non-sector deletion-only network, solved by exact integer Dinic, saturates every non-sector source.

So my reading of `q`, `j` and `ρ_q` is the registered one.

### 3. The sector certificates (`sr4_sector.py`)

**Data.** The frozen `ADJ-T/cert_values.json` (digest `f16526bd…`, re-verified inside the script). Its variable inventory was
checked: exactly the `φ_b(β,γ)` with `β ≥ 1`, the `φ_c(β,γ)` with `γ ≥ 1`, `σ(1..d−1)`, the split affine variables and `θ`.
There is no `σ(0)` and no `σ(d)`.

**Semantics.**

- A sector source is `{r, v}` plus `K = p−1` leg elements.
- Along each deletion of a `b` (resp. `c`) at choke `i`, it sends `φ_b` (resp. `φ_c`) evaluated at the state `(β_i, γ_i)` of that
  choke.
- If `β_i = 1`, it also sends `σ(γ_i)` along the `u_i`-switch.
- `Out(β,γ) = βφ_b + γφ_c + [β=1]σ(γ)`.
- `In(y) = (d−|y|)(φ_b(y+b) + φ_c(y+c))`.
- A switch image of weight `g` receives `(d−g)σ(g)`.

I confirmed these semantics on the literal relation, test B below.

**Checks** (exact `Fraction` arithmetic):

| check | `CB(8,108)/577` | `CB(7,144)/673` |
|---|---|---|
| all values `≥ 0` | yes | yes |
| affine separation `Out(x) ≥ a + λ\|x\|` (all 45 / 36 states) and `m·a + λK ≥ 1` | yes (bound = 1 exactly) | yes (bound = 1 exactly) |
| affine separation `In(y) ≤ a₂ + λ₂\|y\|` and `m·a₂ + λ₂(K−1) ≤ 1` | yes (bound = 1 exactly) | yes (bound = 1 exactly) |
| **exact min-plus DP**: min source outflow over all profiles of `m` choke states with total `K` | **1** | **1** |
| **exact max-plus DP**: max in-sector inflow over all profiles with total `K − 1` | **1** | **1** |
| `(d−g)σ(g) ≤ θ*·g` for `g = 0..d−1` (`σ(0) = 0`) | yes; `max_g (d−g)σ(g)/g = θ*` | yes; `= θ*` |
| `θ*` in the file equals the stated value | `16/65097` | `16/138633` |
| `σ(g) > 0` | `g = 1..7` | `g = 1..6` |
| `θ* ≤ 1 − ρ_1` (my `ρ_1`) | yes, margin **10.595** | yes, margin **12.908** |

Both affine-separation sides and both exact DP sides hold at both rows. Sources whose outflow exceeds 1 are scaled down
proportionally, which only lowers loads. The result is a nonnegative flow on literal (D) ∪ (S) arcs with these properties:

- it saturates every sector source (weight 1);
- it loads every in-sector target (weight 1) at most 1;
- it loads every `u_i`-switch image of weight `ℓ` at most `θ*·ℓ`;
- it sends nothing to a weight-0 target, since `σ(0) = 0` and no value sits on the `r`/`v` deletions or the `s`-switch.

### 4. Structural premises of the composition, checked literally (`sr4_lab.py`, `sr4_lab2.py`)

There were 22 laboratories on `CB(d,m)` with `n ≤ 25`. Sixteen are listed in `out_lab.txt`. Six are switch-necessary with the
criterion holding (`out_lab2.txt`): `CB(4,1)/4`, `CB(6,1)/5`, `CB(7,1)/6`, `CB(8,1)/6`, `CB(9,1)/7` and `CB(5,2)/8`. Weights and
relation are literal.

- **A (exit classification): 0 violations.**
  - Every sector source has weight 1.
  - Every positive-weight exit is one of two kinds: an in-sector leg deletion of weight 1, or a `u_i`-switch image taken where
    `β_i = 1`. That image is `r`-free, has exactly one choke, and has weight `γ_i`.
  - The deletions of `r` or `v`, the `s`-switch, and `g = 0` switch images all have weight 0.
- **B (choke-locality, random rational `φ, σ`): 0 violations.**
  - Literal sector outflow `= Σ_chokes Out`.
  - Literal in-sector inflow `= Σ_chokes In`.
  - Literal switch-image inflow from `sec` `= (d−g)σ(g)`.
  - No sector flow reaches a weight-0 target.
- **C (E1 load clause): saturates at all 13 criterion-holding laboratories** (above).
- **D (superposition).** The sector gets in-sector capacity `w_F` and switch-image residual capacity `(1−ρ_1)·w_F`. That residual
  network saturates at the 7 non-deficient criterion-holding laboratories. It fails at all 6 switch-necessary laboratories.
  - This is expected. On the boundary `3p = 2M + 3` the sector ratio is `(p+1)/(p−1)`, far from 1 at small `p`: 4/3 to 8/5 in
    the laboratories, against 289/288 at the rows.
  - It fails at `CB(7,1)/6`, the non-eligible row where a literal deficient family is on record. So test D is sensitive.
  - The laboratories therefore **cannot** exercise the switch-necessary success. At the rows, that success rests on the exact
    certificate (§3).

### 5. The composition at 577 and 673 (my own reading)

Every source is either a sector source or a non-sector source.

- E1 (criterion by §2, `F_p ⊇ C` by §1) saturates every non-sector source along (D) arcs. It loads each `r`-free target with
  `q ≥ 1` at `ρ_q·w_F` and every other target at 0.
- The sector flow (§3) saturates every sector source.

The superposed loads are:

- **in-sector targets** (contain `r`): `0 + ≤ 1`, against weight 1;
- **`u_i`-switch images** (`r`-free, `q = 1`, weight `ℓ`): `≤ (ρ_1 + θ*)·ℓ ≤ ℓ`;
- **other `r`-free `q ≥ 1` targets:** `ρ_q·w_F ≤ w_F`, because `max_q ρ_q = ρ_1 < 1`;
- **every other target:** 0.

So the superposition is a saturating nonnegative rational flow on literal (D) ∪ (S) arcs. For every `X`,
`Σ_X w = Σ_{B∈X}Σ_A f ≤ Σ_{N(X)} w`, so (HALL-COND) holds. Supplies and capacities are integers, so max-flow integrality gives an
integral saturating flow, which is (HALL).

**Load-bearing switch arcs.**

- `Σ_sec w_F = R_K = 2^K·C(M,K)`.
- The positive-weight part of `N_D(sec)` is exactly the in-sector targets (test A), and every in-sector `(K−1)`-configuration is
  reached. It has total weight `R_{K−1} = 2^{K−1}·C(M,K−1)`.
- `R_K/R_{K−1} = 2(M−K+1)/K = 289/288` (577) and `337/336` (673), which is `> 1`. So no deletion-only saturating flow exists at
  either first rank.

**ℕ-subtraction audit.**

| quantity | why it is the integer value |
|---|---|
| `K = p − 1` | `p ≥ 2` |
| `j = p − q` | computed in `ℤ`; `≥ 469` and `≥ 529` since `m < p` |
| `j − 1` | `≥ 468` |
| `a_q = qd − 1` | `≥ 6` (`d = 7`, `q = 1`) |
| `b_q = d(m−q) + 1` | `≥ 1` since `q ≤ m` |
| `d − g` | `g ≤ d − 1` |
| `d − |y|` | the `In` term vanishes at `|y| = d` |
| `M − K + 1` | `K ≤ M` |

No truncated subtraction enters.

## Findings and repairs

1. **SR-C4-4a is confirmed on my instrument.** Condition (i) holds for every `q`. Condition (ii) holds for every `(q, α)`. The
   maximum `ρ_q` is at `q = 1`, and my two values agree to every digit with T's recorded maxima (0.997396 and 0.998510), after
   the fact. The E1 key's form of (ii) (prefix `≤ α`, then `≤ α` / `< α`) and the D-key's form (prefix `< a`) are equivalent. The
   D-key's form omits only the trivially true full-prefix equality.
2. **Provenance finding (no change to any statement).** SYNTHESIS R-7 says "one instrument so far" at 577/673, and T's R8 says
   "the first computation on record". The registered D-key's own certificate text already says otherwise. Its statement reads
   "The criterion holds at every rank of all five windows (exact integers)". It lists the worst `ρ` "at `q = 1` and the first
   rank" as `88964996559682/89197279304167` and `361507351101341/362046708578535`, and those equal my `ρ_1` exactly.
   - I use this only as a provenance fact about the registry text, never as evidence. It is a frozen record's value.
   - My read is therefore an independent instrument that agrees with **both** T's Cycle 4 computation and the Cycle 3
     registered text.
   - Which Cycle 3 codes computed the first ranks cannot be settled from my capsule. The D-key certifies (D3) only from rank 578
     and 674.
   - Registration should credit this read as "a further independent instrument", not "the second". The two first-rank rows remain
     outside D1–D3's assertions.
3. **SR-C4-4b is confirmed.** Nonnegativity, both affine-separation sides, both exact DP sides, the switch caps and
   `θ* ≤ 1 − ρ_1` all hold at both rows, with margins **10.595** and **12.908** (the brief's 10.6× and 12.9×). The certificate is
   exactly tight: DP extremes equal 1 on both sides, and `max_g (d−g)σ(g)/g = θ*`. Test B confirms its choke-local semantics on
   the literal relation.
4. **SR-C4-4c is confirmed as a conditional.** Four inputs are needed besides 4a and 4b:
   - E1 itself (registered, `proved_informal`);
   - `F_p ⊇ C` at the row (derived leaf by leaf, §1);
   - the exit classification and choke-locality (tests A and B, and the elementary reasoning in §5);
   - the superposition (§5).

   The second and third are the structural content that SR-C4-3 reads for EST-4. They are row-independent.
5. **Ratios and ranks.** `R_K/R_{K−1} = 289/288` and `337/336` are recomputed. The windows are `[577, 648]` (72 ranks) and
   `[673, 768]` (96 ranks). D3 covers 578–648 and 674–768 (71 + 95 = 166), so with the first ranks all 168 eligible ranks of
   the two rows are covered. With the three `CB(8,·)` rows (177; SR-C4-3) the total is 345.
6. **What changes if SR-C4-3 rejects.**
   - **(a) SR-C4-3 rejects the composition mechanism.** That covers E1's load reading, the exit classification, choke-locality,
     and the superposition or flow ⇒ Hall step. The same defect then applies verbatim at 577/673, so 4c fails.
     - No whole-row (HALL) is registered at any first rank, and no three-, five- or two-row key is registered.
     - 4a and 4b register only as RECORD rows (below).
     - The (HALL) scope note for these two rows reduces to what D3 already carries (ranks 578–648 and 674–768).
     - The first ranks stay deletion-deficient in the sector, with (HALL) there open.
   - **(b) SR-C4-3 rejects only row-specific inputs at 460/476/492,** such as the D1 data or those three certificates, while
     confirming the mechanism. Then 4a, 4b and the mechanism give (HALL) at 577/673 alone. The name must match the row count:
     `E993-R30-TWO-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` (fallback block below).
   - **(c) SR-C4-3 repairs EST-4.** Its repaired three-row text governs the three `CB(8,·)` clauses of the five-row key. My
     clauses for 577/673 are unchanged unless the repair touches the mechanism, in which case case (a) or (b) applies.
7. **Fences checked.** These are two finite rows, and the result strengthens letter (b); it is not a letter of its own.
   - Not (HALL): the key stays OPEN.
   - Not parameter-uniform.
   - Not a deletion-only claim: deletion-only saturation fails at both first ranks.
   - No refuted mechanism is revived. The flow uses the literal (D) ∪ (S) relation, the literal `w_F`, and a fixed original
     selector. It is not per-leaf injectivity, own-support unit capacity or occupancy domination.
   - The primary aggregate is untouched. `S < 0` at both rows was already derivable and is not a status transfer.
   - No RTree assertion. No census value enters a proof.
   - A finite certificate never qualifies for a Lean award.
8. **Predicate check of the key names.**
   - `…FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` is true of the five-row statement, and asserts no
     more than it does.
   - The `TWO-CB` fallback is true of the two-row statement.
   - The three-row name would under-describe the scope if 577/673 were included, so it must not carry them.

## Registration text

**R1. Record row, the criterion at 577 (register now; it does not depend on SR-C4-3).**

```text
RECORD: R30-CB-RECORD-C4-E1-CRITERION-CB8-108-FIRST-RANK-577
CLAIM: At CB(8,108) (n = 1839, alpha = 973, x = 575, eligible window [577, 648]; IsTree tested), p = 577, F = F_577(T) = all 865 leaves (Delta_577(T - leaf) < 0 derived leaf by leaf on the original tree), supply - capacity = S(T, 577) < 0 (413 digits) asserted from two independent sides, the registered E1 criterion holds in exact integers: for every q in [1, 108], with a_q = 8q - 1, b_q = 8(108 - q) + 1, j = 577 - q (integer rank), r_q(k) = [y^k](1+y)^{a_q}(1+2y)^{b_q}: (i) r_q(j) <= r_q(j - 1) and (ii) both type-path inequalities for every alpha in [0, a_q]. max_q rho_q = rho_1 = 88964996559682/89197279304167 (about 0.997396); rho_q strictly decreasing in q; rho_108 = 14663/17353. Hence E1 gives a deletion-arc flow saturating every non-sector source at this rank, loading each r-free target with q >= 1 chokes at rho_q w_F and every other target at 0.
STATUS: computer_assisted
PROVENANCE: Isolated second read SR-C4-4 (Claude Opus 5.5, high; own instrument sr4_e1.py with a second binomial expansion of r_q, validated on the registered CB(1,7)/10 fixture and on 13 literal laboratories; row data sr4_rows.py and sr4_fp_all.py). Agrees exactly with the T adjudicator's Cycle 4 computation (Claude Opus 5.5; adj_e1_lab/adj_verify_cert instruments) and with the first-rank worst rho already printed in the certificate text of E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK (which asserts D3 only from rank 578). Criterion and E1: C-T1-F, C-T1-U, T adjudicator, SR-C3-3 (Cycle 3). CB family, active-tag weight and relation: Codex (GPT-6 Astra/Sol/Luna). Fences: one finite rank of one tree; the criterion at a rank, not a family theorem; non-sector families only; not (HALL); the primary aggregate untouched; no RTree assertion.
```

**R2. Record row, the criterion at 673 (register now).**

```text
RECORD: R30-CB-RECORD-C4-E1-CRITERION-CB7-144-FIRST-RANK-673
CLAIM: At CB(7,144) (n = 2163, alpha = 1153, x = 671, eligible window [673, 768]; IsTree tested), p = 673, F = F_673(T) = all 1009 leaves (derived leaf by leaf on the original tree), supply - capacity = S(T, 673) < 0 (483 digits) asserted from two independent sides, the registered E1 criterion holds in exact integers: for every q in [1, 144], with a_q = 7q - 1, b_q = 7(144 - q) + 1, j = 673 - q (integer rank): (i) r_q(j) <= r_q(j - 1) and (ii) both type-path inequalities for every alpha in [0, a_q]. max_q rho_q = rho_1 = 361507351101341/362046708578535 (about 0.998510); rho_q strictly decreasing in q; rho_144 = 7685/8464. Hence E1 gives a deletion-arc flow saturating every non-sector source at this rank, loading each r-free target with q >= 1 chokes at rho_q w_F and every other target at 0.
STATUS: computer_assisted
PROVENANCE: Isolated second read SR-C4-4 (Claude Opus 5.5, high; own instruments sr4_e1.py, sr4_rows.py, sr4_fp_all.py). Agrees exactly with the T adjudicator's Cycle 4 computation (Claude Opus 5.5) and with the first-rank worst rho printed in the certificate text of E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK (which asserts D3 only from rank 674). E1: C-T1-F, C-T1-U, T adjudicator, SR-C3-3. CB family, weight, relation: Codex (GPT-6 Astra/Sol/Luna). Fences: as R30-CB-RECORD-C4-E1-CRITERION-CB8-108-FIRST-RANK-577.
```

**R3. Record row, the sector certificates at 577 and 673 re-verified (EST-6's two (O3) rows; register now).**

```text
RECORD: R30-CB-RECORD-C4-SECTOR-CERTIFICATE-O3-FIRST-RANKS-THIRD-CHECK
CLAIM: At CB(8,108)/577 and CB(7,144)/673 (F = F_p = all leaves, derived), C-T1-U's choke-local sector values (frozen sources/c4-stage7-sources/ADJ-T/cert_values.json, f16526bd...) define a nonnegative flow on literal (D) and u_i-switch arcs from the root-plus-arm sector (r, v in B; every member weight 1) with: minimum source outflow exactly 1 and maximum in-sector target inflow exactly 1 (exact min-plus / max-plus DP over all profiles of m choke states with total K = p - 1, resp. K - 1; both affine-separation sides also hold with bound exactly 1); every u_i-switch image of weight l >= 1 loaded at most theta* l, with theta* = 16/65097 and 16/138633 (equal to max_g (d - g) sigma(g)/g; sigma(0) = 0, so no weight-0 target is loaded); theta* <= 1 - rho_1, margins 10.595 and 12.908. The sector's positive-weight deletion neighbourhood is the in-sector layer, with R_K/R_{K-1} = 289/288 and 337/336 (sector deletion-deficient).
STATUS: computer_assisted
PROVENANCE: C-T1-U (Claude Opus 5.5; construction, LP search device and exact DP); T adjudicator (Claude Opus 5.5; independent affine-separation checker and DP); isolated second read SR-C4-4 (Claude Opus 5.5, high; third, independent checker sr4_sector.py reading the values as data, plus literal choke-locality and exit-classification tests on 22 CB laboratories, 0 violations). Fences: two finite sector statements; the sector only; not (HALL); not parameter-uniform; the primary aggregate untouched.
```

**R4. Conditional KEY: register only if SR-C4-3 confirms EST-4, or confirms it with repairs that leave the mechanism intact. It
replaces the three-row name. If SR-C4-3 repairs EST-4's three-row text, its repaired clauses for 460/476/492 are substituted
into the STATEMENT verbatim.**

```text
KEY: E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
STATUS: VERIFIED (restricted scope, separate key; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN)
GRADE: computer_assisted
STATEMENT: Let CB(d,m) be the tree with path r - s - v, m chokes u_i adjacent to r, d supports b_ij adjacent to u_i and one private leaf c_ij adjacent to b_ij (n = 3 + m + 2dm, M = dm). At each of the five first eligible ranks (T, p) = (CB(8,86), 460), (CB(8,89), 476), (CB(8,92), 492), (CB(8,108), 577), (CB(7,144), 673), with (n, alpha, x) = (1465, 775, 458), (1516, 802, 474), (1567, 829, 490), (1839, 973, 575), (2163, 1153, 671), let F = F_p(T) (derived: every leaf), w_F the literal active-tag weight and the relation (D) union (S). Then there is a nonnegative rational flow supported on literal (D) union (S) arcs that saturates every source supply w_F(B) and loads every target A at most w_F(A); hence (HALL-COND) holds for every X subset of I_{p+1}(T), and an integral saturating flow exists by max-flow integrality: (HALL) holds at these five (T, p). Switch arcs are load-bearing: the root-plus-arm sector sec = {B in I_{p+1}(T) : r, v in B} has total weight R_K = 2^K C(M, K) (K = p - 1; every member weight 1), its whole positive-weight deletion neighbourhood is the in-sector layer of total weight R_{K-1} = 2^{K-1} C(M, K-1), and R_K/R_{K-1} = 460/459, 476/475, 492/491, 289/288, 337/336 > 1, so no deletion-only saturating flow exists at these ranks. Certificate: (i) E1 (E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL) with its criterion verified in exact integers at each row (max_q rho_q = rho_1 < 1; the three CB(8,.) rows by the D1 record, the rows 577 and 673 by records R30-CB-RECORD-C4-E1-CRITERION-CB8-108-FIRST-RANK-577 and R30-CB-RECORD-C4-E1-CRITERION-CB7-144-FIRST-RANK-673) gives a deletion-arc flow saturating every non-sector source, loading each r-free target with q >= 1 chokes at rho_q w_F and every other target at 0; (ii) C-T1-U's choke-local sector flow saturates every sector source, loads every in-sector target at most 1 and every u_i-switch image of weight l at most theta* l, with theta* = 96/495419, 96/530501, 96/566783, 16/65097, 16/138633 (exact DP over all choke-state profiles and affine separation); (iii) every u_i-switch image is r-free with exactly one choke, so its superposed load is at most (rho_1 + theta*) l <= l because theta* <= 1 - rho_1 (margins 28.06, 29.04, 30.02, 10.60, 12.91); in-sector targets contain r and receive nothing from (i); the sum of (i) and (ii) is the required flow.
SCOPE: Five named ordinary trees, each at its first eligible rank only (five instances). F_p(T) = leafSet(T) derived at each (bounded_computation). Relation (D) union (S) literal; weight w_F literal. Inputs at their grades: E1 (proved_informal), the D1 record and the two first-rank criterion records (computer_assisted), the sector certificates (computer_assisted, record R30-CB-RECORD rows for EST-6). With D2 and D3 of E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK, (HALL) holds at every eligible rank of the five rows (345 instances); that union is a scope note on (HALL), not part of this key.
ATTRIBUTION: C-T1-U (Claude Opus 5.5; the choke-local sector certificate and the conditional composition); controller CF-T2/CF6-4 (Claude Fable 5.1; the composition derivation); the r30 T adjudicator (Claude Opus 5.5; independent affine-separation checker, E1 reconstruction, the E1 criterion at 577/673 in Cycle 4); E1 of record (C-T1-F, C-T1-U, T adjudicator, SR-C3-3) and D1 of record (C-T1-F, T adjudicator, SR-C3-4); isolated second reads SR-C4-3 (the three CB(8,.) rows and the composition) and SR-C4-4 (Claude Opus 5.5; a further independent instrument on the E1 criterion at 577/673, a third check of the sector certificates there, F_p leaf by leaf, WID from two sides, literal composition premises on 22 laboratories); Codex (GPT-6 Astra/Sol/Luna) for the transport mechanism, the active-tag weight, the relation and the CB family; the first-interior run (Codex) and r24-r26 for the definition layer.
FENCES: Five finite instances; not (HALL) - E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN; not parameter-uniform and nothing about any other CB(d,m) or rank; a strengthening of ruling-30 letter (b), not a letter of its own and not decisive; not a deletion-only claim (deletion-only saturation fails at all five ranks) and not E993-R23-LITERAL-DELETE-ONLY-HALL; no refuted mechanism revived (literal (D) union (S), literal w_F, fixed original selector; not per-leaf injectivity, own-support unit capacity or occupancy domination); the primary aggregate E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE untouched (S < 0 at these rows was already derivable; no status transfer), as are E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG and Erdős #993; no RTree or governed-model assertion; no census value enters; a finite certificate never qualifies for a formal award.
ALIASES: E993-R30-THREE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS (superseded three-row name); five CB first eligible ranks weighted Hall with load-bearing switch arcs; r30 C4 E-2 and E-2 prime; r30 C4 EST-4 with the O3 rows
```

**R5. Conditional fallback KEY: only in case 6(b), where SR-C4-3 rejects row-specific inputs at 460/476/492 but confirms the
mechanism.**

```text
KEY: E993-R30-TWO-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
STATUS: VERIFIED (restricted scope, separate key; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN)
GRADE: computer_assisted
STATEMENT: As E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS, restricted to the two first eligible ranks (T, p) = (CB(8,108), 577) and (CB(7,144), 673), (n, alpha, x) = (1839, 973, 575), (2163, 1153, 671): with F = F_p(T) = every leaf (derived), there is a nonnegative rational flow on literal (D) union (S) arcs saturating every source and loading every target at most its weight, so (HALL-COND) holds for every X and (HALL) holds at these two (T, p); switch arcs are load-bearing (R_K/R_{K-1} = 289/288, 337/336). Certificate: E1 with the criterion verified at each row (records R30-CB-RECORD-C4-E1-CRITERION-CB8-108-FIRST-RANK-577 and R30-CB-RECORD-C4-E1-CRITERION-CB7-144-FIRST-RANK-673; rho_1 = 88964996559682/89197279304167, 361507351101341/362046708578535), C-T1-U's sector certificate (theta* = 16/65097, 16/138633; record R30-CB-RECORD-C4-SECTOR-CERTIFICATE-O3-FIRST-RANKS-THIRD-CHECK), and the superposition (switch images r-free with one choke, load at most (rho_1 + theta*) l <= l; margins 10.60, 12.91).
SCOPE: Two named trees at their first eligible ranks (two instances). With D3, every eligible rank of the two rows (168 instances), as a scope note on (HALL).
ATTRIBUTION: As the five-row block, without the D1 attribution.
FENCES: As the five-row block, with "two finite instances".
ALIASES: two CB first eligible ranks weighted Hall with load-bearing switch arcs; r30 C4 E-2 prime
```

**R6. Conditional SCOPE NOTE on (HALL): on SR-C4-3 confirming EST-4, appended to synthesis note (ii).**

```text
SCOPE NOTE ON: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL
TEXT: (computer_assisted; r30 Cycle 4; second reads SR-C4-3 and SR-C4-4) (HALL) holds at CB(8,108) and CB(7,144) at every eligible rank (windows [577, 648] and [673, 768]; 72 + 96 = 168 instances): at the first ranks 577 and 673 with switch arcs load-bearing (sector ratios 289/288, 337/336), by E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS, and at 578-648 and 674-768 with deletion arcs alone, by D3 of E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK. With note (ii)'s three CB(8,.) rows, (HALL) holds at every eligible rank of the five CB rows (345 instances). Finite instances only; the key stays OPEN; the primary aggregate is untouched. Attribution: C-T1-U, the T adjudicator, controller CF-T2/CF6-4, E1 and D1-D3 of record, SR-C4-3, SR-C4-4; Codex (GPT-6 Astra/Sol/Luna) for the mechanism.
```

**R7. Conditional SCOPE NOTE on the D-key: on the five-row key registering.**

```text
SCOPE NOTE ON: E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK
TEXT: (r30 Cycle 4; SR-C4-3, SR-C4-4) The first eligible ranks 460, 476, 492, 577 and 673, where this key asserts only (D1) at 460/476/492 and nothing at 577/673, are covered with switch arcs by the separate key E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS (computer_assisted). The E1 criterion at 577 and 673, printed in this key's certificate text, was recomputed by an independent instrument (records R30-CB-RECORD-C4-E1-CRITERION-CB8-108-FIRST-RANK-577 and R30-CB-RECORD-C4-E1-CRITERION-CB7-144-FIRST-RANK-673) with identical rho_1. This key's own assertions are unchanged.
```

**R8. Conditional DISTINCTION ROW: with R4 or R5.**

```text
DISTINCTION ROW: R30-C4-FIVE-CB-FIRST-RANK-HALL-VS-R23-LITERAL-DELETE-ONLY-HALL
KEY: E993-R23-LITERAL-DELETE-ONLY-HALL
TEXT: The r30 first-rank CB key asserts a saturating flow on the (D) union (S) network with the active-tag weight w_F at a fixed original selector, at five (or two) named instances; the switch arcs are load-bearing there, because deletion-only saturation provably fails (sector ratio R_K/R_{K-1} > 1). It is therefore not the refuted universal unweighted deletion-only Hall under the r23 literal contract, and it revives nothing of it.
```

## Verdicts

verdict[SR-C4-4a]: confirmed
verdict[SR-C4-4b]: confirmed
verdict[SR-C4-4c]: confirmed

- **4a.** The criterion holds at both rows on my own instrument (R1 and R2). There is a provenance finding (Findings 2): the
  registered D-key's certificate text already prints the same first-rank `ρ_1`, so this is a further independent instrument
  rather than strictly the second. No statement text changes.
- **4b.** Affine separation, both exact DP sides, the switch caps and the margins 10.595 / 12.908 are confirmed (R3).
- **4c.** Confirmed as the conditional it states. Register R4 (or R5 in case 6(b)), R6, R7 and R8 only on SR-C4-3's outcome. If
  SR-C4-3 rejects the mechanism, only R1–R3 register.

This read is not decisive for ruling 30. It strengthens letter (b).

## Artifact inventory

Scratch directory: `scratchpad/c4-sr-SR-C4-4/` (absolute
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-sr-SR-C4-4/`).

| file | bytes | SHA-256 |
|---|---|---|
| `seal_audit.py` | 676 | `bdbf77a2403ee4039a1eaa0d24c24e7de5271465885e24f2d11017c73ba4f4f9` |
| `sr4_rows.py` | 7181 | `b3909ff5698ba89d296c473802d40712876521850826b2c59acb51c23bac7757` |
| `sr4_fp_all.py` | 757 | `fc055f8c8ed2a4242b7d9c2bfc163691d92e30376d7fc1cbca18884f48560095` |
| `sr4_e1.py` | 3634 | `2d8939d2d23d2cdc5cc1f721e9ce556e685e1f2221586166d0f4da80af037e23` |
| `sr4_sector.py` | 5344 | `3f807363a223beea2f5f5746a1da90d3aa8b35f168ad1e26633158a88a8c44c6` |
| `sr4_lab.py` | 8346 | `7225643bca62f053886293fcde386b2274947c6174a74090a0a069a624ee70fe` |
| `sr4_lab2.py` | 621 | `cd33dd204a799e337111061e01ec79c50f36076c5e77a2342c297a18506820c5` |
| `out_rows.txt` | 1644 | `156b43a494f7f372edd1b07b892d688a59a305c0ff8f4d6e1f66a57cfa12e382` |
| `rows.json` | 2756 | `bd079907906e822f7ba98e9f86fbeb1a15c2ead025eadacf9362e5270ab85198` |
| `out_fp_all_577.txt` | 113 | `cdb2051d06e3d1adbd08c2b6c3e0407605eef8da21c249e86a057bf5cef0f452` |
| `out_fp_all_673.txt` | 115 | `2bef3015b4874cb7e2af98d8fd06bc3ac5fbfb3d882503443a33dfc0604d2d04` |
| `out_e1.txt` | 981 | `d5f58e653ecf4fdd1e69c900f3440b91acdf5c72320f8a989663f960a9312358` |
| `e1.json` | 985 | `01762ee962d5321c075a28f7a895a75abb2e5d654c9618738f7157f99d1b9bfb` |
| `out_sector.txt` | 1118 | `2453ce0562d96f50c9132813b924678cda8eadb977457c007865d85e17de1b9b` |
| `sector.json` | 1273 | `e31d3533f98a31583aa17812dcdeda26b5ce2c47f25ae0c30cb96af7a17c6d1c` |
| `out_lab.txt` | 3095 | `b5ee16b7f6982279d734a2766edb09417ba208cba0a8ed3e6ca82a5e1f16a2eb` |
| `lab.json` | 3567 | `a25d127be207a2f9950313bf855956cc209a23485b4b32b26a4d99cc624234e7` |
| `out_lab2.txt` | 1655 | `39c063e89e929a267bb7795c4fdd2792ccbe7edd8062206851483a9bc1639fe0` |
| `lab2.json` | 1867 | `ccff540ea81259c5dad62553dd961c715b5fefede7ec284297e02b7b05622af9` |

- **Run times** (foreground): `sr4_rows.py` 5 s; `sr4_e1.py` 5 s; `sr4_sector.py` 4 s; `sr4_lab.py` 1 s; `sr4_lab2.py` 4 s;
  `sr4_fp_all.py` 96 s (577) and 169 s (673).
- **Reproduce:** `cd` to the scratch directory, then run `python3 -B <script> [out.json]`. For `sr4_fp_all.py` the arguments are
  `d m p`.
- No `__pycache__` or `.pyc` exists.
- **Output file:** `second-reads/SR-C4-4/SECOND-READ.md` (this file; its SHA-256 is reported in the final message, since a file
  cannot contain its own digest).

Reread before close: done.
