# Second Read

Isolated second read `SR-C6-6`, r30 Cycle 6 (the terminal cycle), run `erdos-993-math-dre-20260926-r30-weighted-transport`, run root
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26`. Date 2026-09-27 (host clock; the brief is dated
2026-09-28). Seat chartered as Claude Opus 5.5, effort high; isolated; no child delegation was used.

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, as the brief names. I loaded no other VerityOS subsystem. The host placed the
project `CLAUDE.md` and the user's auto-memory index in my context at session start; I did not act on either beyond this acknowledgment.
I kept no conversation log, because the brief confines my writes to this file and my scratch directory.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Brief.** `control/C6-SECOND-READ-BRIEF-SR-C6-6.md` SHA-256 `8f6b6d700417be1486362f145804ea9bc9e00f0abbece933ce7138623a9fdec9`,
  computed with `shasum -a 256` before I followed it: equal to the digest in my charter. The binding protocol
  `control/C6-SECOND-READ-PROTOCOL.md` hashes to `c2e9d131218cd682ab9113d8d0c536834dbf3c0e1e6aa2cdd5d8d1cb218837f9`, equal to its capsule entry.
- **Capsule seal.** `control/c6-second-read/SR-C6-6-PACKET-MANIFEST.json` (stage `cycle-6-second-read-SR-C6-6`, schema
  `verityos.math-dre.packet-manifest.v1`). SHA-256 of the compact key-sorted JSON of the manifest minus `seal_sha256`, no trailing newline:
  **`e134b4a34e6789c9223e007861d9207aa33c071b4c894385471d0b54558ef03b`**, equal to the recorded seal and to my charter. All **188/188** members
  match their recorded byte counts and SHA-256 (`seal_check.py`).
- **Frozen instruments.** The 149 capsule members under `sources/c6-stage7-sources/` all match `sources/c6-stage7-sources/SOURCE-DIGESTS.json`
  (723 entries; 0 mismatches, 0 unlisted), verified before any of them was read.
- **Registries.** The frozen run-local snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c6-stage2.json` (460 claims), the frozen master
  `sources/authority/CLAIM-IDENTITY.json` (434) and the live master `sources/heterogeneous-closure/master-2026-09-27/CLAIM-IDENTITY.json` (457)
  were loaded only for the alias check and for the texts of the registered inputs named in the brief.
- **Read-boundary disclosures.**
  1. Everything I opened is a capsule member or one of the two boot files. I opened no return, critique, adjudication, scratch directory or
     root outside the capsule. I ran no `find`, `grep -r` or `rg` anywhere, and **no directory listing outside the capsule**. The one listing I
     ran was a non-recursive `ls` of my own scratch directory, to inventory my artifacts. The only other non-read filesystem operations were
     `mkdir -p` of my scratch directory and of this file's directory.
  2. The harness saved the stdout of my first `cat` of the manifest to a tool-results file under `~/.claude/projects/…/tool-results/`. I did
     not open that file; I re-read the manifest member list with Python from the capsule copy.
  3. Of the frozen instruments I read the source of `C-F1-U/own/vshift_validate.py` and `C-F1-U/own/strata.py` only, to see what the critic's
     records count. I ran neither; no seat output file was opened. My instrument is my own code.
  4. I read the controller replays `CF-REPLAY-c6{a,b,c,d}.json` (third instrument). None bears on the statements of this read, and none is
     used below.
  5. From the Stage 6 and Stage 5 controller facts and the Stage 4 process flags I read only regex-matched excerpts mentioning A1/A3/K-6/K-7;
     they are facts, never authority, and nothing below rests on them.
  6. My A1 and A3 validation rows (`CB(2,2)`, `(3,2)`, `(4,2)`, `(2,3)`, `(3,3)`) have **no eligible rank** (`x + 2 ≤ p`, `3p < 2α + 1` is
     empty on each). SEMANTIC-CONTRACT §1.2 requires nonempty eligibility of every instance an instrument reports as a (HALL) instance. Both
     statements read here carry no eligibility hypothesis, and these rows are the brief's own required rows; I report them as validation of
     eligibility-free lemmas, never as (HALL) evidence at any row.
  7. No network, installs, `lake`/`lean`, background jobs or process kills. Every run was `python3 -B` in the foreground.
     One harmless shell slip: a `zsh` `echo ======` was parsed as an `=`-expansion and failed with no output.

## Statements read

Notation as in the CB record: `T = CB(d,m)`, `d, m ≥ 1`, the path `r – s – v`, chokes `u_i ~ r`, supports `b_ij ~ u_i`, private leaves
`c_ij ~ b_ij`; `W_v = {r}`, `W_{c_ij} = {u_i}`; `Sec = {B ∈ I_{p+1} : r, v ∈ B}`; `def(X) = Σ_X w_F − w_F(N(X))` with `N` the literal
(D) ∪ (S) neighbourhood of SEMANTIC-CONTRACT §1.2.

- **SR-C6-6a (A1, both clauses, and the corollary).** Origins: `C-F1-U` `## Verdict` A-1 (statement, four-step proof, corollary; its
  `vshift_validate.py` record); `C-F1-T` Lemma 2 (the `v` clause for families whose every member contains `v`); the F adjudication
  `## Established results` item A1; the synthesis `## Exact established results` item 6 and `## Registrations` K-6.
- **SR-C6-6b (A3, the within-stratum criterion).** Origins: `C-F1-U` A-3 (criterion and the bounded table at the two target rows); the F
  adjudication item A3 and its ruling that the normalized-matching step must be written on the face; synthesis item 7 and K-7.
- **SR-C6-6c (keys and names).** K-6 and K-7 of the synthesis `## Registrations`; `C-F1-U`'s own candidate name for A-1; the alias
  pre-screen `control/C6-CONTROLLER-ALIAS-PRESCREEN.json` (a pre-screen, not my verdict); the registered inputs
  `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` (REFUTED), `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` (VERIFIED, `proved_informal`)
  and `E993-R19-FIXED-GAMMA-HALL` (OPEN).

## Independent re-derivation

### SR-C6-6a — re-proof

Fix `d, m ≥ 1`, `p ≥ 1` and any set `F` of original leaves. The original leaves of `CB(d,m)` are `v` and the `dm` private leaves; `s`, `r`,
every `u_i` and every `b_ij` have degree at least 2 (`deg r = m + 1`, `deg u_i = d + 1`, `deg b_ij = deg s = 2`). Literally
`W_v = N(s) ∖ {v} = {r}` and `W_{c_ij} = N(b_ij) ∖ {c_ij} = {u_i}`. Hence for any independent `B`:
`w_F(B) = [v ∈ F][r ∈ B][v ∈ B] + #{c_ij ∈ F ∩ B : u_i ∈ B}`.

**Case split.** Every `B ∈ I_{p+1}` falls in exactly one of: `r, v ∈ B` (the sector); `r ∈ B`, `v ∉ B`; `r ∉ B`. For `X ⊆ I_{p+1}` put
`X_2 := {B ∈ X : r ∈ B, v ∉ B}` and `X_3 := {B ∈ X : r ∉ B}`, so `X = (X ∩ Sec) ⊔ X_2 ⊔ X_3`. The split is exhaustive and disjoint, and `X_3`
is exactly the set of root-free members, on which the hypothesis speaks. (Literal check: the five classes sector / `X_2` / root-free with
`v` / root-free with `s` / root-free with neither partition every source layer, asserted at all 100 instances.)

**Step 1.** `B ∈ X_2` has `w_F(B) = 0`: `v ∉ B`, and each `c_ij ∈ B` has its only witness `u_i`, which is absent because `u_i ~ r ∈ B`.

**Step 2 (`v` clause).** Let every `B ∈ X_3` contain `v`. Then `s ∉ B` (`s ~ v`) and `r ∉ B`. Put `φ(B) := B ∖ {v}`, a (D)-arc, so
`φ(B) ∈ N(X)`. `φ` is injective on `X_3` because `B = φ(B) ∪ {v}`. It preserves weight: the tag `v` (if in `F`) was inactive in `B`
because its only witness `r` is absent, and `v` lies in no `W_{c_ij}`, so no private tag changes status. `φ(B)` contains none of `r`, `s`,
`v`.
**Step 2 (`s` clause).** Let every `B ∈ X_3` contain `s`. Then `v ∉ B`, `r ∉ B`; put `φ(B) := B ∖ {s}`. `s` is not a leaf, so not a tag; `s`
lies in no `W_{c_ij}` and not in `W_v = {r}`; so `w_F(φ(B)) = w_F(B)`. `φ` is injective and `φ(B)` avoids `r`, `s`, `v`. The sector is the
SAME `Sec = {r, v ∈ B}` in this clause; only the hypothesis changes.

**Step 3.** Every target `A ∈ N(X ∩ Sec)` (not only the positive ones) contains `r`, `v` or `s`. Let `B ⊇ {r, v}`. A deletion removes one
vertex, so it keeps `r` or `v`. A switch at `u ∉ B` needs `|N(u) ∩ B| = 2`: at `u = s` (`N(s) = {r, v}`) it inserts `s`; at `u = u_i`
(`N(u_i) = {r} ∪ {b_i·}`) it needs exactly one `b_ij ∈ B`, removes `r` and `b_ij` and keeps `v`; at `u = b_ij` at most one neighbour is in `B`
since `u_i ∉ B`; `c_ij` has degree 1; `r, v ∈ B` are not candidates. Hence `φ(X_3) ∩ N(X ∩ Sec) = ∅`, and since `φ(X_3) ⊆ N(X)`,
`w_F(N(X)) ≥ w_F(N(X ∩ Sec)) + Σ_{B ∈ X_3} w_F(φ(B)) = w_F(N(X ∩ Sec)) + Σ_{X_3} w_F`.

**Step 4.** By Step 1, `Σ_X w_F = Σ_{X ∩ Sec} w_F + Σ_{X_3} w_F`. Subtracting Step 3: `def(X) ≤ def(X ∩ Sec)`, in both clauses. `def` is an
integer difference; no ℕ-subtraction occurs. `X ∩ Sec = ∅` is allowed and gives `def(X) ≤ 0`.

**Corollary.** Suppose `def(Y) ≤ 0` for every `Y ⊆ Sec` (with `N` the full literal neighbourhood; if "Hall" is read inside the sector
sub-network, the full-network inequality follows since the full neighbourhood is larger). Let `def(X) > 0` and `X⁺ := {B ∈ X : w_F(B) > 0}`.
Then `Σ_{X⁺} w_F = Σ_X w_F` and `N(X⁺) ⊆ N(X)`, so `def(X⁺) ≥ def(X) > 0`. If every root-free member of `X⁺` contained `v`, the `v` clause
would give `def(X⁺) ≤ def(X⁺ ∩ Sec) ≤ 0`; so `X⁺` has a root-free member lacking `v`. Likewise one lacking `s`. One member with none of
`r, s, v` does both. **Hypotheses consumed:** the `CB` adjacency only — no `IsTree`, eligibility, favorability, invariance or quotient step;
finiteness only through the finite layers.

**Own instrument** (`scratchpad/c6-sr-SR-C6-6/sr6_lit.py`, `sr6_a1.py`; my own labelling, exhaustive bitmask enumeration of independent sets,
literal leaves/supports/`W`, literal `w_F`, literal (D) ∪ (S), `F_p` from `Δ_p(T − v) < 0` on the original tree by a separate forest DP, `x`
through `α`, Dinic max-flow). Rows `CB(2,2)`, `(3,2)`, `(4,2)`, `(2,3)`, `(3,3)`; every `p ∈ [1, α]` (50 ranks); `F = F_p` derived and
`F` = every leaf: **100 instances**.

- `supply − capacity` (layer sums of `w_F` from the enumeration) equals `Σ_{v ∈ F}[Δ_{p−1}(T − H_v) − Δ_{p−1}(T − R_v)]` (forest DP on the
  literal deleted graphs) at every instance, asserted before anything else; with `F = F_p` this is `S(T, p)`.
- Steps 1–3 asserted element by element at every instance (every `X_2` member weight 0; for every root-free source with `v` (resp. `s`):
  `φ(B)` is among its literal targets, has equal weight and avoids `r, s, v`; every literal target of every sector source contains `r`, `v` or
  `s`).
- Exact restricted maxima: `max_{X ⊆ Sec ∪ X_2-class ∪ {root-free with v}} def = max_{X ⊆ Sec} def`, and the same with `s`, at all 100.
- 8,800 explicit families (per instance and clause: the whole admissible class, the sector maximizer plus all root-free `v`- (resp. `s`-)
  members, with and without the `X_2` class, the root-free part alone, and 40 random families at densities 0.05–0.95): `def(X) ≤ def(X ∩ Sec)`
  and the sharper `w(N(X)) ≥ w(N(X ∩ Sec)) + w(X_3)` hold at every one; **0 failures**.
- Non-vacuous: at **32** instances the whole-network maximum deficiency exceeds the sector maximum.
- Corollary: the sector is Hall for every subfamily at **78** instances; at all of them the restricted maxima above are 0, which proves the
  corollary for EVERY family there; at the **10** of them with a deficient family, the minimal maximizer and 20 random deficient supersets
  (pruned) each contain a root-free member without `v` and one without `s`.
- Run: `RESULT_SHA256 274d213c9156e58592b7ccfc29849cf5e27f5a6a606000ed15970c61b47194a1` (`a1_out.json`); 7 min 8 s.

### SR-C6-6b — re-proof, with the normalized-matching step on the face

Let `F = leafSet(T)` (every original leaf). A **root-free configuration** `σ = (U, Γ)` is a set `U` of `t` chokes (`0 ≤ t ≤ m`) and a set `Γ`
of `g` private leaves `c_ij` with `u_i ∈ U`. Its source stratum is
`X_σ := {B ∈ I_{p+1} : r ∉ B, B ∩ {u_1..u_m} = U, B ∩ {c_ij : u_i ∈ U} = Γ}` and its target stratum `Y_σ` is the same condition in `I_p`. Put
`D″ := d(m − t) + 1` and `R := p − t − g`, **an integer** (it can be negative).

**Which `D″` factors, and why `+1`.** For `B` with configuration `σ`: each `u_i ∈ U` forces every `b_i·` out, and `σ` fixes which `c_i·` are in
(`Γ`); each choke `k ∉ U` has `u_k ∉ B` (fixed by `σ`), so each of its `d` columns `{b_kj, c_kj}` is an edge whose other neighbour `u_k` is
absent and contributes `∅`, `b_kj` or `c_kj` independently — a three-element star; the arm `{s, v}` is an edge whose other neighbour `r` is
absent and contributes `∅`, `s` or `v` — one more three-element star. That is `d(m − t)` column stars **plus the arm**: the `+1` is the arm
`{∅, s, v}`. Every choice is independent together with `U ∪ Γ`. So `B ↦ B ∖ (U ∪ Γ)` is a bijection from `X_σ` (resp. `Y_σ`) onto the rank
`R + 1` (resp. `R`) elements of the product of `D″` three-element stars, and `|X_σ| = C(D″, R+1)·2^{R+1}`, `|Y_σ| = C(D″, R)·2^R` (zero
outside `[0, D″]`).

**Weights.** For `B ∈ X_σ ∪ Y_σ`: `r ∉ B`, so `v` is inactive; `c_ij` is active iff `u_i ∈ B`; so the active tags are exactly `Γ ⊆ F` and
`w_F(B) = g`.

**Arcs inside the stratum.** A pair `(B, A) ∈ X_σ × Y_σ` is joined by (D) ∪ (S) iff `A = B ∖ {y}` with `y ∈ B ∖ (U ∪ Γ)`. Deleting such `y`
keeps `σ`; deleting `y ∈ U ∪ Γ` changes `σ`. Every switch leaves the stratum: at `u = r` (needs two of `s, u_1..u_m`) it removes a choke of
`U` and inserts `r`; at `u = u_k`, `k ∉ U` (needs two `b_k·`), it adds a choke; at `u = b_ij` (needs `u_i, c_ij ∈ B`) it removes `u_i`;
`s` has at most one neighbour in `B` (`r ∉ B`), and `v`, `c_ij` have degree 1. So "the within-`σ` deletion network" and "the literal network
restricted to `X_σ × Y_σ`" are the same object.

**Degrees (the brief's question marks resolved).** In this bipartite graph each `B ∈ X_σ` has exactly **`R + 1`** neighbours (delete one of
its `R + 1` star elements) and each `A ∈ Y_σ` has exactly **`2(D″ − R)`** neighbours (choose one of its `D″ − R` empty stars and one of that
star's two vertices). It is biregular.

**Normalized matching property, by double count.** Let `D″ > R` and `X ⊆ X_σ`, and let `N_σ(X) := N(X) ∩ Y_σ`. Count the edges `e(X, N_σ(X))`
between `X` and `N_σ(X)`. Each member of `X` sends all its `R + 1` edges into `N_σ(X)`, so `e(X, N_σ(X)) = |X|·(R + 1)`. Each member of
`N_σ(X)` receives at most its `2(D″ − R)` edges. Hence `|X|·(R + 1) ≤ |N_σ(X)|·2(D″ − R)`, i.e.
`|N_σ(X)| / |Y_σ| ≥ |X| / |X_σ|` (using `|X_σ|·(R + 1) = |Y_σ|·2(D″ − R)`, the same double count on the whole levels). If `R ≥ D″`, then
`X_σ = ∅`.

**The criterion.** Assume `g ≥ 1` and `t + g ≤ p + 1` (that is, `R ≥ −1`).
- If `3R + 1 ≥ 2D″`, equivalently `2(D″ − R) ≤ R + 1`: for `D″ > R` the double count gives `|N_σ(X)| ≥ |X|`, so
  `Σ_X w_F = g|X| ≤ g|N_σ(X)| = w_F(N_σ(X))` for every `X ⊆ X_σ`; for `R ≥ D″` there is nothing to prove.
- If `3R + 1 < 2D″`: then `R + 1 ≤ (2D″ + 1)/3 ≤ D″`, so `X_σ ≠ ∅`. For `R ≥ 0`, `|X_σ|/|Y_σ| = 2(D″ − R)/(R + 1) > 1`, and `X = X_σ` has
  deficiency `g(|X_σ| − |N_σ(X_σ)|) ≥ g(|X_σ| − |Y_σ|) > 0`. For `R = −1`, `X_σ = {U ∪ Γ}` has weight `g ≥ 1` and no neighbour in `Y_σ = ∅`.

So under `g ≥ 1` and `R ≥ −1`, the stratum's network is Hall for every subfamily **iff** `3R + 1 ≥ 2D″`. **ℕ guards:** `R` is an integer
and the case `R = −1` is live; `D″ − R > 0` is used only when `D″ > R`; `m − t ≥ 0` since `t ≤ m`.

**Without the guards the iff is false.** `g = 0`: every weight is 0, so the stratum is Hall trivially, while the criterion can fail
(e.g. `CB(2,2)`, `p = 1`, `U = {u_1}`, `Γ = ∅`: `R = 0`, `D″ = 3`, `1 < 6`). `t + g ≥ p + 2` (`R ≤ −2`): `X_σ = ∅`, Hall is vacuous, and
`3R + 1 < 0 < 2D″` fails (e.g. `CB(2,2)`, `p = 1`, `t = 1`, `g = 2`).

**Sector analogue (consistency check, not a dependency).** For `B ⊇ {r, v}`, every choke is absent and the arm is occupied, so
`B ∖ {r, v}` runs over the rank-`(p − 1)` elements of the product of the `dm` column stars; every sector source and sector target has weight
exactly 1 when `v ∈ F` (only `v` is active, through `r`); the switches out of the sector land outside it (Step 3 above). The same argument
with `R = p − 2`, `D″ = dm` gives: the within-sector deletion network is Hall for every subfamily iff `3(p − 2) + 1 ≥ 2dm`, i.e.
**`3p ≥ 2dm + 5`** — exactly the complement of the `t = 1` deficiency criterion `3p < 2dm + 5` of `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`
(whose `t` counts private leaves per support, not U-chokes). Recovered; not used.

**Own instrument** (`sr6_a3.py`, same library): every configuration `σ` of each row (25, 81, 289, 125 and 729 configurations), every
`p ∈ [1, α]`, `F` = every leaf: **14,810** `(σ, p)` strata. At every stratum, literally: `|X_σ|`, `|Y_σ|` equal the product-of-stars level
sizes; every weight equals `g`; the set of literal (D) ∪ (S) targets of each `B ∈ X_σ` inside `Y_σ` equals its free-part deletions and has
size `R + 1`; every `A ∈ Y_σ` has exactly `2(D″ − R)` literal in-stratum sources. Hall for every subfamily was decided by exact max-flow twice
(weighted, and with unit weights). Under `g ≥ 1`, `R ≥ −1` (**9,464** strata; 3,435 nonempty: 374 Hall, 1,840 failing at `R ≥ 0`, 1,221
failing at `R = −1`) the iff held at **every** stratum; 11,070 random normalized-matching inequalities held. The unguarded iff fails at 94
zero-weight strata (92 of them nonempty) and at 5,054 empty strata with `R ≤ −2`, as the proof predicts. The sector analogue
`Hall ⇔ 3p ≥ 2dm + 5` held at all 38 instances with a nonempty sector. `supply − capacity` = aggregate side asserted at all 50 ranks.
`RESULT_SHA256 fa14f7e2077ccac99cbf2d5a424f72435b60753702ca07b257fb81cb3b8d2dcd` (`a3_out.json`).

**Record recount (target rows; a RECORD, not evidence).** My own closed count (`sr6_strata_types.py`) reproduces `C-F1-U`'s table: failing
strata **9,793** at `CB(8,95)/508` and **15,097** at `CB(9,112)/673`, supply shares 23.93% and 26.91%, smallest failing `g` for `t = 1..4`:
6, 10, 15, 19 and 6, 11, 16, 21. Two precisions for the record: the counted "strata" are `(t, g)`-types (unions of `Aut`-orbits of
configurations), not single configurations; and the table counts only `R ≥ 0` — a further 39 and 45 types with `R = −1` fail trivially
(single-source strata of negligible weight).

### SR-C6-6c — keys, predicates and aliases

My alias check (`sr6_alias.py`) runs on every candidate name and on every text block under `## Registration text`, against the 460 snapshot,
the 434 master and the 457 master: exact key; registered alias equality (case-insensitive); every registered `alias_patterns` regex
(case-insensitive) on the name, on its lower-cased spaced form and on the text; token overlap (hit if at least 4 shared tokens and at least
85% of a registered key's tokens), with the top three overlaps; the forbidden phrases of ruling 48. Results are in `## Findings and repairs`
(F-8) and in `alias_out.json`.

## Findings and repairs

**F-1 (6a; confirmed).** The four steps and the corollary are correct as stated by `C-F1-U` and checked by the F adjudicator. The case split
is exhaustive, `X_3` is exactly the root-free part, and Step 3 holds for every target of a sector source, not only the positive ones. Two
wording points go on the registration face, but neither changes the mathematics. First, the `s` clause keeps the same sector `{r, v ∈ B}`:
"with `s` in place of `v`" replaces `v` in the hypothesis only. Replacing it in `Sec` as well would give the empty set `{r, s ∈ B}` and a
false statement. Second, the corollary's "sector subfamily is Hall" is read as `def(Y) ≤ 0` in the full literal network. The within-sector
reading implies it. `C-F1-T` Lemma 2 is the special case with `X_2 = ∅` and the `v` clause. Its proof sentence "arm-`∅` targets are reached
from `X` only by `B ↦ B ∖ {v}`" is correct for its families: every target of a sector source contains `r`, `v` or `s` (Step 3), and from a
root-free source containing `v` the vertex `v` leaves only by its own deletion, since a switch never removes `v` when `r` is absent.

**F-2 (6b; repaired).** The statement as written in the brief, the adjudication and the synthesis omits two hypotheses, and without them the
iff is false. The repairs are **`g ≥ 1`** (a positive-weight stratum) and **`t + g ≤ p + 1`** (`R ≥ −1` in ℤ). Counterexamples are above,
and there are 94 + 5,054 of them on the small rows. The `(t, g)`-type table at the target rows already filtered to `g ≥ 1`, `R ≥ 0`, so that
record is unaffected.

**F-3 (6b; answered).** `D″ = d(m − t) + 1` counts the `d(m − t)` free column stars under the chokes outside `U`, plus the arm star `{∅, s, v}`.
The `+1` is the arm. The degrees are down `R + 1` and up `2(D″ − R)`. These are verified literally at every stratum.

**F-4 (6b; written out).** The normalized-matching step appears on the face as a double count (above and in the K-7 text). It is the `q = 2`
case of the uniform product lemma already carried in the scope note (T-D-R1) of `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`,
and of `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING` at `q_i ≡ 2`. K-7 re-proves it on its own face and imports no status. A
distinction row records why the stratum is not an instance of NM's graph-side statement.

**F-5 (6b; answered).** Inside a stratum the literal (D) ∪ (S) network consists of deletions only, because every switch leaves the stratum.
"Deletion network" and "literal network restricted to the stratum" are therefore the same object. The fences keep the criterion to that one
stratum: arcs that leave the stratum (deletion of a choke or of a chosen private leaf, and every switch) can serve a failing stratum, so a
failing stratum is **not** a deficient family of the whole network.

**F-6 (6b; remark, not registered).** The weight identity uses only `Γ ⊆ F`. With a general `F` of leaves, every stratum member has weight
`|Γ ∩ F|`, and the same criterion holds with that as the positive weight. I do not widen the scope at a second read. The registered scope is
`F` = every leaf, as the adjudicator consumed it.

**F-7 (records).** The recount of `C-F1-U`'s target-row table agrees exactly (above). Its two precisions, `(t, g)`-types and `R ≥ 0` only, go
into the record text. The whole-stratum deficiencies (`tlevels.py`) are not re-derived here. I do not register them.

**F-8 (6c; names).**
- **K-6.** The synthesis name `E993-R30-CB-FAMILY-WHOSE-ROOT-FREE-MEMBERS-ALL-CONTAIN-ARM-LEAF-OR-ALL-CONTAIN-ARM-SUPPORT-HAS-DEFICIENCY-AT-MOST-ITS-ROOT-ARM-SECTOR-PART`
  is a predicate covering both clauses. `C-F1-U`'s own name covers the `v` clause only, so it is rejected as the key and kept as an alias. I
  **choose** the synthesis name with one precision: `ROOT-ARM-SECTOR` leaves open which arm vertex, and `{r, s}` is never in an independent
  set. The chosen key is
  **`E993-R30-CB-FAMILY-WHOSE-ROOT-FREE-MEMBERS-ALL-CONTAIN-ARM-LEAF-OR-ALL-CONTAIN-ARM-SUPPORT-HAS-DEFICIENCY-AT-MOST-ITS-ROOT-AND-ARM-LEAF-SECTOR-PART`.
  It asserts no more than the statement. Alias check: no exact key, alias, pattern or forbidden-phrase hit in any of the three registries.
  The largest token overlaps are 2 shared tokens (for example `E993-BETA-AGG-SUPPORT`, 2 of 4), far below the 4-token, 85% threshold (`alias_out.json`).
- **K-7.** "Free star count" is exactly `D″`: the number of three-element stars free in the stratum, namely the `d(m − t)` columns plus the
  arm. "Three R plus one" refers to `R = p − t − g`, which the statement defines. The synthesis name asserts the iff for every fixed
  configuration, including `g = 0` and empty strata, where it is false (F-2). The name is therefore **repaired** to
  **`E993-R30-CB-FIXED-POSITIVE-WEIGHT-ROOT-FREE-CONFIGURATION-STRATUM-DELETION-NETWORK-HALL-IFF-THREE-R-PLUS-ONE-AT-LEAST-TWICE-FREE-STAR-COUNT`**.
  The rank guard `t + g ≤ p + 1` is on the face: a stratum of the source layer is nonempty or has `R ≥ D″`. Alias check: clean in all three
  registries. The nearest neighbour is `E993-R19-FIXED-GAMMA-HALL` (shared tokens `E993`, `FIXED`, `HALL`: 3 of its 5), for which a distinction row is written.
  Distinction rows are also written against the CBstar key and the NM key.
- **Distinction against the refuted per-leaf key (K-6).** K-6's map `B ↦ B ∖ {v}` is a lower bound on one family's neighbourhood weight,
  applied where `v` is inactive. It is not a per-leaf transport and not a linear-rank statement. The row is under `## Registration text`.
- **Attribution on the face.** A1: `C-F1-U` (containing `C-F1-T` Lemma 2). A3: `C-F1-U`. All three are Claude Opus 5.5. The F adjudicator's
  checks are Claude Opus 5.5 as well. `CB(d,m)` and the network are from Codex GPT-6's lower-region run.
- The registration texts contain none of the forbidden phrases of ruling 48 and name no r30 award by a working label. No text block matches
  any registered alias pattern; `alias_out.json` gives the per-block result. The distinction rows necessarily name their comparison keys.

## Registration text

```text
KEY: E993-R30-CB-FAMILY-WHOSE-ROOT-FREE-MEMBERS-ALL-CONTAIN-ARM-LEAF-OR-ALL-CONTAIN-ARM-SUPPORT-HAS-DEFICIENCY-AT-MOST-ITS-ROOT-AND-ARM-LEAF-SECTOR-PART
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: Let d, m >= 1 and T = CB(d,m): the path r - s - v (v a leaf with support s), m chokes u_1..u_m adjacent to r, d supports b_{i1..id} adjacent to each u_i, and one private leaf c_{ij} adjacent to each b_{ij}; so W_v = {r} and W_{c_ij} = {u_i}. Let p >= 1, let F be any set of original leaves of T, let w_F be the literal active-tag weight and N(X) the set of targets in I_p(T) joined to some member of X by the literal relation (D) union (S) (SEMANTIC-CONTRACT section 1.2), and for X a subset of I_{p+1}(T) put def(X) := sum_{B in X} w_F(B) - sum_{A in N(X)} w_F(A). Let Sec := {B in I_{p+1}(T) : r in B and v in B}. (i) If every member B of X with r not in B contains v, then def(X) <= def(X cap Sec). (ii) If every member B of X with r not in B contains s, then def(X) <= def(X cap Sec), with the same Sec. Corollary: if def(Y) <= 0 for every subset Y of Sec, then for every X with def(X) > 0 the positive part X+ := {B in X : w_F(B) > 0} has def(X+) >= def(X) > 0 and contains a member with neither r nor v and a member with neither r nor s (possibly one member with none of r, s, v). Proof of record: split X into X cap Sec, X_2 := {B in X : r in B, v not in B} and X_3 := {B in X : r not in B}; the split is exhaustive. (1) Every B in X_2 has w_F(B) = 0: v is absent, and each present c_{ij} has its only witness u_i absent because u_i ~ r. (2) In clause (i) every B in X_3 contains v, hence not s; phi(B) := B minus {v} is a (D)-arc, injective on X_3 (B = phi(B) plus v), and weight-preserving (v was inactive since r is absent, and v witnesses no tag); in clause (ii) every B in X_3 contains s, hence not v; phi(B) := B minus {s} is weight-preserving because s is not a leaf and lies in no witness set W_v = {r}, W_{c_ij} = {u_i}; in both clauses phi(B) contains none of r, s, v. (3) Every target joined to a source containing r and v contains r, v or s: a deletion keeps r or v; a switch at s inserts s; a switch at u_i needs exactly one b_{ij} in B, removes r and b_{ij} and keeps v; b_{ij} has at most one neighbour in B because u_i is absent; c_{ij} and v have degree one. Hence phi(X_3) is disjoint from N(X cap Sec) and contained in N(X), so w_F(N(X)) >= w_F(N(X cap Sec)) + sum_{X_3} w_F. (4) With (1), sum_X w_F = sum_{X cap Sec} w_F + sum_{X_3} w_F, which gives def(X) <= def(X cap Sec). Corollary: N(X+) is contained in N(X) and the weight sums agree, so def(X+) >= def(X); if every root-free member of X+ contained v (resp. s), clause (i) (resp. (ii)) would give def(X+) <= def(X+ cap Sec) <= 0. All quantities are integers; no natural-number subtraction occurs.
SCOPE: The homogeneous tree family CB(d,m), d, m >= 1; every rank p >= 1; every set F of original leaves; the literal active-tag weight and the literal relation (D) union (S); every family X of the source layer I_{p+1}(T). Hypotheses consumed: the CB adjacency only; no tree property, eligibility, favorability, invariance or quotient step is used. Isolated second read SR-C6-6: literal validation on CB(2,2), CB(3,2), CB(4,2), CB(2,3), CB(3,3) at every p in [1, alpha], F = F_p(T) and F = leafSet(T) (100 instances, none eligible): exact restricted max-flow equalities for both clauses, 8,800 explicit random and extremal families with 0 failures, 32 instances non-vacuous, the corollary at 78 instances (bounded_computation; record R30-CB-RECORD-SR-C6-6-SMALL-ROW-LITERAL-VALIDATION).
ATTRIBUTION: C-F1-U (Claude Opus 5.5; r30 Cycle 6 Stage 4 critic of route F1), critic-derived advance A-1 with its four-step proof and corollary, containing C-F1-T (Claude Opus 5.5; r30 Cycle 6 Stage 4 critic of route F1) Lemma 2, the clause (i) for families whose every member contains v; checked line by line and validated on 6,560 families by the r30 Cycle 6 F adjudicator (Claude Opus 5.5); isolated second read SR-C6-6 (Claude Opus 5.5); the tree family CB(d,m), the active-tag weight, the relation (D) union (S) and the transport network from the Codex GPT-6 (Astra/Sol/Luna) lower-region run.
FENCES: A comparison of one family's deficiency with that of its root-and-arm-leaf sector part; it proves no Hall inequality for any family by itself. Not (HALL) E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL at any scope, not (HALL-COND) for any family, not a (CUT), and not a sector certificate: it assumes nothing and proves nothing about Hall of sector subfamilies, and the corollary is conditional on that hypothesis. The maps B minus {v} and B minus {s} serve only to bound one family's neighbourhood weight from below, on root-free sources where the removed vertex carries no active tag and witnesses none; they are not a per-leaf transport, not a flow and not a statement about the rank of any linear map; E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY stays REFUTED at its scope. Homogeneous CB(d,m) only; no statement about heterogeneous patterns or other trees. The primary aggregate E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE is untouched; no RTree or governed-model implication; the small-row validation is non-eligible and is not evidence at any eligible row.
ALIASES: CB V-shift lemma; CB S-shift lemma; CB arm-leaf and arm-support shift; E993-R30-CB-FAMILY-WITH-EVERY-ROOT-FREE-MEMBER-CONTAINING-THE-ARM-LEAF-HAS-DEFICIENCY-AT-MOST-ITS-SECTOR-PART; E993-R30-CB-FAMILY-WHOSE-ROOT-FREE-MEMBERS-ALL-CONTAIN-ARM-LEAF-OR-ALL-CONTAIN-ARM-SUPPORT-HAS-DEFICIENCY-AT-MOST-ITS-ROOT-ARM-SECTOR-PART
```

```text
KEY: E993-R30-CB-FIXED-POSITIVE-WEIGHT-ROOT-FREE-CONFIGURATION-STRATUM-DELETION-NETWORK-HALL-IFF-THREE-R-PLUS-ONE-AT-LEAST-TWICE-FREE-STAR-COUNT
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: Let d, m >= 1, T = CB(d,m) (as in E993-R30-CB-FAMILY-WHOSE-ROOT-FREE-MEMBERS-ALL-CONTAIN-ARM-LEAF-OR-ALL-CONTAIN-ARM-SUPPORT-HAS-DEFICIENCY-AT-MOST-ITS-ROOT-AND-ARM-LEAF-SECTOR-PART), p >= 1 and F = leafSet(T) (every original leaf), with the literal active-tag weight w_F and the literal relation (D) union (S), N(X) denoting the set of targets in I_p(T) joined to some member of X. A root-free configuration sigma = (U, Gamma) is a set U of t chokes (0 <= t <= m) and a set Gamma of g private leaves c_{ij} with u_i in U. Its source stratum is X_sigma := {B in I_{p+1}(T) : r not in B, B cap {u_1..u_m} = U, B cap {c_{ij} : u_i in U} = Gamma}; its target stratum Y_sigma is the same set of conditions in I_p(T). Put D'' := d(m - t) + 1 (the free star count) and R := p - t - g computed in the integers. Suppose g >= 1 and t + g <= p + 1 (R >= -1). Then: (a) every member of X_sigma and of Y_sigma has w_F = g; (b) B maps to B minus (U cup Gamma) bijectively from X_sigma and Y_sigma onto the elements of rank R + 1 and R of the product of D'' three-element stars, namely {empty, b_{kj}, c_{kj}} for the d(m - t) columns of the chokes outside U and {empty, s, v} for the arm (the +1), so |X_sigma| = C(D'', R+1) 2^(R+1) and |Y_sigma| = C(D'', R) 2^R (zero outside [0, D'']); (c) a source in X_sigma and a target in Y_sigma are joined by (D) union (S) exactly when the target is the source minus one vertex outside U cup Gamma; (d) the stratum network (supplies and capacities w_F = g, arcs as in (c)) satisfies sum_{B in X} w_F(B) <= sum_{A in N(X) cap Y_sigma} w_F(A) for every subset X of X_sigma if and only if 3R + 1 >= 2D''. Proof of record: (a) r is absent, so v is inactive (W_v = {r}); c_{ij} is active exactly when u_i is present; so the active tags are exactly Gamma, all in F. (b) Each u_i in U excludes every b_{i.}, and sigma fixes which c_{i.} are present; each choke outside U is absent, so each of its d columns b_{kj} - c_{kj} is an edge with no other present neighbour and contributes empty, b_{kj} or c_{kj}; the arm s - v is an edge whose other neighbour r is absent and contributes empty, s or v; every such choice is independent together with U cup Gamma. (c) Deleting a vertex outside U cup Gamma keeps sigma, deleting one of U cup Gamma changes it; every switch leaves the stratum: at r it needs two of s, u_1..u_m and removes a choke of U; at u_k with k outside U it needs two b_{k.} and adds a choke; at b_{ij} it needs u_i and c_{ij} and removes u_i; s has at most one neighbour in the set (r absent) and v, c_{ij} have degree one. (d) Normalized matching by counting edges from both sides: in the bipartite graph of (c) every source has exactly R + 1 neighbours (delete one of its R + 1 star elements) and every target exactly 2(D'' - R) (choose one of its D'' - R empty stars and one of that star's two vertices). If D'' > R and X is a subset of X_sigma, count the edges between X and N(X) cap Y_sigma: all |X|(R + 1) edges of X land there and each target receives at most 2(D'' - R), so |X|(R + 1) <= 2(D'' - R)|N(X) cap Y_sigma|, i.e. |N(X) cap Y_sigma| / |Y_sigma| >= |X| / |X_sigma| (the whole levels satisfy |X_sigma|(R + 1) = |Y_sigma| 2(D'' - R)); if R >= D'' then X_sigma is empty. If 3R + 1 >= 2D'', equivalently 2(D'' - R) <= R + 1, the edge count gives |N(X) cap Y_sigma| >= |X|, and all weights equal g. If 3R + 1 < 2D'', then R + 1 <= D'' and X_sigma is nonempty; for R >= 0, |X_sigma| / |Y_sigma| = 2(D'' - R)/(R + 1) > 1 and X = X_sigma has deficiency at least g(|X_sigma| - |Y_sigma|) > 0; for R = -1, X_sigma = {U cup Gamma} has weight g >= 1 and no neighbour in the empty Y_sigma. Natural-number guards: R is an integer and R = -1 is a live case; D'' - R > 0 is used only when D'' > R. The hypotheses g >= 1 and t + g <= p + 1 are necessary for the equivalence: at g = 0 every weight is 0 and the stratum is Hall while the criterion can fail, and at t + g >= p + 2 the stratum is empty while the criterion fails. Consistency check (not a dependency): the same argument on the root-and-arm-leaf sector (r and v present, every choke absent, the dm column stars free, every weight one when v is in F) gives Hall of the within-sector deletion network for every subfamily iff 3(p - 2) + 1 >= 2dm, i.e. 3p >= 2dm + 5, the complement of the t = 1 criterion of E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT.
SCOPE: The homogeneous tree family CB(d,m), d, m >= 1; every rank p >= 1; F = leafSet(T); one fixed root-free configuration sigma with g >= 1 and t + g <= p + 1; the literal network restricted to that configuration's source and target strata. Hypotheses consumed: the CB adjacency and F containing every private leaf; no tree property, eligibility or favorability is used. Isolated second read SR-C6-6: literal validation of every configuration on CB(2,2), CB(3,2), CB(4,2), CB(2,3), CB(3,3) at every p in [1, alpha] (14,810 strata; the equivalence at all 9,464 under the hypotheses; level sizes, weights, arc set and both degrees literal at every stratum; the necessity of both hypotheses exhibited at 94 plus 5,054 strata) (bounded_computation; record R30-CB-RECORD-SR-C6-6-SMALL-ROW-LITERAL-VALIDATION).
ATTRIBUTION: C-F1-U (Claude Opus 5.5; r30 Cycle 6 Stage 4 critic of route F1), critic-derived advance A-3 (the criterion and its biregular normalized-matching proof); checked by the r30 Cycle 6 F adjudicator (Claude Opus 5.5), who required the normalized-matching step on the face; hypotheses g >= 1 and t + g <= p + 1, the identification of the +1 as the arm star, the arc analysis (c) and the edge count written out by isolated second read SR-C6-6 (Claude Opus 5.5); the normalized-matching inequality is the q = 2 case of the uniform product lemma carried in the scope note (T-D-R1) of E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING, re-proved here; the tree family CB(d,m), the active-tag weight, the relation (D) union (S) and the transport network from the Codex GPT-6 (Astra/Sol/Luna) lower-region run.
FENCES: A criterion for ONE configuration stratum's network only. Not (HALL) E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL at any scope, not (HALL-COND) for any family of the whole network, and not a (CUT): arcs that leave the stratum (deletion of a choke of U or of a leaf of Gamma, and every switch) are ignored, so a stratum failing the criterion can still be served in the whole network and is not a deficient family of it. The equivalence is not asserted at g = 0 or at t + g >= p + 2. F = leafSet(T) only (no general-selector claim). The counts of failing strata at CB(8,95)/508 and CB(9,112)/673 are bounded records (R30-CB-RECORD), not part of this statement. The sector consistency check neither uses nor re-proves E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT. Not the r19 Delete-and-Retag mechanism; E993-R19-FIXED-GAMMA-HALL is unchanged. No status transfer to or from E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING or E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING. The primary aggregate E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE is untouched; no RTree or governed-model implication.
ALIASES: CB root-free stratum criterion; CB within-stratum Hall criterion; CB regime-3 stratum criterion; E993-R30-CB-FIXED-ROOT-FREE-CONFIGURATION-STRATUM-DELETION-NETWORK-HALL-IFF-THREE-R-PLUS-ONE-AT-LEAST-TWICE-FREE-STAR-COUNT
```

```text
DISTINCTION ROW: DR-SR-C6-6-01
KEY: E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY
TEXT: The REFUTED key asserts, at every eligible ordinary tree and rank and every favorable leaf v, injectivity of the rational linear map d_p sending each marked independent p-set of H_v = T minus {v, s_v} to the sum of its one-vertex deletions still meeting W_v; it is refuted on an order-91 tree. E993-R30-CB-FAMILY-WHOSE-ROOT-FREE-MEMBERS-ALL-CONTAIN-ARM-LEAF-OR-ALL-CONTAIN-ARM-SUPPORT-HAS-DEFICIENCY-AT-MOST-ITS-ROOT-AND-ARM-LEAF-SECTOR-PART differs in object, map and scope. Object: an inequality between one source family's deficiency and that of its root-and-arm-leaf sector part, i.e. a lower bound on the family's neighbourhood weight; it asserts nothing about the rank of any linear map and constructs no transport or flow. Map: B maps to B minus {v} (or B minus {s}) only on root-free sources, where v is INACTIVE (its only witness r is absent) and witnesses no tag, and s is not a tag at all; the map moves no active tag, acts on sources of the (D) union (S) network rather than on marked sets of H_v at a favorable leaf, and serves only to exhibit targets of the family lying outside the neighbourhood of its sector part. Scope: one tree family CB(d,m), any rank, any tag set; no universal claim over trees, ranks or leaves. Not a revival; the refuted key stays REFUTED at its scope.
```

```text
DISTINCTION ROW: DR-SR-C6-6-02
KEY: E993-R19-FIXED-GAMMA-HALL
TEXT: Nearest lexical neighbour of E993-R30-CB-FIXED-POSITIVE-WEIGHT-ROOT-FREE-CONFIGURATION-STRATUM-DELETION-NETWORK-HALL-IFF-THREE-R-PLUS-ONE-AT-LEAST-TWICE-FREE-STAR-COUNT (shared tokens E993, FIXED and HALL, 3 of its 5). The r19 key (OPEN) is a universal Hall subset inequality for the fixed r19 Delete-and-Retag relation on every governed RTree tuple, on the aggregate-beta route. The r30 key fixes a root-free CONFIGURATION of the ordinary tree CB(d,m) (a choke set and the private leaves in it), uses the r30 active-tag weight (every stratum member has weight g) and the r30 relation (D) union (S) restricted to one stratum (only deletions survive there), and proves an exact equivalence for that one stratum's network with the criterion 3R + 1 >= 2D''. Different relation, weight, object, graph class and quantifier; neither implies the other; no status transfer; the r19 key is unchanged.
```

```text
DISTINCTION ROW: DR-SR-C6-6-03
KEY: E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT
TEXT: The CBstar key gives the exact maximum deletion deficit over subfamilies of the root-plus-arm sector {r, v present} of CBstar(d,m,t), where t counts private leaves per support; at t = 1 (CB(d,m)) a deficient sector subfamily exists iff 3p < 2dm + 5. E993-R30-CB-FIXED-POSITIVE-WEIGHT-ROOT-FREE-CONFIGURATION-STRATUM-DELETION-NETWORK-HALL-IFF-THREE-R-PLUS-ONE-AT-LEAST-TWICE-FREE-STAR-COUNT concerns root-free strata (r absent), which the sector key does not cover, and its t counts the chokes present in a configuration (a different symbol). Applied by the same argument to the sector (R = p - 2, D'' = dm, weight one) it recovers 3p >= 2dm + 5 as a consistency check only; it neither uses nor re-proves the CBstar key, whose statement, grade and fences are unchanged.
```

```text
DISTINCTION ROW: DR-SR-C6-6-04
KEY: E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING
TEXT: The normalized-matching step of E993-R30-CB-FIXED-POSITIVE-WEIGHT-ROOT-FREE-CONFIGURATION-STRATUM-DELETION-NETWORK-HALL-IFF-THREE-R-PLUS-ONE-AT-LEAST-TWICE-FREE-STAR-COUNT, (R + 1)|X| <= 2(D'' - R)|shadow of X|, is the abstract content of the uniform product lemma in this key's scope note (T-D-R1) at q = 2, M = D'', k = R + 1, and of E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING at q_i = 2; it is re-proved on the new key's face by the same biregular edge count. The stratum is not an instance of this key's graph-side statement: over Q = U cup Gamma the graph T minus N[Q] also contains the chokes outside U and the unchosen private leaves of U-chokes (isolated vertices), which the configuration fixes absent, so it is not a perfect matching. The new key adds the weight identification, the arc analysis inside the stratum and the converse (failure of the whole level). No alias in either direction; no status transfer; both registered keys are unchanged.
```

```text
RECORD: R30-CB-RECORD-SR-C6-6-SMALL-ROW-LITERAL-VALIDATION
CLAIM: SR-C6-6 own literal instrument on CB(2,2), CB(3,2), CB(4,2), CB(2,3), CB(3,3) at every p in [1, alpha] (50 ranks; none eligible). Fidelity: at every instance the layer weight difference equals sum over F of [Delta_{p-1}(T - H_v) - Delta_{p-1}(T - R_v)] computed by a forest DP on the literal deleted graphs (supply - capacity = S(T, p) when F = F_p(T)). Arm-leaf and arm-support shift (F = F_p(T) and F = leafSet(T), 100 instances): the element-wise steps hold; the maximum deficiency over families of sector sources, root-containing arm-leaf-free sources and root-free sources containing v (resp. s) equals the sector maximum at all 100; 8,800 random and extremal families satisfy the inequality with 0 failures; 32 instances non-vacuous; every sector subfamily Hall at 78 instances, 10 with a deficient family, each containing root-free members lacking v and lacking s. Within-stratum criterion (F = leafSet(T), 14,810 configuration strata): level sizes, weights g, arc set (free-part deletions only), down-degree R + 1 and up-degree 2(D'' - R) literal at every stratum; under g >= 1 and t + g <= p + 1 (9,464 strata, 3,435 nonempty: 374 Hall, 1,840 failing with R >= 0, 1,221 failing with R = -1) Hall for every subfamily holds iff 3R + 1 >= 2D'' at every stratum (weighted and unit-weight max-flow); 11,070 random shadow-ratio inequalities (R + 1)|X| <= 2(D'' - R)|shadow of X| hold; without the hypotheses the equivalence fails at 94 zero-weight and 5,054 empty strata; the sector analogue (Hall iff 3p >= 2dm + 5) holds at all 38 instances with a nonempty sector.
STATUS: bounded_computation
PROVENANCE: scratchpad/c6-sr-SR-C6-6/ sr6_lit.py, sr6_a1.py (RESULT_SHA256 274d213c9156e58592b7ccfc29849cf5e27f5a6a606000ed15970c61b47194a1), sr6_a3.py (RESULT_SHA256 fa14f7e2077ccac99cbf2d5a424f72435b60753702ca07b257fb81cb3b8d2dcd); isolated second read SR-C6-6 (Claude Opus 5.5); non-eligible rows, never evidence at an eligible row.
```

```text
RECORD: R30-CB-RECORD-C6-ROOT-FREE-STRATA-FAILING-THE-WITHIN-STRATUM-CRITERION
CLAIM: At CB(8,95)/508 and CB(9,112)/673 with F = every leaf: the (t, g)-types (unions of automorphism orbits of root-free configurations with t chokes and g private leaves in them, g >= 1, R = p - t - g >= 0) whose stratum fails 3R + 1 >= 2D'' number 9,793 and 15,097, carrying about 23.93% and 26.91% of the root-free supply; the smallest failing g for t = 1, 2, 3, 4 is 6, 10, 15, 19 and 6, 11, 16, 21. A further 39 and 45 types with R = -1 (single-source strata of negligible weight) fail trivially and are not counted. The sector (r and v present) carries about 0.063% and 0.149% of the total supply there. A failing stratum is not a deficient family of the whole network.
STATUS: bounded_computation
PROVENANCE: C-F1-U (Claude Opus 5.5) strata.py (RESULT_SHA256 a75a1375...), replayed by the r30 Cycle 6 F adjudicator (Claude Opus 5.5); counts, shares and smallest failing g recounted by isolated second read SR-C6-6 with its own code (sr6_strata_types.py); the sector shares are C-F1-U's and were not recounted.
```

## Verdicts

verdict[SR-C6-6a]: confirmed
verdict[SR-C6-6b]: confirmed_with_repairs
verdict[SR-C6-6c]: confirmed_with_repairs

- **SR-C6-6a** is confirmed at `proved_informal`. The exact registration text is the first block under `## Registration text`: both
  clauses are explicit, the `s` clause keeps the same sector, and the corollary is stated precisely.
- **SR-C6-6b** is confirmed with repairs at `proved_informal`. The repaired statement adds the hypotheses **`g ≥ 1` and `t + g ≤ p + 1`**
  (`R ≥ −1` in ℤ), without which the iff is false. It also puts the normalized-matching double count and the arc analysis on the face. The
  exact text is the second block.
- **SR-C6-6c** is confirmed with repairs. K-6 is registered under the chosen predicate name
  `E993-R30-CB-FAMILY-WHOSE-ROOT-FREE-MEMBERS-ALL-CONTAIN-ARM-LEAF-OR-ALL-CONTAIN-ARM-SUPPORT-HAS-DEFICIENCY-AT-MOST-ITS-ROOT-AND-ARM-LEAF-SECTOR-PART`.
  The synthesis name and `C-F1-U`'s name are kept as aliases. K-7 is renamed
  `E993-R30-CB-FIXED-POSITIVE-WEIGHT-ROOT-FREE-CONFIGURATION-STRATUM-DELETION-NETWORK-HALL-IFF-THREE-R-PLUS-ONE-AT-LEAST-TWICE-FREE-STAR-COUNT`,
  because the synthesis name overclaims at `g = 0`; the synthesis name is kept as an alias. Four distinction rows are written, against the
  refuted per-leaf key, `E993-R19-FIXED-GAMMA-HALL`, the CBstar key and the NM key. Two bounded records are written. Attribution is on
  every face.

## Artifact inventory

- **Deliverable:** `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/second-reads/SR-C6-6/SECOND-READ.md`
  (this file only).
- **Scratch:** `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-sr-SR-C6-6/`. Every run
  used `python3 -B`, in the foreground; no bytecode was written, and no background job was started.

| File | SHA-256 | Role |
|---|---|---|
| `seal_check.py` | `1a2c472cb30d090df3b29a445f7018a4bb6fd972d86ae2625bbe1a866b95036a` | capsule seal and member digests |
| `sr6_lit.py` | `fab886a0bedc594b585083ce85598552c202fcfd6649173593e54d8b715f6362` | own literal library (CB builder, IsTree, enumeration, forest DP, `F_p`, `w_F`, (D) ∪ (S), Dinic) |
| `sr6_a1.py` | `046e6426bd0f8629f2b817e63851a99da8f58eee561a4a7bdce531b395ee0c80` | SR-C6-6a checks (`RESULT_SHA256 274d213c…94a1`) |
| `a1_out.json` | `cf42561c2df4a50924ad8f56904030764df77255c1feefa34d60fd582897f39d` | per-instance rows |
| `a1_stdout.txt` | `0574a2caeacdfeb848ad704247c2e4633c3f0ca74fbaf9cad5eabc34846db2c0` | run log |
| `sr6_a3.py` | `4d53ceb47d4c37f680834ef67c89fcbf7937032019ff8f1fcd517d5ab80faff5` | SR-C6-6b stratum checks (`RESULT_SHA256 fa14f7e2…2dcd`) |
| `a3_out.json` | `4d35a1fb8b7afa5b1a968bd2614168049444d84603b42733b4d1386a5d39fa67` | counters and guard cases |
| `a3_stdout.txt` | `7d9d7d3b39ee644e8adbc38d7c4cf7dfe7f0a480c7f1bc04faf5422df8eaf8b8` | run log (last lines) |
| `sr6_strata_types.py` | `85dfd21d343bd579eb83551ac7182f2ab82779b2177f95367d5df62ee1a4f49a` | target-row `(t, g)`-type recount (record) |
| `sr6_alias.py` | `7a823ef9a1592b5301f49839d5d6adf612d875ae95864d3226136f1170974d58` | alias and forbidden-phrase check |
| `alias_out.json` | `05feae555433bb521e084a31a031a749bf20d5b837a026dec02af720bae4b1f4` | alias-check output |
