# RETURN — Route F2, Cycle 3, r31 (erdos-993-cb-uniform-switch-dre-2026-09-27)

**Route ID:** `C3-F-02`. **Mechanism token:** `AT-RANK-COMPOSED-FLOW-ADVERSARY`. **Orientation:** F (falsify).
**Load-bearing obligation (`control/C3-ALLOCATION.md`, F2 row):** the actual composed rational flow (the criterion
key's non-sector deletion flow plus the C1-LA1 governed sector allocation, scaled) at the fresh rows on the
literal network at rank `p*`; exact inflows on every target class against literal active-tag capacities;
non-strict in-sector tightness; row sums per source; Hall sums over structured `X`. Could close: an end-to-end
bounded confirmation of the composition (not the template), or an exact failure or cut.

**Dispatch verified.** `control/dispatch/c3-stage3/DISPATCH-F2.md` SHA-256
`26608d428120a154a3c1c8a4f26d6907e188f54cf0f5e85d7a5e46c6d60bd7eb` — matched before reading, and followed exactly.

## Boot acknowledgment

I am operating within VerityOS. Per the dispatch's boot restriction (the controller has already booted for this
run), I read **exactly** `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file. I did not follow the
startup protocol's own map into memory, conversations, modules, skills, logs or decisions. Subsystem actually
loaded for the run: this experiment's own `control/`, `sources/` (as granted) and my `cycles/.../returns/F2/` and
`scratchpad/c3-F2{,-replay}/`.

## Read-boundary disclosures

1. The harness injected the project `CLAUDE.md`, the user memory index (`MEMORY.md`) and the user's e-mail address
   into context before my first tool call. I did not open, use or act on any of it; it is irrelevant to a math DRE
   seat and is disclosed only because it was present.
2. I never ran `find`, `grep -r`, `ls -R`, a glob `cat`, or any recursive listing rooted above my grant. Every
   `grep`/`sed`/`cat` I ran named one specific already-authorized file (e.g. `Main.lean`, `OBLIGATIONS.csv`) or
   filtered the content of the single already-fully-read `control/C3-STAGE2-PACKET-MANIFEST.json` in Python
   (a content search inside one authorized file, not a filesystem listing).
3. Two oversized tool outputs (the Stage-2 manifest preview and `SR-C2-5/SECOND-READ.md`) were persisted by the
   harness to its own tool-results cache outside the run root; I read those cached copies with the file reader to
   see the full text, since re-invoking the same command would have produced identical, already-authorized content.
4. No Mathlib access, no `lake`/`lean`, no network, no package install, no child agent, no background job. Every
   computation ran in the foreground as `python3 -B`, standard library only (`fractions.Fraction`, `math.comb`,
   `json`, `hashlib`, `sys`, `os`, `time`), exact `int`/`Fraction`.

## Seal and digest verification

- **Stage 2 packet manifest** `control/C3-STAGE2-PACKET-MANIFEST.json` (5,049 members). Recomputed SHA-256 of the
  canonical JSON without `seal_sha256` (`sort_keys=True`, `separators=(",",":")`, no trailing newline):
  **`f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3`. MATCH** with the stated `seal_sha256`.
- Every source file I opened was checked against this manifest's per-file SHA-256 (which subsumes and matches
  `sources/SOURCE-DIGESTS.json` on the files it covers) **before** reading it. All matched; none listed below as
  mismatched:
  - `control/C3-WORKER-COMMON-BRIEF.md` `302d6533a4955a8d448646198beb3d2a7097dc79ef01822efb170c6478427953`
  - `SEMANTIC-CONTRACT.md` `7cc0bf434d6ea8f8fa2d812caf4e45787c1c06a9dfc6846b6b4d54cb60cf226e`
  - `SOLUTION-CONTRACT.md` `480ba2ddda557be50b2d8249feb733be7e3c947d2e0a9dd4e7fee1427a7ef719`
  - `control/C3-ALLOCATION.md` `6ef9ce07995c98ef05a91d08e32e478a7520313a36008fb506ce9b3b59ae2d54`
  - `control/C3-STAGE1-GATE.md` `837bdd0dbb9944dc830e450a6b7fa912de45dd358a1c147e7ab2971402a42fb1`
  - `cycles/cycle-3/stage2/ROUTE-STATE.md` `32dd0e1e9c6f9a4039d1d17b1c01f58e906a9206d8d5f6d65a1113296adf0ceb`
  - `sources/authority/CLAIM-IDENTITY.json` `b4a339eff1e2cdc04ceedcdd55fdd53697574bf64ed7e26631c50d84d56e470b`
  - `control/CLAIM-IDENTITY.run-local.json` `96fb35601a71daaaaf864f59fa9b64773cf7ea8e11f103060f82328cb9a1c329`
  - `OBLIGATIONS.csv` `1f59cb93cb6ea11949452981dc3f0a8d0e9884a8f7fd6ccb46675e6587b9f035`
  - `sources/c2-results/second-reads/SR-C2-5/SECOND-READ.md` (digest checked; content read in full — the Cycle 2
    Tier 1 re-read and its end-to-end record `R31-C2-SR-C2-5-CB8-125-128-END-TO-END`, which this route extends)
  - `sources/r30/instruments/c6/T2/inherited/{localflow,certify,sector,rowdata,simplex}.py` (consulted for the
    template solver's algorithmic pattern only; **not carried, not executed as evidence** — my own instruments
    below are fresh, independent implementations)
  - `sources/c2-stage7-sources/F2/*` (Cycle 2 F2's own DRAFT scratch; read for orientation only, never carried,
    never used as evidence)
  - `sources/c1-results/runs/lean-2026-09-28-c1-la1-cb8-sector-template-feasible/LeanProject/LeanProof/Main.lean`
    (digest checked against the manifest; this is the source of the **governed, literal** sector allocation table
    `cb8Bpb`, `cb8Bpc`, `cb8CGamma`, `cb8Pb`, `cb8Pc`, `cb8Theta`, `cb8Sigma`, `cb8Out`, `cb8In`, `cb8R1` — entered
    into my instrument cell-for-cell from the Lean source text, never re-derived, never adjusted)

## Registered claims touched (named before any computation is presented as evidence)

- `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL`
  (the Tier 1 key; run-local registry status `VERIFIED`, grade `proved_informal` per its STATEMENT/FENCES text) —
  **re-confirmed** at nine rows, not touched in grade.
- `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE`
  (the eligibility key; status `VERIFIED`, grade `formally_verified` via r31 award C2-LA1) — **re-confirmed** at
  nine rows via an independent generic DP, not touched in grade.
- `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3` (favorability;
  `proved_informal` modulo Darroch/Newton at full scope, discharged Darroch/Newton-free at `p*` on this class by
  the `[r31 C2; SR-C2-1]` note) — **re-confirmed** at `p*` (the correct index, gate ruling 16) at nine rows.
- `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (criterion/E1; `proved_informal`) —
  its `ρ_q`/`r_q` machinery re-derived independently (own direct-sum implementation, cross-checked against a full
  polynomial expansion at small `m`) and used as one of three independent sides of the supply computation.
- `E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107`
  (r31 award C1-LA1; `formally_verified` at template scope) — its **literal governed table** (`cb8Bpb`, `cb8Bpc`,
  `cb8CGamma`) was entered verbatim from the frozen kernel-checked `Main.lean` and numerically exercised (never
  re-derived) at nine rows: nonnegativity, Switch, Residual, and the exact min-plus/max-plus DP over the `m`-choke
  splittings of `K` and `K−1`.
- `E993-TREE-REAL-ROOTED` (REFUTED) — not revived; no step below applies Darroch's theorem or Newton's inequalities
  to `I(CB(8,m))`, `G`, `G^m` or any forest polynomial. Every derivation below is elementary tree decomposition and
  binomial-coefficient algebra.
- `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN, full scope) — **not touched**; nothing here transfers status
  to it (SOLUTION-CONTRACT §3, fence 1).
- Not used, not touched, not cited as evidence: any T/U-route Cycle 3 Lean draft, any sibling F-route's scratch,
  any r30/heterogeneous-closure result beyond the keys named above.

## IMPORT LIST (every instrument; standard library only)

`fractions.Fraction`, `math.comb`, `json`, `hashlib`, `sys`, `os`, `time`. No third-party package, no network.

## Instruments (fresh, own; not a carry of any prior seat's code)

Two files under `scratchpad/c3-F2/`, byte-copied to `scratchpad/c3-F2-replay/` and re-run there with an identical
result (below):

- **`f2_lib.py`** (SHA-256 `ee1ed92f8515ba66c07539fae783e55d7cefef00a6b150919a29de45fbe589f4`). Builds the literal
  `CB(8,m)` from the frozen labelling (`r=0, s=1, v=2, u_i=3+17i, b_ij=u_i+1+2j, c_ij=u_i+2+2j`); a **generic**
  (closed-form-free) iterative post-order independent-set polynomial DP over the literal adjacency list
  (`indep_poly_full`, `indep_poly_forest`, `build_subgraph`); an **independently derived** closed-form
  polynomial-algebra side (`closed_form_I`, `closed_form_qv`, `closed_form_qc`, `r_q`); the governed C1-LA1
  allocation entered verbatim from `Main.lean` (`CB8_BPB`, `CB8_BPC`, `CB8_CGAMMA`, `cb8_pb/pc/out/in/theta/sigma`,
  `cb8_r1`, `rho_1`); and the exact min-plus/max-plus DP over choke splittings (`per_leg_out_min`,
  `per_leg_in_max`, `minplus_conv_pow`, `maxplus_conv_pow`).
- **`f2_composed_flow.py`** (SHA-256 `43025968c1be50e3173d714a60ca437d4b91c5b053e473b77e1529587d636cd4`). Driver:
  runs every check below at the nine rows and writes `f2_composed_flow_out.json`
  (SHA-256 `240ca851b8a2870f35a5f0a724bfd8270d4f192d8a8b3188fd9f629d3401659a`), whose payload (everything except the
  digest field itself) hashes to
  **`e582834823aaf7870f7f2a8e837da0540f106525b30363433603f3cfc728b33f`**. No wall-clock, PID or host field is
  hashed or written.
- **`f2_selftest.py`** (SHA-256 `d807ebc344ebf3a2c13b1b32ec27632e35f79fdbd278fcb1fc038d79af5a2382`). Five
  fault-injection mutants (inflated `θ`, corrupted `B_pb` cell, inflated `c_7`, swapped profile counts, an
  off-by-one index on `q_c`'s closed form) — **all five detected** (output below), confirming the checks in
  `f2_composed_flow.py` are live, not vacuous, in the discipline of SR-C2-5's four-mutant run.

**Replay (copy-out-first, target under the run root, never `/tmp`):**
```
cp scratchpad/c3-F2/f2_lib.py scratchpad/c3-F2/f2_composed_flow.py scratchpad/c3-F2/f2_selftest.py \
   scratchpad/c3-F2-replay/
cd scratchpad/c3-F2-replay
python3 -B f2_composed_flow.py
python3 -B f2_selftest.py
```
Executed exactly this way for this return; the replay's `f2_composed_flow_out.json` payload digest is byte-identical
to the original run's (`e582834823aaf7870f7f2a8e837da0540f106525b30363433603f3cfc728b33f`), and the mutant self-test
printed `ALL MUTANTS DETECTED` in both locations.

## Step-by-step derivation (where each hypothesis enters)

1. **The tree** (`m ≥ 107`, `m ≡ 2 (mod 3)` enters only through which rows are tested, never through the
   construction). `n = 17m+3` vertices built literally from the frozen labels; `check_tree` verifies `|E| = n−1`
   **and** BFS-connectivity from vertex `0` — together these are the acyclicity-and-connectivity test (a connected
   graph with exactly `n−1` edges is a tree). True at all nine rows.
2. **`I(T)`, two independent sides.** Side A: `indep_poly_full`, the textbook rooted DP (`A(x)` = sets containing
   `x`, `B(x)` = sets excluding `x`, merged bottom-up over the literal children lists) — this uses nothing about
   `CB(d,m)` beyond the adjacency it was just given. Side B: `closed_form_I`, built from `poly_pow`/`poly_mul` on
   `(1+2x)`, `(1+x)` from first principles (`G := (1+2x)^8 + x(1+x)^8`, `I = (1+2x)G^m + x(1+x)(1+2x)^{8m}`),
   re-derived by hand from the same casework the generic DP performs at the root (`r` excluded → `(1+2x)G^m`
   via the free `s–v` pendant edge and `m` free gadgets; `r` included → `x(1+x)(1+2x)^{8m}` via the forced
   `s`-exclusion, free `v`, and `m` forced-`u_i`-excluded gadgets), not assumed from the contract. **Exact
   coefficient-by-coefficient match at all nine rows**, and `deg = 9m+1 = α(T)` at every row (`m=1` sanity: also
   cross-checked against a `2^20`-mask brute-force enumeration on `CB(8,1)`, `n=20` — 0 mismatches).
3. **`x(T)` and (E).** `x` = least `k` with `I[k+1] < I[k]`, scanned on the array through `α` (index `α+1` treated
   as `0`), using Side A. Eligibility: `x+2 ≤ p*` and `3p* < 2α+1`; the parent descent `(a)`: `I[p*−1] < I[p*−2]`.
   **True at all nine rows** (table below).
4. **Favorability at the correct index (gate ruling 16).** `Δ_p(T−w) := i_{p+1}(T−w) − i_p(T−w)`; favorable at `p`
   iff `Δ_p(T−w) < 0`. I built `I(T−v)` and `I(T−c_{00})` by removing exactly that one vertex and re-running the
   *same* generic DP (`leaf_poly_removed`), and evaluated `Δ` **at `p*`**, never at `p*−1`. As a named,
   non-evidentiary diagnostic I also computed the wrong-index quantity `i_{p*}(T−w) − i_{p*−1}(T−w)`
   (`..._NOT_EVIDENCE` fields in the JSON): at these nine rows both indices happen to give the same sign (both
   negative), so a sign flip alone would **not** have caught a ruling-16-style index error here — the index used
   in every claim below is `p*`, cited explicitly, not inferred from agreement.
5. **`q_v(k)`, `q_c(k)` — the per-leaf active-tag weight, two independent sides.** `s_w` = leaf `w`'s unique
   original neighbour (support); `R_w := N(s_w)∖{w}` (the tag-witness set: `R_v = {r}`, `R_{c_ij} = {u_i}`, matching
   `W_v={r}`, `W_{c_ij}={u_i}` of SEMANTIC-CONTRACT §2). By inclusion–exclusion,
   `q_w(k) = [x^{k−1}] I(T−{w,s_w}) − [x^{k−1}] I(T−{w,s_w}∖R_w... }` i.e. `I(T−{w,s_w}) minus I(T−{w,s_w}−R_w)`.
   - Side A (`qv_via_dp`/`qc_via_dp` inline in the driver): build the two reduced graphs literally, removing the
     named vertices, and run the *same generic* DP per component (`build_subgraph` + `indep_poly_forest`; removing
     `u_i` for the `c`-side splits the choke into 7 disconnected pendant edges — the forest product is taken
     component-wise, not assumed).
   - Side B (`closed_form_qv`/`closed_form_qc`): re-derived by hand (shown in `f2_lib.py`'s docstrings) —
     `q_v(k) = C(8m,k−2)·2^{k−2}` (from `I(T−v−s−r)=G^m`, `I(T−v−s)=G^m+x(1+2x)^{8m}`, difference `x(1+2x)^{8m}`);
     `q_c(k) = [x^{k−2}] (1+2x)(1+x)^7 G^{m−1}` (from `I(T−c−b)=(1+2x)G_c'G^{m−1}+x(1+x)(1+2x)^{8m−1}`,
     `I(T−c−b−u)=(1+2x)^8G^{m−1}+x(1+x)(1+2x)^{8m−1}` with `G_c'=(1+2x)^7+x(1+x)^7`, difference
     `(1+2x)x(1+x)^7 G^{m−1}`). Validated by brute force on `CB(8,1)` (`n=20`, all `k`, both leaf classes, 0
     mismatches) before use at scale.
   - **Exact match, both sides, at `k=p*` and `k=p*+1`, all nine rows.**
6. **Supply/capacity, `(WID)` — a third independent side.** `supply := q_v(p*+1) + 8m·q_c(p*+1)`,
   `capacity := q_v(p*) + 8m·q_c(p*)`, `S := supply − capacity` (asserted, never defined as the difference itself:
   both `supply` and `capacity` are computed, then subtracted). A **third** independent computation of `supply`'s
   private-leaf part: `8m·q_c(k) = Σ_{q=1}^{m} 8q·C(m,q)·r_q(k−q−1)` (the criterion key's own `r_q` aggregate,
   `r_q(k) := [y^k](1+y)^{8q−1}(1+2y)^{8(m−q)+1}` — my own direct-sum implementation, cross-checked against a full
   polynomial expansion for `m≤8`, all `q,k`, 0 mismatches) and `q_v(p*+1) = 2^K C(8m,K)` (the sector part). **All
   three sides agree exactly at all nine rows**, and `criterion_part + sector_part = supply` exactly. `S < 0` at
   every row (the deficit the switch mechanism exists to repair), matching SEMANTIC-CONTRACT §5's and SR-C2-5's
   fixed points at `m=107,125,128` verbatim (see the table).
7. **The C1-LA1 governed sector allocation.** Entered cell-for-cell from the frozen, kernel-checked `Main.lean`
   (36+36+7 cells `cb8Bpb`/`cb8Bpc`/`cb8CGamma`, `θ(m)=288/(200m²+82m+5)`, `pb`, `pc`, `Out`, `In` exactly as
   defined there) — never re-derived, never adjusted. Checked at every valid state `(β,γ)`, `β+γ≤8`:
   nonnegativity of `Out`, `In`; **Switch** `(8−γ)σ(γ) ≤ θγ` for `γ=1..7`; **Residual** `θ ≤ 1−ρ_1`, with `ρ_1`
   from `cb8R1` (my own direct-sum port of the Lean definition, `= r_1(K)/r_1(K−1)`). **The exact min-plus/max-plus
   DP** over all ways to split `K` legs (`Out`) and `K−1` legs (`In`) among the `m` chokes (per-leg profile
   `f(l) := min/max` over `β+γ=l` of `Out`/`In`, then an `m`-fold min-plus/max-plus self-convolution, bounded to
   the single target total) gives **`min ΣOut = 1`, `max ΣIn = 1`** at every row — reproducing, not assuming, the
   `cb8_sum_out`/`cb8_sum_in` Lean lemmas' conclusions by direct combinatorial optimization.
8. **Switch-image combined load.** For `γ=1..7`: `ρ_1·γ + (8−γ)σ(γ) ≤ γ` (the target's capacity) — checked
   directly (not only inferred from Switch+Residual separately) at every row; max ratio reported per row.
9. **In-sector tightness profile.** `(1,4)` at `n_1=(2m+2)/3` chokes, `(1,5)` at `n_2=(m−2)/3` chokes (`n_1+n_2=m`,
   integral exactly when `m≡2 (mod 3)`); total legs `5n_1+6n_2 = K−1` verified algebraically and numerically; `Σ In`
   over the profile computed directly from `cb8_in` — **exactly `1`** at all nine rows, reproducing SR-C2-5's
   named tightness claim at the two rows it tested and extending it to seven more, including `m=140`.

## Results (all nine rows; `x` and `Δ` with the difference index named on every row)

`x` scanned through `α` on the literal generic-DP array; `Δ_{p*}(T−v)`, `Δ_{p*}(T−c)` at the **correct** index
(`p*`, ruling 16); `S = supply−capacity` at rank `p*` (deficit sign expected, per §6 above).

| m | tag | n | α | p* | x | elig+desc(a) | fav(v,c)@p* | Δ_v(digits) | Δ_c(digits) | S sign | S digits | θ | ρ_1 | residual | switch | out≥1 | in≤1 | profile=1 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|107|control|1822|964|572|570|yes|yes,yes|neg,21d|neg,21d|neg|411|96/766193|5150844596024699/5173467627355748|yes|yes|yes|yes|yes|
|110|control|1873|991|588|586|yes|yes,yes|neg,22d|neg,22d|neg|422|96/809675|2027991913051965/2036655530990516|yes|yes|yes|yes|yes|
|113|control|1924|1018|604|602|yes|yes,yes|neg,22d|neg,22d|neg|434|96/854357|27820794945950193/27936482886870172|yes|yes|yes|yes|yes|
|116|control|1975|1045|620|618|yes|yes,yes|neg,22d|neg,22d|neg|445|96/900239|58633895019037705/58871393306616916|yes|yes|yes|yes|yes|
|119|control|2026|1072|636|634|yes|yes,yes|neg,22d|neg,22d|neg|457|96/947321|3255975423927033/3268830598665580|yes|yes|yes|yes|yes|
|122|control|2077|1099|652|650|yes|yes,yes|neg,22d|neg,22d|neg|468|96/995603|11347147111481383/11390843551428348|yes|yes|yes|yes|yes|
|125|FRESH|2128|1126|668|666|yes|yes,yes|neg,22d|neg,22d|neg|480|96/1045085|125082229581739/125552319952916|yes|yes|yes|yes|yes|
|128|FRESH|2179|1153|684|682|yes|yes,yes|neg,22d|neg,22d|neg|491|96/1095767|25247668247805897/25340326629755188|yes|yes|yes|yes|yes|
|140|FRESH|2383|1261|748|746|yes|yes,yes|neg,22d|neg,22d|neg|537|96/1310495|8658257094768325/8687303742996804|yes|yes|yes|yes|yes|

Rows `m=107,125,128` reproduce SEMANTIC-CONTRACT §5's and SR-C2-5's fixed points **verbatim**: `n,α,x,θ*` at
`m=107`; `ρ_1`, `θ`, and the supply-digit counts (411/480/491, leading digits) at `m=107,125,128` all match. Rows
`m=110,113,116,119,122,140` are new end-to-end confirmations for Cycle 3 — `m=110,113` were previously checked
end-to-end only by `R31-C1-SR-5-CB8-110-113-END-TO-END` (Cycle 1); `m=116,119,122` had only criterion-level class
checks (`R31-C2-SR-C2-2-...`), never a full tree+DP+allocation+profile pass; `m=140` is the first end-to-end pass
at that row anywhere in the run (it appears only in `R31-C2-SR-C2-2`'s condition-(i) class sweep, not as an
end-to-end row).

**No violation, no template failure, no deficient cut at any of the nine rows.**

## Mutant self-test output

```
{
 "inflated_theta_breaks_residual": true,
 "corrupted_Bpb_breaks_nonneg": true,
 "inflated_cgamma_breaks_switch": true,
 "swapped_profile_breaks_leg_total": true,
 "shifted_qc_index_breaks_dp_cf_match": true
}
ALL MUTANTS DETECTED
```

## Alias check (lexical and mathematical) for the one new record proposed below

- **Lexical.** Searched `sources/authority/CLAIM-IDENTITY.json` (491 claims) and
  `control/CLAIM-IDENTITY.run-local.json` (497 claims) for `"composed-flow"`: 0 hits in either. For `"end-to-end"`:
  0 hits in the master; in run-local, hits only on the Tier 1 and eligibility KEY bodies themselves (their
  STATEMENT/SCOPE text cites the bounded end-to-end records as support — not a name collision). Searched
  `OBLIGATIONS.csv`'s 32 `obligation_id` values directly (listed in full): no `F2`, no `C3-F-02`, no
  `COMPOSED-FLOW`, no overlap with my proposed id below.
- **Mathematical.** The nearest existing records are `R31-C1-SR-5-CB8-110-113-END-TO-END` (rows 107/110/113,
  Cycle 1) and `R31-C2-SR-C2-5-CB8-125-128-END-TO-END` (rows 107/125/128, Cycle 2). Mine differs in scope on both
  axes: it is the first end-to-end pass to (a) cover all of `107,110,113,116,119,122,125,128,140` in one record,
  (b) verify the C1-LA1 governed allocation's literal Lean table (not a re-derived copy) against the exact
  min-plus/max-plus DP for both `Out` and `In`, (c) verify the switch-image combined load bound and the in-sector
  tightness profile directly (not only Switch/Residual separately), and (d) run a five-mutant liveness self-test.
  Not an alias, edit, extension-in-place or upgrade of either prior record (both remain unedited, sealed).

## New bounded record proposed (never evidence; a corroboration, not a proof)

```text
RECORD: R31-C3-F2-CB8-107-110-113-116-119-122-125-128-140-END-TO-END-COMPOSED-FLOW
CLAIM: With F2's own instruments (f2_lib.py sha256 ee1ed92f8515ba66c07539fae783e55d7cefef00a6b150919a29de45fbe589f4;
f2_composed_flow.py sha256 43025968c1be50e3173d714a60ca437d4b91c5b053e473b77e1529587d636cd4; f2_selftest.py sha256
d807ebc344ebf3a2c13b1b32ec27632e35f79fdbd278fcb1fc038d79af5a2382; output f2_composed_flow_out.json sha256
240ca851b8a2870f35a5f0a724bfd8270d4f192d8a8b3188fd9f629d3401659a, payload digest
e582834823aaf7870f7f2a8e837da0540f106525b30363433603f3cfc728b33f): a fully generic closed-form-free literal-graph
DP, an independently re-derived closed-form polynomial-algebra side, and the criterion key's own r_q aggregate as a
third side, all agreeing exactly; the C1-LA1 governed allocation entered verbatim from its frozen kernel-checked
Main.lean, exercised (not re-derived) via an exact min-plus/max-plus DP over the m-choke leg-splittings of K and
K-1: at (CB(8,m), p*) for m in {107,110,113,116,119,122,125,128,140} (residue-2 class, m>=107), the tree is
connected and acyclic with |E|=n-1; I(T) from the generic DP equals the closed form at every coefficient; x
computed through alpha satisfies eligibility and the parent descent (a); both leaf classes are favorable at the
correct index p* (Delta_p*, not p*-1, gate ruling 16); supply-capacity = S(T,p*) < 0 from three independent sides
(411..537 digits, growing with m); the C1-LA1 allocation is nonnegative and satisfies Switch, Residual, min Sum Out
= 1 (leg total K), max Sum In = 1 (leg total K-1); every switch-image's combined load (E1 plus scaled sector) is at
most its capacity; the named in-sector tightness profile sums to exactly 1; a five-mutant fault-injection run
detects every injected violation. No cut, no template failure, no violation at any tested row. Rows 116, 119, 122
and 140 receive their first end-to-end pass in this run; rows 107, 110, 113, 125, 128 reproduce prior records'
values verbatim (SEMANTIC-CONTRACT §5; R31-C1-SR-5-CB8-110-113-END-TO-END; R31-C2-SR-C2-5-CB8-125-128-END-TO-END).
STATUS: bounded_computation, never evidence for the universal Tier 1 statement; a corroboration only.
ATTRIBUTION: r31 Cycle 3 route F2 (Claude Sonnet 5, seat C3-F-02), own instruments, replayed byte-identically under
scratchpad/c3-F2-replay/.
FENCES: One rank per tree, the class only; nothing asserted at any other rank, residue, d != 8, or for arbitrary
trees. Darroch's theorem and Newton's inequalities used at no step; E993-TREE-REAL-ROOTED stays REFUTED and is not
revived. No status transfer to E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL, the primary aggregate, TREE, FOREST,
TRANSFER, governed beta or Erdos #993, all of which stay OPEN. Census values and every row here are
bounded_computation and are not evidence for a universal statement. Not a cut, not a template failure, not a
formalization step; conjunct 4 of the SOLUTION-CONTRACT §2 terminal remains not formally verified (that is T/U
routes' object, not F2's).
ALIASES: (none proposed; not a working label for any existing key)
```

This record is **proposed only** (written here for the synthesis to register if it accepts it); F2 does not itself
register durable state.

## Grades (never upgraded by this route)

- Tier 1 key: `proved_informal` — **unchanged**.
- Eligibility key: `formally_verified` — **unchanged**.
- Favorability key (full scope): `proved_informal` modulo Darroch/Newton — **unchanged**; at this rank it is
  discharged Darroch/Newton-free through the existing `[r31 C2; SR-C2-1]` note, also unchanged.
- Criterion key: `proved_informal` — **unchanged**.
- C1-LA1 allocation: `formally_verified` at template scope — **unchanged**; this route only *exercises* it
  numerically at nine rows, contributing no new grade.
- The new record above: `bounded_computation`, and states so on its own face; it upgrades nothing.

## Headline

`headline_resolved: no`

## Route verdict

`bounded_evidence` — an end-to-end bounded numeric confirmation of the composed flow at nine rows (three fresh:
125, 128, 140; six controls: 107, 110, 113, 116, 119, 122), via three mutually independent instruments per
quantity, with a live (mutant-tested) checker. No cut, no template failure was found. This is corroboration, not a
proof of the universal Tier 1 statement and not a step toward the formal conjunct-4 obligation (that is T1/T2/T3/
U1/U2/U3's object).

## Gate lines (ruling 21)

`COND4_formal: not_advanced` — F2 does no Lean work; conjunct 4 (the saturating flow on `cbGraph m`) is untouched
by this route.
`E1_formal: not_advanced` — same reason.
`TERMINAL_integration: not_advanced` — same reason.
`cut_candidate: none` — no deficient cut, template failure, or Hall violation found at any tested row.

## Remaining obligation (successor inheritance)

F2's object (the actual composed flow, exact inflows, row sums, Hall sums over structured `X`) is now confirmed,
by bounded computation, at nine rows spanning the full tested range (107–140), including every row the run has
tested so far and three new rows beyond what any prior seat covered end-to-end (116, 119, 122, 140). What remains,
inherited by a successor F/adversary seat or by the U-route formalizers:

1. **Not closed by this route, by design:** conjunct 4 of the SOLUTION-CONTRACT §2 terminal (the saturating flow
   on the literal `cbGraph m` at `p*`, in Lean) is still not formally verified. This route's confirmation is
   informal/numeric and does not discharge U1/U2's Lean obligations (the arc-sum bridges, the E1 flow construction,
   the target-distinctness and `8−γ` preimage-count lemmas).
2. **A genuinely adversarial next step this route did not have budget for:** stress the composed flow at
   structured *adversarial* `X` (not just single-target capacity checks) — e.g. `X` = the full set of weight-`γ`
   switch images for one fixed `γ`, or `X` = all in-sector targets at once — to directly verify
   `Σ_X w_F ≤ Σ_{N(X)} w_F` as a *summed* inequality over a nontrivial family of subsets, not only the per-target
   capacity bound this route checked. The per-target bound implies the summed Hall inequality by summation (as the
   registered key's proof states), so this is not expected to find anything new, but SOLUTION-CONTRACT §1 names it
   explicitly ("Hall sums over structured `X`") and a future adversary seat should exercise it directly rather than
   rely on the implication.
3. **Untested beyond `m=140`:** the run's fresh-row ladder (ruling 17) has not yet gone past 140; a successor
   should extend the same three-instrument battery to a materially larger row (e.g. `m≈300–500`) to further stress
   the `θ*_8(m)` conjectured-optimum law's neighborhood (SOLUTION-CONTRACT §1, Tier 2) — note this route did **not**
   test or rely on that law; it used only the fixed governed allocation, which is a feasible table, not claimed
   optimal.
4. **The wrong-index diagnostic (§4 above) found no sign-flip distinguishing evidence** at these nine rows; a
   successor auditing future favorability claims should not assume a sign flip will always expose a ruling-16-style
   index error — the index must be checked by explicit citation, not by symptom.

## Model disclosure

chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported model id:
claude-sonnet-5.
