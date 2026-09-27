# Second Read

Read `SR-C4-8` of r30 Cycle 4 (`erdos-993-math-dre-20260926-r30-weighted-transport`): R3, the bounded up-degree deletion
inequality (critic `C-F2-U`), its application on `G_k`, and the proposed key. Isolated reader under
`control/C4-SECOND-READ-PROTOCOL.md`.

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in full, and no other VerityOS file. The host placed the project
`CLAUDE.md` and the user's auto-memory index into my context at session start. I did not open either file and did not act on
either (see `## Artifact inventory`, read-boundary disclosures).

Model disclosure: chartered opus/high (Claude Opus 5.5, effort high); transport-resolved model opus (explicit parameter);
runtime-reported model id: claude-opus-5-5[1m]. The transport clause is the protocol's template wording. I cannot observe the
dispatch parameter myself. The runtime id is quoted verbatim from my own system context.

## Identity and seal audit

- **Capsule** `control/c4-second-read/SR-C4-8-PACKET-MANIFEST.json`, stage `cycle-4-second-read-SR-C4-8`.
  - Declared seal `e8137c3f967648db7dd3484d01536cbc91257f4fb4c9551927a02a86cd5226ce`.
  - Recomputed seal (SHA-256 of `json.dumps(manifest − seal_sha256, sort_keys=True, separators=(",", ":"), ensure_ascii=False)`,
    no trailing newline): `e8137c3f967648db7dd3484d01536cbc91257f4fb4c9551927a02a86cd5226ce`. **Match.**
- **Members.** `file_count` is 88 and 88 are listed. I checked every member's SHA-256 and byte count: 88/88 match, 0 mismatches
  (`scratchpad/c4-sr-SR-C4-8/seal_audit.py`).
- **Frozen reference instruments.** Before reading any of them, I checked the 62 capsule members under
  `sources/c4-stage7-sources/` against that directory's `SOURCE-DIGESTS.json` (itself a verified capsule member). All 62 are
  listed there, and all match in bytes and SHA-256 (`stage7_digest_audit.py`).
- **Order of first reads.** The dispatch told me to read the protocol and the manifest first. I did so, then recomputed the seal
  and the digests (the protocol's own digest matches) before reading anything else.
- **Brief** `control/C4-SECOND-READ-BRIEF-SR-C4-8.md` (`faf392b5…`): statements SR-C4-8a–8c.
- **Registry used.** The run-local snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c4-stage2.json` (448 claims, 203 alias
  patterns) and the frozen master `sources/authority/CLAIM-IDENTITY.json` (434 claims, 195 patterns). Both are capsule members.
- **Keys read in full:** (NM) `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`; E1
  `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`; `E993-R23-LITERAL-DELETE-ONLY-HALL` (REFUTED);
  `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` (REFUTED).

## Statements read

Statement of record: `cycles/cycle-4/stage6/SYNTHESIS.md`. I read EST-10, R-14 and R-15, the `(NM)` scope-note bullet under
`## Headline verdicts`, `### No award attempted` row AG-F-2, `## Registrations` items 5 and 6, and the SR-C4-8 row of the
second-read batch.

- **SR-C4-8a (EST-10), as stated.** "On any finite simple graph, with `F` a set of degree-one tags, `p ≥ 2` and `X ⊆ I_{p+1}`,
  let every `A ∈ I_p` have at most `d` members of `X` above it. Then `(p−1)·Σ_X w_F ≤ d·Σ_{N_D(X)} w_F`. Corollary: deletion Hall
  holds for `X` whenever `d ≤ p − 1`."
- **SR-C4-8b.** On `G_k`, the corollary covers every family whose union is independent, including the tight family
  `C(L′, p+1)`, uniformly in `k`. It is NOT a proof of CT-1, which covers every `X`.
- **SR-C4-8c.** The key `E993-R30-ACTIVE-WEIGHT-DELETION-HALL-HOLDS-WHEN-EVERY-TARGET-HAS-AT-MOST-P-MINUS-1-SOURCES-ABOVE`,
  VERIFIED `proved_informal`. Is the name a predicate? And the distinctions from (NM) and E1.
- **Origins read:**
  - critic `C-F2-U` (`cycles/cycle-4/stage4/critics/F2/U/CRITIQUE.md`, in full: statement, proof, the `G_k` application, "what
    it is not", fence adjacency, proposed name);
  - the F adjudication (R3, the distinction table row, AG-F-2 and its draft Lean statement, the record-discrepancy note on (NM));
  - the frozen checks `ADJ-F/updeg_lemma.py` (+ out: 840 families, 0 violations) and `C-F2-U/lemma_test.py` (+ out: 1,214
    tests, 0 failures, 262 Hall failures when `L` is large). I read these only. I cite them as the seats' own checks, never as
    proof, and nothing below depends on them.

## Independent re-derivation

**Definitions used (SEMANTIC-CONTRACT §1.2, verbatim meaning).**
- For a degree-one `t`: `s_t` is its unique neighbour, and `W_t = N(s_t) ∖ {t}`.
- `t ∈ F ∩ B` is active in `B` iff `(B ∖ {t}) ∩ W_t ≠ ∅`; `w_F(B)` counts the active tags.
- `N_D(X) = {B ∖ {y} : B ∈ X, y ∈ B}`, and `up_X(A) = #{B ∈ X : A ⊂ B}`.
- For `|B| = p + 1` and `|A| = p`, "`B` above `A`" means exactly `A = B ∖ {y}` for the unique `y ∈ B ∖ A`. Every such `A` is
  independent.

**Lemma 1 (exact per-tag count).** Let `B ∈ I_{p+1}` and let `t` be active in `B`. Call `y ∈ B` valid for `(B, t)` if `t` is
active in `B ∖ {y}`. Then the number of valid `y` is exactly `p − [|B ∩ W_t| = 1]`, which is at least `p − 1`.

*Proof.*
- `y = t` is invalid, because `t` must be present.
- For `y ≠ t`, `t` stays present, and `(B ∖ {y, t}) ∩ W_t = (B ∩ W_t) ∖ {y}` (using `t ∉ W_t`). This is empty iff
  `B ∩ W_t = {y}`.
- So the invalid set is `{t}`, plus the single witness when there is exactly one. ∎

The count is per (source, active tag) pair, not per source. The brief's parenthetical "each source `B` has at least `p − 1`
deletions keeping each of its active tags active" is true only when read per tag. A source can have fewer than `p − 1` deletions
that keep all of its active tags active at once. Example: two cherries `t_i – s_i – w_i` with `F = {t_1, w_1, t_2, w_2}`,
`B = {t_1, w_1, t_2, w_2}` and `p = 3`. Every tag's unique witness is its partner, so no single deletion keeps all four active.
The proof of record uses only the per-tag count.

**Lemma 2 (exact double-count identity).** For every `X ⊆ I_{p+1}`:

`Σ_{B∈X} Σ_{t active in B} (p − [|B ∩ W_t| = 1]) = Σ_{A ∈ N_D(X)} w_F(A)·up_X(A)`.

*Proof.* Count the triples `(B, t, y)` with `B ∈ X`, `t` active in `B`, and `y` valid for `(B, t)`. By Lemma 1, the left side
counts them. Map each triple to `(A, t, B)` with `A = B ∖ {y}`: then `t` is active in `A`, and `B` is above `A`. Conversely, if
`t` is active in `A ∈ I_p` and `B ∈ X` is above `A`, then `t ∈ B` and `B ∖ {t} ⊇ A ∖ {t}` meets `W_t`. So `t` is active in `B`,
and `y = B ∖ A` is valid. The map is a bijection onto the pairs `(A, t)` with `t` active in `A`, each paired with a `B ∈ X` above
`A`. That set has `Σ_A w_F(A)·up_X(A)` elements, and `up_X(A) > 0` only for `A ∈ N_D(X)`. ∎

**R3 (EST-10).** If `up_X(A) ≤ d` for every `A ∈ I_p`, then:
- by Lemma 1, the left side of Lemma 2 is at least `(p − 1)·Σ_X w_F`;
- the right side is at most `d·Σ_{N_D(X)} w_F`;
- so `(p − 1)·Σ_X w_F ≤ d·Σ_{N_D(X)} w_F`. ∎

This is the critic's equal-split flow argument written as an integer double count, with no fractions. Step 3 of the critic's
proof, "at most `1/(p−1)` from each of at most `d` sources, per active tag of `A`", is exactly the upper bound here.

**Corollaries.**
- **(i) `d ≤ p − 1`.** Then `(p − 1)·Σ_X w_F ≤ (p − 1)·Σ_{N_D(X)} w_F`. Since `p − 1 ≥ 1`, cancel to get
  `Σ_X w_F ≤ Σ_{N_D(X)} w_F ≤ Σ_{N(X)} w_F`, because `N_D(X) ⊆ N(X)` for the (D) ∪ (S) relation and weights are nonnegative. So
  (HALL-COND) holds at `X`, witnessed by deletion arcs alone.
- **(ii) `|⋃X| ≤ 2p − 1`.** Every `B ∈ X` above `A` is `A ∪ {y}` with `y ∈ ⋃X ∖ A`, and `A ⊆ ⋃X` when `up_X(A) > 0`. So
  `up_X(A) ≤ |⋃X| − p ≤ p − 1`, and corollary (i) applies. This is in the critic's statement and the F adjudication. EST-10
  omits it, and SR-C4-8b needs it.

**Hypotheses and where they enter.**
- `F` degree-one: this enters only to define `s_t` and `W_t`. The proof uses only `t ∉ W_t`.
- `p ≥ 2`: this enters only in corollary (i)'s cancellation. The inequality itself is trivially true at `p = 1`.
- ℕ-subtraction: `p − 1` is the only one. `p ≥ 2` makes the ℕ value equal to the integer `p − 1` and positive. `|⋃X| − p` in
  (ii) is used only when `up_X(A) > 0`, where `|⋃X| ≥ p + 1`.
- No tree, eligibility, selector, invariance or census hypothesis enters. `F` is any set of degree-one vertices, not only
  `F_p(G)`.
- `d` is an upper bound. The critic's "`d` = the maximum" and EST-10's "at most `d`" give the same statement.

**Sharpness (proved; literally checked).** Equality in R3 holds iff two conditions hold (given `Σ_X w_F > 0`):
- every active tag of every source has a unique witness in that source;
- `up_X(A) = d` for every `A ∈ N_D(X)` with `w_F(A) > 0`.

Both follow from Lemma 2. The *cherry-spider tree* realizes it:
- *Construction.* Hub `h`; supports `s_1..s_m ~ h`; leaves `t_i, w_i ~ s_i`; optionally a leaf `z ~ h`. Take
  `F = {t_i, w_i}`, `L = {t_i, w_i}` (∪ `{z}`), and `X = C(L, p+1)`.
- *Why every tag has a unique witness.* `W_{t_i} = {w_i, h}` and `h ∉ L`, so each tag's unique witness in any source is its
  partner.
- *Why the up-degree is constant.* It is `|L| − p` on every target in `N_D(X) = C(L, p)`.
- *`m = p − 1`, with `z`.* `d = p − 1` and `Σ_X w_F = Σ_{N_D(X)} w_F`: Hall with equality at the threshold.
- *`m = p`, without `z`.* `d = p` and `Σ_X w_F = (p/(p−1))·Σ_{N_D(X)} w_F`, so deletion Hall FAILS.

So the threshold `d ≤ p − 1` cannot be raised to `d ≤ p`. Literal values, `p = 2..6`:
- *equality at `m = p − 1`:* `2/2`, `12/12`, `60/60`, `280/280`, `1260/1260`;
- *failure at `m = p`:* `8 > 4`, `36 > 24`, `160 > 120`, `700 > 560`, `3024 > 2520`.

These are sharpness examples, not a (CUT):
- no row is eligible (`x = p` at `m = p`);
- `F ≠ F_p`;
- with switch arcs, (HALL-COND) at that `X` holds for `p ≥ 3`, and fails only at the non-eligible `p = 2`, `n = 7`.

The smallest tight general-graph case is `P_3 + K_1` at `p = 2`: `X = {{t, w, z}}`, `2 = 2`.

**Own instrument** (`scratchpad/c4-sr-SR-C4-8/`, written from SEMANTIC-CONTRACT §1 before I opened any frozen script;
`python3 -B`, standard library, exact integers).
- `sr8core.py` computes everything literally: independent layers, leaves and supports, `W_t`, `w_F`, `x` through rank `α` (with
  the terminal zero-extension difference), `F_p` from `Δ_p(G − v)` on the original graph, the aggregate `S` from `H_v`/`R_v`,
  the (D) and (S) relations, `N_D` and `N`, `up_X` and `d`.
- For every family it asserts two things before reporting:
  - Lemma 1's exact count on every (source, active tag) pair;
  - Lemma 2's identity.
- For every instance it asserts (WID) `supply − capacity = S` with the instance's `F`.

**Results** (`sr8_tests.py`; outputs `sr8_out_*.json`).

| Test | Scope | Families | R3 violations | Other |
|---|---|---|---|---|
| T1 | every labelled graph on 5 vertices (1024), every `F ⊆` degree-one vertices, every `p ≥ 2` with `I_{p+1} ≠ ∅`, **every** nonempty `X` | 23,700 (3,278 instances, WID asserted on each) | 0 | 3,780 tight; 2,700 of them Hall-equalities at `d = p − 1`; 0 deletion-Hall failures with `d ≤ p − 1` |
| T2 | 120 random graphs (`n = 6..9`) and 120 random trees (`n = 8..14`), every `p`, `F` = all leaves and a random subset; exhaustive `X` when `|I_{p+1}| ≤ 10`, else sampled, union-of-an-independent-set and up-set families | 235,316 (1,580 instances, WID asserted) | 0 | 12,521 tight. Deletion-Hall fails on 56,712 families, never with `d ≤ p − 1`, and already at `d = p` (the minimum excess over `p − 1` among failures is 1). These are arbitrary-`F`, non-eligible instances, never a (CUT). |
| T3 | eligible fixed points with derived `F_p` (eligibility and WID = `S` asserted): `G_3/6` (n 14, α 9, x 4, 253/527/−274), `G_4/7` (n 17, α 11, x 5, 1542/2735/−1193), `K_{1,12}/8` (n 13, α 12, x 6, 1980/3960/−1980) | 446 / 446 / 456 | 0 | 158 union-independent families, all with deletion Hall |
| T4 | the sharpness constructions above | 11 | 0 | as stated |
| T5, T6 | `G_k` (below) | — | 0 | — |

The `K_{1,12}/8` and `G_3/6` rows reproduce the contract's fixed point and the critic's quoted `G_3` figures. `G_5/8` (n 20,
α 13, x 6, `|F_8|` = 8 = all leaves, 8875/14196/−5321, WID asserted) is eligible.

**On `G_k` (SR-C4-8b).**
- **α.** `α(G_k) = 2k + 3` for every `k ≥ 1`, proved as follows:
  - *Upper bound.* Every independent set meets the core `{0,1,2,3,4}` (a tree: `0–1`, `0–2`, `2–3`, `2–4`, independence
    number 3) in at most 3 vertices, and each arm path `a_i – b_i – c_i` in at most 2.
  - *Attained.* `L′ = {1, 3, 4} ∪ {a_i, c_i}` is independent and has `2k + 3` vertices.
  - The synthesis lists `α(G_k) = 2k + 3` only as bounded (`k = 2..400`). The uniform-in-`k` claim needs this one-line proof, not
    the record. My enumeration agrees for `k = 1..7`.
- **Union-independent families are covered.** Let `p ≥ k + 2`, so that `2k + 3 ≤ 2p − 1`. Every family whose union is independent
  has `|⋃X| ≤ 2k + 3 ≤ 2p − 1`, so corollary (ii) gives deletion (HALL-COND) at `X`, for every `k ≥ 1`.
  - At `p = k + 3`: `up_X ≤ 2k + 3 − p = k`, so `Σ_{N_D(X)} w_F ≥ ((k+2)/k)·Σ_X w_F`, a margin of at least `1 + 2/k`.
  - This includes `C(L′, p+1)`, uniformly in `k`. I did not use F-2's bounded claim that it is the minimiser.
- **Checks on `C(L′, p+1)`** (T6). Literally at `k = 1..5`:
  - `d = k`;
  - `N_D(X) = C(L′, p)`;
  - the ratio exceeds `(k+2)/k` (`230/133 ≥ 5/3` at `k = 3`), with equality only at `k = 1`;
  - the critic's closed form `W(j)` equals the literal layer weights.
  - By the closed form, `W(p)/W(p+1) ≥ (k+2)/k` for `k = 1..200`, again with equality only at `k = 1`.
- **Not a proof of CT-1** (every `X`).
  - For every `k ≥ 6`, the target `A = {1, 3, 4} ∪ {a_i, c_i : i ≤ ⌊k/2⌋}`, plus `{a_{⌊k/2⌋+1}}` when `k` is odd, lies in
    `I_{k+3}(G_k)` and has exactly `⌊3k/2⌋` addable vertices:
    - three on each empty arm;
    - `c` on the half-filled arm;
    - `0` is blocked by `1`, `2` by `3` and `4`, and the full arms' `b_i` are blocked.
  - `⌊3k/2⌋ > k + 2 = p − 1` iff `k ≥ 6`. So the hypothesis fails at `X = I_{p+1}`, and at every `X` containing `A`'s up-set.
  - Checked literally for `k = 2..40`. By full enumeration of `I_p`, the maximum up-degree over the whole layer is
    `1, 3, 4, 6, 7, 9, 10` for `k = 1..7`.
  - At `k ≥ 6`, R3 applied to `I_{p+1}` yields only `Σ_X w ≤ (d/(p−1))·Σ_{N_D(X)} w` with `d/(p−1) > 1`, which is no Hall
    inequality.
  - Side record: at `k = 3, 4, 5` the whole-layer maximum is at most `p − 1` (`4 ≤ 5`, `6 ≤ 6`, `7 ≤ 7`). So R3 alone does give
    deletion (HALL-COND) for every `X` at the three eligible rows `G_3/6`, `G_4/7` and `G_5/8`. This is finite and
    `bounded_computation`: a second route to three rows of the bounded `G_k` record, not a family theorem.
- **Conclusion.** R3 corroborates CT-1 only on union-independent families. This agrees with R-14.

**Against (NM)** (`sr8_nm.py`, six small `CB(d, m)`, `m·d ≤ 4`, every sector rank, whole sector plus 60 random subfamilies
each). On the root-plus-arm sector (`Q = {r, v}`, `F ∋ v` plus all private leaves), the instrument asserts:
- every sector member has `w_F = 1`;
- the tag `v` (with `W_v = {r}`) has exactly `p − 1 = k` valid deletions, namely the deletions outside `Q`;
- `Σ_{N_D(X)} w_F = |∂_Q X|`, because `B − r` and `B − v` have weight 0;
- `d ≤ 2(N − k + 1)`, with equality on the whole sector.

So on this sector R3 reads `k·|X| ≤ 2(N − k + 1)·|∂_Q X|`. That is (NM)'s inequality in the weighted CB reading already
recorded on `R30-CB-RECORD`. At `CB(8, 92)/492`, `d = 2·(736 − 491 + 1) = 492 > 491 = p − 1`, so R3 gives no sector Hall
there. This is consistent with the recorded `492/491` shortfall.

**Against E1** (`sr8_cb_updeg.py`, literal `CB(8, 92)`, n 1567, IsTree asserted). At `p = 492`, the `r`-free target made of 492
private leaves has 583 addable vertices. Every source above it is non-sector. So R3's hypothesis fails on non-sector families
that E1 addresses (at criterion ranks). E1 is therefore not a corollary of R3.

## Findings and repairs

1. **The mathematics of EST-10 is correct as stated.** I found no gap, no hidden hypothesis and no ℕ-subtraction defect. The
   critic's count "at least `p − 1` valid deletions" is exact as `p − [|B ∩ W_t| = 1]`, per (source, active tag) pair.
2. **Face repairs for SR-C4-8a (non-mathematical).**
   - (a) Define `N_D(X)` and `up_X` on the face.
   - (b) State that the conclusion also gives (HALL-COND) at `X` under (D) ∪ (S), since `N_D(X) ⊆ N(X)`.
   - (c) Carry the proof on the face, including the per-tag count and the per-tag (not per-source) wording.
   - (d) Restore the critic's corollary (ii), `|⋃X| ≤ 2p − 1`, which SR-C4-8b consumes.
   - (e) Complete the attribution per SEMANTIC-CONTRACT §3. Synthesis item 5 names only `C-F2-U` and the F adjudicator. It omits
     Codex for the network and the active-tag weight, and the `G_k` origin.
3. **Repair for SR-C4-8b.** The uniform-in-`k` claim needs `α(G_k) ≤ 2k + 3` for every `k`. The synthesis holds this only as a
   bounded record (`k ≤ 400`), and the critic asserts it without proof. The one-line proof above supplies it, so the claim holds
   for every `k ≥ 1` at `p = k + 3` (indeed at every `p ≥ k + 2`). Beyond that repair, 8b is confirmed:
   - union-independent families, including `C(L′, p+1)`, are covered with margin `(k+2)/k`;
   - R3 is not a proof of CT-1, because the explicit `⌊3k/2⌋` target breaks the hypothesis for every `k ≥ 6`.
4. **SR-C4-8c, predicate check.** The name `…ACTIVE-WEIGHT-DELETION-HALL-HOLDS-WHEN-EVERY-TARGET-HAS-AT-MOST-P-MINUS-1-SOURCES-ABOVE`
   is true when read as a predicate, under both readings of "sources":
   - *members of `X`:* this is corollary (i);
   - *all of `I_{p+1}`:* the hypothesis is then stronger, and it implies `up_X ≤ p − 1` for every `X`.

   Under ℕ or integer readings of "`P-MINUS-1`" at `p ≤ 1` the named statement is trivially true or vacuous. The name asserts
   nothing about trees, eligibility, (HALL), CT-1 or `S`. It names the corollary, not the full inequality, which is allowed: it
   does not assert more than the statement.
5. **Alias checks** (`sr8_alias.py`) cover the proposed name, every alias and the full registration text below. They run against
   all 203 run-local patterns and 195 master patterns, case-sensitive and case-insensitive, and against every key and alias.
   The name and the aliases have no key or alias collision and no pattern hit in either registry.
   - *First pass.* The draft key block tripped three generic patterns: `double.count`
     (`E993-R27-INDEP-EXTENSION-DOUBLE-COUNT`), `guard.*sharp` (`E993-R29-HIGH-TAIL-BOUNDARY-RECORD`, case-insensitive, spanning
     "ℕ guard … Sharpness") and `active.tag.weight.*identity` (the WID key, spanning "active-tag weight … identity"). None of
     these was an identity of content. I rephrased them ("two-way counting equation", "ℕ subtraction check", "the equation").
   - *Final pass* (`sr8_alias_out.json`). There are zero hits on the key block and on the records. The only remaining hits are
     (NM)'s own pattern `sector.*normalized.matching`, and they fire only on the SCOPE NOTE ON (NM) and the DISTINCTION ROW
     `R30-C4-R3-VS-NM`, both of which cite (NM)'s key name by design. (NM)'s pattern does not fire on the proposed key, its
     aliases or its statement.

   R3 is not an alias of (NM). **(NM) versus R3:**

   | | (NM) | R3 |
   |---|---|---|
   | Weight | unweighted | weighted by active tags |
   | Setting | sector-only (independent `Q`, `G − N[Q]` a perfect matching, `∂_Q` deletes outside `Q`) | every graph, every `X ⊆ I_{p+1}` |
   | Structure | biregular; Boolean at `q = 2`, uniform-`t` in its q-ary note | an assumed maximum up-degree `d` and a per-tag valid-deletion count |

   R3 needs no biregularity: with heterogeneous star sizes it still holds, with `d` the maximum. Neither statement, as
   registered, implies the other. They share the double-count skeleton. On the CB weight-one sector, R3 reproduces (NM)'s
   inequality in its weighted CB reading.
6. **E1 is distinct.** E1 is one family (`CB(d, m)`), non-sector families only, and conditional on a per-`(d, m, p)` criterion,
   with an explicit flow and exact load `ρ_q`. R3 is every graph and every `X`, conditional on an up-degree bound, and gives an
   inequality with no load formula. Neither implies the other (see the witness above).
7. **Fence adjacency.**
   - *`E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`.* R3 asserts no injectivity and no property of a per-leaf linear map.
   - *`E993-R23-LITERAL-DELETE-ONLY-HALL`.* R3 is weighted and conditional, and makes no universal deletion-only claim. Its own
     sharpness example shows deletion Hall failing at `d = p`.
   - Neither refuted key is revived.
8. **Not decisive for ruling 30.** Nothing here moves (HALL), the primary aggregate, E1, (NM)'s statement, or any `G_k` key.

## Registration text

```text
KEY: E993-R30-ACTIVE-WEIGHT-DELETION-HALL-HOLDS-WHEN-EVERY-TARGET-HAS-AT-MOST-P-MINUS-1-SOURCES-ABOVE
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: Let G be a finite simple graph, F a finite set of degree-one vertices of G (for t in F, s_t is its unique neighbour and W_t = N_G(s_t) minus {t}), w_F the active-tag weight of SEMANTIC-CONTRACT §1.2 (w_F(B) = #{t in F ∩ B : (B minus {t}) ∩ W_t ≠ ∅}), p ≥ 2 a natural number, and X ⊆ I_{p+1}(G). For A in I_p(G) let up_X(A) := #{B in X : A ⊂ B} (the members of X above A, i.e. A = B minus {y} for some y in B), and let N_D(X) := {B minus {y} : B in X, y in B} be the deletion neighbourhood of X. If up_X(A) ≤ d for every A in I_p(G), then (p − 1)·Σ_{B in X} w_F(B) ≤ d·Σ_{A in N_D(X)} w_F(A). Corollary (i): if d ≤ p − 1, then Σ_{B in X} w_F(B) ≤ Σ_{A in N_D(X)} w_F(A) ≤ Σ_{A in N(X)} w_F(A), with N(X) the (D) ∪ (S) neighbourhood; that is, (HALL-COND) holds at X, witnessed by deletion arcs alone. Corollary (ii): the hypothesis of (i) holds whenever |⋃X| ≤ 2p − 1, because up_X(A) ≤ |⋃X| − p. Proof of record: for B in X and t active in B, the deletions y in B that keep t active in B minus {y} are all y except y = t and, when |B ∩ W_t| = 1, that single witness; there are exactly p − [|B ∩ W_t| = 1] ≥ p − 1 of them. The count is per (source, active tag) pair, not per source. Conversely, if t is active in A and A ⊂ B in X, then t is active in B and B minus A is such a deletion. Counting the triples (B, t, y) both ways gives the equation Σ_{B in X} Σ_{t active in B} (p − [|B ∩ W_t| = 1]) = Σ_{A in N_D(X)} w_F(A)·up_X(A). Bound the left side below by (p − 1)·Σ_X w_F and the right side above by d·Σ_{N_D(X)} w_F. Equivalently: split each active tag's unit equally over its valid deletions; a target receives at most 1/(p − 1) per active tag from each of at most d sources.
SCOPE: Every finite simple graph; every finite set F of degree-one vertices (not only F_p(G)); every p ≥ 2; every X ⊆ I_{p+1}(G) whose up-degree is at most d. No tree, forest, eligibility, selector, invariance, rank-window or census hypothesis enters. Degree-one enters only in defining s_t and W_t, and the proof uses only that t is not in W_t. ℕ subtraction check: p ≥ 2 makes the ℕ value p − 1 equal to the integer p − 1 and positive; corollary (i)'s cancellation needs this, and there is no other subtraction (|⋃X| − p in (ii) is used only when up_X(A) > 0, where |⋃X| ≥ p + 1). Sharpness: given Σ_X w_F > 0, equality holds iff every active tag of every source of X has a unique witness in that source and up_X(A) = d for every A in N_D(X) with w_F(A) > 0. Take the tree with hub h, supports s_1..s_m adjacent to h, leaves t_i and w_i adjacent to s_i, and optionally a leaf z adjacent to h, with F = {t_i, w_i} and X = C(L, p + 1), where L = {t_i, w_i} plus z when present. With z and m = p − 1, d = p − 1 and Σ_X w_F = Σ_{N_D(X)} w_F. Without z and with m = p, d = p and deletion Hall fails at X. Both are verified literally for p = 2..6; neither is an eligible row, and F is not F_p there, so neither is a (CUT). The threshold d ≤ p − 1 cannot be raised to d ≤ p. On G_k (root 0; leaf 1 on 0; support 2 on 0 with leaves 3, 4; arms 0 – a_i – b_i – c_i, i = 1..k): alpha(G_k) = 2k + 3 for every k ≥ 1, because the core {0,1,2,3,4} has independence number 3, each arm path has 2, and L′ = {1,3,4} ∪ {a_i, c_i} attains the sum. So at every p ≥ k + 2, and in particular at p = k + 3, every family whose union is independent satisfies corollary (ii). This gives deletion (HALL-COND) at every such X for every k ≥ 1, including the tight family C(L′, p + 1), uniformly in k; at p = k + 3, Σ_{N_D(X)} w_F ≥ ((k + 2)/k)·Σ_X w_F. This is not a proof of the G_k every-X statement (CT-1): for every k ≥ 6 the target {1, 3, 4} ∪ {a_i, c_i : i ≤ ⌊k/2⌋} (with a_{⌊k/2⌋+1} added when k is odd) lies in I_{k+3}(G_k) and has ⌊3k/2⌋ > k + 2 = p − 1 sources above it, so the hypothesis fails at X = I_{p+1}.
ATTRIBUTION: Critic C-F2-U (Claude Opus 5.5; r30 Cycle 4 Stage 4 critique of F2): the statement, the per-tag equal-split proof, corollary (ii) and the G_k application. The r30 Cycle 4 F adjudicator (Claude Opus 5.5): verification, randomized check and the AG-F-2 draft Lean statement. The r30 Cycle 4 synthesis: EST-10 and this key name. Isolated second read SR-C4-8 (Claude Opus 5.5): the exact per-tag count and the two-way counting equation, the sharpness examples, the proof of alpha(G_k) = 2k + 3, the k ≥ 6 non-coverage construction, and the (NM) and E1 distinctions. Codex (GPT-6 Astra/Sol/Luna) and the lower-region run with its corrections: the transport network (HALL), the active-tag weight w_F and the (D) ∪ (S) relation. r30 Cycles 2–3: the G_k family.
FENCES: Not (HALL) and not a restricted-scope (HALL) theorem on any tree family. It gives (HALL-COND) only at families X that satisfy the up-degree hypothesis, and E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN. Nothing is asserted for any family that violates the hypothesis; deletion Hall can fail at d = p. Not CT-1 and not any G_k flow, eligibility or sign key. No tree, eligibility, selector or invariance content; no census value; no RTree or governed-model assertion. The primary aggregate E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, E993-BETA-AGG, TREE, FOREST, TRANSFER and Erdős #993 are untouched. It revives neither E993-R23-LITERAL-DELETE-ONLY-HALL (unweighted universal deletion-only Hall) nor E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY (per-leaf linear injectivity); it is an inequality of active weights under an explicit up-degree hypothesis. It is not an alias of E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING or of E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL (distinction rows R30-C4-R3-VS-NM and R30-C4-R3-VS-E1). No formal award (AG-F-2 was not attempted); a Lean award would be a separate certificate.
ALIASES: R3 (r30 Cycle 4 bounded up-degree deletion inequality); EST-10 (r30 Cycle 4 synthesis); AG-F-2 (r30 Cycle 4 F adjudication award group); bounded up-degree deletion Hall lemma (C-F2-U); E993-R30-DELETION-WEIGHTED-HALL-HOLDS-WHEN-EVERY-TARGET-HAS-AT-MOST-P-MINUS-1-SOURCES-ABOVE-IT (C-F2-U proposed name, superseded by the synthesis name)
```

```text
SCOPE NOTE ON: E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING
TEXT: [r30 C4; SR-C4-8] Distinction from E993-R30-ACTIVE-WEIGHT-DELETION-HALL-HOLDS-WHEN-EVERY-TARGET-HAS-AT-MOST-P-MINUS-1-SOURCES-ABOVE (R3). This key is unweighted and sector-only: Q is independent, G − N_G[Q] is a perfect matching, ∂_Q deletes only outside Q, and the covers are biregular (Boolean at q = 2; uniform t only in its q-ary note). R3 is an inequality of active-tag weights on every finite simple graph with degree-one tags, for every X ⊆ I_{p+1}. In place of the exact down- and up-degrees it uses the per-tag valid-deletion count p − [unique witness] ≥ p − 1 and an assumed maximum up-degree d. It needs no biregularity: with heterogeneous star sizes it still holds, with d the maximum, where this key's note makes no statement. As registered, neither statement implies the other; they share a two-way counting skeleton. On the CB(d, m) root-plus-arm sector (Q = {r, v}, v in F, every member of active weight exactly one, W_v = {r}), four facts hold: the tag v has exactly p − 1 = k valid deletions, namely the deletions outside Q; the deletions of r and v land on weight-zero targets; Σ_{N_D(X)} w_F = |∂_Q X|; and d ≤ 2(N − k + 1), with equality on the whole sector. So R3 there yields k·|X| ≤ 2(N − k + 1)·|∂_Q X|, which is this key's inequality in the weighted CB reading recorded on R30-CB-RECORD (checked literally on six CB(d, m) with dm ≤ 4, at every sector rank). In that sector d > p − 1 (492 > 491 at CB(8, 92), p = 492), so R3's corollary gives no sector Hall; this is consistent with the recorded 492/491 shortfall. This note changes neither this key's statement, grade nor fences.
```

```text
DISTINCTION ROW: R30-C4-R3-VS-NM
KEY: E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING
TEXT: (NM) is an unweighted shadow bound on the sector over an independent Q with G − N_G[Q] a perfect matching, with deletions outside Q only and biregular covers. R3 is a weighted (active-tag) inequality on every finite simple graph, every X ⊆ I_{p+1} and every deletion, with a per-tag valid-deletion count (at least p − 1) and an assumed maximum up-degree d. It needs no biregularity, no sector and no matching structure. Neither implies the other as registered. On the CB weight-one root-plus-arm sector, R3 with d = 2(N − k + 1) reproduces (NM)'s inequality in its weighted CB reading (a scope note on R30-CB-RECORD), and there d > p − 1, so R3 gives no sector Hall. Not an alias.
```

```text
DISTINCTION ROW: R30-C4-R3-VS-E1
KEY: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL
TEXT: E1 concerns one tree family CB(d, m), non-sector source families only, at ranks satisfying a per-(d, m, p) criterion. It gives an explicit deletion flow whose load on each r-free target is exactly ρ_q·w_F(A). R3 concerns every finite simple graph and every source family satisfying an up-degree bound, and gives an inequality with no load formula. Neither implies the other. At CB(8, 92), p = 492, the r-free target made of 492 private leaves has 583 > 491 non-sector sources above it, so R3's hypothesis fails on non-sector families that E1 addresses; and E1 says nothing off CB(d, m). Both split units per active tag over deletion covers, but a shared skeleton is not identity. Not an alias.
```

```text
DISTINCTION ROW: R30-C4-R3-VS-R23-LITERAL-DELETE-ONLY-HALL
KEY: E993-R23-LITERAL-DELETE-ONLY-HALL
TEXT: The refuted key asserts universal unweighted Delete-only Hall, |X| ≤ |Gamma_Delete(X)|, for every ordinary tree under the r23 literal contract. R3 is weighted by the active-tag weight w_F at any fixed tag set and holds only under an explicit up-degree hypothesis. It makes no universal deletion-only claim, and its own sharpness example (d = p) shows deletion Hall failing. Not a revival.
```

```text
DISTINCTION ROW: R30-C4-R3-VS-PER-LEAF-DOWN-MAP-INJECTIVITY
KEY: E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY
TEXT: The refuted key asserts injectivity of a per-selected-leaf rational linear deletion map d_p on marked sets of H_v, at every eligible (T, p). R3 asserts no injectivity and no property of any per-leaf operator. Its proof is a fractional per-tag split, bounded by an explicit up-degree hypothesis, and its conclusion is an inequality of active weights. Not a revival.
```

```text
RECORD: R30-C4-SR8-GK-FULL-LAYER-UP-DEGREE
CLAIM: On G_k at p = k + 3, the maximum over A in I_p(G_k) of #{B in I_{p+1}(G_k) : A ⊂ B} is 1, 3, 4, 6, 7, 9, 10 for k = 1..7 (literal enumeration). So R3's corollary alone gives deletion (HALL-COND) for every X ⊆ I_{p+1} at the eligible rows G_3/6, G_4/7 and G_5/8 (derived F_p = all leaves; WID = S asserted). This is a second route to three rows of the bounded G_k Hall record and is not a family theorem. For every k ≥ 6 the whole-layer maximum exceeds p − 1 (explicit target with ⌊3k/2⌋ addable vertices, proved in the key's scope and checked for k = 2..40).
STATUS: bounded_computation
PROVENANCE: SR-C4-8 instrument scratchpad/c4-sr-SR-C4-8/sr8_tests.py (T3, T5), outputs sr8_out_t3.json and sr8_out_t4_t5_t6.json; digests in the SR-C4-8 artifact inventory.
```

```text
RECORD: R30-C4-SR8-R3-SHARPNESS-CHERRY-SPIDER
CLAIM: On the cherry-spider tree (hub h; supports s_1..s_m on h; leaves t_i, w_i on s_i; optional leaf z on h), with F = {t_i, w_i} and X = C(L, p + 1): with z and m = p − 1, d = p − 1 and Σ_X w_F = Σ_{N_D(X)} w_F (R3 and its Hall corollary hold with equality); without z and with m = p, d = p and Σ_X w_F = (p/(p − 1))·Σ_{N_D(X)} w_F > Σ_{N_D(X)} w_F (deletion Hall fails). Proved from the two-way counting equation for every p ≥ 2, and checked literally for p = 2..6. Not eligible and F is not F_p, so this is not a (CUT) and does not bear on (HALL).
STATUS: proved_informal
PROVENANCE: SR-C4-8 instrument scratchpad/c4-sr-SR-C4-8/sr8_tests.py (T4), output sr8_out_t4_t5_t6.json.
```

## Verdicts

verdict[SR-C4-8a]: confirmed_with_repairs
verdict[SR-C4-8b]: confirmed_with_repairs
verdict[SR-C4-8c]: confirmed

- **SR-C4-8a.** The mathematics is confirmed unchanged. The repairs are face completions: `N_D` and `up_X` defined; the per-tag
  count and the identity carried as the proof of record; the (D) ∪ (S) consequence; the critic's corollary (ii) restored; the
  attribution completed per SEMANTIC-CONTRACT §3. The KEY block above is the exact text.
- **SR-C4-8b.** Confirmed with one repair: `α(G_k) = 2k + 3` is proved for every `k`, replacing reliance on the bounded
  `k ≤ 400` record. With it, union-independent families (including `C(L′, p+1)`) are covered uniformly in `k`, with margin
  `(k+2)/k`. R3 is not a proof of CT-1: the explicit `⌊3k/2⌋` target breaks the hypothesis for every `k ≥ 6`. The text lives in
  the KEY's SCOPE, and the side record is `R30-C4-SR8-GK-FULL-LAYER-UP-DEGREE`.
- **SR-C4-8c.** The name is a true predicate. It is not an alias of (NM), E1 or any registered key or pattern. VERIFIED
  `proved_informal`. The SCOPE NOTE ON (NM) and the four DISTINCTION ROWs above are the exact texts.

Not decisive for ruling 30.

## Artifact inventory

**Output.** `second-reads/SR-C4-8/SECOND-READ.md` (this file). Its digest is reported in the final message, since a file cannot
contain its own digest.

**Scratch** (`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-sr-SR-C4-8/`;
SHA-256 listed below).

| File | Bytes | SHA-256 | Role |
|---|---|---|---|
| `seal_audit.py` | 744 | `18fe8b0d88031d3a884b13cf637b83add8ab0dc64e4f22e0de83d6a1ef693665` | capsule seal and 88 member digests |
| `stage7_digest_audit.py` | 760 | `81b0424e709072a69144af1256b51be685d649e94ce0b59017057e370746be93` | 62 frozen instruments vs `sources/c4-stage7-sources/SOURCE-DIGESTS.json` |
| `sr8core.py` | 5031 | `847803c940a6158e1e1e18edc5cb12b9cdf508cdfdc09575e639fb1f49181912` | own literal core (layers, `w_F`, `x`, `F_p`, `S`, WID, (D)/(S), R3 with Lemma 1/2 assertions) |
| `sr8_tests.py` | 12334 | `5de9b2c85a456d10c9aa3c233d66b6ab866ca4dcf7582b029c180a7eca5c0c47` | T1–T6 |
| `sr8_out_t1.json` | 211 | `0c032cd2099ef7a30fc3e5ce592c71779cf93d2ed67d3d38fb6639a2205b2091` | T1 |
| `sr8_out_t2.json` | 279 | `4f41df650b550b9f65d1e051e86ffe173486150554b2442a8e60fcb6559a55c8` | T2 |
| `sr8_out_t3.json` | 950 | `6817e7acdb57fab78cf74928e2534dd4f82b4deb45cee0f8059eb8a90325ec06` | T3 |
| `sr8_out_t4_t5_t6.json` | 7560 | `65e7a6abcacd4553726d27cc2e2d4f5383a7b84c7299bd5e2a2bc9e385b9e505` | T4–T6 |
| `sr8_g5.py` | 696 | `031a9e0e617b902728ed3730283412998dc95e29767225b501d424565ebcce90` | `G_5/8` eligibility, `F_p`, WID |
| `sr8_g5_out.json` | 141 | `47020b3c632fc27ea6a40ff9794ba49564432ffcbdfbb5d91bfc7beefae70811` | `G_5/8` output |
| `sr8_nm.py` | 2077 | `15e379337871c5c15c1fe692317e12f337d955f88cb7d27c9c7f326939a9ed97` | R3 on the CB sector vs (NM) |
| `sr8_nm_out.json` | 2348 | `fa12ca36728dc22582861e05f0e77d1dfd59a7727b0d0ceb666facf86d7f7043` | output |
| `sr8_cb_updeg.py` | 855 | `e88ee37d01373f821a72258903b4214018c7f1855c3575f60dcdce52cb69efba` | `CB(8,92)/492` non-sector up-degree (E1 distinction) |
| `sr8_cb_updeg_out.json` | 128 | `5586d6a6bb0e327b0856f918305e6da23ca23eae40e1ee5fdca019205fafd04d` | output |
| `sr8_alias.py` | 2490 | `cdf888f9a4c9170bf0e28ee0cbfe19519894f87182ffca7f547eaf424f727387` | alias and pattern check of the registration text |
| `sr8_alias_out.json` | 1275 | `6156f5da5f6e5ee8d7d2d8b498e5e58478c31c6e30909f38b62d686d49755574` | final-pass output |

`sr8_alias_out.json` was produced from this file's registration blocks. Those blocks are unchanged after that run. No
`__pycache__` was written.

**Read-boundary disclosures.**
1. The host injected the project `CLAUDE.md` (with its conversation-logging instructions) and the user's auto-memory index into
   my context at session start. I did not open either file and did not act on either. In particular I created no conversation
   log, because the isolated-reader protocol permits exactly one output file.
2. As instructed by the dispatch, I read the protocol and the manifest before computing the seal. I computed the seal and all
   member digests before reading any other file.
3. I ran one directory listing of `second-reads/` (the parent of my output directory) to check whether my output directory
   existed. It returned only the names of other reads' directories. I opened no other seat's file. I also listed my own scratch
   directory (`ls -la`) to take the inventory.
4. `grep` and `sed` were used only on individual capsule-member files (the synthesis, the critique, the adjudication). No
   `find`, `grep`, `rg` or `ls -R` was rooted above the capsule members.
5. `sr8_cb_updeg.py` imports `sr8_nm.py`, whose module-level code re-ran and rewrote `sr8_nm_out.json` inside my scratch. The
   seed and inputs are fixed, so the output is deterministic. The digest in the table above is of the final file.
6. My first shell command contained a literal `======` separator, which zsh rejected after printing the protocol. The manifest
   was then read by a separate command. There were no side effects.
7. I made no network access, no installs and no Lean/`lake` calls. I opened no Mathlib files, spawned no child agents and killed
   no processes. There were no background jobs. Everything ran as `python3 -B`, standard library only.
