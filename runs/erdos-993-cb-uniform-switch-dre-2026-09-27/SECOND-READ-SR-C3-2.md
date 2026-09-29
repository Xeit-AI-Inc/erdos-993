# Second Read

Isolated second read `SR-C3-2`, r31 Cycle 3 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`): the literal sector bridge (the
In-sum, switch preimages, zero classes and the arc-level composition). Written 2026-09-28, 07:05–07:30 EDT by the clock.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (the constitution and the startup protocol). Subsystems loaded: those
two files only. I did not follow the task-type map into memory, logs, skills, decisions, operations or conversations, and I wrote
no conversation log: the protocol confines my writes to this file and my scratch.

## Identity and seal audit

**Governing files (verified before reading).**

| Object | Recomputed SHA-256 | Status |
|---|---|---|
| Protocol `control/C3-SECOND-READ-PROTOCOL.md` | `1eb6aa33f05fef770cbd571e1f39fa5ea9a5329e4c5f05dd5d961764c40753cc` | MATCH |
| Brief `control/C3-SECOND-READ-BRIEF-SR-C3-2.md` | `cacff2acc69e21b9b6edcd8d26b132d31c0e882a79a2b1d2dc55bb8acac7db9b` | MATCH |
| **Capsule seal** `control/c3-second-read/SR-C3-2-PACKET-MANIFEST.json` (SHA-256 of compact key-sorted JSON of the manifest minus `seal_sha256`, separators `(",", ":")`, no trailing newline) | **`b8f19b40e20a272e83312eb16b68423bc49edb0b8ce9318506e72af3099c5870`** | **MATCH** (the ASCII-escaped and UTF-8 serializations agree) |
| Manifest file itself | `6061240c2162852adabe7402e6dde6dfd57dcc9a2bb63c81bff635afeb2ee1ab` | recorded |
| Members: 612 listed (`file_count` 612), stage `cycle-3-second-read-SR-C3-2`, schema `verityos.math-dre.packet-manifest.v1` | every SHA-256 and byte count recomputed | **612/612 MATCH**, 0 missing |

**Frozen-source digest indexes** (members checked against their own directory's `SOURCE-DIGESTS.json`, in addition to the manifest):
`sources/c3-stage7-sources/` 152 capsule members, `sources/SOURCE-DIGESTS.json` 65, `sources/c1-results/` 357, `sources/c2-results/` 1,
`sources/concurrent/` 1: 0 mismatches. Entries of those indexes that are not capsule members were not opened.

**Registries (read as data).** Run-local snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c3-stage2.json` (497 claims), frozen
master `sources/authority/CLAIM-IDENTITY.json` (491), concurrent master `sources/concurrent/master-510-2026-09-28/CLAIM-IDENTITY.json`
(510). Controller facts `control/C3-STAGE6-CONTROLLER-FACTS.json` and the Stage 5 facts files were read as facts, never as authority.
The controller's lexical pre-screen was not consulted.

**Read-boundary disclosures.**
1. The harness injected the project `CLAUDE.md`, the user memory index and the user's e-mail into my context before my first tool
   call. I did not act on them. Their conversation-logging instruction is superseded by the protocol's single-file write rule.
2. My first boot call used an `echo ======` separator; zsh `=`-expansion aborted it after `verity.md` was displayed. The display
   truncated the middle of `verity.md`, and I re-read that section with `sed`. The startup protocol was displayed in a separate call.
3. The manifest-listing call exceeded the tool's inline limit; the harness saved the display to its own tool-output cache outside the
   run root. I did not open that copy; I re-listed the member paths with filtered calls.
4. Directory listings outside my scratch (names only; nothing opened beyond capsule members):
   - `control/c3-second-read/` (non-recursive `ls`): it showed the four readers' `PACKET-MANIFEST` and `PATH-CHECK` files and
     `SEALS.json`. I opened only my own manifest.
   - `sources/c2-results/second-reads/SR-C2-3/` (non-recursive `ls`; a member directory; one file).
   - The C1-LA2 `Snippets/` directory (a member directory): one `ls`, one `os.listdir` inside a membership check, and one glob `cat`
     whose expansion I then confirmed consists of capsule members only (21 fragments, all members).
5. Every `grep` named a single capsule member. No `find`, `rg`, recursive `grep` or `ls -R` was run. No Mathlib read, no `lake`/`lean`,
   no network, no installs, no child agents. `python3 -B`, standard library, exact `int`/`Fraction`. Every command ran in the foreground;
   no background job was started, so none was running at the final write. Scratch only under `scratchpad/c3-sr-SR-C3-2/`; one
   `mkdir -p` for it and one for `second-reads/SR-C3-2/`.

## Statements read

From the brief, with the statement of record `cycles/cycle-3/stage6/SYNTHESIS.md` (`## Exact established results` Y-8, R-7, the
cross-route composition paragraph; `## Registrations` G-3; `## Refuted or narrowed mechanisms`):

- **SR-C3-2a — the sector flow and its Out/In sums.** For the sector flow `g_sec` on literal pairs `(B, A)` at `p*` (defined by set
  difference): the Out bridge `Σ_A g_sec(B,A) = Σ_i cb8Out(state_i(B))` with target distinctness across `(i, j, kind)`; the In-side
  identity `Σ_B g_sec(B,A) = Σ_i cb8In(state_i(A))` for in-sector targets.
- **SR-C3-2b — switch images.** A weight-`γ` switch image has exactly `8 − γ` sector preimages; an image with two or more chokes has
  none.
- **SR-C3-2c — zero classes.** Every other literal arc out of a sector source carries zero sector flow, with the corrected reason for the
  `u = r` arcs (they land on in-sector targets).
- **SR-C3-2d — arc-level composition.** The sector flow plus the criterion (E1) flow respects every target capacity at arc level; the
  doubly-fed switch images carry `(ρ_1 + θ)γ ≤ γ`. Registration text for the G-3 bridge items.

**Origins read (all capsule members).** C-T3-F (in full), C-T3-U (in full), C-U1-F (in full), C-F2-T (in full); the T3 return's
DAG, `switch_preimage_8_gamma`, `in_sector_*` and `in_bridge_zero_classes` paragraphs (lines 100–262); the F adjudication's F2
section and cross-route reconciliation; the U adjudication's portfolio notes and Established results (A2); the T adjudication's T3
section; the synthesis (identity audit, R-1..R-13, the composition paragraph, results, refuted list, headline, awards' "no award"
groups, registrations, continuation ruling); SR-C2-3 (statements, alias check, findings, registration text, verdicts); both contracts;
C1-LA1's `Main.lean` (entries 1–33, the definitions and the terminal statement); the C1-LA2 definition fragments 0001–0012, 0014–0020,
0022, 0023; the composition key's run-local record (statement, scope with the `[r31 C2; SR-C2-3]` note, certificate, aliases) and the
list of `E993-R31-` keys with grades. Frozen critic and seat instruments under `sources/c3-stage7-sources/` were digest-checked but not
run and not used as evidence; the controller's replays were not cited.

**Where the hypotheses enter (duty 2).**
- The bridge identities (the pair function, the Out and In sums, the preimage census, the zero classes) are graph-combinatorial on
  `CB(8,m)`. They use no property of `m`, of the rank or of the residue class, and they hold for any table of `pb`, `pc`, `σ`.
- The class `m ≥ 107`, `m ≡ 2 (mod 3)` enters only through the composition key's hypotheses: (c) (nonnegativity, Out at leg total
  `K = (16m+1)/3`, In at `K − 1`, Switch, Residual; supplied by the formally verified allocation key) and (b) (condition (i), which
  gives `ρ_q ≤ 1`); and through the integrality of `p* = (16m+4)/3`. Hypothesis (a) (`F_{p*} = leafSet`) fixes the weights `1`, `0`,
  `γ`.
- Endpoint: the identities hold at `m = 107` as at every `m`. Fixed point `CB(8,107)/572` reproduced before any arc check (below).
- No `M_0`, no remainder, no asymptotic step. No Newton or Darroch step in any of the four items. ℕ-subtractions: `K − 1` (`K ≥ 571`),
  `8 − γ` (`γ ≤ 8`), `8 − β − γ` (in `ℚ` inside `cb8In`, guarded by `β + γ ≤ 7`), `p* − q`, `p* − q − 1` (`q ≤ m`, `p* − m − 1 =
  (13m+1)/3 > 0`): all in range.

## Independent re-derivation

**Proof (my own).** Labels `0 = r`, `1 = s`, `2 = v`, `u_i = 3+17i`, `b_ij = u_i+1+2j`, `c_ij = u_i+2+2j`; `N(r) = {s, u_0..u_{m−1}}`,
`N(s) = {r, v}`, `N(v) = {s}`, `N(u_i) = {r, b_i0..b_i7}`, `N(b_ij) = {u_i, c_ij}`, `N(c_ij) = {b_ij}`. A sector set contains `r` and
`v`, hence neither `s` nor any choke.

1. *Pair function.* On any graph, a `transportRel` pair `(B, A)` is a (D) arc iff `A ⊆ B` (then `B ∖ A = {q}`) and an (S) arc iff
   `A ⊄ B` (then `A ∖ B = {u}` with `u ∉ B`, and `B ∖ A = N(u) ∩ B`). So the arc label is read off the pair, and `g_sec` defined by set
   difference is a total function; two arcs out of one source with the same target would have the same label. Target distinctness is
   generic.
2. *Out sum.* The arcs out of a sector source `B` are the `K` leg deletions, the deletions of `r` and `v`, the switch at `s`
   (`N(s) ∩ B = {r, v}`), and the switch at `u_i` iff `β_i = 1` (`|N(u_i) ∩ B| = 1 + β_i`); no other switch (`b_ij`: at most `c_ij`,
   since `u_i ∉ B`; `c_ij`, `v`: one neighbour). With `g_sec = pb/pc` on leg deletions at the source's own state, `σ(γ_i)` on the
   `u_i`-switch when `γ_i ≥ 1`, and `0` elsewhere, regrouping by choke gives `Σ_A g_sec(B,A) = Σ_i Out(β_i, γ_i)` exactly, matching
   `cb8Out` including its `1 ≤ γ` guard (`cb8Sigma m 0 = 0` since `cb8CGamma 0 = 0`).
3. *In sum.* For `A` with `r, v ∈ A`, a (D) preimage `A ∪ {y}` needs `y` independent of `A`; `y ∉ N(r) ∪ N(v) = {s, u_i}`, so `y` is a
   leg vertex at an empty leg, and `A ∪ {y}` is a sector source whose state at that choke is `(β_i+1, γ_i)` (`y = b_ij`) or
   `(β_i, γ_i+1)` (`y = c_ij`). An (S) preimage inserts `u ∈ A` with a 2-subset of `N(u) ∖ A`: `u = r` gives `(A ∖ {r}) ∪ {u_i, u_k}`
   (`s` is excluded by `v`), valid iff chokes `i, k` have no b-leg, `C(z,2)` of them, non-sector; `u = v, c_ij` have one neighbour;
   `u = b_ij` would put `u_i` next to `r`; `u ∈ {s, u_i}` is not in `A`. Summing `g_sec` over the (D) preimages at choke `i` gives
   `(8 − β_i − γ_i)(pb(β_i+1,γ_i) + pc(β_i,γ_i+1)) = cb8In(β_i, γ_i)` (0 at `β_i + γ_i = 8`), and the (S) preimages contribute 0.
   The identity is exact before scaling and holds for any table; the scaled load is `≤` it only when the arc values are nonnegative
   (C-T3-U's instrument slip, off-class negative cells, is the witness that the order matters).
4. *Switch preimages.* If `A` contains `v` and exactly one choke `u_i` (so `r, s ∉ A`, no b-leg at `i`), a sector preimage contains
   `r ∉ A`, so it is not a (D) preimage (those contain `u_i`, incompatible with `r`); an (S) preimage inserts the unique element of
   `A ∖ B`, which is `u_i` (the only vertex of `A` adjacent to `r`), and `N(u_i) ∩ B = {r, b_ij}` with `c_ij ∉ A` for independence.
   So the sector preimages are `(A ∖ {u_i}) ∪ {r, b_ij}` over the `8 − γ` legs with `c_ij ∉ A`, all at state `(1, γ)`; `w_leafSet(A) = γ`
   (`W_v = {r}` misses `A`; `W_{c_kl} = {u_k}` meets `A` iff `k = i`). A target with two or more chokes has no sector preimage (a sector
   source has no choke, and one step inserts at most one vertex). A one-choke target without `v` has none (every image of a sector
   source that contains a choke is a `u_i`-switch image, which keeps `v`). This holds at `γ = 8` too (0 preimages).
5. *Zero classes.* The deletions of `r`, `v`, the switch at `s` and the switch at state `(1,0)` carry `g_sec = 0`, and their targets have
   weight 0 (no `r` with `v`, no active private leaf). The switch-at-r arcs land on in-sector targets (item 3) but start at non-sector
   sources, where `g_sec = 0`; the criterion flow is deletion-only. T3's "never touch a sector target" is false; the conclusion stands for
   this reason.
6. *Composition.* Scale the sector part by `1/Σ_i Out(B) ≤ 1` (Out, leg total `|B| − 2 = K`), so each sector row sums to exactly
   `1 = w(B)`. Loads: in-sector `≤ Σ_i In ≤ 1` (leg total `K − 1`) plus 0 from the criterion flow (all (D) preimages are sector);
   one-choke `v`-target with `1 ≤ γ ≤ 7`: sector `≤ (8 − γ)σ(γ) ≤ θγ` (Switch) plus criterion `ρ_1 γ`, total `≤ (ρ_1 + θ)γ ≤ γ`
   (Residual); `γ = 8`: `8ρ_1 ≤ 8`; any other `r`-free target with `q ≥ 1` chokes: `ρ_q w ≤ w` (condition (i)); everything else has
   weight 0 and load 0. The criterion flow's per-target load `ρ_q·w_F(A)` is CARRIED from the criterion key; I did not re-derive it.

**Instrument A** (`sr_bridge_small.py`, own code; the (D) ∪ (S) relation over every vertex, no pre-filter; literal `activeWeight` with
`F = leafSet` read off the adjacency; `g_sec` as a pair function by set difference; random signed rational tables, `d` legs in place of
8). Exhaustive at every rank of `CB(d,m)` for `(d,m) ∈ {(8,1), (2,2), (2,3), (2,4), (3,2), (3,3), (4,2), (5,2), (6,1), (7,1), (1,5)}`, and
every independent set of size `≤ 6` of `CB(8,2)` (4,808,558 sets): 137,226 sector sources, 107,658 in-sector targets, 54,317 one-choke
`v`-targets, 60,835 multi-choke and 126,249 one-choke no-`v` targets, 16,529 switch-at-r arcs into in-sector targets, 437,491 zero-class
sector arcs, 15,163,265 arcs. Checks: distinctness; image count `K + 3 + #{β_i = 1}`; source sum `= Σ Out`; target sum `= Σ In`; the
complete in-sector preimage census; the `d − γ` preimage set, its shape, state `(1, γ)` and weight `γ`; zero sector preimages at
multi-choke and no-`v` targets; zero classes on weight-0 targets; positive sector inflow only on in-sector and one-choke `v`-targets.
**0 failures.** Non-vacuity: four mutants (target state for deletions; `In` factor off by one; `σ` on `(1,0)`; preimage count off by one)
produce 1393, 665, 369 and 432 failures.

**Instrument B** (`sr_bridge_atrank.py`, own code) at rank `p*` on `CB(8,m)`, `m = 107` (endpoint) and the untested rows `149, 155, 200`.
**Fidelity first, per row:** generic tree DP on the literal adjacency equals the contract's closed form; `n`, `α`, `x` scanned through
`α`; eligibility and descent (a); `F_{p*}` derived at the index `i_{p*+1}(T−t) < i_{p*}(T−t)` for `v` and three private-leaf
representatives, the other private leaves through a literal equality check of every deleted choke-subtree DP table (all equal);
`F = leafSet`; (WID) from independent sides, a literal active-tag DP (source side) against `C5LA1.aggregate` from `H_t`/`R_t` deletion
DPs. Both DPs are validated against brute force on `CB(8,1)` and 40 random trees (82 cases, 0 failures).

| m | n | α | p* | x | closed form | elig. ∧ desc. (a) | F = leafSet | (WID) | S | (1−ρ_1)/θ |
|---|---|---|---|---|---|---|---|---|---|---|
| 107 | 1822 | 964 | 572 | 570 | equal | yes | yes | holds | < 0, 409 digits | 34.901 |
| 149 | 2536 | 1342 | 796 | 794 | equal | yes | yes | holds | < 0, 570 digits | 48.573 |
| 155 | 2638 | 1396 | 828 | 826 | equal | yes | yes | holds | < 0, 593 digits | 50.526 |
| 200 | 3403 | 1801 | 1068 | 1065 | equal | yes | yes | holds | < 0, 765 digits | 65.174 |

The §5 fixed point `CB(8,107)/572` (`n = 1822`, `α = 964`, `x = 570`, margin 34.90) is reproduced. Concordance only: my `S` and supply at
`m = 107` hash to `cb941a35…` and `494eba71…`, the prefixes C-F2-T reports.

Then, with the C1-LA1 tables parsed from the frozen Lean text (36 + 36 + 7 cells) and `ρ_1 = r_1(K)/r_1(K−1)` from my own convolution:
per row 12 sector sources (forced states `(1,γ)` for `γ = 0..7`, `(1,0)^6(1,7)^4`, `(8,0)`, `(0,8)`, mixed), 8 in-sector targets
(including the load-1 profile `(1,4)^{(2m+2)/3}(1,5)^{(m−2)/3}`), 9 one-choke `v`-targets `γ = 0..8`, and 3 controls (two chokes with `v`;
one choke with `s`; one choke alone), each with its complete literal image or preimage set (7,181 / 9,931 / 10,354 / 13,313 images;
12,119 / 17,018 / 17,434 / 22,619 preimages). Results: source sum `= Σ Out ≥ 1` (minimum exactly 1 at `m = 107`); in-sector target
sum `= Σ In`, scaled load `≤ 1` and exactly 1 on the load-1 profile; the switch-at-r census `C(z,2)`, all non-sector; `8 − γ` sector
preimages of the stated shape and state, weight `γ`, unscaled sector inflow `(8 − γ)σ(γ)`; controls 0 sector preimages; zero classes
on weight 0; scaled sector load `+ ρ_1γ ≤ 0.99575γ, 0.99692γ, 0.99704γ, 0.99769γ` at `m = 107, 149, 155, 200`. **0 failures.** These
rows are `bounded_computation`, sanity only.

## Findings and repairs

1. **One fact, one record (the principal repair).** Most of Y-8 is already registered on the composition key: its statement carries
   the per-target composition, the `8 − γ` preimage count, the `(ρ_1 + θ)γ ≤ γ` bound and "every other target receives no sector flow",
   and the `[r31 C2; SR-C2-3]` scope note carries the sector-arc table, target distinctness, the switch-image preimages for `γ ≤ 7`, the
   in-sector preimages including `C(z,2)` with the correct zero-flow reason, and the doubly-fed class. G-3's scope note must therefore
   add only what is new, and cite the rest:
   - `g_sec` as a total function of the pair by set difference, with generic label uniqueness;
   - the Out and In sums as exact identities before scaling (the registered text has "at most `Σ_i In` before scaling");
   - the switch-preimage statement at `γ = 8` and for the non-image targets (multi-choke, one choke without `v`);
   - the split statement of the zero classes, with the struck reason recorded;
   - the per-target load written out for every target class, including `γ = 8` and weight 0.
   The text below does exactly this. "The exact weight formula as the target case-split input", the remaining G-3 item, is SR-C3-3's
   object and is not in my text.
2. **SR-C3-2a domain and order (repair).** `g_sec(B,A)` must be `0` off literal arcs and off sector sources, stated on the face. The
   Out/In identities are regroupings valid for any table; the inequality "scaled load `≤ Σ_i In`" uses hypothesis (c)'s nonnegativity.
3. **SR-C3-2b target class (repair).** "A weight-`γ` switch image" is circular at `γ = 8` (such a target is no image) and ambiguous for
   one-choke targets without `v`, which also have weight `γ` but no sector preimage. The class is stated by membership: `v` and exactly
   one choke `u_i` in `A`. C-U1-F's "any rank `p`" is a property of the argument; under fence 1 nothing is claimed off `p*` and the class.
4. **SR-C3-2c wording (repair).** The switch-at-r arcs are not arcs out of a sector source; they start at non-sector sources
   `(A ∖ {r}) ∪ {u_i, u_k}`. The zero-class statement is split into (i) the zero sector arcs (deletions of `r`, `v`; switch at `s`;
   switch at `(1,0)`; all into weight-0 targets) and (ii) the switch-at-r arcs, which land on in-sector targets and carry no flow for the
   corrected reason. The correction concerns T3's route text only; the registered `[r31 C2; SR-C2-3]` note already gives the right
   reason.
5. **SR-C3-2d hypotheses (repair).** C-F2-T's closing sentence names Out, In and Residual only. The composition also uses nonnegativity,
   Switch and condition (i) (`ρ_q ≤ 1` on the non-doubly-fed `r`-free targets). The criterion flow's per-target load `ρ_q·w_F(A)` stays
   carried from the criterion key. This read does not remove the "E1 per-target load not verified at arc level" caveat; that is the
   object of SR-C3-1 (clone-level exactness) and SR-C3-3 (the literal arc function).
6. **No defect in the mathematics.** The origins agree with each other and with my proof and instruments. No cut, no template failure,
   no refuted mechanism revived; no status transfer. The synthesis's corrections to T3 (the struck reason) and to C-F2-T's A-list stand.
7. **Alias and predicate check.** No new key is proposed. The composition key occurs exactly once in the run-local registry and is
   absent as key or alias from both masters, as expected for a run-local key. The record id
   `R31-C3-SR-C3-2-SMALL-CB-AND-CLASS-ROW-LITERAL-SECTOR-BRIDGE-AUDIT` occurs nowhere. None of the tokens `LITERAL-SECTOR-BRIDGE`,
   `SECTOR-BRIDGE`, `IN-SUM`, `OUT-BRIDGE`, `IN-BRIDGE`, `SWITCH-PREIMAGE`, `PREIMAGE-COUNT`, `ARC-LEVEL`, `DOUBLY-FED`, `ZERO-CLASS`,
   `SR-C3-2` or `BRIDGE-AUDIT` occurs in a key or alias of the three registries. The key's name remains a predicate its statement
   satisfies; the note adds proof-face text only. Working labels (Y-8, R-7, A2, Lemma DF, E1, award labels) are kept out of the
   registry text.

## Registration text

```text
SCOPE NOTE ON: E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107
TEXT: [r31 C3; SR-C3-2] The sector part of this key's flow as a function of literal pairs, its exact source and target sums, the sector preimages of every r-free target, the zero classes, and the load of every target at arc level (proved_informal; no new key; the key's statement, hypotheses, grade and fences are unchanged; this note adds to the [r31 C2; SR-C2-3] note and restates none of it beyond what the new clauses need). Notation as on this key's face: T = CB(8,m), p* = (16m + 4)/3, K = p* − 1, F = F_{p*}(T) = leafSet(T) by hypothesis (a), (β_i(X), γ_i(X)) the state of choke i in the set X. (1) Definition by set difference. For B ∈ I_{p*+1}(T) and A ∈ I_{p*}(T), g_sec(B, A) := 0 unless r, v ∈ B and (B, A) is a literal (D) ∪ (S) arc; on such an arc, g_sec(B, A) := pb(β_i(B), γ_i(B)) if B ∖ A = {b_ij} for some leg j of choke i, pc(β_i(B), γ_i(B)) if B ∖ A = {c_ij} for some leg j of choke i, σ(γ) if A ∖ B = {u_i} and the state of B at choke i is (1, γ) with γ >= 1, and 0 otherwise. This is a total function of the pair on any graph: a (D) arc has A ⊆ B and its deleted vertex is the unique element of B ∖ A; an (S) arc has A ⊄ B and its inserted vertex is the unique element of A ∖ B; so the arc label and the distinctness of the targets of one source need no argument specific to CB. (2) Source sum. For every sector source B, Σ_{A ∈ I_{p*}(T)} g_sec(B, A) = Σ_i Out(β_i(B), γ_i(B)) exactly: the targets are the K + 3 + #{i : β_i = 1} distinct images of the [r31 C2; SR-C2-3] note, and the β_i b-deletions, the γ_i c-deletions and, when β_i = 1 and γ_i >= 1, the switch at u_i regroup by choke into Out. The leg total of B is |B| − 2 = K, so hypothesis (c) Out gives Σ_i Out >= 1, and the scaled sector part g_sec(B, A)/Σ_i Out(β_i(B), γ_i(B)) has row sum exactly 1 = w_F(B). (3) Target sum on in-sector targets. For every A ∈ I_{p*}(T) with r, v ∈ A, Σ_{B ∈ I_{p*+1}(T)} g_sec(B, A) = Σ_i In(β_i(A), γ_i(A)) exactly before scaling. The (D) preimages are A ∪ {b_ij} and A ∪ {c_ij} over the 8 − β_i − γ_i empty legs of each choke i; each is a sector source in state (β_i + 1, γ_i), respectively (β_i, γ_i + 1), at choke i and carries pb(β_i + 1, γ_i), respectively pc(β_i, γ_i + 1), on its arc to A, and their sum at choke i is In(β_i, γ_i), which is 0 at β_i + γ_i = 8. The only (S) preimages are the switches at r from (A ∖ {r}) ∪ {u_i, u_k}, one for each of the C(z, 2) pairs of chokes with no b-leg in A; they are non-sector and carry 0. No other literal preimage exists: s and every u_i are excluded by r ∈ A, v and c_ij have one neighbour, and a preimage through b_ij would contain u_i together with r. The identities (2) and (3) are regroupings and hold for any table; the bound "load after scaling <= Σ_i In(β_i(A), γ_i(A)) <= 1" (leg total K − 1) uses the nonnegativity and In of hypothesis (c). (4) Sector preimages of r-free targets. Let A ∈ I_{p*}(T) contain v and exactly one choke u_i (so r, s ∉ A and A has no b-leg at choke i) and let γ = #{j : c_ij ∈ A}, 0 <= γ <= 8. The sector sources B with a literal arc from B to A are exactly the 8 − γ pairwise distinct sets (A ∖ {u_i}) ∪ {r, b_ij} over the legs j with c_ij ∉ A, each through the switch at u_i from state (1, γ): a sector preimage contains r ∉ A, so it is not a (D) preimage (those contain u_i); the inserted vertex of an (S) preimage is the only vertex of A adjacent to r, namely u_i; and (A ∖ {u_i}) ∪ {r, b_ij} is independent exactly when c_ij ∉ A. Further w_F(A) = γ (the witness r of v is absent; the witness u_k of c_kl is present exactly when k = i), so the sector inflow of A before scaling is (8 − γ)·σ(γ) for 1 <= γ <= 7 and 0 for γ ∈ {0, 8}. A target with two or more chokes has no sector preimage (a sector source has no choke and one step inserts at most one vertex), and a target with exactly one choke and v ∉ A has none (every image of a sector source that contains a choke keeps v). This extends clause (2) of the [r31 C2; SR-C2-3] note to γ = 8 and to the one-choke targets without v and the multi-choke targets. The argument uses no property of the rank, but nothing is claimed off this key's class and rank. (5) Zero classes. Among the arcs out of a sector source, g_sec is 0 exactly on the deletion of r, the deletion of v, the switch at s and the switches at chokes in state (1, 0), and each of these arcs ends at a target of weight w_F = 0. Separately, the literal switch-at-r arcs from the non-sector sources (A ∖ {r}) ∪ {u_i, u_k}, which contain v and two chokes, DO land on in-sector targets, C(z, 2) of them per target; they carry no flow because the sector part is sourced only at sector sets and the criterion flow is deletion-only. This is the reason of record; a Cycle 3 route statement that these arcs never reach an in-sector target is struck. (6) Load of every target at arc level. Take the scaled sector part on sector sources and, on non-sector sources, the deletion-arc flow of E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL, which loads each r-free target with q >= 1 chokes at exactly ρ_q·w_F(A) and every other target at 0 (carried at that key's grade; not re-derived here). Then: an in-sector target receives at most Σ_i In(β_i(A), γ_i(A)) <= 1 = w_F(A) from the sector part and nothing from the criterion flow, since every (D) preimage of it is a sector source; a one-choke target containing v with 1 <= γ <= 7 receives at most (8 − γ)·σ(γ) <= θ·γ (Switch) from the sector part and ρ_1·γ from the criterion flow, in total at most (ρ_1 + θ)·γ <= γ (Residual), and these are the only targets fed by both parts; with γ = 8 it receives only 8·ρ_1 <= 8; every other r-free target with q >= 1 chokes receives only ρ_q·w_F(A) <= w_F(A) (condition (i) gives ρ_q <= 1); every remaining target has w_F = 0 and receives 0. This restates the key's own flow target by target and adds no status; ρ_1 = max_q ρ_q is not used. No Darroch, Newton, asymptotic step, M_0, census value or θ* law enters (1)–(6); the ℕ-subtractions K − 1, 8 − γ (γ <= 8) and 8 − β − γ (β + γ <= 8, taken in the rationals inside In) are in range; the class enters only through hypotheses (b) and (c) and the integrality of p*. Checks (bounded_computation; sanity only, never evidence of the universal statement): record R31-C3-SR-C3-2-SMALL-CB-AND-CLASS-ROW-LITERAL-SECTOR-BRIDGE-AUDIT; the literal instruments of C-T3-F (m = 107, 125, 128, 140), C-T3-U (nine class rows; exhaustive at m = 1, 2), C-U1-F (four small trees; rows 107–140), C-F2-T (CB(8,2), CB(8,3); m = 125, 128, 140) and the r31 Cycle 3 U adjudicator (four small trees), 0 failures. Attribution: the exact target sum on in-sector targets, the complete preimage census of in-sector targets and the corrected zero-flow reason: critics C-T3-F and C-T3-U (Claude Opus 5.5, r31 Cycle 3, first written at Stage 4); the definition by set difference and the generic uniqueness of arc labels: critic C-T3-U; the literal switch classification on cbGraph m (compiled scratch, no grade): critics C-T3-F and C-T3-U; the switch-preimage count on the literal network at every rank, the image weight and the multi-choke zero class: critic C-U1-F (Claude Opus 5.5), re-derived by the r31 Cycle 3 U adjudicator (Claude Opus 5.5), who added the switch-at-s zero-class note; the written bridge paragraph and its literal checks: critic C-F2-T (Claude Opus 5.5); the per-target composition at arc level: the r31 Cycle 3 F adjudicator (Claude Opus 5.5); the ruling on the zero-flow reason: the r31 Cycle 3 T adjudicator (Claude Opus 5.5); consolidation: the r31 Cycle 3 synthesis (Claude Opus 5.5); the route restatement of the sector-arc accounting, whose zero-flow reason is struck: r31 Cycle 3 seat T3 (Claude Sonnet 5); the γ = 8 and one-choke-without-v clauses, the exact-before-scaling form, the split of the zero classes, the full hypothesis list of (6) and own literal instruments: isolated second read SR-C3-2 (Claude Opus 5.5). This key's own attribution (r31 Cycle 1 U2, C-U2-T, C-U2-F, the Cycle 1 U adjudicator and synthesis, SR-3; the [r31 C2; SR-C2-3] note's authors; r30 as registered, including the choke-local sector certificate method; Codex GPT-6's lower-region run for the transport network, the active-tag weight, the relation (D) ∪ (S), (HALL) and the CB family) travels unchanged. Fences: this key's fences apply unchanged; one rank per tree, the class only; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL, E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, governed beta and Erdős #993 stay OPEN, with no status transfer; E993-TREE-REAL-ROOTED stays REFUTED; nothing here discharges hypothesis (a), (b) or (c) or certifies a row.
```

```text
RECORD: R31-C3-SR-C3-2-SMALL-CB-AND-CLASS-ROW-LITERAL-SECTOR-BRIDGE-AUDIT
CLAIM: (A) Exhaustive literal audit, every independent set at every rank, of CB(d,m) for (d,m) ∈ {(8,1), (2,2), (2,3), (2,4), (3,2), (3,3), (4,2), (5,2), (6,1), (7,1), (1,5)}, and every independent set of size at most 6 of CB(8,2): arcs (D) ∪ (S) generated from adjacency over every vertex; activeWeight literal with F = leafSet; the sector part as a function of the pair by set difference with random signed rational tables (d legs in place of 8). For 137,226 sector sources: pairwise distinct targets, K + 3 + #{β_i = 1} arcs, source sum = Σ_i Out. For 107,658 in-sector targets: preimages exactly the sector deletions at empty legs and C(z, 2) switches at r from non-sector sources with v and two chokes (16,529 such arcs), target sum = Σ_i In. For 54,317 targets with v and one choke: exactly d − γ sector preimages (A ∖ {u_i}) ∪ {r, b_ij}, all at state (1, γ), weight γ, sector inflow (d − γ)·σ(γ) (0 at γ = 0). For 60,835 multi-choke and 126,249 one-choke targets without v: no sector preimage. 437,491 zero-class sector arcs, all into weight 0. 0 failures; four mutants (target state on deletions, In factor, σ at (1,0), preimage count) fail 1393, 665, 369 and 432 times. (B) At rank p* on CB(8,m), m = 107, 149, 155, 200, fidelity first: the generic tree DP equals (1+2x)G^m + x(1+x)(1+2x)^{8m}; x through α (570, 794, 826, 1065); eligibility and descent (a); F_{p*} derived and equal to leafSet; (WID) from a literal active-tag DP against C5LA1.aggregate (both DPs validated against brute force on 82 small cases); fixed point CB(8,107)/572 reproduced. Then, with the allocation of record parsed from its Lean source: per row 12 sector sources (source sum = Σ_i Out >= 1, minimum exactly 1 at m = 107), 8 in-sector targets (complete preimage census; target sum = Σ_i In; scaled load <= 1, exactly 1 on the profile (1,4)^{(2m+2)/3}(1,5)^{(m−2)/3}), 9 targets with v and one choke at γ = 0..8 (8 − γ sector preimages of the stated shape; weight γ; scaled sector load plus ρ_1·γ at most 0.99575γ, 0.99692γ, 0.99704γ, 0.99769γ), 3 controls with no sector preimage. 0 failures.
STATUS: bounded_computation
PROVENANCE: Isolated second read SR-C3-2 (Claude Opus 5.5), own instruments under scratchpad/c3-sr-SR-C3-2/: sr_bridge_small.py (af0314c6db633704500220b6516d67b438ee0f925a7f3082cfa19a7da9dc21ca; sr_bridge_small_out.json 06fae3de5ab56bdc6b9c0c6641c05545739df52a072b6df3cf007bc14ba631c2), sr_bridge_atrank.py (c81d50498e931ac93e48fce4bb8234f9484e17de3f34aaf82a31c5b1f17c5c73; sr_bridge_atrank_out.json ff78bac3ae9955476ab2b8db27f4ba4257392e305edc4d464fa8ae9ebffbe92f). Sanity only; never evidence of a universal statement.
```

## Verdicts

verdict[SR-C3-2a]: confirmed_with_repairs
verdict[SR-C3-2b]: confirmed_with_repairs
verdict[SR-C3-2c]: confirmed_with_repairs
verdict[SR-C3-2d]: confirmed_with_repairs

- **SR-C3-2a.** Both identities are confirmed by my own proof and two own literal instruments. Repairs: `g_sec` is 0 off literal arcs
  and off sector sources, on the face; the identities are exact before scaling and hold for any table, while the scaled In bound uses
  nonnegativity; target distinctness is generic. Grade `proved_informal`.
- **SR-C3-2b.** Confirmed. Repairs: the target class is stated by membership (`v` and exactly one choke), which covers `γ = 8` (no
  preimage) and excludes one-choke targets without `v` (weight `γ`, no preimage); the rank-uniformity is fenced to `p*` and the class.
  Grade `proved_informal`.
- **SR-C3-2c.** Confirmed. Repair: the switch-at-r arcs are not arcs out of a sector source; the statement is split and the corrected
  reason is recorded as the reason of record. Grade `proved_informal`.
- **SR-C3-2d.** Confirmed. Repairs: the full hypothesis list (nonnegativity, Out, In, Switch, Residual, condition (i)), the `γ = 8` and
  weight-0 cases, and the criterion flow's per-target load kept as carried. Grade `proved_informal`; it adds no status to the key.
- **Registration.** Register the scope note and the record above verbatim, as G-3's bridge items; SR-C3-3's weight-formula text is
  separate. No new key; no grade moves on any key or headline.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Artifact inventory

Written file: `second-reads/SR-C3-2/SECOND-READ.md` (this file). Scratch, all under `scratchpad/c3-sr-SR-C3-2/`, run in the
foreground with `python3 -B` (standard library; exact `int`/`Fraction`):

| File | SHA-256 | Purpose |
|---|---|---|
| `seal_check.py` | `c203a435957ef93dbd0d779abf27775b08a28e7a6b9d85c1ae31a628ed868869` | capsule seal and 612 member digests |
| `srcdig.py` | `1aa6e5ed56fa7cddcb6fbf31c8b0a0fada22afb3ba25d1a2f8a95b34bc646a82` | capsule members against the frozen `SOURCE-DIGESTS.json` indexes |
| `sr_bridge_small.py` | `af0314c6db633704500220b6516d67b438ee0f925a7f3082cfa19a7da9dc21ca` | instrument A: exhaustive small `CB(d,m)`, every rank, with mutants |
| `sr_bridge_small_out.json` | `06fae3de5ab56bdc6b9c0c6641c05545739df52a072b6df3cf007bc14ba631c2` | its output (`total_failures: 0`) |
| `sr_bridge_atrank.py` | `c81d50498e931ac93e48fce4bb8234f9484e17de3f34aaf82a31c5b1f17c5c73` | instrument B: fidelity, (WID), sampled literal audit at `p*`, `m = 107, 149, 155, 200` |
| `sr_bridge_atrank_out.json` | `ff78bac3ae9955476ab2b8db27f4ba4257392e305edc4d464fa8ae9ebffbe92f` | its output (0 failures; fidelity ok at every row) |
| `sr_alias.py` | `5835c780e15340893232dadcc89bc6b7fd8cf64be77566a147e7f4fc30b0e7a7` | alias and token check against the three registries |

Replay: `cd scratchpad/c3-sr-SR-C3-2 && python3 -B sr_bridge_small.py && python3 -B sr_bridge_atrank.py 107 149 155 200`, then
`cd` to the run root and `python3 -B scratchpad/c3-sr-SR-C3-2/sr_alias.py`.
