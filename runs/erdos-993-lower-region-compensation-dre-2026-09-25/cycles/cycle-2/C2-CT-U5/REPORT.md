# C2-CT-U5 critique of C2-U5

## Disposition

**Retained** for the claim's stated existential scope: the specified pendant extension changes the fixed-rank favorable tagged family and its complete aggregate on one pair for which the same rank remains eligible on both trees. The exact pair was replayed from the route's vertex and edge recipe; see `EVIDENCE.md`.

This conclusion is only about extension instability. It does not decide the primary lower-region aggregate inequality: both full sums are negative (`-4256` and `-6267`). Nor does it establish that every pendant extension changes the aggregate, or provide a universal recurrence-based sign theorem.

## Mathematical audit

The base polynomial and the extension polynomial both have independence number 12. Computing `Delta_j=i_{j+1}-i_j` through the terminal zero-extended rank gives first descent `x=6` for both; the terminal differences are respectively `-1` and `-3`. At `p=8`, `x+2<=p` and the strict lower-region guard `3p<2alpha+1` hold on both rows. The selector is the original-tree strict condition `Delta_8(T-v)<0`: all 12 base leaves qualify, and all 12 leaves of the extended tree qualify. The old leaf 10 is no longer a leaf, while the new leaf 18 has support 10. The replay preserves leaf multiplicity by listing each leaf separately and obtains every selected summand and the full sum exactly.

The stated polynomial identity for adding a pendant vertex follows by partitioning independent sets according to whether they contain the new vertex: `P_{T^+}=P_T+zP_{T-u}`. The independence-number maximum formula follows from the same partition. For a surviving old leaf, `v` remains favorable exactly when the coefficient difference of `P_{T-v}+zP_{(T-v)-u}` at ranks `p+1,p` is negative. The new leaf is favorable exactly when `Delta_p(T)<0`. In each summand's `H` deletion, if `u` survives, the added vertex is pendant at `u`; if `u` is deleted, the new vertex is isolated unless its edge endpoint is included in the deleted closed neighborhood. In the `R` deletion, the cases `u in R`, `u survives outside R`, and `u=s` yield respectively the pendant, isolated-factor, and deleted-new-vertex formulas in the route. These cases preserve the original support for every surviving old leaf; the new leaf uses support `u`. Exact polynomial replay checked all such cases on this pair.

The example is useful as a countercheck to arguments that carry old tags or the old aggregate unchanged through a leaf extension. Its limited scope is exactly the limitation stated by the source: no proof, refutation, or census of the primary target follows from it.

## Limits

- Only the one specified 18-to-19-vertex pair was checked.
- Both complete selected sums are negative; no sign reversal or refutation is shown.
- The extension identities alone give no bound on the transformed complete sum. Any reduction argument must still establish the new rank guards, all strict selector tests, and the recomputed full sum under its own hypotheses.
