# C5-T3 claim critique — matching-only slack obstruction

## Disposition: retained_narrowed

**Claim reviewed:** `C5-T3-MATCHING-ONLY-SLACK-OBSTRUCTION`. The finite-graph counterexample to the proposed per-set matching-only slack lower bound is correct. The exact matching decomposition is also correct. I retain those statements, narrowed to that intermediate bound and the displayed configuration. I do not retain the source evidence’s displayed matching-category counts or its claim that both primary guards fail.

## Independent arithmetic

For `H_v` with edges `zy1, zy2` and isolated `w`, `alpha(H_v)=3`, `nu(H_v)=1`, and `W_v={w,z}`. With `k=1` and `A={w}`, all of `z,y1,y2` are addable, so `e(A)=3`. Thus the actual slack is `2(h-k)-e(A)=4-3=1`, while the proposed matching-only lower bound is `2(h-k-nu(H_v))=2`. This is a valid counterexample.

For the displayed maximum matching `{zy1}`, both endpoints are addable. The correct category counts are `m2=1, m1=0, m0=0, u=1`, not `m2=0, m1=0, m0=1, u=3` as listed in the source evidence. The exact identity gives `2r-e=2(r-nu)+2m0+m1-u=2-1=1`. The mistaken categories do not change the independently verified failure of the proposed bound, but they invalidate that source subcalculation.

## Primary-scope and selector check

The original tree has independence counts `(1,6,10,6,1)`, hence zero-extended deltas through rank 5 are `(5,4,-4,-5,-1)`, `alpha=4`, and `x=2`. At `p=2`, the lower-region guard is **true**: `3p=6<9=2a+1`. The other guard fails: `x+2=4≤p=2` is false. Therefore this example is outside primary eligibility, but not for the two reasons stated in the source report/evidence.

Direct deletion counts give `Delta_2(T-v)=Delta_2(T-w)=Delta_2(T-y1)=Delta_2(T-y2)=-4`; all four original leaves are selected by the strict selector at this ineligible rank. Their primary summands at rank `p-1=1` are each `2`, so the full selected sum is `S=8`. This is only an ineligible positive sum and does not refute the registered target.

## Scope and limits

No across-tag bound for the unmatched-addable contribution together with the multiply-marked correction is proved. This case establishes an obstruction to the stated matching-only sufficient bound, not a global selected-family budget, a primary proof, or an eligible primary counterexample. The full exact calculations are in `AUDIT-EVIDENCE.json`.
