# C5-F1 search report

## Scope and seal check

I verified the bytes of all 237 members in `manifests/C5-COMMON-DISPATCH.json` and all 4 members in `manifests/C5-F1-DISPATCH.json`; there were no missing files or hash mismatches. The packet lists no additional source files. Replay the hash check with `PYTHONDONTWRITEBYTECODE=1 python3 manifest_check.py`; its data are in `cycles/cycle-5/C5-F1/manifest_check.json`. The neutral handoff says the exact selected lower-half payment, selected MASS, and full selection are verified at computer-assisted/nonformal grade; the exact-ratio payment remains outside a Lean award. I kept that result separate from the guarded shifted-comparison mechanisms below.

The adversarial run uses exact Python integer coefficients, zero extension, strict first descent of `P=C+zL^(N+1)` through its terminal coefficient, and the original deletion formulas. Replay from this directory with:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 F1_adversarial.py
```

The resulting finite data are in `cycles/cycle-5/C5-F1/F1_adversarial.json`. The script and JSON are this worker's independent artifacts.

## Required obstruction controls

- **Isolated binomial term, inside the guard.** For 22 arity-3 branches, `N=66`, `n=91`, `alpha=68`, and actual first strict descent `x=32`, take actual eligible `p=34` and the separate guarded minor rank `k=27`. The rank guard holds: `1<=27` and `2·27<=68`. At `p=34`, strict current-p flags are `e0=e3=1`; multiplicities are one endpoint tag and 66 original tip tags. At `k=27`, the E-only signed minor `E[k]C[k]-E[k+1]C[k-1]` is `-518620474811633289768751398606375936`, while the full endpoint and arity-3 tip margins are respectively `745097444696166793706461153834912453824` and `777419068009671422357461955841645743808`. This defeats separate nonnegativity of the E summand, not the full deletion comparison or the selected payment.
- **Activity-layer coefficient.** For three arity-4 branches at `k=7`, the guard holds (`14<=N+2=14`). The degree-3 coefficient in the formal activity variable has margin `-66`, but the sum of all layer margins and direct full-tip margin are both `2076267`; the weighted tip-deck margin is positive as well. Thus coefficientwise activity positivity is not a valid premise, and its failure is not a failure at activity value one.
- **n=122 rank outside the guard.** For counts `(38,0,1)`, `N=80`, `n=122`, actual `x=41`, and `k=77`, the full tip minor is negative (`-49239834336`) but `2k=154>N+2=82`. It refutes only an unguarded comparison, not a guarded target.

These reproductions agree with the neutral control descriptions. None is a new full-target counterexample.

## Focused bounded falsification

I independently evaluated the original-multiplicity weighted tip deck `W=Σ_i r_i A_i` against `C` at every rank `1<=k`, `2k<=N+2`, for every arity-count profile with `1<=m<=20`. The run covered 1,770 profiles and 41,205 guarded profile-rank tests; no negative margin `W[k]C[k]-W[k+1]C[k-1]` occurred. The least margin was 38 at counts `(1,0,0)`, `N=2`, `k=1`. This is bounded exact evidence only and does not prove the open weighted comparison. The computation uses the original branch multiplicity `r_i` in each deck contribution. It does not apply current-p selectors because this shifted comparison is stated on its full guard, without an eligibility premise.

## Branch-addition and mixed-minor audit

The positive-state recurrences in the handoff are algebraically consistent:

```text
C' = B_r C
U' = B_r U + r B_(r-1) C
E' = L^r E
N' = N+r
```

Recombining gives `W'=B_r W+r B_(r-1)C+(rL^r-Nz)E`; the negative `-NzE` contribution prevents dropping the perturbation in a lower-bound induction. Also, adding a branch changes the guard from `2k<=N+2` to `2k<=N+r+2`; for example, appending arity 4 to an `N=2` profile extends the guarded rank range from `k<=2` to `k<=4`. A recurrence proof must establish the imported boundary strips, rather than invoke closure only on the old guarded range. This is an identified proof obligation, not a counterexample to the target.

For mixed minors, the controls above show why a proof cannot certify the main-product and E minors separately, and why coefficientwise positivity after introducing activity is too strong. The bounded weighted scan did not produce a guarded obstruction. I found no pairing or invariant cone that pays the E deficit, and no exact guarded counterexample to the full shifted target. The ULC exact-ratio tip-surplus condition stays OPEN at its registered scope; the old `217(j+1)epsilon<1` large-m tail is not discharged by these checks.

## Dispositions and limitations

- `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS`: proposed OPEN, unchanged. The controls do not challenge the actual-ratio condition; they reject a crude substitution and certain proof shortcuts only.
- The exact isolated-E, activity-layer, and n=122 controls are bounded mechanism evidence, not universal proofs and not full-target failures.
- The weighted guarded comparison's no-failure result is limited to profiles with at most 20 branches. No broad census, Lean build, external source import, or authoritative status change was made.
