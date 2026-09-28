# C3-U3 independent search report

## Dispatch and source integrity

Read the sealed protocol, solution contract, grade clarification, neutral handoff, shared-source clarification, search allocation, packet, and targeted registry entries. The packet has no additional case inputs. The common dispatch manifest has 86 members and all actual member SHA-256 values matched; the transport manifest has 3 members and all matched. In particular, the shared-source clarification and both v3 runner files match `manifests/C3-TRANSPORT-CLARIFICATION.json`. `scripts/cli_seat_v3.py` explicitly appends the clarification to its worker prompt. The empty `allowed_source_files` therefore leaves the common neutral shared sources readable and supplies no worker-case inputs.

The primary selected exact-ratio payment and all-m selected MASS remain OPEN at dispatch. The all-m branchwise three-halves local-mass claim and the related Jensen/profile claims are OPEN candidates. The accepted selector composition and the separate m>=238 computer-assisted MASS result do not prove either all-m payment or this local coefficient claim. No registered status is changed here.

## Exact center-layer bound

Write each unmarked factor as `B_(r_h)=L^(r_h)+z`. For fixed branch `i`, expanding over the set `J` of factors from which the `z` term is chosen gives the identity

`T_i[j] = sum_(J subset [m]\\{i}) sum_(epsilon=0,1) sum_(s=0)^(r_i-2) g_epsilon * binom(N-r_i-sum_(h in J)r_h+s, j-|J|-epsilon)`,

where `g_0=1`, `g_1=2`, and out-of-range binomials are zero. Hence, for any integer `d>=0`, retaining only `|J|<=d` gives an exact nonnegative lower bound `U_i^(d)[j] <= T_i[j]`. This is a valid coefficient bound for each fixed profile; it assumes no spread monotonicity, selected aggregate, or selector conclusion.

For the homogeneous arity-4 profile, this lower bound is

`U^(d)[j]=sum_(ell=0)^min(d,m-1) binom(m-1,ell) [z^(j-ell)] G F_4 L^(4(m-1-ell))`.

This identity and the tests below are independently implemented with exact integer polynomial arithmetic in `layer_probe.py`; replay with `PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-3/C3-U3/layer_probe.py`. The script writes `layer_probe.json` beside itself.

## Fresh adversarial checks and repair signal

The checks calculate the actual parent `P`, its least strict forward descent with zero extension, and every eligible `p` satisfying all three guards. For the homogeneous arity-4 cases, endpoint and representative branch deletion flags were also evaluated at current `p`; both are 1 on each listed row. Distinct original tip tags still have multiplicity 4 per branch; no weighted aggregate was substituted for the branch-local test.

- At `(a2,a3,a4)=(0,0,40)`, `N=160`, `n=N+m+3=203`, `alpha=162`, `x=78`; the eligible rows are `p=80,81`. At `p=80`, `j=78`, `delta=83`, `D_j=3325930472040984210531608420501465726832040800`, so the local target is `3 delta D_j=828156687538205068422370496704864965981178159200`. The depth-2 retained coefficient is `U^(2)=331081887145304231578158375882746015535604168730`, with signed test margin `2U^(2)-3 delta D_j=-165992913247596605266053744939372934909969821740`. Depth 3 gives positive margin `68876627812667956101597164554156780421646618340` at this rank and positive margin at `p=81`. Thus depth 2 is not a uniform small-range repair.
- At `(a2,a3,a4)=(0,0,150)`, `N=600`, `n=753`, `alpha=602`, `x=292`; the eligible ranks are `p=294,...,301`. At `p=294`, `j=292`, `delta=309`, endpoint/branch selectors are both 1, and depth 1 has negative margin `-3832724130728223755568003393741933500520063442188901798605896722358114160559765031978287895022008120542114100939287937250136128799223596288883071570046421340278183367606821221917056`. Depth 2 has positive margin `2083028093996033535489688450920598849644507975794689659957066372214299838026513783612682057303683937232490485225663348754918603204863850809118067095714274130489881293023202695479248`. Depth 2 has positive margin at all eight eligible ranks. This independently reproduces the failure of the singleton truncation on its stated obstruction and exhibits an exact two-layer repair on this one profile.

The same computations confirm that the full `T_i[j]` is above the local target on these rows; failure of a truncation is only failure of that lower bound. The depth thresholds vary even between these homogeneous profiles, so these checks do not prove the proposed all-m branchwise inequality, selected MASS, or exact-ratio payment. The known spread obstruction is irrelevant to this route's proof step: the decomposition is coefficientwise at a fixed profile and makes no claim that payment or selectors are monotone under spread.

## Scope and disposition

This search yields (1) an informal exact center-layer expansion/lower-bound lemma and (2) bounded exact evidence at two profiles. It supplies neither the remaining all-m local-mass proof nor endpoint-only exclusion, and it does not use the accepted computer-assisted aggregate. No Lean build, source edit, installation, message, or controller operation was performed. No producer script was executed or copied; `layer_probe.py` is an independently written evaluator. There are no background processes.
