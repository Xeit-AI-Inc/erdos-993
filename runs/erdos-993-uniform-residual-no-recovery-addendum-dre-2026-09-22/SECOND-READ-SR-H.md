# Second Read — SR-H (Lemma H's uniqueness half)

## Identity and seal audit

**VerityOS boot.** Operating within VerityOS. Boot reads were exactly the two the
protocol enumerates: `/Users/ashtonsperry/VerityOS/verity.md` (root constitution) and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (startup protocol). I did
not follow the startup protocol's own subsystem map: no `memory/`, `conversations/`,
`modules/`, `skills/`, `logs/`, `decisions/`, `projects/`, `knowledge/`, `operations/`
or `inbox/` read occurred. No VerityOS read outside those two files. **No read-boundary
disclosure item.**

**Model disclosure.** chartered opus/high; transport-resolved model opus (explicit
parameter); the seat cannot self-inspect its runtime model/effort — stated on
dispatch-record authority.

**Packet seal.** `control/lane-c/SR-H-PACKET-MANIFEST.json`
(`schema_version verityos.math-dre.packet-manifest.v1`, `run_id
erdos-993-math-dre-20260922-r25-addendum`, `stage lane-c-second-read-SR-H`). Inner seal
recomputed as SHA-256 over the canonical JSON of the manifest with `seal_sha256`
removed (`json.dumps(..., sort_keys=True, separators=(",", ":"))`, UTF-8):

- declared `6f662af0255c0e0cbdff8fb0ea6d689dc0c4accd5db68d950b740919630c961d`
- recomputed `6f662af0255c0e0cbdff8fb0ea6d689dc0c4accd5db68d950b740919630c961d` — **match**

`file_count` 52 equals the number of `files` entries. I recomputed the SHA-256 and byte
length of **all 52 members**: 52/52 digest-and-size match, 0 missing, 0 mismatched.
Generator `gen_seal_audit.py` (`c92d5ed89711b8df52e5590e41620e47d0689b6741800e34d39841411d3ad9f7`;
IMPORT LIST: `hashlib`, `json`, `sys`, `pathlib.Path`), output `seal-audit.json`
(`20e6c6f797b9e18cbee1abb72e267987248e62a8157810b5d6ef35a0be55fc03`).

**Members read** (all digest-verified before reading; all paths relative to the run
root): `control/lane-c/SR-H-PROTOCOL.md` (`ce5a59da…`),
`control/lane-c/SR-H-PACKET-MANIFEST.json`, `control/lane-c/PATH-CHECK-SR-H.json`
(`ac07f3c8…`; 50 files scanned, 0 findings),
`sources/r25-terminal/second-read-inputs/C6-F4-RETURN.md` (`d7360f77…`),
`…/C6-F4-CRITIQUE-T.md` (`91f2780c…`), `…/C6-F4-CRITIQUE-U.md` (`cd4d41de…`),
`sources/r25-terminal/C6-ADJUDICATION-F.md` (`4160cfe0…`),
`sources/r25-terminal/C6-SYNTHESIS.md` (`4b9cc572…`),
`control/snapshots/CLAIM-IDENTITY.run-local.a1-stage2.json` (`8bdd67c6…`, 360 claims),
`SEMANTIC-CONTRACT.md` (`3bbeae07…`), `SOLUTION-CONTRACT-ADDENDUM-1.md` (`02aeb0ba…`),
`control/A1-STAGE1-GATE.md` (`73a343db…`). Reads of the five large r25 documents were
by whole-file Read or by path-restricted Python reads naming exactly one granted member
per call (the gate's "provenance by Read or path-restricted grep" rule); no
`find`/`grep`/`rg`/`ls -R` and no recursive listing was issued anywhere, at any root.

**Grants not exercised.** The protocol permits a read-only, copy-out-first replay of the
r25 seats' scratch (`scratchpad/c6-F4/`, `c6-crit-F4-T/`, `c6-crit-F4-U/`, `c6-adj-F/`
under the r25 root). I did not exercise it and nothing below depends on it: the object
is closed-form binomial arithmetic and I decided it on an instrument written from
scratch here. Nothing was written, read or listed under the r25 root. No network, no
package installs; standard library and exact integers only. Writes confined to
`second-reads/SR-H/` and `scratchpad/lane-c-SR-H/`; nothing in `cycles/` or
`scratchpad/a1-*` was touched. No background jobs were started; none were running at the
final write.

**Provenance of the object.** `C6-ADJUDICATION-F.md` Ruling 34 (lines 1184–1227) grades
the tightness half THEOREM/`proved_informal`, strikes its 29-forest evidence base, and
adopts C-F4-U's narrowing to the uniqueness of the attaining set. `C6-SYNTHESIS.md` A7
(line 483) and R3 (line 1634) restate it as a registration awaiting gate ruling 8's
isolated second read. `control/A1-STAGE1-GATE.md` §2 ruling 2 confirms it is **stated,
not registered**, and is lane C's object. Both F4 critics re-derive it independently
(C-F4-T lines 113–122; C-F4-U lines 642–648); the seat's own statement is
`C6-F4-RETURN.md` §1.2 (lines 156–168).

## The proof, re-derived

Conventions of record (`SEMANTIC-CONTRACT.md`, "Conventions (binding)"): integer zero
extension, `C(b,m) = 0` for `m < 0` or `m > b`. Write `E(b,j) := C(b,j+1) − C(b,j)`,
`Cat_j := C(2j,j)/(j+1)`, and `h(b) := −E(b,j) = C(b,j) − C(b,j+1)`. The claim is
`max_b h(b) = Cat_j` with the maximum attained exactly on `{2j−1, 2j}`.

**Step 1 (the increment).** Pascal twice, valid under the zero extension:
`h(b+1) = [C(b,j) + C(b,j−1)] − [C(b,j+1) + C(b,j)] = C(b,j−1) − C(b,j+1)`, hence

```
D(b) := h(b+1) − h(b) = C(b,j−1) − C(b,j).
```

**Step 2 (the sign of `D` on its exact ranges).** Fix `j ≥ 1`.

- `0 ≤ b ≤ j−2`: both `C(b,j−1)` and `C(b,j)` are zero (`j−1 > b`), so **`D(b) = 0`**.
- `j−1 ≤ b ≤ 2j−2`: `C(b,j−1) ≥ 1` and `C(b,j)/C(b,j−1) = (b−j+1)/j ≤ (j−1)/j < 1`, so
  **`D(b) > 0`** (at `b = j−1` directly: `D = 1 − 0 = 1`).
- `b = 2j−1`: `C(2j−1,j−1) = C(2j−1,j)` by symmetry (`(2j−1) − j = j−1`), so **`D = 0`**.
- `b ≥ 2j`: `C(b,j)/C(b,j−1) = (b−j+1)/j ≥ (j+1)/j > 1`, so **`D(b) < 0`**.

For `j = 0` the whole increment is `D(b) = C(b,−1) − C(b,0) = −1 < 0` for every `b ≥ 0`;
the first three bullets are vacuous.

> **Repair 1, load-bearing on the write-up, not on the truth.** The sign clause as
> printed in Ruling 34 (`C6-ADJUDICATION-F.md` line 1187), in C-F4-T (line 117) and in
> this protocol's own summary — "`C(b,j−1) − C(b,j)` is `> 0` for `b ≤ 2j−2`" — is
> **false** on `0 ≤ b ≤ j−2`, where the increment is `0`. Over the chartered box
> (`j ≤ 200`, `b ≤ 2j+50`) that clause has **19,900** counterexamples, **every one** with
> `b ≤ j−2` (`= Σ_{j=2}^{200}(j−1)`); the repaired clause `D > 0` on `j−1 ≤ b ≤ 2j−2`
> has **0** failures, `D = 0` on `0 ≤ b ≤ j−2` has **0** failures, `D = 0` at `b = 2j−1`
> has **0** failures, `D < 0` on `b ≥ 2j` has **0** failures
> (`gen_lemma_h_exact.py` → `lemma-h-exact.json`, key `increment_clause_audit`).
> **C-F4-U states it correctly** (line 644: "`> 0` on `j−1 ≤ b ≤ 2j−2` … with `h ≡ 0`
> below `b = j`"). Consequence: `h` is *not* strictly increasing up to `2j−1`; it is
> **flat at 0, then strictly increasing, then flat on `{2j−1, 2j}`, then strictly
> decreasing**, and the argument needs the extra observation in Step 3.

**Step 3 (the low plateau is not a competitor).** For `0 ≤ b ≤ j−1` both `C(b,j)` and
`C(b,j+1)` vanish, so `h(b) = 0`. Since `Cat_j ≥ 1 > 0` for every `j ≥ 0`, no `b ≤ j−1`
attains the maximum. This is the step the defective clause silently supplies and which
must appear on the face of any registered proof (verified: `h ≡ 0` on `b ≤ j−1`, 0
failures; `Cat_j` a positive integer, 0 failures).

**Step 4 (the peak value).** `C(2j,j+1)(j+1) = C(2j,j)·j` (absorption), so
`h(2j) = C(2j,j) − C(2j,j+1) = C(2j,j)/(j+1) = Cat_j`, for **every** `j ≥ 0` — derived
here, not quoted. By Step 2 the step at `b = 2j−1` is flat, so `h(2j−1) = h(2j) = Cat_j`
for `j ≥ 1`.

**Step 5 (uniqueness).** `h` is non-decreasing on `[0, 2j−1]` and strictly decreasing on
`[2j, ∞)`. Strictness on `[j−1, 2j−1]` gives `h(b) < h(2j−1)` for `j−1 ≤ b < 2j−1`;
Step 3 gives `h(b) = 0 < Cat_j` for `b ≤ j−1`; strict decrease gives `h(b) < h(2j)` for
`b > 2j`. Hence `h(b) = Cat_j`, i.e. `E(b,j) = −Cat_j`, holds exactly on
`{2j−1, 2j} ∩ ℕ`. ∎

The proof uses only: the integer zero extension, Pascal's rule, binomial symmetry, the
absorption identity, and integrality/positivity of `Cat_j`. All five were audited
exactly (Pascal for `b ≤ 401` and every `m ∈ [−3, b+3]`, symmetry for `n ≤ 401`,
absorption / mid-symmetry / `Cat` integrality / the peak value for `j ≤ 200`): **0
failures on each**. **No graph ingredient, no cover-fiber identity, no `Γ_n`, no `d`,
`τ`, `ν`, `r`, `x(F)`, no G1 hypothesis, no Lemma T.** There is no hidden dependency.

## Exact check and the j = 0 boundary

`gen_lemma_h_exact.py` (`44d2dcb9406d3217c0947a59b745be262bf8fd0e82512fcdbc56305ff5309e10`;
IMPORT LIST: `json`, `sys`, `fractions.Fraction`, `math.comb`), output
`lemma-h-exact.json` (`791531e675fd5fd273d98b3751a282b7c39047300f0be1b936e4dd5a1e09bd47`).
Chartered box `0 ≤ j ≤ 200`, `0 ≤ b ≤ 2j+50`; exact integers throughout; no wall-clock,
PID or host field in the payload.

- **Floor.** `E(b,j) ≥ −Cat_j`: **0 violations** over the box.
- **Attaining set, reported at every `j`.** `A(j) := { b in the box : E(b,j) = −Cat_j }`
  equals `{2j−1, 2j} ∩ ℕ` for **all 201** values of `j`: **0 mismatches**.
  `A(0) = {0}`; `A(1) = {1,2}`; `A(2) = {3,4}`; `A(3) = {5,6}`; `A(4) = {7,8}`;
  `A(5) = {9,10}`; `A(6) = {11,12}`. `|A(0)| = 1`; `|A(j)| = 2` for every `1 ≤ j ≤ 200`
  (min 2, max 2).
- **The box does not carry the infinite statement.** The tail `b ≥ 2j+2` is closed
  exactly, not scanned: `E(b,j) ≥ Cat_{j+1} > 0 > −Cat_j` there (**0** failures over the
  box) and `E(·,j)` is strictly increasing on `b ≥ 2j+2` (**0** failures). Together with
  Steps 2–5 the statement is proved for all `b`, all `j`; the scan is corroboration only
  and must not be quoted as the thing that has no horizon.
- **Near misses, checked rather than assumed.** `E(2j+1,j) = 0` for every `j ≤ 200`
  (symmetry `C(2j+1,j+1) = C(2j+1,j)`) — the single `b` between the plateau and Lemma T's
  domain, and it is not an attainer since `Cat_j ≥ 1`. `E(2j−2,j)` is strictly above
  `−Cat_j` at every `j` (e.g. `j = 2..6`: `−1 > −2`, `−3 > −5`, `−9 > −14`, `−28 > −42`,
  `−90 > −132`).

**The `j = 0` boundary, stated precisely.** `Cat_0 = 1` and `E(b,0) = C(b,1) − C(b,0) =
b − 1` for every natural `b` (verified `b ≤ 399`, 0 failures). So `E(b,0) ≥ −1 = −Cat_0`
with equality **iff `b = 0`**. The raw set `{2j−1, 2j} = {−1, 0}`; `b = −1` is not a
natural and never enters the quantifier, so the attaining set at `j = 0` is the
**singleton `{0} = {2j} `**, i.e. `{2j−1, 2j} ∩ ℕ`.

> **Repair 2 (narrowing of the wording, not of the theorem).** The statement does **not**
> need `j ≥ 1`, provided `b` ranges over the naturals and the attaining set is written
> `{2j−1, 2j} ∩ ℕ` (or "`b ∈ {2j−1, 2j}` with `b` natural"). It **does** need `j ≥ 1`
> for any sentence asserting that the attaining set has two elements, or that `b = 2j−1`
> is an attainer, or that the maximum is attained at two consecutive `b`. Ruling 34,
> synthesis A7 and R3, and this protocol's question all print the set bare; the seat's
> own §1.2 is the only place in the record that flags it ("`2j−1` vacuous at `j = 0`",
> `C6-F4-RETURN.md` line 159). The registrable statement below carries the intersection
> on its face.

## Alias check

`gen_alias_check.py` (`2249067f469bc21d098595a84743f0bee9278c07a9e066388c9f260fe8b3203b`;
IMPORT LIST: `hashlib`, `json`, `re`, `sys`, `math.comb`), output `alias-check.json`
(`61f8598b4e78087647108d179d605d8681ab2d8e3e46baaea14d937cff2e0fab`), against the Stage 2
registry snapshot `control/snapshots/CLAIM-IDENTITY.run-local.a1-stage2.json`
(`8bdd67c62442d06d169c15005c973ac10871ef764a0cd99602bfb853e2b4d36d`, **360 claims**), the
run-local registry of record for this read.

**Lexical**, over the full serialized record of every claim (key, aliases,
`alias_patterns`, statement, scope, certificate, every nested field) — not keys only:
`TIGHT`, `TIGHTNESS`, `EXTREMAL`, `UNIQUE`, `UNIQUENESS`, `ATTAIN`, `ATTAINING`,
`ATTAINED`, `UNIQ` appear in **no claim key and no alias or alias pattern** (0 hits in
each of the four key/alias sweeps). The strings `2j-1`, `2j − 1`, `2j−1`, `{2j`, `2j,2j`
and `exactly at b` do **not occur anywhere in the registry** (0 hits each). `equality
exactly` and `exactly at n` occur in **exactly one** claim,
`E993-R25-BINOMIAL-DIFFERENCE-CATALAN-CEILING`. `nowhere else` occurs in exactly one
claim, `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST` (a graph theorem about `c(d) = min(d,5)`,
unrelated object). This reproduces the return's and both critics' lexical results on a
wider surface.

**Structural.** Twelve of the 360 claims carry a binomial-difference or Catalan-gap
object at all: `E993-BINOMIAL-DIFFERENCE-CATALAN-FLOOR`,
`E993-CATALAN-COVER4-PRE-R-INEQUALITY`, `E993-PAIR-BROOM-DOMINATION`,
`E993-PAIR-STAR-CLOSURE`, `E993-R25-BD-INTERIOR-PEAK-CATALAN-BOUND`,
`E993-R25-BINOMIAL-DIFFERENCE-CATALAN-CEILING`, `E993-R25-CARD5-COVER-CATALAN-BOUND`,
`E993-R25-CATALAN-DOMINANCE-RANK-R-MINUS-2`, `E993-R25-CATALAN-GAP-MONOTONE-RATIO`,
`E993-R25-MA-CATALAN-COMPARISON`, `E993-R25-PER-FIBER-BUDGET-UPWARD-CLOSURE`,
`E993-R25-RANK-R-MINUS-2-HALL-INVARIANCE`. Of these, **exactly one** also carries a
tightness/equality-set statement: the CEILING.

**Mathematically, claim by claim.**

1. **`E993-BINOMIAL-DIFFERENCE-CATALAN-FLOOR`** (VERIFIED). Statement verbatim: *"For
   every natural m and j>=0, C(m,j+1)-C(m,j)>=-Cat_j, where Cat_j=C(2j,j)/(j+1). At
   integer j=-1 the difference is 1; at j<=-2 it is 0 under integer zero extension."*
   Scope verbatim: *"Arithmetic auxiliary; independent of any graph or G1 hypothesis."*
   **No tightness clause, no attaining set, no `b`-location of any kind.** The uniqueness
   half is its strict refinement — same object, same quantifier, one level more precise —
   and is **not** contained in it.
2. **`E993-R25-BINOMIAL-DIFFERENCE-CATALAN-CEILING`** (VERIFIED, alias "Lemma T").
   Statement verbatim: *"… for every k >= 0 and every n >= 2k+2, E(n,k) >= Cat_{k+1},
   with equality exactly at n = 2k+2, and E(.,k) strictly increasing on n >= 2k+2."*
   Same two-parameter family `E`, but a **different statement in every component**: a
   *positive* bound `+Cat_{k+1}` where uniqueness bounds by `−Cat_j`; the half-line
   `n ≥ 2j+2` where uniqueness quantifies over all naturals `b`; and the equality point
   `2j+2`, which is **never** an element of `{2j−1, 2j}` (checked for `j ≤ 2000`, 0
   coincidences). Not an alias in either direction.
3. **Is uniqueness a corollary of FLOOR + CEILING?** No, and this is the sharp form of
   the no-overlap finding. CEILING excludes only `b ≥ 2j+2` (there `E ≥ Cat_{j+1} > 0 >
   −Cat_j`); FLOOR excludes nothing, being the inequality itself. The `b` left open by
   the two registered claims together are the `2j` values of `b ∈ [0, 2j+1] ∖ {2j−1,2j}`
   for every `j ≥ 1`, and the single `b = 1` at `j = 0` (formula verified for `j ≤ 2000`;
   `j = 1..5` → `2, 4, 6, 8, 10`). **Excluding exactly those `b` — plus establishing that
   `b = 2j−1` does attain — is the whole of the new content.**
4. **`E993-PAIR-STAR-CLOSURE`** (VERIFIED). Carries the Catalan-slack identity *"C(2t,t)
   - C(2t,t-1) = Catalan_t for t >= 3"*, which by symmetry is the equality **value** at
   `b = 2j` — Ruling 34 and C-F4-U are right that the value half is already registered.
   Two precisions: its registered scope begins at **`t ≥ 3`**, so the value at
   `j ∈ {0,1,2}` is outside it (identity verified here independently for all `j ≤ 2000`:
   `j=0 → 1 = Cat_0`, `j=1 → 1 = Cat_1`, `j=2 → 2 = Cat_2`), and its claim scope is *"the
   star family exactly"*, a graph scope. The registrable statement therefore derives the
   value itself (Step 4) rather than importing it, and cites PAIR-STAR as the registered
   overlap for `j ≥ 3` only.
5. **`E993-R25-RANK-R-MINUS-2-HALL-INVARIANCE`** (VERIFIED) is the closest registered
   relative and the only one whose face carries a two-consecutive-value attaining set at a
   negative-Catalan value: *"at rank r-2 the per-fiber worst term at fiber size s is
   attained at rho_S in {2s+3, 2s+4} with value -Cat_{r-2-s}"*. Tested as a possible
   alias under the substitution `j := r−2−s`, `b := ρ_S`: the arithmetic attaining set
   `{2j−1, 2j} ∩ ℕ` equals `{2s+3, 2s+4}` **only on the line `r = 2s+4`** (28 coincidences
   for `r < 60`, every one satisfying `r = 2s+4`). They are different statements in
   different variables; the registered one is PER-FIBER (its scope word is mandatory),
   rank-`(r−2)`, forests, `τ ≤ 12`, Hall-restricted. **Not an alias.** It is, however, the
   claim most likely to have used the uniqueness fact as an unstated ingredient, which
   makes registering the arithmetic statement additively strengthening rather than
   duplicative — a point the controller may wish to record on that claim's scope.
6. The remaining seven binomial-difference claims are different objects: the second
   difference `D(b,m) = C(b,m+1) − 2C(b,m) + C(b,m−1)`
   (`E993-R25-BD-INTERIOR-PEAK-CATALAN-BOUND`, `E993-R25-MA-CATALAN-COMPARISON` — the
   latter a `max_b` bound of superficially similar shape, but on the **second** difference,
   over a truncated `b`-range, fixed-band `d = 5`, and with **no** uniqueness clause); the
   Catalan gap `Γ(τ,k)` (`E993-R25-CATALAN-GAP-MONOTONE-RATIO`,
   `E993-R25-PER-FIBER-BUDGET-UPWARD-CLOSURE`); cover-cardinality bounds
   (`E993-R25-CARD5-COVER-CATALAN-BOUND`, `E993-CATALAN-COVER4-PRE-R-INEQUALITY`,
   `E993-R25-CATALAN-DOMINANCE-RANK-R-MINUS-2`, `E993-PAIR-BROOM-DOMINATION`). No overlap.

**Alias conclusion: no alias, lexically or mathematically, in the 360-claim run-local
registry.** The candidate stays in the `E993-R25-…` namespace per `A1-STAGE1-GATE.md` §2
ruling 5.

## Verdict and the exact registrable statement

The uniqueness half is a theorem at `proved_informal`, for **every** natural `j ≥ 0`
including `j = 0`, with no hidden dependency and no alias. Two repairs are required
before registration, neither of which weakens the mathematical content: the printed sign
clause of the adjudicator's re-derivation is false on `0 ≤ b ≤ j−2` and must be replaced
by C-F4-U's correct range plus the low-plateau observation (Repair 1, §"The proof,
re-derived"); and the attaining set must be written `{2j−1, 2j} ∩ ℕ`, a **singleton at
`j = 0`** (Repair 2, §"Exact check and the j = 0 boundary"). Because the statement as
posed — "equality exactly at `b ∈ {2j−1, 2j}`", with `b` a natural — is literally true at
every `j ≥ 0`, no narrowing of the quantifier range is needed and `j ≥ 1` is **not**
required.

verdict: confirmed_with_repairs

**Exact registrable statement.**

> With `E(b,j) := C(b,j+1) − C(b,j)` under integer zero extension
> (`C(b,m) = 0` for `m < 0` or `m > b`) and `Cat_j := C(2j,j)/(j+1)`: for every natural
> `j` and every natural `b`, `E(b,j) ≥ −Cat_j`, with equality **if and only if**
> `b ∈ {2j−1, 2j} ∩ ℕ`. For `j ≥ 1` the attaining set is exactly the two consecutive
> naturals `{2j−1, 2j}`; for `j = 0` it is the singleton `{0}` (`E(b,0) = b − 1`,
> `Cat_0 = 1`).

**Scope sentence** (as the protocol directs, with the two additions this read earned):

> Arithmetic auxiliary; independent of any graph or G1 hypothesis; the uniqueness
> refinement of `E993-BINOMIAL-DIFFERENCE-CATALAN-FLOOR`; critic-attributed to C-F4-T and
> C-F4-U, adjudicator re-derived. The attaining set is `{2j−1, 2j} ∩ ℕ`, a singleton at
> `j = 0`; the equality **value** at `b = 2j` overlaps `E993-PAIR-STAR-CLOSURE`'s
> Catalan-slack identity for `j ≥ 3` only and is re-derived here for every `j ≥ 0`; the
> registered proof must carry the corrected increment ranges (`C(b,j−1) − C(b,j)` is `0`
> on `0 ≤ b ≤ j−2`, `> 0` on `j−1 ≤ b ≤ 2j−2`, `0` at `b = 2j−1`, `< 0` for `b ≥ 2j`) and
> the observation that `h ≡ 0 < Cat_j` below `b = j`, the second reader's Repair 1.

**Grade.** THEOREM, `proved_informal`, no horizon — the grade attaches to the proof of
§"The proof, re-derived"; the `j ≤ 200` box is corroboration only and must never be
quoted as what carries the statement.

## What it is not

- **Not a graph statement.** It carries no `d`, `τ`, `ν`, `r`, `k`-as-rank, `x(F)`,
  `Δ_k(F)`, `Γ_n`, no cover, no matching, no forest and no tree. It is about zero-extended
  integer binomial coefficients and Catalan numbers only.
- **Not evidence about any forest.** The F4 return's "realized on 29 explicit forests",
  "the first to check it against real cover-fiber decompositions" and "zero bound
  violations anywhere" were **struck** by Ruling 34: Stage C evaluates one predicate (the
  cover-fiber closed form against the DP polynomial) and never evaluates `Cat`, the floor
  or `Γ_n` — no bound is computed there, so no bound violation could have been observed.
  **The struck 29-forest support is not evidence for this statement** and must not be
  reinstated in its certificate. What survives from Stage C (the cover-fiber identity on
  29 acyclicity-tested forests, including the `C5-E-f` isolated-vertex family) belongs to
  `E993-GRAPH-VERTEX-COVER-DELTA-PARTITION`, not here. The admissible evidence is the
  proof, this read's exact check, C-F4-T's supplied tight-set test and the two critics'
  scans.
- **Not Lemma T, and not a consequence of the registered claims.** It is neither an alias
  nor a corollary of `E993-BINOMIAL-DIFFERENCE-CATALAN-FLOOR` +
  `E993-R25-BINOMIAL-DIFFERENCE-CATALAN-CEILING`, which between them leave `2j` values of
  `b` unexcluded at each `j ≥ 1` and say nothing about `b = 2j−1` attaining.
- **Not the equality value.** The value `E(2j,j) = −Cat_j` is, for `j ≥ 3`, already inside
  `E993-PAIR-STAR-CLOSURE`; registering the value as new would be the `C5-E-e` species.
  The registrable content is the **uniqueness of the attaining set** (plus the value at
  `j ∈ {0,1,2}`, which lies outside PAIR-STAR's registered scope).
- **Not a resolution of anything headline.** It touches no tier, no `c(d) = min(d,5)`, no
  `E993-R25-UNR-FOREST-WIDE`, no `E993-G1WIDE-NO-SIZE-CAP`, and does not bear on Erdős
  #993. Nothing written here changes any r25 record; r25 is terminal.
- **Not a registration.** This seat registers nothing. The controller registers, at the
  grade this read confirms, additively, in the `E993-R25-…` namespace.

## Artifact inventory

All under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-uniform-residual-no-recovery-addendum-dre-2026-09-22/scratchpad/lane-c-SR-H/`.
Standard library only, exact integers, deterministic; no wall-clock, PID, host or
environment field in any hashed payload. All three ran in the foreground; no background
job was ever started. Replay: `python3 <generator> > <output>` from that directory.

| artifact | SHA-256 | bytes | import list |
|---|---|---|---|
| `gen_seal_audit.py` | `c92d5ed89711b8df52e5590e41620e47d0689b6741800e34d39841411d3ad9f7` | 2764 | `hashlib`, `json`, `sys`, `pathlib.Path` |
| `seal-audit.json` | `20e6c6f797b9e18cbee1abb72e267987248e62a8157810b5d6ef35a0be55fc03` | 10863 | — |
| `gen_lemma_h_exact.py` | `44d2dcb9406d3217c0947a59b745be262bf8fd0e82512fcdbc56305ff5309e10` | 10725 | `json`, `sys`, `fractions.Fraction`, `math.comb` |
| `lemma-h-exact.json` | `791531e675fd5fd273d98b3751a282b7c39047300f0be1b936e4dd5a1e09bd47` | 9085 | — |
| `gen_alias_check.py` | `2249067f469bc21d098595a84743f0bee9278c07a9e066388c9f260fe8b3203b` | 8699 | `hashlib`, `json`, `re`, `sys`, `math.comb` |
| `alias-check.json` | `61f8598b4e78087647108d179d605d8681ab2d8e3e46baaea14d937cff2e0fab` | 12770 | — |

Numeric claims → generator map: the seal, the 52/52 member verification and every member
digest → `gen_seal_audit.py`/`seal-audit.json`. The floor and attaining-set results over
`j ≤ 200`, `b ≤ 2j+50`; the 19,900 counterexamples to the quoted sign clause and the four
repaired-clause zero-failure counts; the `j = 0` figures, `E(b,0) = b−1`, `E(2j+1,j) = 0`,
`E(2j−2,j)` values, `h ≡ 0` below `b = j`; the ceiling-tail and strict-increase zero
counts; the five-ingredient identity audit → `gen_lemma_h_exact.py`/`lemma-h-exact.json`.
The 360-claim count, every lexical hit count, the twelve binomial-difference claims, the
one-with-tightness result, the `2j`-values-left-open formula, the PAIR-STAR value identity
at `j ≤ 2000`, and the 28 `r = 2s+4` coincidences → `gen_alias_check.py`/`alias-check.json`.

Reread before close: the manifest seal, all 52 member digests, this file's headings, the
single verdict line, the model-disclosure line and the terminal line were re-verified
against `control/lane-c/SR-H-PROTOCOL.md` (`ce5a59da…`) after drafting.

headline_resolved: no
