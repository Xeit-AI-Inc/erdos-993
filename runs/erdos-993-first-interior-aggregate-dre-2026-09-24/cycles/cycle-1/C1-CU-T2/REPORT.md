# C1-CU-T2 independent U critique of C1-T2

## Scope and disposition

I reviewed exactly the three incoming claims in `cycles/cycle-1/C1-T2/RETURN.json` against its pinned report and evidence, the present semantic and solution contracts, and the permitted historical r24 fence. The polynomial identity is valid as an informal lemma. The proposed pointwise budget is a valid sufficient condition but remains unproved. The six fixture computations replay exactly; they do not establish either the pointwise statement or the primary complete aggregate. No source here supplies a positive complete eligible aggregate. The primary target remains open from this route.

### C1-T2-ALG-IDENTITY: proposed retained

For an original leaf `v` with original support `s`, put `H=T-{v,s}` and `R=T-N_T[s]`. Partition independent sets of `T-v` by membership of `s`. The sets avoiding `s` are independent sets of `H`; the sets containing `s` are `s` joined to independent sets of `R`. Thus `I_(T-v)=I_H+z I_R`. Partitioning `T` by membership of `v` also gives `I_T=(1+z)I_H+z I_R`. Since `R` is induced inside `H`, the latter identity implies `alpha(T)=alpha(H)+1`: its `z I_H` term has positive top coefficient, and no other term has higher degree.

Under the zero extension in `SEMANTIC-CONTRACT.md`, coefficient comparison is valid for every integer rank `p`, including negative ranks. With `a=Delta_p(T-v)` and `g=Delta_(p-1)(H)-Delta_(p-1)(R)`, one gets

`a=Delta_p(H)+Delta_(p-1)(R)` and `g+a=i_(p+1)(H)-i_(p-1)(H)`.

When `p=alpha(T)-2` and `a<0`, this becomes `g=i_(alpha-1)(H)-i_(alpha-3)(H)+|a|`. This verifies the incoming identity with the original leaf and original closed neighborhood convention. The proof needs no eligibility or residual assumption. It is informal and has no Lean gate, as the origin report correctly says. The source is `cycles/cycle-1/C1-T2/REPORT.md`, “Exact deletion identity and reduction.”

### C1-T2-ALPHA2-BUDGET: proposed retained as an unresolved conditional

For each favorable leaf, `g<=0` is *equivalent* to `i_(alpha-3)(H)-i_(alpha-1)(H)>=-Delta_(alpha-2)(T-v)`. If it holds for all favorable leaf tags then their complete sum is nonpositive. This is strictly stronger than the contracted aggregate theorem; a positive individual summand would not alone refute the primary theorem. The condition `x(T)+2<=alpha(T)-2` is about the full polynomial `I_T`. The route gives no inequality transferring that condition to the two near-top coefficients of each `H_v` or to the selector deficit of `T-v`. Consequently the budget's truth and the primary target remain unresolved. This is a reduction, not a proof. The inherited T22 positive summand at `p=34` has `alpha=68`, so it is a valid warning against rank-unqualified pointwise claims but is outside this frozen `p=66` row; see `sources/public/experiments/r24-direct-favorable-leaf-aggregate.md`, “Outcome,” and `sources/standing-controls/t22-order91.json`. The inherited Hall and log-concavity fences do not enter this coefficient identity, so they create no hidden premise here.

### C1-T2-BOUNDED-POINTWISE-CHECK: proposed retained with replay qualification

I copied the source `identity_probe.py`, `random_probe.py`, and `ordinary_tree.py` into this assigned scratch directory. I changed only the random script's output path to `random-probe.json` in my own directory; the source script otherwise writes `scratchpad/C1-T2/random-probe.json`, so its report's stated replay from the run root has that mutable scratch path dependency. Running the copies reproduced `large_constructed_summary.json` and `random-probe.json` exactly as JSON objects. They give `(alpha,x,p,F,S)=(251,139,249,2,-322849250)` for `P_501`, `(377,181,375,376,-26506125)` for `T_125`, and for the four order-260 Prüfer trees respectively `(147,79,145,96,-36327064026382336)`, `(146,80,144,91,-11820291646586501120)`, `(146,79,144,93,-9046564555277139968)`, `(146,79,144,94,-6020601544695297024)`. Each has zero positive favorable summands and satisfies the eligibility guard. The random script uses one continuous pseudorandom stream seeded `20260924`; its case labels ending `20260925` through `20260927` are labels, not separate seeds. This does not change the fixtures or results.

Separately, `independent_audit.py` counts independent sets by literal vertex subsets, without importing the route's DP. It checked all `1+3+16+125+1296+16807=18248` labeled Prüfer trees of orders 2–7 and 358242 leaf/rank instances for the deletion identities, including rank `-1` and terminal ranks; all passed. None of these trees meets `x+2<=alpha-2`, so that enumeration does not test the target sign. An eligible 9-vertex star has `alpha=8`, `x=4`, `p=6`, eight favorable leaves with `a=-6`, `g=-14` each, and complete `S=-112`, also checked by independent subset enumeration. These are bounded checks. The six larger source fixtures and the small audit do not justify universal pointwise or aggregate status.

Replay after controller admission from the run root:

```
cd cycles/cycle-1/C1-CU-T2
python3 identity_probe.py
python3 random_probe.py
python3 independent_audit.py
```

The output paths in this report and the return refer to the eventual admitted cycle directory; all present files were written only in `scratchpad/C1-CU-T2`. No Lean build, remote edit, subagent, or background job was started. All owned jobs ended before this report and return were finalized.
