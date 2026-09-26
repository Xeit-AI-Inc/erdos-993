# C2-CU-T4 audit evidence

## Integrity

Both packet manifests were checked against the source bytes before review. Every listed common and case source hash matched. The route's sealed evidence was read as evidence; it was not edited or replayed in place.

## Replay

`path_replay.py` is the bounded path arithmetic copied/adapted from the route's displayed deterministic loop and stored in this assigned scratch root. It uses exact Python integers and binomial coefficients, no random seed, and checks the reported row count, order count, extrema, sign, endpoint selector, and path recurrence expression. Command: `python3 path_replay.py`.

Replay output:

```text
{'rows': 449, 'orders': 117, 'min': -140598451215242502192647212080, 'max': -38896, 'all_nonpositive': True}
```

The generation boundary is exactly paths `P_n` for `4<=n<=150`, with all integer `p` from `x(P_n)+2` through `alpha(P_n)` filtered by `3p<2alpha(P_n)+1`. This is a bounded cross-check, not an exhaustive tree census and not the basis for the all-path proof.

## Audited identities

For fixed original `F=F(T,p)`, each `q_v(j)` is the number of independent `j`-sets in `H_v` that meet `W_v`. Adding the original leaf `v` gives an independent `(j+1)`-set in `T` counted by that tag's contribution to `w_F`; deleting `v` is the inverse. Thus `sum_F q_v(j)=sum_{|B|=j+1} w_F(B)` and `S=sum_{|B|=p+1}w_F(B)-sum_{|B|=p}w_F(B)`. This is an identity, not a proof that the difference is nonpositive on general trees.

For paths, the leaf/support deletions yield `H=P_(n-2)`, `R=P_(n-3)`; `I(P_m;z)=I(P_(m-1);z)+zI(P_(m-2);z)` yields `q_v(j)=i_(j-1)(P_(n-4))`. The fixed-selector sum has the exact expression recorded in REPORT.md. Endpoint tags remain separate despite their reflected-equal profiles.
