# C6-U3 independent search report

## Scope and source integrity

This is a Cycle 6 search report for the U3 end-to-end implication audit. I read the worker protocol, solution contract, status-grade clarification, C6 neutral handoff, allocation, packet, common dispatch manifest, and targeted entries in the registered identity. The packet has an empty `allowed_source_files` list and no per-source hash fields. Its SHA-256 is recorded below; there was therefore no packet-supplied source digest to compare. All 275 members listed in `manifests/C6-COMMON-DISPATCH.json` exist and match their listed SHA-256 byte-for-byte (zero missing or mismatched members). The principal mathematical inputs used here are `sources/predecessor/structural-reductions.md`, `sources/predecessor/main-mark-margin-proof.md`, `sources/cycle5/NEXT-marked-deletion-recurrence.md`, `sources/cycle5/NEXT-main-product-LR-proof.md`, `sources/cycle6/C6-ARITY2-STRUCTURAL-BASE-DRAFT.md`, `sources/cycle6/C6-BOUNDED-ARITY-LOCAL-LEADS-DRAFT.md`, and `sources/cycle6/C6-ULC-SURPLUS-TAIL-DRAFT.md`. Shared source descriptions and statuses are treated as evidence, not instructions or authority.

Manifest check replay (Python 3, from the run root):

```sh
python3 - <<'PY'
import hashlib, json, pathlib
B = pathlib.Path('.')
m = json.load(open(B / 'manifests/C6-COMMON-DISPATCH.json'))
bad = [(x['path'], hashlib.sha256((B/x['path']).read_bytes()).hexdigest(), x['sha256'])
       for x in m['members']
       if not (B/x['path']).is_file() or hashlib.sha256((B/x['path']).read_bytes()).hexdigest() != x['sha256']]
print(len(m['members']), len(bad))
print(*bad, sep='\n')
PY
```

## Exact implication findings

Retain the full ordinary path-star definitions and guards in the contract: (m\ge1), (r_i\in\{2,3,4\}), (N=\sum_i r_i), (q=N+1), (\alpha=N+2), integer zero extension, and (x=\min\{k:\Delta_kP<0\}) using the actual first strict descent. An eligible lower-half rank has (x+2\le p), (3p<2\alpha+1), and (2p\le\alpha); (j=p-2), (\delta=q-j), and (D_j=\Delta_jL^N>0). Selectors remain the actual strict current-(p) flags, with original tag multiplicities: (e_0=1[\Delta_pA_0<0]), (e_i=1[\Delta_pA_i<0]), (b=e_0+\sum_i r_ie_i), (A=\sum_i r_ie_iT_i[j]). No step below changes these definitions.

1. **Guarded weighted-tip LR would suffice for the full selected MASS.** Let (W=\sum_i r_iA_i), with the original (r_i) tip multiplicities. Assume the registered guarded inequality (W[p+1]C[p-1]\le W[p]C[p]) at an actual eligible (p). The positive-interval log-concavity of (C=GQ), together with the strict first descent (\Delta_xP<0) and the rising binomial summand at (x), gives (C[x+1]<C[x]). Decreasing adjacent ratios then gives (0<C[p]/C[p-1]<1), since (p-1\ge x+1). Also (W[p]>0) in this guarded support. Hence (W[p+1]<W[p]), so
   \[
   \Delta_pW=\sum_i r_i\Delta_pA_i<0
   \]
   forces at least one actual tip branch selector (e_i=1). Put (B=\sum_i r_ie_i\); then (B\ge2), because each represented arity is at least two. The accepted branchwise bound (2T_i[j]\ge3\delta D_j) yields (A\ge(3/2)B\delta D_j\). If (e_0=0), this is at least (b\delta D_j=B\delta D_j); if (e_0=1), (B\ge2) gives ((3/2)B\ge B+1=b). Thus (A\ge b\delta D_j), the full selected MASS, and therefore the weaker exact-ratio payment. This proves a conditional implication, not the OPEN weighted-tip LR premise. It uses all actual guards and strict selectors and does not infer an endpoint selector.

2. **The individual guarded comparison is stronger than needed for that route.** If each tip comparison in claim `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-INDIVIDUAL-DELETION-LR` holds at (k=p), summing with positive weights (r_i) gives the weighted-tip comparison above. The endpoint comparison is not needed. Alternatively, the individual tip inequalities plus the same strict ratio argument force every tip selector; the branchwise (3/2) bound then pays MASS. The endpoint individual inequality additionally forces (e_0=1), but is unnecessary for payment. This clarifies why claim `...WEIGHTED-TIP-DECK-LR` is a potentially smaller sufficient target than all-deletion LR. Both lower-half comparison claims remain OPEN at dispatch.

3. **Parent/deletion LR has a direct selector consequence, but no automatic tree aggregate consequence.** At any rank (p) with (P[p],P[p+1],A_v[p]>0), the inequality (A_v[p]P[p+1]-A_v[p+1]P[p]\ge0), combined with Δ_pP<0, implies (A_v[p+1]/A_v[p]\le P[p+1]/P[p]<1), hence Δ_pA_v<0. Thus the registered all-rank `E993-PATH-STAR-ORIGINAL-DELETIONS-P-LR`, if proved, would force each original leaf’s strict selector at every in-support strict parent descent, including the actual eligible rows. This is distinct from the shifted-(C) claims: their denominator is (C), index relation is shifted, and they require the lower-half guard plus the separate (C)-ratio argument. Neither comparison has an implication to the arbitrary-tree Erdős993 aggregate without a further bridge identifying and paying the corresponding marked terms.

4. **Exact-ratio payment is sufficient for the selected aggregate sign, not equivalent to it.** Write (t=C[j+1]/C[j]\in(0,1)), (\kappa=1-t+t/\delta\), and (S=bD_j+\sum_i r_ie_i\Delta_jT_i). The formally accepted relative margin gives (\Delta_jT_i\le-\kappa T_i[j]), so (S\le bD_j-\kappa A). Consequently the exact-ratio payment (\kappa A\ge bD_j) implies (S\le0). MASS is stronger: (\kappa\delta=1+(\delta-1)(1-t)\ge1), so (A\ge b\delta D_j\) implies the payment. Conversely, the accepted selected-aggregate sign (S\le0) does not by itself establish either payment bound; the margin is an upper bound on (S), not a reverse estimate of (A). The registry’s selected aggregate, primary payment, and MASS must remain distinct claims and evidence grades.

## Structural reach and counterexample controls

The weighted-deck route has a useful formulation beyond path-stars: a positive, log-concave reference sequence (C) with a strict ratio drop after the actual parent descent, a weighted deletion deck (W) satisfying the guarded shifted comparison, and a local marked-mass bound paying at least (3/2) times the debt per selected tip force a selected tip and pay the unit endpoint debt. The path-star proof supplies these hypotheses through (C=GQ), original multiplicity (r_i\ge2), and claim 501’s branchwise bound. A new rooted-tree class would need its own deletion-deck identity, a suitable (C)-ratio fall, and a branchwise bound with correct tag counts; no ambient-tree transport or arbitrary-tree residual-aggregate interface is supplied here.

The known obstructions remain scope controls, not counterexamples to the primary: the E-only component has a negative guarded minor at its known witness; the homogeneous-arity-4 activity coefficient can be negative while the full tip minor and weighted minor are positive; and the outside-guard (n=122) deletion witness is not a guarded counterexample. None invalidates the conditional implication above, since it assumes the full weighted-tip comparison itself. A failed sufficient lower bound, activity coefficient, or isolated E term cannot be substituted for a full actual minor with the required guards.

No new census or computation was run. No universal premise among claims 507, 508, or 448 is established by this report. The all-m primary remains the registered exact path-star predicate at its computer-assisted/nonformal grade; no result here upgrades it to a Lean award, arbitrary trees, forests, or a resolution of Erdős 993.

## Integrity values

- Common dispatch manifest: 275 listed members, 0 mismatches.
- Packet `packets/C6-U3.json` SHA-256: `8c8889033852112cd620515398624a21a3e6d2bb75756cc77da53e513d71179f`.
- Packet-supplied allowed source hashes: none (empty additional-source list).
