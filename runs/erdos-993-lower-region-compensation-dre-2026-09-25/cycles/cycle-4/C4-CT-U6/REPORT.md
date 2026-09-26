# C4-CT-U6 independent critique (orientation T)

## Covered claim

Reviewed exactly `C4-U6-first-shell-bridge`.

## Disposition: retained_narrowed

Retain the definition-level bridge and the stated first-shell scale limit, narrowed to an informal, scope-specific result. The source is right that the frozen interfaces encode the original-leaf selector, original deletion sets, integer differences, and one summand per original leaf, with exact per-leaf identity `summand = q_p - q_(p-1)`. The first-shell marked-shadow route uses a retained graph of order `2p`; its cited sharp first-wide step is calibrated to that order. This gives no bridge to the unrestricted-order lower-region aggregate.

This disposition does not verify the entire first-shell proof afresh, promote its informal proof grade, or certify a terminal Lean declaration. The claim is properly nonauthoritative; the general primary aggregate remains open.

## Independent audit

- **Definitions and selector.** In `BASE.lean`, `support` is choice-defined off leaves but `support_spec` proves adjacency and uniqueness when the vertex is a leaf. Consequently `H={v,s}` and `R={s}∪neighborFinset(s)=N[s]` on the domain under review. The avoided-set count uses independent subsets of the original vertex type; its difference embeds counts in `Int`. The favorable predicate is the strict negative difference after deleting the original vertex, and `aggregate` sums over the original leaf set filtered by that predicate. Thus leaves sharing a support are not merged.
- **Partition arithmetic.** Since `H⊆R`, independent k-sets avoiding H split disjointly into those meeting `R\\H` and those avoiding R. The tagged family counts the first class, so `i_k(T-H)-i_k(T-R)=q_k`. Subtracting this identity at `k=p-1` from the identity at `k=p` proves the summand is `q_p-q_(p-1)` with integer subtraction. The eligible primary ranks have `p≥2`; the audited first-shell argument uses `p≥3` and `k=p-1≥2`. There is no natural-number subtraction or selector replacement in this identity.
- **Scope and proof gap.** The first-shell contract fixes `|V(T)|=2p+2`; removing the two distinct vertices in H leaves exactly `2p` vertices. That is the equality case needed by the cited first-wide lemma for `r=p-1`. The general target has no order equation, and `3p<2alpha(T)+1` constrains alpha rather than order. The report's cover/marked-shadow argument is an informal proof at its stated first-shell scope, not a larger-order theorem. No global compensation argument or arbitrary-order marked-shadow result is supplied here.
- **Standing controls and usefulness.** No governed-tree interpretation is introduced. The selector remains the original strict `Delta_p(T-v)<0`; all supports/neighborhoods are from T; the argument described is pointwise before summing, so it preserves the full selected sum and same-support leaf tags. No local positive-term or census claim is used as a refutation. The identity is a useful formal interface for a future scale-up, but it has no sign by itself.
- **Verification boundary.** The preflight receipt records an earlier successful compile with warnings. The first-shell contract separately requires kernel and fidelity checks; neither is evidenced for the terminal theorem here. I performed source inspection only, no Lean build, and no new computation or replay.

## Limitations

- No fresh proof of the entire first-shell marked-shadow argument was attempted; the disposition retains it only at the informal scope and grade documented by its admitted report.
- No arbitrary-order proof, counterexample, exhaustive census, or terminal kernel/fidelity receipt was produced.
- Hash verification covered all source entries listed in both assigned packets; no other files were read.
