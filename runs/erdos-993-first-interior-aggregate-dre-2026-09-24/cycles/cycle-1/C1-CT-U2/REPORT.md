# C1-CT-U2 critique of C1-U2

## Disposition of the assigned claim

**C1-U2-LOCAL-TOPSHELL-REDUCTION: proposed_retained.** The claimed identities are correct for every finite ordinary tree and original degree-one leaf, with integer zero extension even when the unguarded formal rank `p=alpha(T)-2` is negative. They make no sign assertion. At the eligible target rank, `p>=2`, so none of those edge cases is needed for the primary theorem. The original return's `report_path` points to scratch, whereas its controller-normalized return names `cycles/cycle-1/C1-U2/REPORT.md`; this is a path normalization only and changes no mathematical claim. I checked all nine pinned C1-U2 file hashes against `packets/C1-CT-U2.json`; they match. The original and normalized return bytes are both retained as distinct provenance.

Here is an independent proof. Let `v` be an original leaf, `s` its support, `H=T-{v,s}`, `W=N_T(s)-{v}` and `R=H-W`. Every independent set of `H` extends by `v`, so `alpha(T)>=alpha(H)+1`. Any independent set of `T` contains at most one of `v,s`; remove that vertex if present, or remove nothing if neither is present. The result is independent in `H`, giving the reverse inequality. Thus `alpha(H)=alpha(T)-1=:a` and `p=a-1`. Partition independent `j`-sets of `H` by whether they meet `W`. Those avoiding `W` are precisely the independent `j`-sets of `R`; hence `q_v(j)=i_j(H)-i_j(R)` is the nonnegative number meeting `W`, including for `j<0` by zero extension. Therefore the contract summand is

`Delta_(p-1)(H)-Delta_(p-1)(R)=q_v(p)-q_v(p-1)`.

Independence sets of `T-v` either omit `s` (a set in `H`) or contain `s` (a set in `R` with `s` adjoined). Thus `I(T-v,z)=I(H,z)+z I(R,z)` and coefficient subtraction gives the exact strict selector `Delta_p(T-v)=Delta_p(H)+Delta_(p-1)(R)`. Summing `q_v(p)-q_v(p-1)` over the original favorable leaf tags proves the two-shell cardinality identity, preserving multiplicity when leaves share a support. A maximum set of `T` omitting `v` must contain `s`, since a set omitting both lies in `H` and has size at most `a`. It exists precisely when `R` has an independent `a`-set. Since `R` is induced in `H`, `alpha(R)<=a`; hence `v` is residual iff `alpha(R)<=a-1`, and otherwise `alpha(R)=a`. It follows directly from `I(T-v)=I(H)+zI(R)` that `alpha(T-v)=a` in the first case and `a+1` in the second. This validates the claimed split. None of the proof uses residuality, unimodality, or the target eligibility inequality.

The report's `T_100` arithmetic is also reproduced, as computation separate from the proof above. I copied the source evaluator and both source scripts into my own scratch before execution; I ran only these copies. `fresh_T_family_replay.json` and `independent_T100_replay.json` are byte-identical to the respective pinned source JSON outputs. The independent recurrence reports order 403, `alpha=302`, first strict `x=145`, `p=300`, all 301 leaves favorable, marked `g=-44550`, 300 other leaves `g=-45147`, and complete `S=-13588650`. Its assertions check the local identities on that row; they cannot establish a universal sign. From the run root, the replay commands are:

```sh
python3 scratchpad/C1-CT-U2/fresh_T_family_test.py > scratchpad/C1-CT-U2/fresh_T_family_replay.json
python3 scratchpad/C1-CT-U2/independent_T100_replay.py > scratchpad/C1-CT-U2/independent_T100_replay.json
```

## Constructive repair attempt: an exact family theorem

**New proposed claim C1-CT-U2-T-FAMILY-FIRST-INTERIOR.** Let `T_m` for integer `m>=1` be the ordinary tree with root `r`, one marked length-two arm `r-s_0-v_0`, and `m` root-adjacent centers each carrying three leaves, as defined in `sources/standing-controls/ordinary_tree.py`. It has `alpha(T_m)=3m+2`; at `p=alpha-2=3m`, all `3m+1` original leaves are strictly favorable and

`S(T_m,3m)=(-27m^3-18m^2+27m)/2 < 0`.

The formula holds whether or not `T_m` satisfies the target's eligibility guard; whenever it does, it proves the primary sign on this family. It is an explicit specialization of the historically studied `T_m` family and claims no novelty or general theorem.

For a full proof, put `b(z)=(1+z)^3+z=1+4z+3z^2+z^3`. Excluding the root gives the marked edge and `m` three-leaf stars; including it leaves all `3m+1` pendant leaves free. Thus

`I(T_m,z)=(1+2z)b(z)^m+z(1+z)^(3m+1)`.

The second term has degree `3m+2` and positive leading coefficient; the first has degree `3m+1`, so `alpha(T_m)=3m+2`. For the marked leaf, the witness set in `H` is the singleton `{r}`. Sets meeting it have polynomial `q_0(z)=z(1+z)^(3m)`. Hence at `p=3m`, `q_0(p)=3m`, `q_0(p-1)=C(3m,2)` and `g_0=3m-C(3m,2)`. Deleting the marked leaf yields

`I(T_m-v_0,z)=(1+z)b(z)^m+z(1+z)^(3m)`.

Its coefficients at degrees `3m+1` and `3m` are `2` and `6m+1`, respectively, so `Delta_p(T_m-v_0)=1-6m<0`.

For any leaf `v` on a three-leaf arm, the two sibling leaves become isolated after deleting `v` and its center. Directly partitioning on whether the root is selected gives

`I(H_v,z)=(1+z)^2(1+2z)b(z)^(m-1)+z(1+z)^(3m)`, and
`I(R_v,z)=(1+2z)b(z)^(m-1)`.

Consequently

`q_v(z)=(2z+5z^2+2z^3)b(z)^(m-1)+z(1+z)^(3m)`.

The leading coefficient of `b^(m-1)` is `1` and its next coefficient is `3(m-1)`. Coefficient extraction at `p=3m` and `p-1` gives `q_v(p)=3m+2`, `q_v(p-1)=6m-1+C(3m,2)`, and `g_v=3-3m-C(3m,2)`. Deleting only this leaf gives

`I(T_m-v,z)=(1+2z)(1+3z+z^2)b(z)^(m-1)+z(1+z)^(3m)`.

Its coefficients at `3m+1` and `3m` are `1` and `3m+2`; thus `Delta_p(T_m-v)=-(3m+1)<0`. There are exactly `3m` such tags. The complete sum, with multiplicity, is

`[3m-C(3m,2)]+3m[3-3m-C(3m,2)] = (-27m^3-18m^2+27m)/2`.

For `m>=1`, `27m^3+18m^2-27m=9m(3m^2+2m-3)>0`, proving strict negativity. This proof uses only elementary product counts and exact integer coefficients; no evaluator output is a premise.

As a fresh larger falsification target for this proposed family mechanism, I modified the copied independent `T_100` recurrence in my own scratch to set `m=120`, giving order 483, beyond the source order-403 row. The output reports `alpha=362`, `x=174`, `p=360`, so `x+2=176<=360`; all 361 leaves are favorable, with one `g=-64260` and 360 `g=-64977`, and complete `S=-23455980`. These agree with the proved formula, but are a single test. Run with `python3 scratchpad/C1-CT-U2/independent_T120_extension.py > scratchpad/C1-CT-U2/independent_T120_extension.json`. A separate seeded bounded probe, `top_shell_probe.py`, sampled 300 Prüfer trees each at orders 16, 24, and 40, and 200 at order 60 (1,100 total). Its eligible counts were 272, 300, 300, 200, and it found no positive individual `g` or complete sum. It is deliberately reported as a null finite probe, not proof of the tempting universal pointwise inequality.

## Remaining central gap and fences

The family proof does not extend to arbitrary trees because its two arm types yield explicit `q` polynomials; arbitrary components of `H_v` need not have those tails. The exact general gap remains `sum_{v in F_p} q_v(p) <= sum_{v in F_p} q_v(p-1)` at `p=alpha-2`, with strict selectors defined from each `T-v`. I found neither an injection valid for arbitrary tree components nor an eligible positive complete sum. I therefore do not propose the universal pointwise sign or the primary target as proved.

The inherited r26 theorem is at `p=alpha-1` with every original leaf residual. Its `(RI)` and family-count proof have neither this rank nor general non-residual tags as premises. The registered `T_22` pointwise positive summand at `p=34` lies far below `alpha-2=66`; it blocks a rank-uniform pointwise inference but does not refute this first-interior family formula. The registered per-support positive fibre and Delete/Retag and tag-closed-cut Hall failures concern sign or matching mechanisms absent from this proof. The order-26 tree log-concavity and real-rootedness obstructions do not apply to exact coefficient extraction. The `N2<=M`, raw edge-difference, same-leaf marginal, cover-diagonal, and unimodal-convolution mechanisms are not used. These fences are recorded in `control/REJECTED-MECHANISMS.json`, `control/SCOPE-AUDIT.md`, `sources/public/experiments/r24-direct-favorable-leaf-aggregate.md`, and `sources/public/experiments/r26-top-rank-residual-sign.md`, all admitted by the common historical source list in `packets/C1-T1.json`.

The primary ordinary-tree sign remains open in this critique. No formal Lean build was assigned or run, and no status is transferred to the top-rank residual theorem, governed `RTree` aggregate, or Erdős #993. The copied-source replay, the independent mathematical proofs above, and the bounded new computations have distinct evidentiary roles. All owned jobs completed; no background process remains.
