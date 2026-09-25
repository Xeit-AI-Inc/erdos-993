# C1-CT-F3 — independent T critique of C1-F3

**Disposition.** The three incoming claims survive at their finite scopes. C1-F3-02 needs wording narrowed to a deterministic pseudorandom sample: Python's seeded `random.Random` replay certifies the listed counts, but does not certify a probability statement of independent ideal-uniform draws. None of these claims proves or refutes the universal interior aggregate. `novelty_claimed: false`.

## Semantics and source boundary

I used the exact integer conventions of `SEMANTIC-CONTRACT.md` and `SOLUTION-CONTRACT.md`: `p=alpha(T)-2`, terminal-zero first strict descent, original degree-one leaf tags and supports, strict `Delta_p(T-v)<0` selector, and the complete tagged sum. I read only the C1-F3 route allowed by `packets/C1-CT-F3.json`, the shared historical authority allowed by `packets/C1-T1.json`, and the review/worker protocols. All thirteen listed C1-F3 file hashes matched the case SHA-256 values. No sibling return or controller note was used.

## Per-claim findings

**C1-F3-01 — proposed_retained.** The explicit edge lists in `cycles/cycle-1/C1-F3/C1-F3-fresh-examples.json` are trees: each has `n-1` edges and is connected. I copied the C1-F3 independent recurrence and input data into my scratch directory and ran it there. For all ten structured rows, my comparison checked the entire independence polynomial, original leaf list, favorable list, every selected leaf's support and three differences, and the complete sum against the source receipt; each field matched. The three stated T-family rows are:

| tree | order | alpha | p | x | favorable/original leaves | S |
|---|---:|---:|---:|---:|---:|---:|
| T22 | 91 | 68 | 66 | 32 | 67/67 | -147807 |
| T60 | 243 | 182 | 180 | 87 | 181/181 | -2947590 |
| T100 | 403 | 302 | 300 | 145 | 301/301 | -13588650 |

These are exact finite rows, not a family-wide sign proof. The seven additional KL rows in that same source receipt also matched and have negative sums. `sources/standing-controls/t22-order91.json` and `t60-order243.json` place their inherited positive marked-summand phenomena at ranks 34 and 90, respectively, whereas this claim uses 66 and 180; there is no contradiction. This preserves the pointwise/support-fibre obstruction without silently transferring it to the target rank. The route's new T100 row supplies a larger target-rank check. The verified full comparison is recorded in `audit.json`; it is a replay of source algorithms, with independent structural checks.

**C1-F3-02 — proposed_retained_narrowed.** I copied `cycles/cycle-1/C1-F3/random_search.py` and its evaluator into my scratch and replayed `python3 random_search.py`. Its output was bytewise equal as parsed JSON to `cycles/cycle-1/C1-F3/C1-F3-random-summary.json`: 1,500 generated Prüfer words at orders 16, 20, 24, 30, 40; 1,466 eligible; no positive complete sum; maximum complete sum `-210`; maximum selected summand `0`. The script creates 300 words at each order by repeated seeded `randrange(n)` calls. State the scope as **the exact seeded pseudorandom sequence** (seed 9932401), not an independently certified uniform random sample or an exhaustive census. The negative observation remains valid for the generated trees only.

**C1-F3-03 — proposed_retained.** I separately enumerated all `2^10` subsets of the explicitly listed tree in `cycles/cycle-1/C1-F3/nonresidual_target.json`. Its independence polynomial is `(1,10,36,62,61,37,13,2)`; hence `alpha=7`, `x=3`, `p=5`, and `x+2=p`. Its original leaves are `0,3,5,6,7,8`; each passes the strict selector, with summands `-15,-15,-13,-1,-13,-15`, totaling `-72`. The set `{0,3,4,5,7,8,9}` is independent and has size 7, includes support 9, and omits original leaf 6. This is a direct non-residual witness inside the primary eligibility domain. The inherited r26 theorem contract `sources/public/proofs/lean/r26-c1-la1-top-rank-residual-sign/THEOREM-CONTRACT.md` requires residuality and is at rank `alpha-1`; its proof input `INFORMAL-PROOF.md` uses that hypothesis in the maximum-set and forced-neighbour steps. The witness therefore blocks a direct transfer of that theorem, while satisfying the target inequality itself. The exhaustive small-tree calculation appears in `audit.py` and `audit.json`.

## Constructive exact identity and remaining proof gap

**C1-CT-F3-01 (new, proposed exact identity).** Let `v` be an original leaf with support `s`, `H=T-{v,s}`, and `R=T-N_T[s]`. For every integer `p`,

```text
Delta_p(T-v) = Delta_p(H) + Delta_(p-1)(R),
g_v(p) = Delta_(p-1)(H)-Delta_(p-1)(R)
       = i_(p+1)(H)-i_(p-1)(H)-Delta_p(T-v).
```

Proof: partition independent sets of `T-v` according to whether they contain `s`. Those omitting `s` are precisely independent sets of `H`; those containing `s` are `{s}` joined to independent sets of `R`. Thus `I(T-v;z)=I(H;z)+zI(R;z)`. Taking forward differences gives the first equality. Substituting `Delta_(p-1)(R)=Delta_p(T-v)-Delta_p(H)` into `g_v`, and telescoping the two adjacent differences of `H`, gives the second. Zero-extended coefficients make this valid at every integer rank. Sum this identity over the original favorable leaf **tags**, retaining multiplicity at shared supports.

The identity isolates the missing bound: favorable leaves make `-Delta_p(T-v)>0`, so a proof of `S<=0` must pay for that positive term with the two-step coefficient drop of `H`, collectively or pointwise. I have no such bound at the target rank. The historical positive pointwise rows and failed Hall mechanisms listed in `packets/C1-COMMON-NEUTRAL.md` and `control/REJECTED-MECHANISMS.json` rule out assuming a generic pointwise or fixed-relation transport argument. This identity itself does not assert either.

## Reproduction and limits

From `scratchpad/C1-CT-F3`, run `python3 independent_verify.py`, `python3 random_search.py`, then `python3 audit.py`. The copied scripts and data live only in this scratch directory. The first replay produced ten exact rows in `C1-F3-independent-checks.json`; the second produced the deterministic sample receipt in `C1-F3-random-summary.json`; the final audit compared all structured fields, checked tree topology, matched the random summary, and independently exhaustively enumerated the ten-vertex witness. All commands exited 0. No Lean build was run, no universal proof or positive complete counterexample was produced, and no background job remains.
