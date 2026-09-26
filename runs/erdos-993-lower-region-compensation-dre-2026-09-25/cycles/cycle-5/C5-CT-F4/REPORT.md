# C5-CT-F4 critique (orientation T)

## Reviewed claim

`C5-F4.BOUNDED-PROPER-SELECTOR-SEARCH` reports an exact finite search for a tree/rank pair with both favorable and nonfavorable original leaves. I independently audited the stated graph recipes, eligibility window, full original-leaf selector, and complete selected sum.

## Replay and checks

All four C5-F4 case pins and all 237 common packet pins matched their SHA-256 values. I copied the pinned search and evaluator sources into this worker scratch directory, changed only the replay script's evaluator path to that local copy, and ran the replay in the foreground. `REPLAY.json` is byte-for-byte generated JSON whose parsed value equals the route's sealed `EVIDENCE.json`. The copies are retained here so the calculation can be replayed without executing sealed source in place.

The finite generation boundaries and replayed results are:

- `KL_T_triple`: sorted triples with `1 <= k1 <= k2 <= k3 <= 20`; the count is `C(22,3)=1540`. There are zero eligible ranks in this box, so this family supplies no selector rows.
- `central_path_spider`: sorted arm multisets, 3 through 5 arms, each length 1 through 8; the count is `C(10,3)+C(11,4)+C(12,5)=1242`. It contributes 166 eligible tree-rank pairs.
- `KL_fixture_path_graft`: the five explicitly named fixtures, every nonleaf attachment vertex, and each graft length 1 through 5; it contributes 425 constructions and 142 eligible tree-rank pairs.

For each generated tree, the replay computes the exact forest independence polynomial by tree dynamic programming, sets `alpha` to its degree, and finds the first negative `Delta_j` while including the zero-extended terminal rank. It checks integer ranks from `x+2` through `floor(2 alpha/3)`, which is equivalent to the strict guard `3p < 2alpha+1`. At each checked rank it computes `Delta_p(T-v)` separately for every original leaf and selects exactly the leaves with a strict negative value. The resulting 308 eligible pairs have no proper selector.

The eligible `(7,7,7)` centered path spider is a useful arithmetic control, but it is not a proper-selector witness: its polynomial is `(1,22,210,1141,3891,8661,12684,12028,7086,2401,409,30,1)`, `alpha=12`, and `x=6`. At `p=8`, `3p=24<25`; each original leaf `7,14,21` has `Delta_8(T-v)=-2483`. Each corresponding original support deletion summand is `900-1815=-915`, giving the full selected sum `S=-2745`. Thus the eligibility, strict selector, and complete-sum arithmetic for this control check out.

## Disposition

**retained.** The statement is correctly limited to the two searched families and finite parameter bounds (the KL triple box has no eligible rows). Its bounded exact result is supported by replay. It does not establish that eligible trees have all leaves favorable, does not produce the requested proper-selector witness, and does not prove or refute the lower-region aggregate. No issue was found in the computation that would justify rejecting this bounded claim.

## Limitations

This is an exact calculation over the specified generated families, not a census of ordinary trees. The copied replay is still computational evidence; no formal proof of its universal algorithmic correctness is supplied here. The proper-selector witness remains unresolved, and no conclusion follows for trees outside the listed finite boxes or for the primary aggregate.
