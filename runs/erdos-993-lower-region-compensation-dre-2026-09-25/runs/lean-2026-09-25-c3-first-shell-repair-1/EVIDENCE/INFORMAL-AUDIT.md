---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: C3-LA1-PRODUCER
critic_id: C3-LA1-INFORMAL
attestation_id: c3-la1-first-shell-informal-v1
claim_sha256: 6edd0595c52ead3821e2858f56beb1e24616c9d305bce26d728d16ce2384db74
---
# Informal Proof Integrity Audit

This is an independent **informal review proposal to the controller**, confined to the frozen two-conjunct contract. Stop reason: every scoped mathematical inference reached a reproduced-evidence verdict; no material informal gap found. It is neither a registry award nor a kernel, axiom, assembly, or fidelity receipt. All 16 source SHA-256 values in the worker brief were recomputed and matched before inspection.

## Intended Claim

Exact informal statement from `THEOREM-CONTRACT.yaml` (the normalized whitespace form has SHA-256 `6edd0595c52ead3821e2858f56beb1e24616c9d305bce26d728d16ce2384db74`; here it is identical to the raw field):

> For every finite ordinary tree T and natural p>=3 with |V(T)|=2p+2 and x(T)+2<=p, every original degree-one leaf v with unique original support s has Delta_(p-1)(T-{v,s})-Delta_(p-1)(T-N_T[s])<=0. Also, for every finite ordinary tree T and natural p with |V(T)|=2p+2, x(T)+2<=p and 3p<2alpha(T)+1, the complete sum of that same term over the original degree-one leaves v satisfying Delta_p(T-v)<0 is nonpositive. Here x is the first STRICT descent of the zero-extended independence counts, Delta_j=i_(j+1)-i_j is an integer difference, all supports and neighborhoods belong to the original tree, and distinct leaves remain separate summands even with common support. The first conjunct has no alpha or favorability hypothesis.

Exact planned terminal header from the same frozen contract (raw UTF-8 SHA-256 `4546fe679579b0f8cafc43d01be9c42a35cafd162ebf4a84ab55773aa7a10286`, equal to the contract and receipt values):

```lean
theorem firstShellPointwiseAndAggregate :
    (∀ (V : Type u) [Fintype V] [DecidableEq V]
      (T : SimpleGraph V) [DecidableRel T.Adj]
      (v : V) (p : ℕ),
      T.IsTree → C4LA1.IsGraphLeaf T v → 3 ≤ p →
      Fintype.card V = 2 * p + 2 →
      C5LA1.crossingIndex T + 2 ≤ p →
      C5LA1.forwardDifferenceDel T (C5LA1.H T v) (p - 1) -
        C5LA1.forwardDifferenceDel T (C5LA1.R T v) (p - 1) ≤ 0) ∧
    (∀ (V : Type u) [Fintype V] [DecidableEq V]
      (T : SimpleGraph V) [DecidableRel T.Adj] (p : ℕ),
      T.IsTree → Fintype.card V = 2 * p + 2 →
      C5LA1.crossingIndex T + 2 ≤ p →
      3 * p < 2 * T.indepNum + 1 → C5LA1.aggregate T p ≤ 0)
```

The first quantified conjunct explicitly requires `3 ≤ p` and has no alpha or favorable-leaf premise. The second retains strict `3 * p < 2 * T.indepNum + 1`, but needs no separately supplied leaf. In both, `H` and `R` are original-tree deletion sets; `forwardDifferenceDel` counts independent subsets avoiding each set and subtracts integer-valued counts. `aggregate` filters the original leaf set using the strict original single-vertex deletion difference, then sums one term per original leaf.

## Reproduced Mathematical Evidence

Write `i_j(G)` for the zero-extended independent-set count, `Δ_j(G)=i_(j+1)(G)-i_j(G)∈ℤ`, `x` for the least natural rank with `Δ_x(T)<0`, and `τ(G)` for minimum vertex-cover size. The source `FirstInteriorMain.lean:217-243` makes `x` a genuine least rank: at `α(T)` the difference is negative. Since `|T|=2p+2`, `Δ_0(T)=|T|-1>0`, so `x≥1`; `x+2≤p` forces `p≥3` even in the aggregate conjunct.

**Cover-three obstruction at every earlier rank.** If `τ(T)≤3`, pad a cover to exactly three vertices, possible since `|T|≥8`. Its complement `U` is independent and has `N=2p-1` vertices. Partition independent sets by their intersection `X` with the cover. For independent `X` of size `a`, the fiber polynomial is `z^a(1+z)^b`, where `0≤b≤N` counts available outside vertices. Its contribution to `Δ_r` is `binom(b,r+1-a)-binom(b,r-a)` with integer rank indices and zero extension. The empty fiber contributes `E(N,r)=binom(N,r+1)-binom(N,r)`. For `a≤r`, every other fiber is at least `-Cat_(r-a)` by the shifted Catalan floor (`R25Card5Main.lean:993-1019`). For `a=r+1`, its contribution is exactly `1`; for `a≥r+2`, it is `0`. Thus no negative-index natural subtraction is used. There are at most `3,3,1` subsets of sizes `1,2,3`, and nonindependent fibers may be assigned the nonpositive floor in the lower bound. Hence for each `0≤r≤p-2`,

`Δ_r(T) ≥ E(2p-1,r) - 3 Cat_(r-1) - 3 Cat_(r-2) - Cat_(r-3)`, with `Cat_j=0` for `j<0`.

Because `2p-1≥2r+3`, Pascal's rule gives `E(2p-1,r)≥E(2r+3,r)`; this is also the exact scope of `R25Card5Main.lean:953-960`. At `r=0` the margin is `2`; at `r=1` it is `5-3=2`. For `r≥2`, the binomial/Catalan identity gives `(r+3)E(2r+3,r)=2(2r+3)Cat_(r+1)`, so `E≥2Cat_(r+1)`. The ratio `Cat_(j+1)/Cat_j=2(2j+1)/(j+2)≥2` for `j≥1`, so `Cat_(r+1)≥4Cat_(r-1)`. Catalan monotonicity bounds the three negative terms by `7Cat_(r-1)`. The margin is at least `Cat_(r-1)>0`. All denominators are positive. Therefore **every** `Δ_r(T)>0` for `0≤r≤p-2`; choosing `r=x≤p-2` contradicts strict negativity at `x`. Thus `τ(T)≥4`. This uses the full earlier-rank history, not positivity at one rank.

**Original leaf transfer.** Fix an original degree-one leaf `v`, its unique original support `s`, and the retained graph `G=T-{v,s}` of order `2p=2k+2`, where `k=p-1≥2`. If `G` had a cover `D` of size at most two, `D∪{s}` would cover every original edge: an edge outside `G` meets `s`, since the only edge incident to `v` is `vs`. This contradicts `τ(T)≥4`, so `τ(G)≥3` and `G` has an edge. Let `W=N_T(s)\{v}`, viewed inside `G`. Connectivity gives a path from `s` to any edge component of `G`; its first vertex in that component lies in `W` and cannot be isolated in `G`. Acyclicity is not needed for this existence claim.

**Marked shadow at the exact first-wide order.** For any graph `G` of order `2k+2`, `k≥2`, `τ(G)≥3`, and marks `W` containing a nonisolated vertex, let `q_j` count independent `j`-sets meeting `W`. Order that nonisolated mark first, then all other marks. Partition a marked set by its first mark `w_i`; the remaining choices are independent sets in `J_i=G-(N_G[w_i]∪{w_1,…,w_(i-1)})`. Consequently `q_j=Σ_i i_(j-1)(J_i)` for `j=k,k+1`. Every deletion union has at least two vertices. If `|J_i|≤2k-1`, the deletion/extension incidence count gives `i_k(J_i)≤i_(k-1)(J_i)`: if `|J_i|<k-1`, the left count is zero; otherwise `k i_k≤(|J_i|-k+1)i_(k-1)≤k i_(k-1)`. If `|J_i|=2k`, exactly two vertices `{w_i,z}` were removed. All edges outside `J_i` meet `z`: prior marks, if any, can only be `z`, and all neighbors of `w_i` lie in the removed pair. If `J_i` had at most one edge, `z` plus an endpoint of that edge (or just `z` if edgeless) would cover `G`, contradicting `τ(G)≥3`. Thus `J_i` has at least two edges. The pinned exact first-wide lemma `G1FirstWideMain.lean:2512-2524` applies with `r=k-1≥1` and `|J_i|=2r+2`, proving `i_k(J_i)≤i_(k-1)(J_i)`. Summing gives `q_(k+1)≤q_k`. This invokes the graph lemma only at its precise vertex count and edge threshold; it does not assume coefficient monotonicity under added edges.

For the leaf, `R=N_T[s]` as a deletion set, `H={v,s}`, and `W=R\H`. At every natural rank `j`, the independent sets avoiding `H` partition into those meeting `W` and those avoiding `R` (`OrderBandMain.lean:1011-1021`). Thus `i_j(T-H)-i_j(T-R)=q_j`, so the signed term at `p-1=k` is exactly `q_p-q_(p-1)≤0`. Both differences are in `ℤ`; no truncated natural subtraction occurs. Summing this pointwise bound over `leafSet T` filtered by `IsFavorableAt T v p` gives `aggregate T p≤0`. A shared support does not merge leaves, and an empty filter sums to zero. The strict alpha guard remains in the second conjunct although this route does not consume it.

## Independent Critic Pass

I checked the dangerous endpoints separately: `p=0,1,2` cannot satisfy early descent under the order equation; `r=0,1` have positive cover-three margins; fibers at shifted ranks `-1` and below are `1` and `0`, not a Catalan term produced by natural truncation. The retained graph has exactly `2k+2` vertices, so the first-wide result is used at its equality boundary, never for a wider order. An isolated first mark would break the two-vertex deletion guarantee, hence the nonisolated mark is deliberately ordered first. The order-six, `k=2` boundary was exhaustively probed over all 32,768 simple graphs: among 27,626 graphs with `τ≥3`, all 1,738,095 marked subsets containing a nonisolated vertex satisfied `q_3≤q_2` (8,465 equalities). This finite computation is a falsification check, not the proof. The cover condition is sharp as a warning: on six vertices with just edges `01,23` and `W={0}`, `τ=2` and `q_3=5>q_2=4`.

The contract receipt establishes statement shape and hashes but explicitly says `proof_claim=false` and warns `formulation_truth_unverified`; it cannot supply this verdict. `REGISTRATION-ORDER.md` also corrects the older intake proposal: the terminal must certify both quantified conjuncts and the pointwise conjunct must retain explicit `3≤p`. I used the pinned old Lean sources only to inspect exact definitions and the stated dependency lemmas. I did not compile the new assembly or verify any new Lean declaration, imports, axiom set, or statement fidelity. Those remain separate gates.

## Verdict

**Passed as an informal proof-integrity audit proposal**, with 12 verified ledger claims and no unresolved material informal gap. This does not change the frozen contract's `open` formulation status, register either theorem, or transfer any old formal award to the new conjunctive terminal. The controller may inspect this unchanged artifact before any registration.
