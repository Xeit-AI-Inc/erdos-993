# C5-CT-F3 critique of C5-F3

## Disposition

**C5-F3-BOUNDED-ASYM-SEARCH — retained**, at the exact bounded scope in the source claim. The primary lower-region aggregate remains unresolved by this evidence.

## Independent checks

The case and common packet pins were checked first; all 241 listed source hashes matched. I copied the pinned `REPLAY.py` and `EVIDENCE.json` to this seat before replaying. `SOURCE-REPLAY-OUTPUT.json` records the successful replay, including the stated seeded Prüfer sample and ordered arm-profile counts.

Separately, `AUDIT.py` enumerates subsets directly on the fixture and each induced vertex set. Its results in `AUDIT.json` agree with every recorded fixture field. In particular:

- The graph has 13 vertices and 12 listed edges; it is connected by its stated path-and-branches construction, hence an ordinary tree. Direct subset counts give independence vector `(1,13,66,173,258,231,131,47,10,1)`, alpha `9`, and first strict descent `x=4` (including the terminal rank check). Rank `p=6` is eligible: `6>=4+2` and `18<19`.
- The original leaves are exactly `2,4,5,7,8,10,11,12`. Direct counts after deleting each original leaf give selector values `-46,-38,-38,-38,-38,-31,-31,-31`; therefore the complete favorable set equals the complete original leaf set in this fixture. Each same-support leaf remains a separate tag.
- For every tag, direct induced-subset enumeration verifies `H_v=T-{v,s_v}`, `R_v=T-N[s_v]`, `W_v=N(s_v)-{v}`, `alpha(H_v)=8=a-1`, the marked-set counts, actual addability count, multiply-marked count once per upper set, and the displayed summand. The totals are `Q=578`, `U=271`, `E=1514`, `C=159`, `D=1954`, and `S=-307`. Thus `E=5U+C`, and the displayed budget margin is `D+C-(2a+1-3p)Q=1535=-5S`.

## Scope and limitations

The explicit tree has a negative full aggregate, so it is neither a counterexample nor a proof of the universal inequality. It has no proper selector: every original leaf is favorable. The computed budget margin verifies the identity and arithmetic for this fixture only; it gives no general across-tag charging inequality.

The copied replay reproduces exactly 98 nonempty-selector eligible rows from 5,000 seeded random Prüfer trees, and 536 eligible rows from the 342 enumerated nonconstant ordered profiles with 3, 4, or 5 star arms of sizes in `{2,3,4}` preceded by the path `0-1-2`; neither collection has a proper nonempty selector. These are precisely bounded probes, not exhaustive over all ordinary trees, and do not imply that proper selectors never occur. The random probe depends on Python's `random.Random(993)` and the source's stated generation procedure.

No theorem, selector propagation result, or universal status is established. This critique retains only the source claim's bounded statement and scope.
