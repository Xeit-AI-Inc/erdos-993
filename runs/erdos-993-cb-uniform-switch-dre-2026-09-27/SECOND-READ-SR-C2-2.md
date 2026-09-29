# Second Read

Isolated second read `SR-C2-2`, r31 Cycle 2 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`): the explicit criterion flow at
`p*` and the type-path inequalities. Written 2026-09-28, about 03:25–03:41 EDT by the clock.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file outside this run root. Subsystems loaded:
those two files only. I did not follow the task-type map into memory, logs, skills, decisions, operations or conversations; the
controller owns conversation logging for this run, and I wrote no conversation log.

## Identity and seal audit

| Object | Recomputed | Status |
|---|---|---|
| Protocol `control/C2-SECOND-READ-PROTOCOL.md` (file SHA-256) | `563877beef7a57b1fd71ef95f518998ec7598fc9f9328e28270f3405e85d9e82` | MATCH (dispatch value), verified before reading |
| Brief `control/C2-SECOND-READ-BRIEF-SR-C2-2.md` (file SHA-256) | `10499ec721175b82051a392b595c776c607f2a93b234cba7ecfd4e6f5e0c90d1` | MATCH (dispatch value), verified before reading |
| **Capsule seal** `control/c2-second-read/SR-C2-2-PACKET-MANIFEST.json` (SHA-256 of compact key-sorted JSON of the manifest minus `seal_sha256`, separators `(",", ":")`, no trailing newline) | **`792851eeae83e0e349921a686da1c79bd68dc4813d79dc5795b6011ce637b21a`** | MATCH (manifest field and dispatch value) |
| Capsule manifest file SHA-256 | `b820a6da5da63ac2627c235f1f9ade0259f7a22edbd1896bf881e7c766a987ef` | recorded |
| Capsule members (214 files; `run_id` `erdos-993-math-dre-20260927-r31-cb-uniform-switch`, stage `cycle-2-second-read-SR-C2-2`) | every SHA-256 recomputed | 214 MATCH, 0 missing, 0 mismatch |
| `sources/c2-stage7-sources/` members against that directory's `SOURCE-DIGESTS.json` (687 entries; 118 in the capsule) | recomputed | 118 MATCH, 0 mismatch; every capsule member of that directory is listed there |

**Statements of record read (capsule members).** `cycles/cycle-2/stage6/SYNTHESIS.md` (X-8, X-9, G-4, the struck/narrowed list);
T3's `RETURN.md`; the critiques `C-T3-F`, `C-T3-U` (in full), `C-F3-T` and `C-F3-U` (their condition (ii) sections); the T
adjudication (route T3, cross-route reconciliation, Group C); `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, r30's
`SEMANTIC-CONTRACT.md` (§1–2, for the aggregate and (WID) of record); the three controller-facts files. Registries: the run-local
snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c2-stage2.json` (497 claims), the frozen master `sources/authority/CLAIM-IDENTITY.json`
(491) and the concurrent master `sources/concurrent/master-494-2026-09-28/CLAIM-IDENTITY.json` (494), read by my own JSON queries
for the homogeneous criterion key (statement, scope and every note), the heterogeneous criterion key's proof of record, the
condition (i) threshold key's `[r31 C1; SR-2]` note and the block-product key's scope and certificate. The frozen seat and critic
instruments were digest-checked; none was run or used as evidence. The controller's alias pre-screen was not used.

**Read-boundary disclosures.**
1. The harness injected the project `CLAUDE.md`, the user memory index and the user's e-mail into my context before my first tool
   call. I did not open or use them.
2. An `echo` separator in one early shell call triggered a zsh `=`-expansion error (cosmetic; the second file of that call was
   displayed by a following call).
3. Two displays exceeded the tool's inline limit and the harness saved each to its own tool-output cache outside the run root
   (under the user's `.claude/projects/…/tool-results/`): the combined brief-and-manifest display (not opened there; I re-displayed
   the brief alone) and T3's `RETURN.md` (read there with the file reader). That copy is the capsule member's content; nothing else
   there was listed or opened.
4. Directory listings outside the capsule members, names only: one non-recursive `ls` of `control/c2-second-read/` (it showed the
   names of the other reads' manifests and path checks, `PATH-CHECK-SR-C2-{1,2,3,4,6}.json`, `SR-C2-{1,3,4,6}-PACKET-MANIFEST.json`
   and `SEALS.json`; none was opened), and `ls`/`shasum` inside my own scratch. `mkdir -p` created my scratch and output
   directories (no listing of `second-reads/`). No `find`, `rg`, `ls -R` or glob `cat` above the capsule members.
5. No network, no installs, no `lake`/`lean`, no Mathlib reads (none needed), no child agents, no `/tmp`. Everything ran in the
   foreground with `python3 -B`; no background job was started, so none was running at the final write; nothing was killed.

## Statements read

- **SR-C2-2a (X-8).** Given `C ⊆ F`, at `(8, m, p*)` on the class (`m ≥ 107`, `m ≡ 2 (mod 3)`, `p* = (16m+4)/3`): the explicit
  arc values `G_α/S_α` (active-tag deletion), `w·H_α/(β·S_α)` (closed-leg or arm deletion), 0 (choke deletion); nonnegative by
  (ii-1)/(ii-2); every `r`-free `q ≥ 1` source saturated; `r`-free `q ≥ 1` targets loaded at `ρ_q·w_F`, switch images at `ρ_1·γ`,
  every other target at 0. Synthesis grade `proved_informal` STATED (conditional on `C ⊆ F`). Origins: T3 (loads), C-T3-F and
  C-T3-U (arc values), the T adjudicator (in-balance), the criterion key (r30).
- **SR-C2-2b (X-9).** (ii-1) and (ii-2) for all `a, b ≥ 0`, every integer `j`, every `α ∈ [0, a]`. `proved_informal` on record
  (the criterion key's `[r30 C4; SR-C4-6]` note); new proof paragraphs STATED: T3 (ii-1); C-T3-F, C-T3-U (ii-2); C-F3-T, C-F3-U
  (re-derivations of the recorded proof).
- **SR-C2-2c (G-4).** The scope note on `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` beside the
  `[r30 C4; SR-C4-6]` note, with the correction that condition (i) at `p*` is `proved_informal` and its compiled form is a
  kernel-checked, ungraded companion.

Index of record used throughout: favorability at rank `p` is `Δ_p(T − w) = i_{p+1}(T − w) − i_p(T − w) < 0`. Nothing below depends
on favorability except through the hypothesis `C ⊆ F`.

## Independent re-derivation

All derivations below are mine, from the key's statement and proof of record and the contracts. My instruments (own code, standard
library, exact integers and `Fraction`) are under `scratchpad/c2-sr-SR-C2-2/`.

**D1. The weight on `r`-free sets (from the definitions).** `W_v = N(s) ∖ {v} = {r}`, `W_{c_ij} = N(b_ij) ∖ {c_ij} = {u_i}`. For
`r ∉ B`: `v` is inactive; `c_ij ∈ B ∩ F` is active iff `u_i ∈ B`. So with `C ⊆ F`, `w_F(B)` is the number of present private leaves
at chokes in `B` (whether `v ∈ F` is irrelevant). For `r ∈ B, v ∉ B`: every choke is absent (adjacent to `r`), so `w_F(B) = 0`.
A present vertex of an `r`-free `B` is exactly one of: a choke; a private leaf at a choke in `B` (active tag); a `b_ij` or `c_ij` at a
choke not in `B`; `s` or `v`. These four classes exhaust the deletion arcs out of `B`.

**D2. The clone correspondence (the key's proof of record, checked).** Fix `Q` (`|Q| = q ≥ 1`) and a mark `x = c_ij`, `i ∈ Q`. An
`r`-free set with choke set exactly `Q` containing `x`: at `i ∈ Q`, every `b_ij` is excluded and each other `c_ij` is free (Boolean;
`8q − 1 = a` coordinates); at `i ∉ Q`, each leg is in `{∅, b, c}` (ternary); the arm is in `{∅, s, v}` (ternary): `8(m − q) + 1 = b`
ternary coordinates. Every choice is independent. So these sets correspond one-to-one with `P_q = K(1)^a × K(2)^b` at rank
`|B| − q − 1`. A source at rank `p+1` gives clones at rank `j = p − q`; the clone type is `α = w − 1` (the other active tags) and its
ternary count is `ℓ = j − α = |B| − q − w`. The number of rank-`k` elements of type `α` is `N_q(α, k) = C(a, α)C(b, k−α)2^{k−α}`, so
`S_α = N_q(α, j)`, `T_α = N_q(α, j−1)`, `r_q(k) = Σ_α N_q(α, k)`. Deletions of neither the mark nor a choke are exactly the down-covers;
a target clone `(A, x)` has as up-covers exactly the additions of an absent Boolean coordinate (`a − α` of them) or a nonempty state of
an empty ternary coordinate (`2(b − ℓ')` of them, `ℓ' = j − 1 − α`).

**D3. Well-definedness at `p*`.** `j − 1 = p* − q − 1 ∈ [(13m+1)/3, (16m−2)/3] ⊆ [0, 8m − 1]` for `1 ≤ q ≤ m`, and `a + b = 8m`, so
`r_q(j−1) > 0` and `ρ_q := r_q(j)/r_q(j−1)` is defined. ℕ guards: `q ≥ 1` for `8q − 1`; `q ≤ m` for `8(m − q)`; `p* − q − 1 ≥ 0` since
`q ≤ m < p* − 1` (T3's `(13m+1)/3` "bound on `q`" is a slip for `(16m+1)/3`; `(13m+1)/3` is SR-2's lower bound on `t = j − 1`;
harmless). `α = w − 1 ≥ 0` and `ℓ = j − α ≥ 0` are counts of an existing source.

**D4. Type totals and their identities.** Put `Sc_α = Σ_{α'≤α} S_{α'}`, `Tc_α = Σ_{α'≤α} T_{α'}` (empty sums 0), and
`g_α := ρ_q·Tc_{α−1} − Sc_{α−1}`, `h_α := Sc_α − ρ_q·Tc_{α−1}` (the synthesis's and C-T3-U's `G_α`, `H_α`; C-T3-F's `g_α`, `h_α`; the
same expressions are printed in the proof of record of the heterogeneous key). Then, directly:
- `g_α + h_α = S_α` (telescoping);
- in-balance: `h_α + g_{α+1} = ρ_q(Tc_α − Tc_{α−1}) = ρ_q·T_α`;
- `g_0 = 0`; `g_{a+1} = ρ_q·r_q(j−1) − r_q(j) = 0`;
- if `ℓ = 0` (`α = j`): `Sc_j = r_q(j)` and `Tc_{j−1} = r_q(j−1)` (all later terms vanish), so `h_j = 0` identically.

**D5. Both biregular double counts.** Boolean: `S_{α+1}·(α+1) = T_α·(a − α)`, because `C(a, α+1)(α+1) = C(a, α)(a − α)` and both
sides carry `f(j−1−α)`, `f(t) := C(b, t)2^t`. It counts (source type `α+1`, target type `α`) Boolean cover pairs from each side
(`α+1` down-covers per source clone, `a − α` up-covers per target clone). Ternary: `S_α·ℓ = 2T_α·(b − ℓ')` with `ℓ = j − α`,
`ℓ' = j − 1 − α`, because `C(b, t)·t = C(b, t−1)(b − t + 1)` for every integer `t` (both sides 0 at `t ≤ 0` and `t = b+1`) and
`2^{t} = 2·2^{t−1}`. It counts ternary cover pairs (`ℓ` down-covers per source clone, `2(b − ℓ')` up-covers per target clone).

**D6. The arc values and the three flow clauses.** The type-symmetric transport sends, from each source clone of type `α`,
`g_α/(α·S_α)` along each Boolean down-cover and `h_α/(ℓ·S_α)` along each ternary down-cover. Summing over the marks of `B`:
- deleting an active tag `c`: the `α` marks other than `c` each use the arc once: `α·g_α/(α·S_α) = g_α/S_α` (for `α = 0` there is no
  other mark and `g_0 = 0`, consistent);
- deleting a closed-leg or arm vertex: all `w` marks use it: `w·h_α/(ℓ·S_α)`;
- deleting a choke, or any arc from a source containing `r`, or from an `r`-free source with `q = 0` or `w = 0`: 0.
The value depends only on `(q, w)` (and `p*`). `S_α > 0` whenever a source of type `α` exists; if `ℓ = 0` there is no closed-leg or
arm arc and `h_α = 0` (D4).
- **Rows.** `B` sends `w·g_α/S_α + ℓ·w·h_α/(ℓ·S_α) = w(g_α + h_α)/S_α = w = w_F(B)`. Weight-zero non-sector sources (`r ∈ B, v ∉ B`;
  `r`-free with `q = 0`, or `q ≥ 1` with no active tag) send 0 `= w_F`. So every NON-SECTOR source is saturated, which is the key's
  own clause; X-8's "every `r`-free `q ≥ 1` source" is the positive-weight part of it.
- **Columns.** A target clone `(A, x)` of type `α` receives `(a − α)·g_{α+1}/((α+1)S_{α+1}) + 2(b − ℓ')·h_α/((ℓ'+1)S_α)`, which by
  D5 is `g_{α+1}/T_α + h_α/T_α` (when `S_{α+1} = 0` with `α < a`, the common factor `f(j−1−α)` forces `T_α = 0`, so no such clone
  exists; when `a = α` the Boolean term is absent and `g_{a+1} = 0`; when `S_α = 0 < T_α` then `ℓ' = b`, no ternary up-cover exists,
  and `Sc_α = Tc_{α−1} = 0` so `h_α = 0`), and by the in-balance this is `ρ_q`. `A`'s clones are its `w_F(A)` active tags, so an
  `r`-free target with `q(A) ≥ 1` receives exactly `ρ_{q(A)}·w_F(A)`. A deletion image of an `r`-free source is `r`-free and a choke
  deletion carries 0, so every target containing `r` (in particular every in-sector target) and every `r`-free target with no choke
  receives 0.
- **Switch images.** A `u_i`-switch of a sector source at a choke in state `(1, γ)` removes `r` and the one present `b_ij` and adds
  `u_i`; the image is `r`-free with exactly one choke, and its active tags are the `γ` present `c_ij` at that choke, so it receives
  exactly `ρ_1·γ`; it has exactly `8 − γ` sector preimages (one per empty leg).
- **Nonnegativity.** Multiply by `r_q(j−1) > 0`: for `1 ≤ α ≤ a`, `g_α ≥ 0 ⇔ r_q(j)·Tc_{α−1} ≥ r_q(j−1)·Sc_{α−1}`, which is (ii-1)
  at `α − 1 ∈ [0, a−1]`; `h_α ≥ 0 ⇔ r_q(j−1)·Sc_α ≥ r_q(j)·Tc_{α−1}`, which is (ii-2) at `α ∈ [0, a]`. So nonnegativity follows from
  (ii-1)/(ii-2) exactly as stated, with this index shift for `g`.
- **Condition (i) is not an input of any of these clauses.** It enters only for capacity (`ρ_q·w_F(A) ≤ w_F(A)`).

**D7. (ii-1) and (ii-2) (X-9), re-proved.** Write `c(t) = C(a, t)`, `f(t) = C(b, t)2^t`; both are log-concave with contiguous support
(ratios `(a−t+1)/t` and `2(b−t+1)/t` decrease). Shared lemma: for such a sequence and integers `i < k ≤ l < n` with `i + n = k + l`,
`h(i)h(n) ≤ h(k)h(l)` (if the left side is positive, both outer indices and hence both inner ones lie in the support, and the ratio
monotonicity gives it; otherwise the left side is 0).
- (ii-1): for `x < y`, `S_x T_y ≤ S_y T_x` (cancel `c(x)c(y)`; the rest is `f(u)f(u'−1) ≤ f(u')f(u−1)`, `u = j−x > u' = j−y`). Summing
  `S_x T_y − S_y T_x ≤ 0` over `x ≤ α < y` gives `Sc_α(r(j−1) − Tc_α) − (r(j) − Sc_α)Tc_α = Sc_α r(j−1) − r(j)Tc_α ≤ 0`. This is
  T3's proof; I checked it line by line (its zero-case sentence is loose but true).
- (ii-2): for `x < y`, `S_x T_{y−1} ≥ S_y T_{x−1}` (cancel `f(j−x)f(j−y)`; the rest is `c(x)c(y−1) ≥ c(x−1)c(y)`). Summing over
  `x ∈ [0, α]`, `y ∈ [α+1, a+1]`, with `S_{a+1} = 0`, `T_{−1} = 0`, `Σ_{y=α+1}^{a+1} T_{y−1} = r(j−1) − Tc_{α−1}` and
  `Σ_{x=0}^{α} T_{x−1} = Tc_{α−1}`, gives `Sc_α(r(j−1) − Tc_{α−1}) − (r(j) − Sc_α)Tc_{α−1} = Sc_α r(j−1) − r(j)Tc_{α−1} ≥ 0`. This is
  C-T3-F's A1 (and C-F3-U's second inequality); correct.
- (ii-2), second route: `Sc_α = r(j) − Σ_{α'>α}S`, `Tc_{α−1} = r(j−1) − Σ_{α'≥α}T`, so (ii-2) ⇔ `r(j)Σ_{α'≥α}T ≥ r(j−1)Σ_{α'>α}S`;
  reindexing by the ternary count `β = rank − α'` (both sums become `β ≤ j − α − 1`) turns it into the (ii-1) shape with `c` in place
  of `f`. This is C-T3-U's (R3) and C-F3-T's reindexing (C-F3-T sums the upper tail `β ≥ j − α` of the same reindexing); both correct,
  and both are the "same argument in the ternary count" that the `[r30 C4; SR-C4-6]` note records.
- Degenerate `j`: for `j ≤ 0` every product in both inequalities vanishes (at `j = 0`, `r(0) = 1` but `T ≡ 0` and `r(−1) = 0`); for
  `j ≥ a + b + 1` likewise. No Darroch, no Newton, no ℕ-subtraction, no asymptotics: the only sequences are `C(a, ·)` and
  `C(b, ·)2^·`, never a tree or forest polynomial.

**D8. Condition (i) at `p*` and its companion (for G-4).** The registered grade is `proved_informal`: the `[r31 C1; SR-2]` note on
`E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` (strict, every `q ∈ [1, m]`, Darroch-
and Newton-free; gap `6(p*−q−1) − (3a+4b) = 2q + 1`, which I re-derived: `6p* − 6q − 6 − 24q + 3 − 32m + 32q − 4 = 2q + 1` using
`6p* = 32m + 8`). Its compiled form `E993Transport.cb8_E1_conditionI_topRank` is, per the registry, a companion lemma that "compile[s]
in the same file" as the formally verified terminal of r31 award C1-LA3 (key
`E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-BLOCK-PRODUCT-1-PLUS-X-TO-8J-TIMES-1-PLUS-2X-TO-8M-MINUS-8J-PLUS-1-COEFFICIENTS-STRICTLY-DESCEND-AT-INDEX-16M-MINUS-2-OVER-3-MINUS-J-FOR-5-LE-J-LE-M`,
`formally_verified`), with "no grade … asserted"; the Tier 1 key's scope says the same ("compiled as the companion … on the face
of award C1-LA3, no grade of its own"), and SOLUTION-CONTRACT §4 says a companion carries no certificate of its own. So T3's
"condition (i) `formally_verified`" and C-T3-F's "BACKED" are wrong, and the T adjudicator's ruling for C-T3-U is right. The award's
kernel receipt is not a capsule member; "kernel-checked" rests on the registry's record that the companion compiles in the verified
award's file.

**D9. Literal test (`sr2_literal.py`; max-flow-free; `bounded_computation`).** Nine literal trees `CB(d, m)`, `(d, m)` ∈ {(2,2),
(3,2), (2,3), (8,1), (4,2), (1,5), (3,3), (2,4), (6,2)}, `n ≤ 29`, built from the labelling of record (generalized `u_i = 3 + (2d+1)i`):
- tree tests (`|E| = n − 1`, BFS connectivity); every independent set enumerated; enumeration layer sizes equal an independent forest
  DP at every rank; `x` computed through `α`;
- **fidelity first, at all 90 ranks `1 ≤ p < α`:** `F_p` derived by the strict literal test `i_{p+1}(T−v) − i_p(T−v) < 0` (forest
  DP), `S(T, p) = Σ_{v∈F_p}[Δ_{p−1}(T − H_v) − Δ_{p−1}(T − R_v)]` from the DP, and supply − capacity from the enumeration with the
  literal active-tag weight (`(B ∖ {t}) ∩ W_t ≠ ∅`): equal at 90/90;
- the explicit `f` applied arc by arc (active-tag test done literally, not by label) at the 66 ranks with `p ≥ m + 1` and every class
  defined, for `F` = derived `F_p` (44 ranks with `C ⊆ F_p`), `F = leafSet` and `F = C`; `r_q` computed two ways
  (`Σ_α C(a,α)C(b,k−α)2^{k−α}` and `Σ_i C(b,i)C(a+b−i, k−i)`), equal everywhere;
- results (all three choices of `F`): 0 negative arcs; 0 cases where the number of non-choke, non-tag present vertices differs from
  `ℓ = j − α`; 0 row-sum failures on non-sector sources (0 positive-weight `r ∈ B, v ∉ B` sources); 0 column-sum failures
  (`= ρ_q·w_F`) on 267,181 / 444,421 / 444,421 class targets; 0 nonzero loads on other targets; 0 failures on 75,758 / 119,352 /
  119,352 literal `u_i`-switch images (built by the (S) relation: load `ρ_1·γ`, weight `γ`, one choke, `r`-free, `v` present,
  `d − γ` sector preimages); `F = C` and `F = leafSet` give identical totals (the arm tag is irrelevant); over-capacity targets occur
  only at the 34 ranks where condition (i) fails (0 at the 32 criterion ranks);
- literal clone census: at every flow rank and every `q`, the number of literal source/target clones of type `α` equals
  `C(m,q)·dq·S_α` / `C(m,q)·dq·T_α`, and the literal Boolean and ternary cover-pair counts equal `C(m,q)·dq·α·S_α` and
  `C(m,q)·dq·(j−α)·S_α`, matching both double-count identities: 0 failures;
- mutation control (ternary divisor `ℓ + 1`): failures at 6 of 8 rows of `CB(3,2)` (the other two are `p < m + 1`, not run). Runtime
  57 s.

**D10. Class rows (`sr2_class.py`; the clone quotient; `bounded_computation`).** `d = 8`, `p* = (16m+4)/3`,
`m ∈ {95, 107, 110, 113, 116, 119, 125, 128, 140}` (125, 128, 140 fresh for this read; 95 contract fixed point, off-class):
condition (i) strict at every `q`; `r_q` two ways; in cleared integers `g'_α = r(j)Tc_{α−1} − r(j−1)Sc_{α−1}`,
`h'_α = r(j−1)Sc_α − r(j)Tc_{α−1}` nonnegative at every `(q, α)`; `g'_0 = g'_{a+1} = 0`; `h' = 0` at `ℓ = 0`; `g' + h' = r(j−1)S_α`;
`h'_α + g'_{α+1} = r(j)T_α`; both biregular identities: 0 failures. `ρ_q` strictly decreasing in `q`, `max ρ_q < 1`. `ρ_1` values:
95 `1354839571516225/1361543988640524` (the contract's fixed point, MATCH), 107 `5150844596024699/5173467627355748`,
110 `2027991913051965/2036655530990516`, 113 `27820794945950193/27936482886870172`, 116 `58633895019037705/58871393306616916`,
119 `3255975423927033/3268830598665580` (each equal to the critics' reported values; my code is independent), 125
`125082229581739/125552319952916`, 128 `25247668247805897/25340326629755188`, 140 `8658257094768325/8687303742996804`;
`(1 − ρ_1(107))/(96/766193) = 34.9009` (contract prior). Smallest normalized ternary total `h_α/S_α` over `ℓ ≥ 1`: `1.29×10⁻³`
(107) down to `0.99×10⁻³` (140), all positive. Grid: (ii-1)/(ii-2) at every `a, b ≤ 22`, integer `j ∈ [−2, a+b+2]`, `α ∈ [0, a]`
(194,672 checks) and the two pointwise product inequalities for every `x < y ≤ a+1` (1,719,250 checks): 0 failures; mutation
(strict prefix `α' < α` replaced by `α' ≤ α` in (ii-2)) fails 1,620 of 5,805 checks. Runtime 31 s.

These computations corroborate; they prove nothing universal. The proof is D2–D7.

## Findings and repairs

1. **X-8 is correct; its notation must not be registered as written.** `G_α`/`H_α` collide with the CB polynomial
   `G = (1+2x)^8 + x(1+x)^8` of the contracts, and `β` (the source's closed-leg/arm count) collides with the choke state `(β, γ)` of
   SEMANTIC-CONTRACT §2, which the same registration sentence uses for switch images. The registry already prints the type totals as
   lowercase `g_α`, `h_α` (heterogeneous key's proof of record). **Repair:** register with `g_α`, `h_α` and `ℓ := j − α`.
2. **Saturation clause, scope.** X-8 says "saturates every `r`-free `q ≥ 1` source"; the key's clause is "every non-sector source".
   Both hold (the remaining non-sector sources have weight 0). **Repair:** state the key's clause.
3. **Nonnegativity indexing.** "Nonnegative by (ii-1)/(ii-2)" is right, with `g_α ≥ 0` being (ii-1) at `α − 1` (and `g_0 = 0`),
   `h_α ≥ 0` being (ii-2) at `α`. Written on the note's face.
4. **Condition (i) is not an input of X-8.** The arc values, rows, columns and zeros need only the clone correspondence, D4–D5 and
   (ii); condition (i) is the capacity step `ρ_q ≤ 1`. Written on the note's face, so the grade of X-8 carries no dependency on it.
5. **Type totals are not new.** `g_α`, `h_α` appear verbatim in the heterogeneous key's proof of record, and "summing clones gives
   `f`" is in the homogeneous key's. The per-arc closed form in `(q, w)` and the written (ii-2) proofs are new text, not a new
   predicate: a new key would be a mathematical alias of the criterion key. Scope note, as the synthesis rules.
6. **Attribution on X-8/G-4 is incomplete.** The synthesis's G-4 face lists T3, C-T3-F, C-T3-U and r30. **Repair:** add the r31 T
   adjudicator (in-balance and double-count check; the condition (i) grade ruling), C-F3-T and C-F3-U (independent re-derivations of
   the recorded (ii) proof, which X-9 already credits), r30 for the type totals and the criterion, Codex for the network, weight,
   relation and (HALL), and this read.
7. **Condition (i) grade correction (G-4) confirmed** (D8), phrased as the registry records it; "kernel-checked" rests on the
   registry's statement that the companion compiles in the verified award's file (the receipt is not in my capsule).
8. **Cosmetic, no action:** the T adjudication defines `G_α, H_α` and then writes `h_{α'} + g_{α'+1}`; T3's `(13m+1)/3` slip (D3);
   T3's (ii-1) zero-case sentence is loose but true; the `[r30 C4; SR-C4-6]` note's "for `j ≤ 0` every term vanishes" is true of every
   product (at `j = 0`, `r(0) = 1`).
9. **Struck items stay struck** and are not used here: T3's "EXPLICIT" (loads only), its skeleton without `0 ≤ f` and its per-target
   corollary, its Part C, "condition (i) `formally_verified`", `HALL_formal: advanced`, and "(ii-2) not found from the crossing sum".
10. **Fences.** One rank (`p*`), the class only, `d = 8`; no status transfer to (HALL), the primary aggregate, TREE, FOREST, TRANSFER
    or #993; no Darroch or Newton; no census value as a premise; no refuted mechanism (this is the key's registered type-path transport,
    distinct from the rows `R30-C3-E1-VS-PER-LEAF-DOWN-MAP-INJECTIVITY`, `R30-C3-E1-VS-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT`,
    `R30-C3-E1-VS-R23-LITERAL-DELETE-ONLY-HALL`). `C ⊆ F_{p*}` stays a separate obligation.
11. **Alias check.** No new key is proposed. The target key is spelled identically in the run-local snapshot (497), the frozen master
    (491) and the concurrent master (494). No working label (X-8, X-9, CD-2 as a name, Lemma DF, E1, E1-R, S1..S9, R-n) is used as
    a name in the registration text; notes are cited by their bracket tags; r30 content is named by key.

## Registration text

```text
SCOPE NOTE ON: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL
TEXT: [r31 C2; SR-C2-2] Explicit arc values of this key's flow, and both type-path inequalities written out, at d = 8, for every integer m >= 107 with m ≡ 2 (mod 3) and the single rank p = p* = (16m + 4)/3. Let F be any leaf set with C ⊆ F. For an r-free B ∈ I_{p*+1}(T) with q := |B ∩ {u_1..u_m}| >= 1 and w := w_F(B) >= 1 (w is the number of present private leaves at chokes in B), put a := 8q − 1, b := 8(m − q) + 1, j := p* − q, α := w − 1 and ℓ := j − α (the number of present vertices of B that are b_{ij} or c_{ij} at chokes not in B, or s, or v); with S_α := N_q(α, j), T_α := N_q(α, j − 1) and r_q as in this key's statement, ρ_q := r_q(j)/r_q(j − 1), g_α := ρ_q·Σ_{α' < α} T_{α'} − Σ_{α' < α} S_{α'} and h_α := Σ_{α' <= α} S_{α'} − ρ_q·Σ_{α' < α} T_{α'} (the type totals printed in the proof of record of E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL), the flow of this key is f(B, B ∖ {z}) = g_α/S_α when z is a present private leaf at a choke in B (an active tag), f(B, B ∖ {z}) = w·h_α/(ℓ·S_α) when z is a present b_{ij} or c_{ij} at a choke not in B or z ∈ {s, v}, f(B, B ∖ {u_i}) = 0, and f = 0 on every arc from a source containing r and from every r-free source with q = 0 or w = 0; the values depend only on (q, w). Proof (elementary; no import). (1) r_q(j − 1) > 0 since 0 <= (13m + 1)/3 <= j − 1 <= (16m − 2)/3 < 8m = a + b; S_α > 0 whenever a source of type α exists; if ℓ = 0 there is no such arc and h_α = 0 identically. (2) Rows: g_α + h_α = S_α, so B sends w·g_α/S_α + ℓ·w·h_α/(ℓ·S_α) = w = w_F(B); every other non-sector source has weight 0 and sends 0, so every non-sector source is saturated. (3) Columns: by this key's clone correspondence f is the clone sum of the type-symmetric transport on K(1)^a × K(2)^b that sends g_α/(α·S_α) along each Boolean and h_α/(ℓ·S_α) along each ternary down-cover of a type-α clone; a target clone of type α at rank j − 1 has a − α Boolean and 2(b − (j − 1 − α)) ternary up-covers, and the biregular double counts S_{α+1}·(α + 1) = T_α·(a − α) and S_α·(j − α) = 2·T_α·(b − (j − 1 − α)) (from C(a, α + 1)(α + 1) = C(a, α)(a − α) and C(b, t)·t = C(b, t − 1)(b − t + 1)) make its inflow (g_{α+1} + h_α)/T_α, which equals ρ_q by the in-balance h_α + g_{α+1} = ρ_q·T_α (g_0 = 0 and g_{a+1} = 0 close the path). Hence every r-free target A with q(A) >= 1 receives exactly ρ_{q(A)}·w_F(A); every target containing r (every sector target included) and every r-free target with no choke receives 0; and the u_i-switch image of a sector source at a choke in state (1, γ), which is r-free with one choke and w_F = γ, receives exactly ρ_1·γ. (4) Nonnegativity: multiplied by r_q(j − 1) > 0, g_α >= 0 (1 <= α <= a) is the first type-path inequality at α − 1 and h_α >= 0 is the second at α. (5) The type-path inequalities of this key's [r30 C4; SR-C4-6] note, written out, for all integers a, b >= 0 and j and every α ∈ [0, a]: with c(t) := C(a, t) and f(t) := C(b, t)·2^t, both log-concave with contiguous support, S_x·T_y <= S_y·T_x for x < y (after cancelling c(x)c(y) it reads f(j − x)f(j − 1 − y) <= f(j − y)f(j − 1 − x)), summed over x <= α < y, gives the first; S_x·T_{y−1} >= S_y·T_{x−1} for x < y (after cancelling f(j − x)f(j − y) it reads c(x)c(y − 1) >= c(x − 1)c(y)), summed over x ∈ [0, α] and y ∈ [α + 1, a + 1], gives the second, as does passing to complements and reindexing by the ternary count j − α, which is the argument that note names. Condition (i) is not an input of (1)–(5); it enters only as the capacity step ρ_q <= 1, which makes each load at most w_F(A). At these (d, m, p) condition (i) holds strictly by the [r31 C1; SR-2] note on E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD, at grade proved_informal (Darroch- and Newton-free); its compiled form E993Transport.cb8_E1_conditionI_topRank is a companion lemma compiled in the kernel-verified Lean file of r31 award C1-LA3 (the terminal of E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-BLOCK-PRODUCT-1-PLUS-X-TO-8J-TIMES-1-PLUS-2X-TO-8M-MINUS-8J-PLUS-1-COEFFICIENTS-STRICTLY-DESCEND-AT-INDEX-16M-MINUS-2-OVER-3-MINUS-J-FOR-5-LE-J-LE-M) and carries no grade of its own; a face that reads condition (i) at p* as formally_verified is corrected to this. Grade of this note: proved_informal; inputs this key's proof of record and its [r30 C4; SR-C4-6] note; no Darroch, no Newton, no truncated ℕ subtraction, no cutoff M_0, no asymptotic step. F_{p*}(T) ⊇ C remains a separate obligation, supplied at the grade of the record that supplies it; this note does not discharge it. Scope: this rank and class only; nothing is asserted at any other rank, at m ≡ 0 or 1 (mod 3), at m < 107, or for d ≠ 8. Not (HALL) and not a restricted-scope (HALL) theorem: sector families are outside this key; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL and E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE stay OPEN; TREE, FOREST, TRANSFER and Erdős #993 are untouched; no status transfers. Bounded support, not proof: record R31-C2-SR-C2-2-EXPLICIT-FLOW-LITERAL-AND-CLASS-CHECKS. Attribution: T3 (r31 Cycle 2, Claude Sonnet 5; the specialization of this key's loads at (8, m, p*), the switch-image load ρ_1·γ, and the proof of the first type-path inequality); C-T3-F and C-T3-U (r31 Cycle 2, Claude Opus 5.5; the explicit arc values, identical, and the written proofs of the second type-path inequality); C-F3-T and C-F3-U (r31 Cycle 2, Claude Opus 5.5; independent re-derivations of the recorded type-path proof); the r31 Cycle 2 T adjudicator (Claude Opus 5.5; the in-balance and double-count check and the condition (i) grade ruling); isolated second read SR-C2-2 (r31 Cycle 2, Claude Opus 5.5); this key, its criterion, its proof of record and its [r30 C4; SR-C4-6] note, and the type totals: r30, as registered on this key and on E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL; the transport network, the active-tag weight, the relation (D) ∪ (S) and (HALL): Codex (GPT-6 Astra/Sol/Luna), the lower-region run. This note changes neither this key's statement, grade nor fences.
```

```text
RECORD: R31-C2-SR-C2-2-EXPLICIT-FLOW-LITERAL-AND-CLASS-CHECKS
CLAIM: Exact checks of the [r31 C2; SR-C2-2] note on E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL. Literal: nine trees CB(d, m), (d, m) ∈ {(2,2), (3,2), (2,3), (8,1), (4,2), (1,5), (3,3), (2,4), (6,2)}, n <= 29, tree-tested; at all 90 ranks 1 <= p < α, F_p derived by i_{p+1}(T − v) − i_p(T − v) < 0 and supply − capacity = S(T, p) asserted first from independent sides (enumeration with the literal active-tag weight; forest-DP aggregate); at the 66 ranks with p >= m + 1 the explicit arc values applied arc by arc for F = derived F_p (44 ranks with C ⊆ F_p), F = leafSet and F = C: 0 negative arcs, 0 row-sum failures on non-sector sources, 0 column-sum failures (ρ_q·w_F) on 267,181 / 444,421 / 444,421 class targets, 0 nonzero loads elsewhere, 0 failures on 75,758 / 119,352 / 119,352 literal u_i-switch images (load ρ_1·γ, weight γ, d − γ sector preimages), 0 literal clone-census and cover double-count failures; over-capacity only at the 34 ranks where condition (i) fails; a mutated ternary divisor fails. Class: d = 8, p* = (16m + 4)/3, m ∈ {95, 107, 110, 113, 116, 119, 125, 128, 140}: condition (i) strict at every q; g_α, h_α >= 0 and every identity at every (q, α); ρ_q strictly decreasing in q; ρ_1(95) equals the contract's fixed point. Grid: both type-path inequalities at every a, b <= 22, j ∈ [−2, a + b + 2], α ∈ [0, a] (194,672 checks) and 1,719,250 pointwise product checks, 0 failures; a mutated prefix fails. Corroboration only, never a proof of the universal statement.
STATUS: bounded_computation
PROVENANCE: isolated second read SR-C2-2 (r31 Cycle 2, Claude Opus 5.5); scratchpad/c2-sr-SR-C2-2/sr2_literal.py (b5512f0561dcb5f358096f6d40a7f2eb31a3c25c2e2b5ac3233d8768b1c16a95; output sr2_literal.out.json 3e5da20aa8d037ffaffd3401d84ed892b3e799f008238a7e6800295087684ce6) and sr2_class.py (7938189c9fc30dbab9fe9e88c3515c3134f712c4c4e1688a0e5b78bd92c8e315; output sr2_class.out.json 45659876d7d391eaa4c8a8c03cfbf21936b9a6b3908d3e14ee4ae6a0a9088939); Python standard library, exact integers and Fraction.
```

No `KEY:` block is proposed: X-8 and X-9 are recorded by the scope note above (a new key would be an alias of the criterion key),
and no `DISTINCTION ROW` is needed (the key's existing rows already separate its transport from the refuted mechanisms).

## Verdicts

verdict[SR-C2-2a]: confirmed_with_repairs
verdict[SR-C2-2b]: confirmed
verdict[SR-C2-2c]: confirmed_with_repairs

- SR-C2-2a (X-8): the mathematics is correct and complete at `proved_informal` for every `F ⊇ C`; repairs are to the registration
  text only (notation `g_α, h_α, ℓ`; the key's "every non-sector source" clause; the nonnegativity index shift; condition (i) marked
  as the capacity step only; attribution completed). `C ⊆ F_{p*}` remains a separate obligation.
- SR-C2-2b (X-9): (ii-1) and (ii-2) hold for all `a, b ≥ 0`, every integer `j`, every `α ∈ [0, a]`; the grade on record
  (`proved_informal`, the `[r30 C4; SR-C4-6]` note) is unchanged; T3's (ii-1) proof and the four (ii-2) write-ups are correct. Its
  registration is paragraph (5) of the note above; nothing else is registered for it.
- SR-C2-2c (G-4): the note is warranted on this key; the condition (i) correction is confirmed; repairs as in findings 1–7 (the exact
  text is above).

## Artifact inventory

Scratch root `scratchpad/c2-sr-SR-C2-2/` (under the run root). Python 3 standard library only (`math.comb`, `fractions`, `json`,
`hashlib`, `collections`, `sys`), exact arithmetic, `python3 -B`, foreground.

| Path | SHA-256 | Role |
|---|---|---|
| `scratchpad/c2-sr-SR-C2-2/sr2_literal.py` (15,934 B) | `b5512f0561dcb5f358096f6d40a7f2eb31a3c25c2e2b5ac3233d8768b1c16a95` | D9: literal trees, forest DP, derived `F_p`, (WID) first, explicit arc values arc by arc, switch images, clone census and double counts; `mutate` control |
| `scratchpad/c2-sr-SR-C2-2/sr2_literal.out.json` | `3e5da20aa8d037ffaffd3401d84ed892b3e799f008238a7e6800295087684ce6` | its output (per-row records and totals; 57 s) |
| `scratchpad/c2-sr-SR-C2-2/sr2_literal.mutate.txt` | `32500c23370e174d4e0c5bdb6dae3fd53c4174f2f973a445d957dbb843e39714` | mutation control output (6 of 8 rows fail) |
| `scratchpad/c2-sr-SR-C2-2/sr2_class.py` (6,022 B) | `7938189c9fc30dbab9fe9e88c3515c3134f712c4c4e1688a0e5b78bd92c8e315` | D10: (ii-1)/(ii-2) grid and pointwise lemmas; class rows at `p*` |
| `scratchpad/c2-sr-SR-C2-2/sr2_class.out.json` | `45659876d7d391eaa4c8a8c03cfbf21936b9a6b3908d3e14ee4ae6a0a9088939` | its output (31 s) |
| `scratchpad/c2-sr-SR-C2-2/sr2_class.mutate.txt` | `2e12e8a125c8e5471c1891e7695ae5c864f6a3f2a570b8712f602e2d031d9479` | mutation control output (1,620 of 5,805 fail) |
| `second-reads/SR-C2-2/SECOND-READ.md` | (this file) | the deliverable |

Replay: from `scratchpad/c2-sr-SR-C2-2/`, `python3 -B sr2_literal.py`, `python3 -B sr2_literal.py mutate`, `python3 -B sr2_class.py 22`,
`python3 -B sr2_class.py mutate`. No sealed member was edited. No background job was started; none was running at the final write.
This file was reread before close.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5
