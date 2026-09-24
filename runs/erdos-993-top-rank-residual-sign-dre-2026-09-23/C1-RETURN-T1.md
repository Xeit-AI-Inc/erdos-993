# RETURN — Route T1, Cycle 1, r26 (top-rank residual sign)

Route ID: `C1-T-01 RC-FULL-PROOF-LEAN-READY`. Orientation `T` (prove). Mechanism fingerprint:
`RC-FULL-PROOF-LEAN-READY`. Load-bearing obligation: `C1-ALLOCATION.md` numbered item 1 (derive
`(RC)` from scratch at the exact scope, never by citing the packet, as a statement-level lemma DAG
covering items (a)-(f)).

**Model disclosure.** Chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter);
the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

## Boot acknowledgment

VerityOS booted this session by reading exactly the two authorized files and nothing else from the
startup protocol's own map (memory, conversations, modules, skills, logs, decisions were **not**
read): `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`.

## Read-boundary disclosure

None. Every file read this session was one of: the two boot files above; the packet members listed
in `control/C1-STAGE2-PACKET-MANIFEST.json` that this route's mandate required (see file list below);
`control/SOURCE-DIGESTS.json`; and this route's own scratch files under
`scratchpad/c1-T1/` and `scratchpad/c1-T1-replay/`. No `find`/`grep`/`rg`/`ls -R`/glob `cat` was run
rooted above the grant; the two targeted `grep -n` invocations used in this session were each pointed
at one specific file already inside the Stage 2 packet's `sources/literature-packet/` grant
(`RC-CANDIDATE-CHECK.json`), not a recursive listing.

## Stage 2 seal verification

Recomputed SHA-256 of the canonical JSON of `control/C1-STAGE2-PACKET-MANIFEST.json` without its
`seal_sha256` field (`sort_keys=True`, separators `(",",":")`, no trailing newline):

```
MANIFEST_SEAL_STATED     = c97e121561a7b63cef93312f22f60cfa2097b916f264bfb8ebff52cb68ee9de3
MANIFEST_SEAL_RECOMPUTED = c97e121561a7b63cef93312f22f60cfa2097b916f264bfb8ebff52cb68ee9de3
MATCH = True
```

Every one of the 79 entries in `control/SOURCE-DIGESTS.json` was re-hashed against the bytes on disk
under `sources/` (byte count and SHA-256 both matched, 79/79), and `control/CLAIM-IDENTITY.run-local.json`
was independently re-hashed against its `C1-STAGE2-PACKET-MANIFEST.json` entry (matched). Generator:
`scratchpad/c1-T1/verify_seal.py` (IMPORT LIST: `json, hashlib, os, sys`). Digest of the script as
copied to the replay directory: `fc10675e10bfde26d1ac6caf79d9d32e18e1fda20f0f7fd926700c9dcaf1ee61`.

Replay (copy-out-first):
```
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-top-rank-residual-sign-dre-2026-09-23/scratchpad/c1-T1/verify_seal.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-top-rank-residual-sign-dre-2026-09-23/scratchpad/c1-T1-replay/verify_seal.py
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-top-rank-residual-sign-dre-2026-09-23
python3 scratchpad/c1-T1-replay/verify_seal.py
```
Re-run during this session; output reproduced `OVERALL_VERIFICATION_PASS = True` identically.

## Files read (Stage 2 packet members used by this route)

`AUTHORIZATION.md`, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C1-ALLOCATION.md`,
`control/C1-STAGE1-GATE.md`, `control/R26-CHARTER-PROMPT.md`, `control/SOURCE-DIGESTS.json`,
`control/CLAIM-IDENTITY.run-local.json`, `control/C1-WORKER-COMMON-BRIEF.md`,
`cycles/cycle-1/stage2/ROUTE-STATE.md`, `sources/r24/c5-la1/THEOREM-CONTRACT.yaml`,
`sources/r24/c5-la1/INFORMAL-PROOF.md`, `sources/r24/c4-la1/INFORMAL-PROOF.md`,
`sources/r24/r23-evaluator/ordinary_tree.py` (read only; never imported or executed — see
IMPORT LISTs below), `sources/literature-packet/agents/05-RC-CANDIDATE-PROOF.md`,
`sources/literature-packet/agents/05-top-rank-residual.md`,
`sources/literature-packet/RC-CANDIDATE-CHECK.json` (read for the fixed-point discrepancy check in
§4 below — used strictly as a cross-reference input under attack, never cited as proof evidence).

## 1. Registered claims this route touches or would re-confirm (named before any census)

- `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` — status `OPEN` in the run-local registry (363
  claims, seal-verified above). Statement of record: *"For every finite ordinary tree T and every
  natural p>=x(T)+2, sum over all favorable ORIGINAL leaves v ... of [...] <= 0."* This is the
  **all-rank, non-residual-restricted** aggregate sign. `(RC)` (this route's target) is the special
  case `p = α(T)-1` restricted to the class additionally satisfying `hyp-residual (★)`. Proving
  `(RC)` does **not** close this claim; it remains OPEN (other ranks, and the non-residual class at
  every rank including the top rank, are untouched by anything in this return).
- `E993-BETA-AGG` — status `OPEN`, scope is the **governed `RTree`** aggregate, a different carrier
  requiring the ordinary-to-`RTree` transport bridge, never attempted here. Untouched.
- No other registered claim is touched. Independent alias check (below) found no existing claim that
  already states `(RC)` at its exact scope.

## 2. Alias check (lexical AND mathematical) — run before any census

Generator: `scratchpad/c1-T1/alias_check.py` (IMPORT LIST: `json, hashlib, os`). Loads
`control/CLAIM-IDENTITY.run-local.json` once (363 claims) and searches in memory.

- **Lexical**: scanned every claim's `claim_key`, `aliases`, and `alias_patterns` fields for tokens
  `R26`, `TOP-RANK-RESIDUAL`, `RESIDUAL-SIGN`. Zero hits. No existing claim key or declared alias
  collides with the candidate key `E993-R26-TOP-RANK-RESIDUAL-SIGN`.
- **Mathematical**: scanned every claim's `statement`/`title`/`description` text for the combination
  (`residual` or `favorable-leaf`) AND (`aggregate` or `top-rank`). One hit:
  `E993-C3-CB8-92-ORDINARY-RANK-SCOPE-CERTIFICATE` (`VERIFIED`) — a certificate about one **specific**
  witness tree (`n=1567`, a `CB(8,92)` construction) at one specific rank `p=492`, not a universal
  claim and not an alias for `(RC)`. No conflict.
- Confirmed distinct from `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (broader: all ranks, no
  residual restriction) and `E993-BETA-AGG` (different carrier, `RTree`, ungoverned bridge).
- `E993-R26-TOP-RANK-RESIDUAL-SIGN` is confirmed a genuinely new candidate key, properly a sub-case of
  the still-OPEN `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`.

Replay (copy-out-first):
```
cp .../scratchpad/c1-T1/alias_check.py .../scratchpad/c1-T1-replay/alias_check.py
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-top-rank-residual-sign-dre-2026-09-23
python3 scratchpad/c1-T1-replay/alias_check.py
```
Script digest: `0d95530d2437d7d3d786ab77adf6aa532918eafe07329d71ea5b4f58c99a771b`.

## 3. The derivation, from scratch, step by step (claim ledger)

Throughout: `G` a finite ordinary tree (`hyp-tree`: `G.IsTree`), `α := G.indepNum`, `hyp-alpha: 2 ≤
α`, `x(G)` the crossing index, `hyp-eligible: x(G)+2 ≤ α-1`, `hyp-residual (★)`: every leaf in every
maximum independent set. `L`, `ℓ`, `C(G)`, `D`, `λ`, `a`, `M`, `H_v`, `R_v`, `S(G,p)` exactly as
`SEMANTIC-CONTRACT.md` §1. `(RI)` (formally verified, `C5LA1.topRankResidualIdentity`) is used as a
cited fact of record, never re-derived here: `S(G,α-1) = ℓM - W`, `W := Σ_{B∈I_{α-1}(G)} w(B)`,
`w(B) := |B∩L| - Σ_{s∈B} λ(s)`. **Target**: `W ≥ ℓM` (equivalent to `(RC)` via `(RI)`).

Every claim below is stated with the hypotheses it actually uses, named explicitly. None of steps
`L0`–`L11` below cites the literature packet's proof as evidence; each is re-derived independently
from the definitions and cross-checked against an exhaustive small-order census in §4.

**`L0` (`ℕ`-subtraction audit).** `α - ℓ` (defining `a`), `a - |A_D|`, `λ(s) - 1` for `s∈C`, and
`ℓ - Q(A_C) - |B∩L|` (defining `h`) are each proved non-truncating (the smaller operand is proved
`≤` the larger) at the point each is introduced in `L1`–`L4`, never assumed.

**`L1` (leaf/support disjointness).** *Uses `hyp-tree`, `hyp-alpha`.* The only tree with two adjacent
leaves is `K_2` (`α=1`): in a connected graph, an edge with both endpoints of degree 1 cannot have
any other vertex attached without raising one endpoint's degree, so it is the whole graph. Since
`α≥2`, `G≠K_2`, so no leaf is adjacent to a leaf, hence `L∩C(G)=∅` (a support is by definition
adjacent to a leaf, so cannot itself be a leaf). Distinct supports have disjoint leaf-neighbourhoods
(a leaf has a unique neighbour, so belongs to exactly one support's fibre), hence `Σ_{s∈C}λ(s)=ℓ`
exactly, and `V = L ⊔ C ⊔ D` (a genuine partition, not just a naming convention). *Lean anchor:*
`IsTree.card_edgeFinset` region; matches T3(ii)-(iii)'s independent scope.

**`L2` (tree leaf count `ℓ≥2`).** *Uses `hyp-tree`, `hyp-alpha`.* `hyp-alpha` forces `n=|V|≥3`
(`n≤2` gives `α≤1`). Degree-sum `Σdeg=2(n-1)` for a tree; if `≤1` vertex had degree 1, the other
`≥n-1` vertices (degree `≥2` each, since non-leaves have degree `≥2` in a tree) would force
`Σdeg≥2(n-1)+ε>2(n-1)` for `n≥2`, contradiction. Hence `ℓ≥2`. This rules out `ℓ≤1` entirely: it
**cannot occur** under `hyp-tree, hyp-alpha`.

**`L3` (Fact 1: `α=ℓ+a`, max-set bijection, `M=i_a(T[D])`).** *Uses `hyp-tree`, `hyp-alpha`,
`hyp-residual`.* For every maximum independent `S`: `(★)` gives `L⊆S`; `L∩C=∅` (`L1`) plus every
`c∈C` adjacent to some leaf in `L⊆S` forces `S∩C=∅`; hence `S∖L⊆D`, independent, of size
`α-ℓ=:a` (non-truncating since `ℓ=|L|≤|S|=α`). Conversely every independent `J⊆D` gives `L∪J`
independent (no `L`–`D` edges, since `D` is defined as the complement of `L∪C` and `C` is exactly the
set of leaf-adjacent vertices) of size `ℓ+|J|`; taking `J` maximum in `T[D]` (size `α(T[D])`) gives
`ℓ+α(T[D])≤α`, and the forward direction gives `α(T[D])≥α-ℓ`; combined, `α(T[D])=α-ℓ=a`. The maps
`S↦S∖L` and `J↦L∪J` are mutually inverse between maximum independent sets of `G` and maximum
independent subsets of `T[D]`, so `M=i_α(G)=i_a(T[D])`. *Lean anchor:* matches T1-allocation item
(a) verbatim; reuses no r24 lemma beyond the already-verified `(RI)`'s carrier definitions.

**`L4` (budget identity, purely algebraic from `L3`).** *Uses `L1`, `L3` only (no new hypothesis).*
For `B∈I_{α-1}(G)`: `V=L⊔C⊔D` (`L1`) gives the tautological count `|B|=|B∩L|+|A_C|+|A_D|`
(`A_C:=B∩C`, `A_D:=B∩D`). Combined with `|B|=α-1=ℓ+a-1` (`L3`) and the definition
`h:=ℓ-Q(A_C)-|B∩L|` (`Q(A_C):=Σ_{s∈A_C}λ(s)`), pure algebra gives
`(a-|A_D|) + Σ_{s∈A_C}(λ(s)-1) + h = 1`. **`h≥0` is a lemma, not a definition-by-fiat**: every leaf
adjacent to some `s∈A_C⊆B` is excluded from `B` by independence, and there are exactly `Q(A_C)`
such leaves (disjoint fibres, `L1`), so `B∩L⊆L∖{those Q(A_C) leaves}`, giving
`|B∩L|≤ℓ-Q(A_C)`, i.e. `h≥0`. `a-|A_D|≥0` since `A_D` is independent in `T[D]`, hence `|A_D|≤a`.
`λ(s)-1≥0` since `s∈C` has `λ(s)≥1` by definition of `C(G)`.

**`L5` (exhaustive, exclusive three-family classification).** *Pure `ℕ`-arithmetic from `L4`.* Three
non-negative summands sum to `1` iff exactly one equals `1` and the other two (and every term inside
the `Σ_{s∈A_C}` group) equal `0`. This gives exactly three mutually exclusive, jointly exhaustive
cases: **(I)** `a-|A_D|=0`, `A_C` all-`λ=1`, `h=1`; **(II)** `a-|A_D|=0`, exactly one `s∈A_C` has
`λ(s)=2` and no other `s∈A_C`, `h=0`; **(III)** `a-|A_D|=1`, `A_C` all-`λ=1`, `h=0`. At `a=0`:
`|A_D|≤a=0` forces `a-|A_D|=0` always, so family (III) (`a-|A_D|=1`) is **provably empty**, not
merely "excluded by convention" — this closes the `a=0` edge case named in T1-allocation item (c).

**`L6` (forced-neighbour lemma).** *Uses `hyp-tree`, `hyp-alpha`, `hyp-residual` (via `L1`, `L3`).*
For every maximum independent `J⊆D` and every `s∈C_1:={s∈C:λ(s)=1}` with unique leaf `v`: if
`J∩N(s)=∅`, then `(L∖{v})∪J∪{s}` is independent (no `L`–`D` edges; `s` adjacent only to `v` among
leaves since `λ(s)=1`; `J` avoids `N(s)` by assumption) of size `(ℓ-1)+a+1=α`, hence a maximum
independent set omitting the leaf `v` — contradicting `(★)`. So `J∩N(s)≠∅` for every such `J,s`.

**`L7` (family I: `A_C=∅` forced; `W_I=ℓ(ℓ-1)M`).** *Uses `L5`, `L6`.* In family (I), `A_D` is a
**maximum** (size-`a`) independent subset of `D`. If `A_C` contained any `s∈C_1` (family (I) has
`A_C⊆C_1` by definition), independence of `B⊇A_D∪{s}` needs `A_D∩N(s)=∅`, contradicting `L6`. So
`A_C=∅`. Then `h=1` forces `|B∩L|=ℓ-1` (exactly one omitted leaf), `w(B)=ℓ-2·0-1=ℓ-1`. Bijection
`(J,\text{omitted }v)↔B=J∪(L∖\{v\})` between (maximum `J⊆D`)×(leaf choices) and family-(I) members:
count `=ℓM`, `W_I=ℓ(ℓ-1)M` exactly.

**`L8` (family II: `A_C=\{s^*\}` forced, `λ(s^*)=2`; `W_{II}=(ℓ-4)N_2`).** *Uses `L5`, `L6`.* Same
argument as `L7` eliminates every `λ=1` support from `A_C` when `A_D` is maximum-in-`D`; the one
`λ=2` support `s^*` is untouched by `L6` (stated only for `C_1`). So `A_C=\{s^*\}` exactly,
`Q(A_C)=2`, and `h=0` forces `|B∩L|=ℓ-2` (all remaining leaves included), `w(B)=ℓ-4`. Bijection
`(J,s^*)↔B` with `J` maximum in `D`, `J∪\{s^*\}` independent — this is exactly `N_2`'s definition
(`SEMANTIC-CONTRACT.md` §4). `W_{II}=(ℓ-4)N_2` exactly.

**`L9` (family III bijection; no forced-neighbour pruning — `A_D` is sub-maximal here).**
*Uses `L5` only.* `A_D=J'`, `|J'|=a-1`, `A_C⊆C_1` an independent subset of `U(J'):=\{s∈C_1:
N(s)∩J'=∅\}` (compatibility with `J'` plus pairwise independence, forced by `B`'s independence);
`h=0` forces `B∩L` to be exactly the leaves not adjacent to `A_C`. Bijection: family-(III) members
`↔` pairs `(J', A)` with `J'∈I_{a-1}(T[D])`, `A∈I(T[U(J')])`. `w(B)=ℓ-2|A|`. So
`W_{III}=Σ_{J'}Σ_{A∈I(T[U(J')])}(ℓ-2|A|)`.

**`L10` (deletion injection, hypothesis-free; and the fibre bound `W_{III}(J')≥0`).** For any finite
graph `H`, `v↦A∖\{v\}` injects `\{A∈I(H):v∈A\}` into `\{A∈I(H):v∉A\}`, giving `2|\{A:v∈A\}|≤|I(H)|`;
summing over `v∈V(H)` and swapping the order of the double sum `Σ_A|A|=Σ_v|\{A:v∈A\}|` gives
`2Σ_{A∈I(H)}|A|≤|V(H)|·|I(H)|` — this is the deletion injection, re-proved in-run (never imported;
matches `SOLUTION-CONTRACT.md` §3 fence 7's requirement re: Andriantiana–Razanajatovo
Misanantenaina–Wagner 2020). Applied to `H=T[U(J')]`, `m:=|U(J')|≤|C_1|≤ℓ` (from `L1`'s
`Σ_{s∈C}λ(s)=ℓ`): `Σ_{A∈I(H)}(ℓ-2|A|)=ℓ|I(H)|-2Σ|A|≥(ℓ-m)|I(H)|≥0`. Hence `W_{III}(J')≥0` for every
`J'`, so `W_{III}=Σ_{J'}W_{III}(J')≥0`.

**`L11` (finish: `ℓ(ℓ-2)M+(ℓ-4)N_2 ≥ 0` in every case, closing `(RC)`).** From `L7`–`L10`:
`W=W_I+W_{II}+W_{III}≥ℓ(ℓ-1)M+(ℓ-4)N_2`. Target reduces (algebra) to `ℓ(ℓ-2)M+(ℓ-4)N_2≥0`.
  - `ℓ≥4`: `ℓ-2≥2>0`, `ℓ-4≥0`, `M≥1` (a maximum independent set always exists), `N_2≥0` (a count) ⟹
    sum `>0`.
  - `ℓ=3`: at most one `λ=2` support can exist at all (two would need `4>3=ℓ` distinct leaves, `L1`),
    so `N_2≤M` (each of at most one `s∈C_2` pairs with at most `M` maximum `J`'s); `3M-N_2≥2M>0`.
  - `ℓ=2` (`G` is necessarily a path, since exactly 2 leaves forces no branch vertex of degree ≥3):
    **`L11a`** — if some `s` has `λ(s)=2`, the degree-sum equality argument (exactly 2 degree-1
    vertices ⟹ every other vertex has degree exactly 2, `L2`'s proof pushed to equality) forces `s`'s
    only neighbours to be the two leaves, and — since `s`'s component is then closed off — forces
    `V=\{v_1,s,v_2\}` exactly, i.e. `G≅P_3`, `α(P_3)=2`. But `x(P_3)=1` (`Δ_0=2≥0,Δ_1=-2<0`) and
    `hyp-eligible` needs `1+2≤α-1=1`, false — **so `hyp-eligible` excludes this case, and this route's
    proof uses `hyp-eligible` ONLY through this exclusion (equivalently, through `α≥3`, since `P_3`
    is the unique tree this argument produces and it has `α=2`)** — see the note on `Gate ruling 5`
    in §6. Hence `N_2=0` on the eligible class, `ℓ(ℓ-2)M+(ℓ-4)N_2=0+0=0≥0`.
  - `ℓ≤1`: cannot occur (`L2`).

Combining, `ℓ(ℓ-2)M+(ℓ-4)N_2≥0` always, so `W≥ℓM`, so by `(RI)`, `S(G,α-1)=ℓM-W≤0`. **This is
`(RC)`.** No step above relied on any premise this return did not itself prove from `hyp-tree,
hyp-alpha, hyp-eligible, hyp-residual`.

## 4. Fixed points — reproduced, with one discrepancy found and reported

Generator: `scratchpad/c1-T1/rc_verifier.py` (IMPORT LIST: `itertools, json, hashlib, os, sys,
functools`). Implements every predicate directly from `SEMANTIC-CONTRACT.md` §1 (tree test via an
explicit acyclicity-**and**-connectivity check `is_tree`, brute-force `i_k` by exhaustive subset
scan, `crossing_index` as first strict `Δ_k<0`, residual `(★)` by enumerating **every** maximum
independent set, `aggregate` via literal `H_v`/`R_v` deletion sets) — never by importing
`ordinary_tree.py` or `check_rc_candidate.py`. Report digest (deterministic; no wall-clock/PID/host
field anywhere in the hashed JSON): `24bf5e34d31e102a305066a8533682883288d0b19cf62cd2ca25722f65928dc1`,
independently reproduced on replay (identical digest, confirmed this session).

| Tree | `α` | `x` | `Δ` index at descent | `S` | `eligible` (own computation) |
|---|---|---|---|---|---|
| `P_3` | 2 | 1 | `Δ_1=1-3=-2<0` | `+2` | **false** (matches contract) |
| `P_5` | 3 | 2 | `Δ_2=1-6=-5<0` | `0` | **false** (matches contract) |
| `P_7` (7-vertex path) | 4 | 2 | `Δ_2=10-15=-5<0` | `-4` | **false** — **contradicts** the fixed-point table in `SEMANTIC-CONTRACT.md`, `C1-WORKER-COMMON-BRIEF.md` and `C1-ALLOCATION.md`, which all assert `P_7 (α=4, x=2, S=−4)` is **eligible**. |
| `T_1` (r19 `t_family`, `m=1`) | 5 | — | — | `-14` | true (matches contract) |
| `T_2` (r19 `t_family`, `m=2`) | 8 | — | — | `-47` | true (matches contract) |

**On the `P_7` discrepancy**: `hyp-eligible` requires `x(G)+2≤α-1`. For the literal 7-vertex path,
`x=2, α=4`, so the test is `2+2≤3`, i.e. `4≤3`, **false**. This was independently confirmed by (i)
hand derivation from the exact recursion `i_k(P_n)=i_k(P_{n-1})+i_{k-1}(P_{n-2})`, cross-checked
against the brute-force subset scan for every `n≤12` (`path_dp_cross_check_against_bruteforce_n_le_12
= True` in the report); (ii) this route's own brute-force `rc_verifier.py` on the literal graph; and
(iii) the literature packet's own independent bounded check
`sources/literature-packet/RC-CANDIDATE-CHECK.json`, whose row `{n:7, ell:2, alpha:4, x:2, S:-4,
bound:0, eligible:false}` states `eligible:false` for exactly this signature — the packet's own
numeric artifact **already disagrees with the controller's Stage 1/2 fixed-point table**, and this
route's independent instrument confirms the packet's numeric artifact, not the table. Since `ℓ=2`
forces a path (a tree with exactly two leaves has no branch vertex), `P_7` (the literal path) is the
**only** tree with this `(n,ℓ)`, so there is no alternative order-7 witness that both matches
`(α,x,S)=(4,2,-4)` and is eligible. A scan of paths `P_n` for `n=3..60` (`scratchpad/c1-T1-replay/`,
efficient DP, cross-checked against brute force for `n≤12`) finds the **first eligible path is
`P_{11}`** (`α=6, x=3`, `3+2=5≤5`). **Finding, not a fatal defect**: this route's proof of `(RC)`
(§3) never assumes any specific fixed-point table is correct — every step is derived from the four
hypotheses directly and separately cross-checked against the exhaustive order-1..12 census (§5),
where it passed with zero failures including on every actual order-7 eligible residual tree. The
error is confined to the illustrative fixed-point table in three Stage 1/2 controller documents and
should be corrected there (flagged to the controller; not this route's file to edit — those are
sealed Stage 1/2 members).

## 5. Exhaustive small-order validation of every step of §3 (bounded evidence, not a proof)

Same generator (`rc_verifier.py`). Tree generation: a leaf-addition closure with AHU centroid-rooted
canonical-form deduplication (not Prüfer enumeration, which is combinatorially infeasible past order
~10) — every tree on `n≥2` vertices has a leaf whose removal gives a tree on `n-1` vertices, so this
closure reaches every isomorphism class exactly once. Counts reproduced exactly:
`{1:1,2:1,3:1,4:2,5:3,6:6,7:11,8:23,9:47,10:106,11:235,12:551}` (`tree_generation_counts_match_expected
= True`), matching the canonical sequence cited in `SEMANTIC-CONTRACT.md` §5 and the literature
packet's `RC-CANDIDATE-CHECK.json` header.

- Residual trees, orders 1–12: **330**.
- Eligible residual trees, orders 1–12: **312**, broken down by order 7–12 as **4, 5, 17, 39, 80,
  167** — an exact match to `SEMANTIC-CONTRACT.md` §5's cited figure "312 eligible residual trees of
  orders 7–12" and its order breakdown, independently reproduced by this route's own instrument (not
  copied from the source; this route's `is_tree`, `is_residual`, `is_eligible` are its own code).
- **On every one of these 312 trees**, `scratchpad/c1-T1/rc_verifier.py`'s `check_tree_derivation`
  verified, by direct computation on that tree (not by trusting §3's algebra): Fact 1
  (`α=ℓ+a`, `M=i_a(T[D])`, the max-set bijection), the forced-neighbour lemma, the budget identity
  for **every** `B∈I_{α-1}(G)`, the three-family classification's exhaustiveness, the exact formulas
  `W_I=ℓ(ℓ-1)M` and `W_{II}=(ℓ-4)N_2`, an independent direct count of `N_2` cross-checked against the
  family-II count, the deletion-injection fibre bound `W_{III}(J')≥0` fibre-by-fibre, this route's own
  re-derivation of `(RI)`'s right-hand side matching its own `aggregate` computation (a
  self-consistency check of this script, not new evidence for the already-verified `(RI)`), the
  candidate bound `S≤-ℓ(ℓ-2)M-(ℓ-4)N_2`, and the sign `S≤0`. **`derivation_failures_count = 0`** out
  of 312 fully checked; **`positive_S_examples` is empty** (no eligible residual tree of order ≤12
  has `S>0`). This is bounded evidence at orders ≤12, not a proof (`SOLUTION-CONTRACT.md` §3 fence
  3) — the derivation of §3 is what establishes `(RC)` universally; this section is a stress-test of
  that derivation, and it found nothing wrong.
- The `ℓ=2 ∧ ∃s,λ(s)=2 ⟹ G≅P_3` structural fact (`L11a`) was separately checked against every one of
  the 11 order-≤12 trees with `ℓ=2`: only `n=3` has a `λ=2` support; zero violations at any other
  order.

Replay (copy-out-first):
```
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-top-rank-residual-sign-dre-2026-09-23/scratchpad/c1-T1/rc_verifier.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-top-rank-residual-sign-dre-2026-09-23/scratchpad/c1-T1-replay/rc_verifier.py
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-top-rank-residual-sign-dre-2026-09-23
python3 scratchpad/c1-T1-replay/rc_verifier.py
```
Script digest: `348ac0f8aabe9ee6d5cc22d809f48cbe2b803b565d1cb8cfd7266c489762867f`. Report digest:
`24bf5e34d31e102a305066a8533682883288d0b19cf62cd2ca25722f65928dc1`
(`scratchpad/c1-T1-replay/rc_verifier_report.json`). This was actually re-run during this session
(foreground, PID-polled to completion, ~20s wall time) and reproduced the identical report digest.
No background job was left running; both invocations (original and replay) were polled to exit via
`kill -0` on their PIDs and confirmed dead before this file was finalized.

## 6. Overlap finding for F3 (reported transparently, not claimed as this route's territory)

`hyp-eligible` is used in this route's derivation **only** inside `L11`'s `ℓ=2` branch, and only
through its consequence `α≥3` (excluding `G≅P_3`, which is the unique obstruction the argument
produces). No other step (`L1`–`L10`, and the `ℓ≥4`/`ℓ=3` cases of `L11`) uses `hyp-eligible` at all.
Per `C1-STAGE1-GATE.md` Gate ruling 5 ("a route may state the sharper informational form 'S≤0 for
every residual tree with α≥3' as a separate candidate"), this route **states** (does not register)
the informational strengthening: **`S(G,α-1)≤0` holds for every finite ordinary tree with `hyp-tree`,
`α(G)≥3`, and `hyp-residual (★)` — `hyp-eligible` is not needed beyond `α≥3`.** This is exactly
F3's chartered mandate (`RC-HYPOTHESIS-LOAD-BEARING-MAP`); this route surfaces it as an honest
byproduct of its own from-scratch derivation, not as a claim on F3's exact-computation obligation,
and defers ownership of the full hypothesis-drop map to F3. The **statement of record** for `(RC)`
retains all four hypotheses verbatim, per Gate ruling 5 and `SOLUTION-CONTRACT.md` §2 (composition
with `(RI)` requires it).

## 7. Grades (`SOLUTION-CONTRACT.md` §4)

`(RC)` at this route: **`proved_informal`** — a complete, from-scratch, step-by-step derivation
(§3), independently re-derived (not by citing the literature packet as evidence; the packet's
argument was read and this route's derivation reaches the same conclusion by re-deriving every step
independently, including catching a fixed-point error the packet's own materials also expose), with
a closed dependency DAG (every step's hypotheses named, no step left open, no step conditional on an
unproved premise) and stress-tested against 312 exhaustively enumerated eligible residual trees with
zero failures. **Not** `formally_verified`: no Lean kernel receipt exists for this route's argument;
that is Stage 7's governed obligation (§8). Per `SOLUTION-CONTRACT.md` §4, this grade requires "an
isolated second read before registration when first stated at Stage 5/6" before any registry
promotion — this route does not register `E993-R26-TOP-RANK-RESIDUAL-SIGN`; it reports the grade for
the synthesis and adjudicators to weigh.

The informational strengthening in §6 (`α≥3` suffices) is **`STATED`**, not registered, per
`SOLUTION-CONTRACT.md` §4 ("A statement first made by ... the synthesis is STATED and not registered
without an isolated second read") — this route is not the synthesis, so it is doubly not registering
it; it is surfaced for F3/the synthesis to evaluate.

## `headline_resolved: no`

(The run's headline is `(RC)` formally verified; no route can produce `yes` this cycle per
`C1-ALLOCATION.md` Stage 3 admission rule — this route's `proved_informal` grade is not a formal
verification.)

## Route verdict: `proved`

This route proved `(RC)` at its exact stated scope (`SEMANTIC-CONTRACT.md` §3, the four hypotheses
verbatim), informally, with a complete, closed, from-scratch dependency DAG (§3, steps `L0`–`L11`),
cross-validated against an exhaustive census of 312 eligible residual trees at orders ≤12 (§5, zero
failures) and against the frozen `T_1`, `T_2` fixed points (exact match). It is `proved`, not
`proved_conditional`: no step depends on an unproved premise, an unverified external citation, or a
computational stand-in for a universal step — the occupancy/deletion-injection bound (`L10`) is
re-proved in-run from the finite-graph definition, never imported.

## Remaining obligation (successor inheritance)

The remaining obligation is entirely **Stage 7 formalization** — compiling steps `L0`–`L11` above
into the exact Lean declaration of `SOLUTION-CONTRACT.md` §2 (`R26LA1.topRankResidualSign`), composed
with the already-verified `C5LA1.topRankResidualIdentity`. A successor (Stage 7 formalizer, or a
later cycle's `U`-seat) should treat the following as the lemma DAG to compile, in the proposed
`R26LA1` namespace, matching the granularity of steps `L1`–`L11`:

```
R26LA1.leaf_support_disjoint         [L1]  hyp-tree, hyp-alpha
R26LA1.leaf_degree_sum_eq_card       [L1]  hyp-tree, hyp-alpha
R26LA1.leaf_card_ge_two              [L2]  hyp-tree, hyp-alpha
R26LA1.max_indep_eq_leaf_union_D     [L3]  hyp-tree, hyp-alpha, hyp-residual
R26LA1.alpha_eq_ell_add_a            [L3]  (same)
R26LA1.M_eq_indepNum_induce_D        [L3]  (same)
R26LA1.budget_identity               [L4]  L1, L3 (no new hypothesis)
R26LA1.family_classification         [L5]  pure arithmetic from L4
R26LA1.forced_neighbour              [L6]  hyp-tree, hyp-alpha, hyp-residual
R26LA1.family_I_support_empty        [L7]  L5, L6
R26LA1.family_I_weight               [L7]  (same)
R26LA1.family_II_support_singleton   [L8]  L5, L6
R26LA1.family_II_weight              [L8]  (same)
R26LA1.family_III_bijection          [L9]  L5
R26LA1.deletion_injection            [L10] none (arbitrary finite graph)
R26LA1.fibre_nonneg                  [L10] deletion_injection, L1
R26LA1.ell2_lambda2_forces_P3        [L11] hyp-tree, hyp-alpha, L2
R26LA1.finish_sign_bound             [L11] all of the above; hyp-eligible used
                                            ONLY through alpha>=3 (see S6)
R26LA1.topRankResidualSign           [target] composes finish_sign_bound with
                                            C5LA1.topRankResidualIdentity (RI)
```

Debt: none of `L0`–`L11` has an unclosed step in the informal derivation. The debt is purely the
Lean encoding (structural `Finset`/bijection lemmas, not an abstract inequality whose hypotheses
encode the conclusion, per `SOLUTION-CONTRACT.md` §2's fence). `R26LA1.family_III_bijection` and
`R26LA1.fibre_nonneg` are likely the two most Lean-labor-intensive nodes (nested `Finset.sum` over a
`Finset`-indexed family of induced-subgraph independent-set families) and should be prioritized for
early U-seat attention in the next cycle if this route's proof is funded for Stage 7.

Secondary items for a successor: (1) correct the `P_7` fixed-point table entry in future Stage 1/2
controller documents (§4); (2) F3 should independently verify and, if it stands, formally state the
`α≥3`-suffices strengthening (§6) as its own chartered finding; (3) F2's `C6-B3-DISCREPANCY-REPLAY`
is independently corroborated by this route's `L7` (family I is proved to have `A_C=∅` always under
`(★)`, i.e. no realized negative family-(I) weight is possible under the stated residual hypothesis)
— this route did not replay F2's specific order-9 witness (out of this route's scope) but its general
lemma is consistent with, and lends proof-theoretic support to, F2 finding a predicate/labelling
error rather than a live counterexample to `(RI)` or `(RC)`.

## IMPORT LIST summary (every generator used, standard library only)

- `scratchpad/c1-T1/verify_seal.py`: `json, hashlib, os, sys`
- `scratchpad/c1-T1/alias_check.py`: `json, hashlib, os`
- `scratchpad/c1-T1/rc_verifier.py`: `itertools, json, hashlib, os, sys, functools`

No network access, no package installs, no non-standard-library import anywhere in this return's
code. All three scripts and their replay copies are byte-identical (digests cited above and
reproduced by hashing both copies during this session).
