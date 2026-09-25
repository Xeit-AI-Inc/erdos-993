# C1-CF-U2: F critique of C1-U2

## Disposition

Retain `C1-U2-LOCAL-TOPSHELL-REDUCTION` as an exact informal identity, with no aggregate sign consequence. I tried the low-rank boundary, the residual/non-residual split, selector strictness, and duplicate-support leaf tags. None breaks the stated identity. The proof in `cycles/cycle-1/C1-U2/REPORT.md` is essentially complete at the ordinary-tree level. Its numerical T_100 row agrees with an independent closed-form calculation. A new eligible 12-vertex row below confirms that selected residual and selected non-residual tags can coexist; the T_m rows alone do not test that mixed regime.

The source return's `report_path` points to its original scratch directory. `cycles/cycle-1/C1-U2/CONTROLLER-PATH-NORMALIZATION.json` explicitly preserves that original and provides the separate `RETURN-NORMALIZED.json` path. The nine case-pinned source files all match the SHA-256 values in `packets/C1-CF-U2.json`. This is a path normalization matter, not a mathematical defect.

## Universal identity audit

Let `v` be an original degree-one vertex, `s` its original support, `H=T-{v,s}`, `W=N_T(s)-{v}`, and `R=T-N_T[s]=H-W`. These are induced graphs, possibly empty or disconnected. For every independent set `Q` of `T`, remove `v` if present, remove `s` if present, or remove neither. The remainder is independent in `H` and has size at least `|Q|-1`. Conversely each independent set in `H` extends by `v`. Thus `alpha(T)=alpha(H)+1`, including the two-vertex tree. With `a=alpha(T)-1`, `p=a-1`.

The sets counted by `i_j(H)-i_j(R)` are exactly the independent `j`-sets of `H` meeting `W`, for every integer `j`; the zero extension makes negative and excessive ranks harmless. Therefore

`Delta_(p-1)(H)-Delta_(p-1)(R)=[i_p(H)-i_p(R)]-[i_(p-1)(H)-i_(p-1)(R)]=q_v(p)-q_v(p-1)`.

Partitioning independent sets of `T-v` by membership in `s` gives the polynomial identity `I(T-v,z)=I(H,z)+z I(R,z)`, hence `Delta_p(T-v)=Delta_p(H)+Delta_(p-1)(R)`. The selector remains a strict `<0` test at the original `p`, with no rank shift. Summing the first identity only over the tags passing the second identity gives exactly the two tagged shell cardinalities; siblings at one support remain separate tags. If no tag passes, both sets are empty. This does not compare the cardinalities.

A maximum independent set omitting `v` must contain `s`: otherwise adding `v` would enlarge it. It therefore corresponds exactly to a size-`a` independent set of `R` together with `s`. Since `R` is an induced subgraph of `H`, `alpha(R)<=a`. Consequently `v` is residual iff `alpha(R)<=a-1`; otherwise `alpha(R)=a`. Also `alpha(T-v)=max(a,1+alpha(R))`, so the strict selector is at the top difference when `v` is residual, and one difference below it when `v` is non-residual. These are **per-leaf** statements. They do not assert that the whole tree is residual. A one-vertex tree has no original leaves and all tagged formulas are vacuous; for the two-vertex tree `p=-1`, and the integer zero extension still makes the identities true, while the contract eligibility condition fails.

## Independent exact numerical checks

The source's `T_m` has a hub, one length-two arm, and `m` three-leaf stars attached to the hub (`cycles/cycle-1/C1-U2/independent_T100_replay.py`, with the construction also in `sources/standing-controls/ordinary_tree.py`). Set `A(z)=z+(1+z)^3=1+4z+3z^2+z^3`. Conditioning on the hub gives, independently of the source DP,

`I(T_m,z)=(1+2z)A(z)^m+z(1+z)^(3m+1)`.

At `m=100`, this gives order 403, `alpha=302`, `p=300`, and the first strict descent `x=145` by exact coefficient arithmetic, so `147<=300`. The marked arm leaf has `H` polynomial `A^100+z(1+z)^300` and `R` polynomial `A^100`, hence `(q_p,q_(p-1))=(300,44850)`, selector `-599`, and summand `-44550`. Every one of the 300 star leaves has `H` polynomial `(1+2z)(1+z)^2 A^99+z(1+z)^300` and `R` polynomial `(1+2z)A^99`; hence `(q_p,q_(p-1))=(302,45449)`, selector `-301`, and summand `-45147`. Both selectors are strict, and distinct tags give `-44550+300(-45147)=-13588650`. This reproduces `cycles/cycle-1/C1-U2/independent_T100_replay.json` by a different derivation. The T_100 maximum set is unique (hub, arm leaf, and all star leaves), so this row tests only residual tags.

For an adversarial mixed-regime check, take vertices `0..11` and edges `01,12,23,04,45,46,47,08,89,8(10),8(11)`. This is a hub with a length-three arm and two three-leaf stars. Direct enumeration of all `2^12` subsets in my independent script yields `I(T,z)` coefficients

`[1,12,55,127,167,138,72,22,3]`.

They can also be checked from `(1+3z+z^2)A(z)^2+z(1+2z)(1+z)^6`. Thus `alpha=8`, `x=4` (first negative difference `138-167=-29`), `p=6`, and `x+2=p`. The three maximum sets are `{0,2,5,6,7,9,10,11}`, `{0,3,5,6,7,9,10,11}`, and `{1,3,5,6,7,9,10,11}`. Leaf 3 is non-residual; all six star leaves are residual. All seven original leaves are strictly favorable. For leaf 3, `alpha(H)=alpha(R)=7`, selector `-25`, `(q_6,q_5)=(6,17)`, and `g=-11`. For each star leaf, `alpha(H)=7`, `alpha(R)=5`, selector `-17`, `(q_6,q_5)=(19,51)`, and `g=-32`. Each has a separate tag, including three siblings per support, and the complete sum is `-11+6(-32)=-203`. The script checks the selector identity for each tag. This is a finite scope probe, not a positive aggregate witness or a universal argument.

Reproduction from the run root: `python3 scratchpad/C1-CF-U2/independent_audit.py > scratchpad/C1-CF-U2/independent_audit.json`. The output used here is `scratchpad/C1-CF-U2/independent_audit.json`. Both files were created in this seat's own scratchpad. I copied the origin scripts into this scratchpad before considering replay and did not execute source files in place; the reported numbers come from the independent script.

## Scope and obstruction audit

The exact `r26` top-rank result requires whole-tree residuality and rank `alpha-1` (`control/SCOPE-AUDIT.md`; `sources/public/proofs/lean/r26-c1-la1-top-rank-residual-sign/INFORMAL-PROOF.md`). It cannot supply the missing tagged-shell inequality here. The eligible mixed row above shows why a global residual premise cannot be silently added. The source report appropriately refrains from claiming that inequality.

The T_22 order-91 pointwise/support-fibre and literal Delete/Retag failures cited in `control/REJECTED-MECHANISMS.json` occur at `p=34`, whereas the frozen first-interior rank of that same T_22 is `alpha-2=66` (its `alpha=68` in the source scan). The choked-broom tag-closed-cut result is likewise a mechanism fence at its own rank and object. These records refute the named universal methods, but are **not** direct fixed-rank counterexamples to a new pointwise or supportwise sign statement at `p=alpha-2`. This qualification tightens the inherited-fence paragraph of `cycles/cycle-1/C1-U2/REPORT.md`; it does not affect its claim. No Hall, log-concavity, real-rootedness, raw edge-difference monotonicity, or `N2<=M` premise enters the identity proof. The `E993-BETA-TARGET` governed `RTree`/D9 bridge caveat in `control/REJECTED-MECHANISMS.json` also remains separate from the ordinary-tree identity.

No Lean build was assigned or run. The bounded checks cover T_100 and the displayed 12-vertex tree, not all trees. The primary aggregate sign remains open. All owned commands completed; no background job remains.
