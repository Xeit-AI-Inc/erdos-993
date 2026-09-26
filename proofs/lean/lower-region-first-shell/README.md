# Lean proof: First-shell original-leaf pointwise sign and favorable aggregate

The governed [verification receipt](../../../runs/erdos-993-lower-region-compensation-dre-2026-09-25/runs/lean-2026-09-25-c3-first-shell-repair-2/VERIFICATION-REPORT.json) records `formally_verified` for `E993FirstShell.firstShellPointwiseAndAggregate`. The project in [source/](source/) copies the five pinned Lean project files byte-for-byte. The [archived governed run](../../../runs/erdos-993-lower-region-compensation-dre-2026-09-25/runs/lean-2026-09-25-c3-first-shell-repair-2/) retains the kernel, allowed-axiom, dependency and independent statement-fidelity evidence.

For every finite ordinary tree T and natural p>=3 with |V(T)|=2p+2 and x(T)+2<=p, every original degree-one leaf v with unique original support s has Delta_(p-1)(T-{v,s})-Delta_(p-1)(T-N_T[s])<=0. Also, for every finite ordinary tree T and natural p with |V(T)|=2p+2, x(T)+2<=p and 3p<2alpha(T)+1, the complete sum of that same term over the original degree-one leaves v satisfying Delta_p(T-v)<0 is nonpositive. Here x is the first STRICT descent of the zero-extended independence counts, Delta_j=i_(j+1)-i_j is an integer difference, all supports and neighborhoods belong to the original tree, and distinct leaves remain separate summands even with common support. The first conjunct has no alpha or favorability hypothesis.

The [theorem contract](../../../runs/erdos-993-lower-region-compensation-dre-2026-09-25/runs/lean-2026-09-25-c3-first-shell-repair-2/THEOREM-CONTRACT.yaml) fixes this scope. The first-shell pointwise component requires no favorable-selector or alpha hypothesis; the aggregate component keeps the exact strict original-leaf selector. No statement here closes the arbitrary-tree lower-region aggregate, all-rank aggregate, governed beta aggregate, TREE, FOREST or Erdos993.

To reproduce with installed Lean **v4.32.2**, Mathlib commit `905b95818eb32af7874a58b427f50c1711a5e96c`, and dependencies pinned to the included manifest:

```sh
cd source
lake build
lake env lean LeanProof/Main.lean
```

The governed receipts are the evidence for the existing formal award. Packaging copied their already verified source; it did not create a new award or rebuild Lean. Allowed reported axioms are `propext`, `Classical.choice`, and `Quot.sound`. [SOURCE-HASHES.json](SOURCE-HASHES.json) records byte identity.
