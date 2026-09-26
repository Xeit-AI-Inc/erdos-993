---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: C2-LA1-PRODUCER
critic_id: C2-LA1-INFORMAL
attestation_id: c2-la1-order-band-informal-v1
claim_sha256: 9aaeb99788cde87e98e8532cb12d9f24579a1f81bddcbb3985e426f2dde9fa4c
---

# Informal Proof Integrity Audit

This is an independent informal mathematical proposal to the controller. All 18 brief-listed source hashes matched their pins. The contract validator's structural receipt passed but explicitly made no proof claim. No Lean build or formal award is asserted.

## Intended Claim

Exact contract informal statement:

> For every finite simple graph G with m vertices, every vertex subset W containing all isolated vertices of G, and every natural k>=2 with m<=2k+1, the number of independent (k+1)-sets meeting W is at most the number of independent k-sets meeting W. Also, for every finite ordinary tree T, every original degree-one leaf v with its unique original support s, and every natural p>=3 with |V(T)|<=2p+1, Delta_(p-1)(T-{v,s})-Delta_(p-1)(T-N_T[s])<=0. Counts are zero outside supported natural ranks, and Delta_j(G)=i_(j+1)(G)-i_j(G) is an integer difference. All neighborhoods and leaf identities are those of the original tree.

Exact contract `lean_binding.expected_statement`:

```lean
theorem E993OrderBand.markedIsolateAndOrdinaryLeafOrderBand :
    (∀ (V : Type u) [Fintype V] [DecidableEq V]
      (G : SimpleGraph V) [DecidableRel G.Adj]
      (W : Finset V) (k : ℕ),
      E993OrderBand.IsolateCovered G W →
      2 ≤ k →
      Fintype.card V ≤ 2 * k + 1 →
      E993OrderBand.markedCount G W (k + 1) ≤
        E993OrderBand.markedCount G W k) ∧
    (∀ (V : Type u) [Fintype V] [DecidableEq V]
      (T : SimpleGraph V) [DecidableRel T.Adj]
      (v : V) (p : ℕ),
      T.IsTree →
      C4LA1.IsGraphLeaf T v →
      3 ≤ p →
      Fintype.card V ≤ 2 * p + 1 →
      C5LA1.forwardDifferenceDel T (C5LA1.H T v) (p - 1) -
        C5LA1.forwardDifferenceDel T (C5LA1.R T v) (p - 1) ≤ 0)
```

The exact planned statement hashes to `2f76927cdaeade070834c224eae8d5a846ee9a05cb4d04aade9524be58ad0437` as recorded in the contract.

## Reproduced Mathematical Evidence

For a finite ambient set `U` of order `m`, count marked independent `j`-sets by `q_j`, assuming all `U`-relative isolates are marked. For each marked independent `k`-set `A`, let `b(A)` be the number of its neighbors inside `U`; put `B=Σ_A b(A)`. Let `C` count each independent `(k+1)`-set with at least two marks once. Counting addable incidences from below and marked-preserving deletions from above yields `k q_(k+1)+C=(m-k)q_k-B`, hence `k(q_(k+1)-q_k)=(m-2k)q_k-B-C` in integers. If `m≤2k`, the difference is nonpositive. If `m=2k+1`, good lower sets contribute at least one to `B`; bad lower sets consist entirely of marked relative isolates. Given a fixed non-isolate `y`, `A↦A∪{y}` injects bad sets into those counted by `C`, with at least `k≥2` marks. Thus `B+C≥q_k`. If no non-isolate exists, `U` is edgeless, all vertices are marked, and complement pairs the two middle layers. This proves the first conjunct at `U=V(G)`.

For the second conjunct let `s` be the original unique neighbor of leaf `v`, `D={v,s}=H T v`, `E=N_T[s]=R T v`, `U=V(T)\D`, and `W=E\D`. A vertex isolated in `U` has, by the original tree path to `s`, a first neighbor in `D`. It cannot be `v`, whose sole neighbor is `s`; hence it is adjacent to `s` and belongs to `W`. Also `D⊆E`, so at every natural `j`, `i_j(T-D)=q_j+i_j(T-E)`. The leaf and support are distinct, giving `|U|=|T|-2≤2(p-1)+1`; `p≥3` gives `k=p-1≥2`. Thus `q_p≤q_(p-1)`, exactly `Δ_(p-1)(T-D)-Δ_(p-1)(T-E)≤0` after expanding integer differences.

## Independent Critic Pass

I separately checked the one-extra-deletion multiplicity for upper sets with any number of marks at least two, the fixed-`y` injection even when `y` is marked, original rather than residual neighborhoods, the rank-zero count split, the empty and unsupported-rank cases, and the two-vertex tree. The guards are substantive: at `k=1`, an edge plus a marked isolate on three vertices violates the generic inequality; at `m=2k+2`, a star with one marked leaf violates it for `k≥2`. These are boundary checks, not inputs to the proof. No mathematical gap remains for this exact pair.

## Verdict

**Passed, informal mathematical audit only; proposed to controller.** The definition fragment has no proof body. Kernel verification, exact Lean elaboration, and formalization-fidelity review remain unperformed here. The result says nothing about the first order shell or an unrestricted aggregate.
