# Our proof gaps and the complete external argument

Date: 3 October 2026. This is a source reconciliation, not a new proof award.

## Versions and credit

The [original announcement](https://github.com/google-deepmind/formal-conjectures/issues/1058#issuecomment-5896420564)
credits Tong Zhang and Wei Li with the proposed paper proof. Their conditional
binomial representation and finite-order argument are the foundations of the
formalization directed by Kevin Vallier. The all-forest large-order argument in
Vallier's project is a replacement argument, not a formalization of every step
of Zhang and Li's original large-order manuscript. The current public
documentation gives more precise attribution to Zhang and Li for the window,
input forms, variance identity, and competitor construction as well.

- Previously reproduced source: [c524aa28565dbde8b9b685c4c45511a6b434f3b5](https://github.com/selfreferencing/erdos993-lean/tree/c524aa28565dbde8b9b685c4c45511a6b434f3b5).
- Current inspected source: [dd1580fcbb533a5d64e3d97beb2e5ee1653ba883](https://github.com/selfreferencing/erdos993-lean/tree/dd1580fcbb533a5d64e3d97beb2e5ee1653ba883).
- Archived manuscript: [Zhang and Li, Zenodo](https://doi.org/10.5281/zenodo.22999166).
- Previously reproduced [Formal Conjectures bridge](https://github.com/selfreferencing/erdos993-lean/blob/c524aa28565dbde8b9b685c4c45511a6b434f3b5/docs/FORMAL_CONJECTURES_BRIDGE.md).

The current source has 650 tracked files. Relative to our 653-file baseline,
647 are identical, three differ, three are absent from current `main`, and none
was added relative to the baseline.
All **623 local Lean modules in the all-forest headline's import closure are
byte-identical**. The three absent files are the Formal Conjectures bridge,
its audit probe, and its report. They remain on the separate
`formal-conjectures-bridge` branch at the pinned baseline. These are sibling
branches sharing ancestor `865e81498ecacda3de0d47647927353a7fadbba5`, not a
linear sequence deleting the bridge.
This does not invalidate the surviving all-forest theorem. It does mean the
old bridge command is not a valid build command for the latest checkout.
No motive for the branch arrangement is inferred.

We freshly rechecked source identity and all seven evidence hashes in the
previous reproduction receipt. That reproduction built the full theorem and
bridge with exit 0 (8,710 jobs). **This review does not claim a fresh build of
the current checkout.** Our assessment remains a credible complete
computer-assisted proof under its disclosed trust model, not independent
journal acceptance or an exhaustive human re-proof.

## How the complete deduction closes

1. Encode any finite forest by an acyclic graph on `Fin n` and count actual
   independent vertex sets. Empty and disconnected forests are included.
2. For `n <= 60`, reduce arbitrary forests to a finite scalar parameter domain;
   prove checker soundness and check all 17,100 parameter triples by kernel
   reduction. This is not a census of 17,100 graphs.
3. For `n >= 61`, choose an independent set B maximizing the sum of hard-core
   occupation marginals at a positive activity lambda. This is not simply a
   maximum-cardinality set or our favorable-leaf selector.
4. Condition on an independent outside configuration J. Let Y count its
   occupied vertices and M count the unblocked vertices in B. Exactly,
   `K | J = Y + Bin(M, lambda/(1+lambda))` and the configuration weight is
   `lambda^Y (1+lambda)^M / Z(lambda)`. The joint law matters.
5. For `n >= 61` and a candidate rank `ceil(n/4) < k < h_B(F)`, where h_B is
   the first matching-envelope mode, choose lambda in `(1/3,7/3)` so that
   `E[K] = k`. Then
   `E[delta] = 0`, with `delta = k-Y-qM`, and
   `E[delta^2] = Var(K)-q(1-q)E[M]`.
6. Discharge O1-O5 and the separately proved O6 activity-coverage obligation:
   O1 controls `Var(M)`; O2 controls the
   total-size variance relative to the occupation weight; O3 controls small-M
   tails; O4 excludes a window valley using these inputs; O5 supplies a mean
   floor. `AnalyticInputs` has five fields, not six assumed profile fields.
   Distinct analytic complements cover large fibre counts, large means and
   unbounded rooted numerical domains beyond the certificate regions.
7. Transfer the signed weighted comparison back to the original coefficients.
   A coefficient valley would force
   `(lambda+1/lambda)P_k-P_(k-1)-P_(k+1) <= 0`; the certified comparison
   contradicts this. Tilted-probability unimodality alone is not sufficient.
8. Combine the rising prefix, valley-free middle, and falling tail into one
   weak peak. The order split has no missing size. The pinned bridge transports
   vertex labels and adds the zero tail beyond the independence number.

Load-bearing sources at the current pin: `Statement.lean`,
`ZhangKernel/Main.lean`, `Analytic/HardCore/Mixture.lean`,
`Analytic/NoValley/Core.lean`, `Analytic/Translate.lean`, `Analytic/Top.lean`,
`Analytic/Reserve/Assembly.lean`, `Analytic/O2/Main.lean`, and
`Analytic/Erdos993.lean`, all under `Erdos993Lean/`.

## Gap-by-gap comparison

| Our interface or gap | What the external proof does | Logical relationship |
| --- | --- | --- |
| Minimum first recovery and endpoint descent | Excludes weak valleys at strict window ranks for n >= 61; combines prefix/tail and separate n <= 60 proof | Alternative sufficient route to the headline; not a construction of our smaller carrier |
| One original leaf good at both endpoints | Averages over a hard-core configuration law | Bypassed; no common-leaf overlap theorem follows |
| Residual/token identities need a positive global budget | Quantitative mixture variance and tail budgets | Similar compensation purpose, different objects and weights; a transfer must be proved |
| Arbitrary-tree favorable-leaf aggregate | Proves a different weighted expectation has the needed sign | Does not establish our selected original-leaf aggregate |
| All-subset weighted Hall / shared capacity | Uses global moment inequalities and checker soundness | Does not prove our network Hall condition; Hall can be a stronger research objective |
| Arbitrary forest assembly | Works directly for forests, including component induction | Closes FOREST externally without assuming convolution preserves arbitrary unimodality |
| Rooted composition and marking inheritance | Quantitative rooted states, carefully rooted components, occupation-weight marking | Useful guidance; not a proof that every restricted maximizing marking remains optimal after conditioning |
| Size-independent centered kernel candidate | Uses a mean floor plus finite small-order proof | Does not eliminate the order threshold or prove our all-interior candidate |
| Exact small-size correction | Separate finite-order relaxation and certificates | Closes small orders by another route, not by identifying our requested recursive correction |
| Exact scalar weighted-adjacent identity | Uses the corresponding activity-sensitive translation | Compatible reusable algebra; scalar identity alone proves no graph sign |
| Universal log-concavity, real-rootedness, pointwise beta | Does not require these strengthenings | Existing refutations remain binding; weak unimodality does not rescue them |

Thus the collections combine into a clear picture of #993, but **they are not
yet one merged recursive proof**. The external argument supplies a complete
headline. Our restricted Hall, marked/residual identities and compensation
results offer alternative structure and stronger scoped properties. Their
relation to a new recursively closed invariant remains a mathematical task,
not a consequence of putting two ledgers together.

## Trust and claim registry

The kernel-checked finite-order theorem selected by the headline has only
`propext`, `Classical.choice`, `Quot.sound`. The optional alternate `ZhangCert`
finite-order theorem uses one `native_decide` and additionally trusts
`Lean.ofReduceBool` and `Lean.trustCompiler`; it is not that selected path.
The full theorem additionally uses `Lean.ofReduceBool` and `Lean.trustCompiler`
through 271 analytic certificate evaluations. Soundness lemmas and evaluated
certificates are separate trust layers. The current documentation explicitly
states that O4's boxes were checked by Lean without an independent external-code
replay. For O3, Lean checked its own 277,664-cell cover, not a full replay of
the original 18.7-million-cell cover. O1/O2 had reported independent replays.
This is not a newly discovered counterexample, but must constrain assurance
claims. The small-order scalar checker uses its exact soundness hypotheses;
it is not a complete census of graphs.

Our canonical registry remains at 525 identities: 334 VERIFIED, 104 REFUTED,
26 CONDITIONAL and 61 OPEN, at mixed evidence grades. These are not theorem
counts or a completion percentage. Documentary external-source annotations do
not change any of those claim objects. TREE/FOREST being OPEN in our stricter
programme means our own promised governed deduction is unfinished, not that
we deny the external all-forest result. The different TRANSFER and stronger
Hall/leaf targets are not settled by the external headline.

## Implications for future work

Keep a new recursive proof's consumer separate from its producer. A Lean
theorem saying a universal injection family implies unimodality does not
construct that family. Preserve ranks, marking, ownership, compatibility and
boundary cases through every recursive join. Use external bounds as proved
interfaces only at their exact trust and domain scope. A new size-independent
structural proof may use different invariants; no rigid commitment to our old
transport or the external analytic layout is required.

Concrete guidance from the public recursion is available already. O1 preserves
a fixed leaf-containing independent marking through a two-generation reserve,
rather than assuming each restricted marking remains optimal. O2 preserves
the global marginal law through rooted physical records, constructs an
independent competitor and uses global maximality only in the final comparison.
Density carries root-present/root-absent surplus channels and treats small
local degree cases separately from an unbounded complement. These are proved
state-management mechanisms to study, not ready-made injections for our network.
Their precise assumptions and trust dependencies must travel with any reuse.

The source-study coverage accounts for all 641 public Lean files. Generated
numeric interiors were structurally inspected rather than independently
re-evaluated. A supplemental static review read all 51 supporting proof bodies
left partial in the initial certificate-source pass (16,592 lines); the original
coverage reports remain intact. No new kernel build or numerical replay follows
from those body reads; file coverage is not an exhaustive human re-proof. The previously
reproduced build and fresh byte comparisons remain separate evidence layers.

This public amendment contains no private collaborator materials, source
code, research results, or repository contents. No new theorem-search cycle
or formal award is reported here.
