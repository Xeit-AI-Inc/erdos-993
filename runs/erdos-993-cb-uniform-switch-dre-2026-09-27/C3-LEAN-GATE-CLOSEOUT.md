# Cycle 3 Stage 7 — Lean Gate Closeout (r31)

Controller: Claude Opus 5.5, 2026-09-28 (07:53 EDT by the clock). Canonical run id `erdos-993-math-dre-20260927-r31-cb-uniform-switch`.
Every seat Claude Opus 5.5, chartered high (platform-applied effort); runtime-reported `claude-opus-5-5`. Governed lean-proof-workflow;
Lean `v4.32.2`, Mathlib `905b9581…`; axioms exactly `propext`, `Classical.choice`, `Quot.sound`; independent informal audit and
statement-fidelity review; fail-closed `close`. The synthesis funded one award (C3-LA1); SR-C3-1 ran concurrently.

| Award | Run | Terminal | Declarations | `Main.lean` | Informal audit | Fidelity | Close |
|---|---|---|---|---|---|---|---|
| C3-LA1 clone-level E1 transport at `p*` | `runs/lean-2026-09-28-c3-la1-cb8-e1-clone-transport` | `E993Transport.cb8_E1_cloneTransport_topRank` | 53 (20 carried: C1-LA3 entries 1–18, 20; C1-LA1 entry 11) | `1388fa52…eb15` | passed `87f7e9ed…` | match `ac4749ba…` (0 failed, 2 warnings) | **formally_verified** (`b3f358ab…`) |

## What is now formal on the class (`m ≥ 107`, `m ≡ 2 (mod 3)`, `p* = (16m+4)/3`)

- **The clone-level E1 transport** at `p*` for every open-choke count `q ∈ [1, m]` (a = 8q−1, b = 8(m−q)+1, j = p*−q): ρ_q as a
  coefficient ratio of `(1+X)^a(1+2X)^b`; `ρ_q < 1`; nonnegative type flows `g`, `h`; the balance, boundary and per-clone inflow
  identities (inflow = ρ_q exactly); the ρ₁ link to C1-LA1's residual syntax. Zero-extended, every ℕ subtraction guarded; no Newton or
  Darroch (carried entry 15, an induction over linear factors).
- Clone level only. It is **not** the literal up-cover counts on `cbGraph m`, not the E1 flow on the literal network, and not conjunct 4.
- With Cycles 1–2: (L-S)_top template (C1-LA1), CB layer and the reduction to conjuncts 2 and 4 (C1-LA2), block descent (C1-LA3), (E)
  on the literal tree (C2-LA1), closed-form and graph-level favorability (C2-LA2, C2-LA3). **Conjunct 4 remains the one open formal
  obligation**; its smallest missing nodes are the per-set neighbourhood-count bridge (R31-N-21), the sector `g_sec` with its Out/In
  bridges, and the composition.

## Reviewer observations (non-blocking; carried into registration wording)

- Fidelity W-1 / audit C-1: the class hypotheses enter only through carried entry 20 (not the domain). SR-C3-1's clause text says so.
- Fidelity W-2: `ρ_q < 1` is formal only as conjunct (2) of this terminal; entry 20 is an ungraded companion. SR-C3-1's clause says so.
- Audit C-2: `def-poly-coeff-z` listed as a conclusion dependency although proof-internal (harmless over-inclusion).
- Audit C-3: the ℕ-subtraction list omits two subtractions inside carried `cb8R1`; both are true values.
- The formalizer brief's heading reads "Cycle 2" (typo; content is Cycle 3).

## Controller rulings and errata this stage

R31-N-15/N-16 carries (origin terminal entry 20 carried as `lemma`, reversibility checked). **R31-E-h:** the formalizer resumed on the
controller's mid-attempt SR-C3-1 relay after its first return, updated `INFORMAL-PROOF.md` and regenerated the contract (Lean source and
kernel receipt unchanged); the first reviewer pair was stopped before writing anything and relaunched on the current digests; the
filed report was updated to the final return. The formalizer's report write was refused by the harness and filed by the controller
verbatim (hash table shortened, disclosed).

## Disclosures

Formalizer: names-only `ls runs/`; registrar/validator script excerpts; toolchain listing; one scratch temp file written then deleted.
Informal auditor: three Mathlib lemma statements by grep inside the package directory; T2 return headings and TP-h grep hits in its
critiques; a long computation moved to the background by the tool (harness-written output outside the run root, unopened), polled by
literal PID to completion. Fidelity reviewer: a grep of the fidelity-audit skill script; names-only listings and hashes of C1-LA2 files.
None touches a verified artifact.
