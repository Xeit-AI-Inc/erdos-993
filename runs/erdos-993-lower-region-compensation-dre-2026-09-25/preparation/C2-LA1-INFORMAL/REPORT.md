# C2-LA1-INFORMAL — proposed independent informal review

**Verdict proposed to controller:** PASS for the exact two-conjunct mathematical statement in `THEOREM-CONTRACT.yaml`. This is an informal proof-integrity result, not a Lean build, kernel receipt, fidelity award, registry change, or claim about the first order shell. The contract validator receipt says `valid_for_formalization` and expressly has `proof_claim: false`; my mathematical verdict rests on the derivation below.

**Provenance.** I read the exact assigned brief first, then independently SHA-256-checked all 18 files on its allowlist; every hash matched. The planned Lean statement's UTF-8 SHA-256 is `2f76927cdaeade070834c224eae8d5a846ee9a05cb4d04aade9524be58ad0437`, matching the contract. The prior audit and formal plan were context, not proof authority. The relevant pinned meanings are `E993Interior.taggedFamily` (independent subsets of `U` meeting `W`), `C4LA1.IsGraphLeaf` (exactly one original neighbor), `C5LA1.support`, `H`, `R`, `indepSetsAvoiding`, and integer `forwardDifferenceDel`. Proposed `IsolateCovered` is relative coverage at `Finset.univ`; proposed `markedCount` is the tagged-family cardinality.

## Independent reconstruction: marked incidence

Prove a stronger internal lemma on any finite ambient vertex set `U`, with `m=|U|`, where `W` contains every vertex isolated **relative to U**. Let `q_j` count independent `j`-subsets of `U` that meet `W`, including zero for impossible ranks. For each set `A` counted by `q_k`, let `b(A)` count vertices of `U` adjacent to at least one vertex of `A`, and put `B=Σ_A b(A)`. Because `A` is independent, its open neighborhood in `U` is disjoint from `A`; exactly `m-k-b(A)` vertices extend it independently. Let `C` count each independent `(k+1)`-set in `U` with at least two marks **once**, regardless of its precise number of marks.

Double count pairs `(A,y)` with `A` counted by `q_k` and `y` an addable vertex. Each upper set with exactly one mark has `k` marked-preserving deletions. Each with at least two marks has `k+1`. Thus, in integers,

```text
k q_(k+1) + C = (m-k) q_k - B,
k (q_(k+1)-q_k) = (m-2k) q_k - B - C.       (1)
```

For `m≤2k`, the right side of (1) is nonpositive. For `m=2k+1`, split the lower family into good `A` with `b(A)>0` and bad `A` with `b(A)=0`. Each good set contributes at least one to `B`. Every vertex in a bad `A` is isolated relative to `U`, hence belongs to `W`. If a non-isolated `y∈U` exists, it lies in no bad `A` and is adjacent to no element of any bad `A`. The fixed map `A↦A∪{y}` is injective (delete the fixed `y` to recover `A`); its image has at least `k≥2` marks and is counted by `C`. Consequently `B+C≥#good+#bad=q_k`, so (1) gives `q_(k+1)≤q_k` since `k>0`. If every vertex of `U` is isolated, then `U⊆W` and all subsets are independent and marked except the empty set. With `m=2k+1` and `k≥2`, complement pairs the `k` and `k+1` subsets, giving equality.

This reasoning also handles `U=∅`, empty marked families, `k>m`, and `k` above the independence number: the families and sums are empty, and the `m≤2k` case applies. There is no natural-number subtraction of coefficients. The relative-neighborhood count is essential: counting neighbors outside `U` would invalidate the extension formula.

Taking `U=V(G)` gives the first contract conjunct. The isolate premise is exactly `IsolateCovered G W`; no bipartite, tree, independence-number, or selector condition is used.

## Independent reconstruction: original tree bridge

Let `v` be an original degree-one leaf of a tree `T` and `s=support T v`. The leaf condition makes `s≠v`, `v~s`, and `s` the only neighbor of `v`. Put `D={v,s}=H T v`, `E={s}∪N_T(s)=R T v`, `U=V(T)\D`, and `W=E\D`. Here `D⊆E`, and `W=N_T(s)\{v}` in the retained vertex set; all neighborhoods refer to the original `T`.

Take `u∈U` isolated relative to `U`. Since `T` is connected and `u≠s`, the path from `u` to `s` starts with an original neighbor of `u`. Isolation in `U` forces that neighbor into `D`. It cannot be `v`: an edge `u~v` would force `u=s` by the original leaf property. Hence it is `s`, so `u∈W`. This includes singleton residual components and the two-vertex tree, for which `U=W=∅`. A one-vertex tree cannot satisfy the degree-one leaf premise.

At every natural rank `j`, the independent `j`-sets avoiding `D` partition into those meeting `E` and those disjoint from `E`. The first class is the marked family on `U` with marks `W`; the second is exactly the independent `j`-sets avoiding `E`. Therefore `i_j(T-D)=q_j+i_j(T-E)`, including `j=0` and all unsupported ranks. Since `|D|=2`, `|U|=|V(T)|-2≤2p-1=2(p-1)+1`. With `k=p-1≥2`, the relative lemma gives `q_p≤q_(p-1)`. Expanding the two integer forward differences gives

```text
Δ_(p-1)(T-D) - Δ_(p-1)(T-E)
  = [i_p(T-D)-i_p(T-E)] - [i_(p-1)(T-D)-i_(p-1)(T-E)]
  = q_p-q_(p-1) ≤ 0.
```

This is the second contract conjunct exactly. It uses the original support and original closed neighborhood. It makes no assertion about a favorable-leaf aggregate, first-descent eligibility, or the order `2p+2` shell.

## Separate critic pass and limitations

I checked the fragile points again without using the prior verdict: the correction `C` is one per multiply marked upper set, since the excess over `k` deletions is exactly one even with three or more marks; the fixed-`y` image need not have `y` unmarked; relative isolates in a bad `A` are all marked; and `D⊆E` makes the count partition exact. At `m=2k+1`, the edgeless case is necessary because no non-isolate `y` can be fixed. At `k=1`, the claim can fail: one edge plus a marked isolated vertex on three vertices gives `q_2=2>q_1=1`. At `m=2k+2`, a star with one marked leaf gives `q_(k+1)=binom(2k,k)>binom(2k,k-1)=q_k` for `k≥2`. These boundary examples confirm that the two generic guards do mathematical work.

The source fragment supplies proposed definitions only; there is no new Lean proof body. I did not run Lean or inspect an unlisted project. The structural receipt verifies binding and hashes, not theorem truth. A later kernel check and independent formalization-fidelity review remain separate controller gates. No unresolved mathematical gap was found in these two conjuncts.

**Stop reason:** bounded informal audit completed. Ledger rows: 9 verified, 0 escalated. Evidence: this derivation and `INFORMAL-AUDIT.md`. No second model-family run or cross-document repair was part of the brief; no sources were changed.
