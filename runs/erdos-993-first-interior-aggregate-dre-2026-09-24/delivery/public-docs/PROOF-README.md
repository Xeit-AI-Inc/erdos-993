# Lean proof: first interior favorable-leaf aggregate

The governed [verification receipt](../../../runs/erdos-993-first-interior-aggregate-dre-2026-09-24/runs/lean-2026-09-24-c2-primary-v2/VERIFICATION-REPORT.json) records `formally_verified` for `E993Interior.firstInteriorAggregate` only. The project in [source/](source/) copies the pinned Lean project files byte-for-byte; the [archived governed run](../../../runs/erdos-993-first-interior-aggregate-dre-2026-09-24/runs/lean-2026-09-24-c2-primary-v2/) retains the canonical receipts and full evidence. The [final Astra-high analysis](../../../runs/erdos-993-first-interior-aggregate-dre-2026-09-24/FINAL-ANALYSIS.md) accepted the primary decisive close with no primary blockers. The canonical registry promotion is limited to this exact primary.

The exact theorem target from the [theorem contract](../../../runs/erdos-993-first-interior-aggregate-dre-2026-09-24/runs/lean-2026-09-24-c2-primary-v2/THEOREM-CONTRACT.yaml) is:

```lean
theorem firstInteriorAggregate {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hT : G.IsTree)
    (hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2) :
    C5LA1.aggregate G (G.indepNum - 2) ≤ 0
```

`G.IsTree` means a finite connected acyclic simple graph here. `C5LA1.crossingIndex` is the least rank with a **strictly** negative signed independent-set difference. Eligibility forces \(\alpha(G)\ge4\) before the natural-number subtractions are interpreted as the contract's integer \(p=\alpha-2\); the proof then derives \(\alpha(G)\ge7\). `C5LA1.aggregate` sums at that rank over every favorable *original* leaf, using its original support and closed neighborhood. Shared-support leaves remain separate terms, and no residual premise is present. The inherited `aggregate` docstring refers to a top-rank residual aggregate, but its actual rank-generic definition has no such restriction; the [independent fidelity review](../../../runs/erdos-993-first-interior-aggregate-dre-2026-09-24/runs/lean-2026-09-24-c2-primary-v2/REVIEW-SUBMISSIONS/fidelity/REPORT.md) checked the definition and recorded that stale comment as documentation only.

The [informal proof](../../../runs/erdos-993-first-interior-aggregate-dre-2026-09-24/runs/lean-2026-09-24-c2-primary-v2/SOURCE/CANDIDATE-PROOF.md) has three steps: low-rank tree counts exclude eligible \(\alpha\le6\); bipartite tagged deletion incidence gives \(kq_{k+1}\le2(\alpha(H)-k)q_k\); and the original leaf's \(H/R\) term is \(q_p-q_{p-1}\), which is nonpositive when \(p=\alpha-2\) and \(\alpha\ge7\). The Lean proof binds these counts to the registered definitions and sums the terms through the unchanged strict selector.

To reproduce with installed Lean **v4.32.2**, Mathlib commit `905b95818eb32af7874a58b427f50c1711a5e96c`, and existing dependencies already pinned to the project's manifest, run from this proof directory:

```sh
cd source
lake build
lake env lean LeanProof/Main.lean
```

The archived kernel and fidelity receipts, including the source identity and allowed-axiom check, are the governed evidence for this result. This primary theorem does not confer formal status on the three auxiliary registry keys or broader Erdős #993 headlines.
