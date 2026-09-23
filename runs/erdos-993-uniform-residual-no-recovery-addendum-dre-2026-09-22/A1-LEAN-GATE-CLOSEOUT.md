# Cycle A1 Lean Gate Closeout (r25 ADDENDUM)

Controller: Claude (Fable 5.1), 2026-09-23. Protocol: `control/A1-STAGE7-PROTOCOL.md`. Funding instrument: the
admitted synthesis `cycles/cycle-A1/stage6/SYNTHESIS.md` (`44821949…`), `## Lean awards` U-A1-1 — the only award
funded; orientations T and F `no award attempted`.

| Award | Run | Terminal declaration | Status |
|---|---|---|---|
| `A1-LA1` U-AWARD-FOREST-DELTA3-ORDER-12 | `runs/lean-2026-09-23-a1-forest-delta3-order-12/` | `Erdos993G1.ForestDelta3.forest_delta_three_pos_ge_twelve : ∀ {X : Type u} [Finite X] (F : SimpleGraph X), F.IsAcyclic → 12 ≤ Nat.card X → 0 < Erdos993G1.delta F 3` | **formally_verified** |

- Capsule `control/a1-stage7-capsules/A1-LA1-PACKET-MANIFEST.json` (`b44053d0db431732304844ac00e2ec007fdab949d09757d31b98a9416572a84c`), 30 members including
  the seat's compiled project and the byte-identical r25 provenance sources (repair R5).
- Formalizer Claude Sonnet 5 xhigh (`a1-la1-formalizer-sonnet-20260922`): `compiled-candidate`, 8,657-job clean build,
  repairs R1–R8 honoured (namespace `Erdos993G1.ForestDelta3`; the `n ≥ 12` half only; the R2 enumeration wording
  verbatim with the closure fact — exactly one `decide` in the closure, `L3_twelve_pos`; attribution faces; the
  import of record `forest_delta_two_lower`; the `L123Chain` byte-diff = one import line + header comment).
- Kernel `verified`; axioms `propext, Classical.choice, Quot.sound`; no `sorry`/`admit`/`native_decide`; single
  import `Mathlib`. Contract `a18425e1c9a53e74…`; `Main.lean` `00891d6a0e33039f…`.
- Independent informal proof-integrity audit (`a1-la1-fable-informal-20260922`, Opus 5 high): `passed`
  (`42a8b73d…`); all four formalizer disclosures ruled content-free; the mathematics reproduced (the chain to
  `n = 60`, `L3(n) > 0` to `n = 3000`, forest enumeration to order 14).
- Independent statement-fidelity review (`a1-la1-fable-fidelity-20260922`, Opus 5 high): `match` / `passed`
  (16 checks; receipt `1cc77cb2…`); non-vacuity witness `Fin 12`, `F = ⊥`.
- Close: first attempt blocked on the post-receipt `axioms.txt` restructuring (erratum A1-E-f, C6-E-h species);
  receipt-bound bytes restored; second attempt `formally_verified`. Zero bounded repairs used.
- Verification report `edaaf42bb79b822c5d62ec90525c961d68cccebc73167c634527cc5a6265e447`.

## Registry effect (applied at the addendum close)

`E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12`: `proved_informal` → `formally_verified` ON THE `n ≥ 12` HALF ONLY. The
sharpness half (`sharp at 11; P₁₁ the unique minimiser, Δ₃ = −14`) stays `proved_informal`, now confirmed at full
forest scope by the U adjudicator's 710-class census (isolated second read SR-U11 `confirmed_with_repairs`). Fixed
rank `k = 3`; never a band result; never a sharpening of the order-bound award; `E993-C13-I4-GT-I3` unmoved.

## Not attempted

T (`A1-T-01`): no Lean carrier; F (`A1-F-01`): a census over a finite class, not Lean-ready. Lane B's `Bd` tail
closed separately (`cycles/lane-b/LEAN-GATE-CLOSEOUT.md`).
