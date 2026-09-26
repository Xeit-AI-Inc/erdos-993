# Lean proof: Marked-isolate and ordinary-leaf order bands

The governed [verification receipt](../../../runs/erdos-993-lower-region-compensation-dre-2026-09-25/runs/lean-2026-09-25-c2-order-bands-repair-1/VERIFICATION-REPORT.json) records `formally_verified` for `E993OrderBand.markedIsolateAndOrdinaryLeafOrderBand`. The project in [source/](source/) copies the five pinned Lean project files byte-for-byte. The [archived governed run](../../../runs/erdos-993-lower-region-compensation-dre-2026-09-25/runs/lean-2026-09-25-c2-order-bands-repair-1/) retains the kernel, allowed-axiom, dependency and independent statement-fidelity evidence.

For every finite simple graph G with m vertices, every vertex subset W containing all isolated vertices of G, and every natural k>=2 with m<=2k+1, the number of independent (k+1)-sets meeting W is at most the number of independent k-sets meeting W. Also, for every finite ordinary tree T, every original degree-one leaf v with its unique original support s, and every natural p>=3 with |V(T)|<=2p+1, Delta_(p-1)(T-{v,s})-Delta_(p-1)(T-N_T[s])<=0. Counts are zero outside supported natural ranks, and Delta_j(G)=i_(j+1)(G)-i_j(G) is an integer difference. All neighborhoods and leaf identities are those of the original tree.

The [theorem contract](../../../runs/erdos-993-lower-region-compensation-dre-2026-09-25/runs/lean-2026-09-25-c2-order-bands-repair-1/THEOREM-CONTRACT.yaml) fixes this scope. No statement here closes the arbitrary-tree lower-region aggregate, all-rank aggregate, governed beta aggregate, TREE, FOREST or Erdos993.

To reproduce with installed Lean **v4.32.2**, Mathlib commit `905b95818eb32af7874a58b427f50c1711a5e96c`, and dependencies pinned to the included manifest:

```sh
cd source
lake build
lake env lean LeanProof/Main.lean
```

The governed receipts are the evidence for the existing formal award. Packaging copied their already verified source; it did not create a new award or rebuild Lean. Allowed reported axioms are `propext`, `Classical.choice`, and `Quot.sound`. [SOURCE-HASHES.json](SOURCE-HASHES.json) records byte identity.
