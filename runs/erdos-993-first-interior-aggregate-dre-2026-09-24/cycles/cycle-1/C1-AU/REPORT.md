# C1-AU neutral adjudication of the U-origin portfolio

`status_authority: proposed_worker_only`; `novelty_claimed: false`. This report disposes of exactly the six distinct incoming claim IDs from C1-U1, C1-U2, C1-U3 and their assigned T/F critiques. All 56 files in `packets/C1-AU.json` matched their pinned SHA-256 values at review. The mathematical conclusions below are self-contained because subsequent synthesis receives this adjudication, not the underlying route and critique reports. No Lean build or formal award occurred.

## Frozen target and unified exact reduction

Let `T` be a finite simple ordinary tree. For an original degree-one vertex `v` with original support `s`, put `H_v=T-{v,s}`, `W_v=N_T(s)\{v}`, and `R_v=T-N_T[s]=H_v-W_v`; deletion is induced. Let `I_G(z)=sum_k i_k(G)z^k`, with coefficients zero at every integer index outside the ordinary range, and `Delta_k(G)=i_(k+1)(G)-i_k(G)`. Put `a=alpha(T)-1`, `p=alpha(T)-2=a-1`, and `q_v(j)=i_j(H_v)-i_j(R_v)`. A leaf is favorable exactly when `Delta_p(T-v)<0`. The target sum is over all favorable original leaf **tags**, including separate tags at one support. Eligibility is `x(T)+2<=p`, where `x` is the first *strict* negative difference, including the terminal zero extension; it implies `p>=2`.

Every independent set of `H_v` extends by `v`, so `alpha(T)>=alpha(H_v)+1`. Conversely, from any independent set of `T`, remove `v` or `s` if one is present; at most one can be present, and the remainder lies in `H_v`. Thus `alpha(H_v)=alpha(T)-1=a`, without residuality. Independent sets of `T-v` either omit `s` and lie in `H_v`, or contain `s` and consist of `s` plus an independent set in `R_v`. Hence

`I_(T-v)(z)=I_(H_v)(z)+z I_(R_v)(z)` and `Delta_p(T-v)=Delta_p(H_v)+Delta_(p-1)(R_v)`.

Because `R_v=H_v-W_v`, `q_v(j)` counts exactly the independent `j`-sets of `H_v` that meet `W_v`. The target summand is therefore

`g_v=Delta_(p-1)(H_v)-Delta_(p-1)(R_v)=q_v(p)-q_v(p-1)`.

If `A_j(T,p)` counts pairs `(v,J)` with `v` a favorable original leaf tag and `J` an independent `j`-set of `H_v` meeting `W_v`, then, exactly,

`S(T,p)=A_p(T,p)-A_(p-1)(T,p)`.

This compares selected tagged shells of sizes `a-1` and `a-2`. It does **not** compare their cardinalities. The selector involves `Delta_p(H_v)+Delta_(p-1)(R_v)`, a different adjacent-coefficient combination from `g_v`; algebraic rewriting alone has no sign consequence. A proof could still use further tree or eligibility structure. These identities and the unclosed implication are the common core of C1-U2 and C1-U3 (their reports and both pairs of critiques, `cycles/cycle-1/C1-{U2,CT-U2,CF-U2,U3,CT-U3,CF-U3}/REPORT.md`).

A maximum independent set omitting `v` must contain `s`: otherwise it could be enlarged by adding `v`. Such a maximum set is `{s}` plus an independent `a`-set of `R_v`. Since `R_v` is induced in `H_v`, `alpha(R_v)<=a`. Thus `v` is residual (belongs to every maximum set) iff `alpha(R_v)<=a-1`; otherwise `alpha(R_v)=a`. In the residual case `alpha(T-v)=a`, and its selector is the top difference of `T-v`; in the non-residual case `alpha(T-v)=a+1`, and the selector is one below its top difference. This is a per-leaf split, not a whole-tree residual hypothesis. The verified r26 result instead assumes every original leaf residual and uses rank `alpha-1`, so it does not supply this interior sign (`control/SCOPE-AUDIT.md:5-8`; `SOLUTION-CONTRACT.md`).

## Support-fibre form and C1-U1

At any support `s`, let `lambda_s>=1` be its number of original leaf neighbors. For each non-leaf neighbor `u`, let `C_(s,u)` be the component of `T-s` rooted at `u`, and define

`A_s=product_u I(C_(s,u))`, `B_s=product_u I(C_(s,u)-u)`, `H_s=(1+z)^(lambda_s-1) A_s`, `R_s=B_s`, `Q_s=H_s-R_s`.

Empty products are `1`. For every tagged leaf `v` at `s`, deleting `v,s` leaves the other `lambda_s-1` leaves isolated and all non-leaf branches, so `I(H_v)=H_s`. Deleting the original closed neighborhood of `s` removes all leaves at `s` and every non-leaf branch root, so `I(R_v)=R_s`. The partition above gives `I(T-v)=H_s+zR_s`; the strict selector is

`[z^(p+1)]H_s+[z^p]R_s-[z^p]H_s-[z^(p-1)]R_s < 0`,

while `g_v=[z^p]Q_s-[z^(p-1)]Q_s`. All `lambda_s` tags have the same selector and summand; support grouping weights the selected term by `lambda_s`, not by one. This proof holds at every integer `p`, with no residual premise. A one-vertex tree has no support and an empty sum; the empty-branch convention covers stars and `K_2`. It is an informal exact identity, not an aggregate sign theorem or a novelty award. The independent binomial/product replays in `cycles/cycle-1/C1-CT-U1/REPORT.md` and `cycles/cycle-1/C1-CF-U1/REPORT.md` reproduce C1-U1's `P_100` and 91-vertex double-leaf hub checks. Their complete eligible sums are respectively `-4,658,920` and `-104,280`, only two finite rows (`cycles/cycle-1/C1-U1/REPORT.md`).

**C1-U1-SUPPORT-FIBRE-POLYNOMIAL-IDENTITY — proposed_retained.** The preceding component decomposition and set partition prove every polynomial, selector, summand, and multiplicity clause at its stated all-integer-rank ordinary-tree scope. The critics found no counterexample or hidden residual premise.

**C1-U1-PRIMARY-INTERIOR-AGGREGATE-STATUS — proposed_unresolved.** For every ordinary tree with `p=alpha-2` and `x+2<=p`, the claim `S(T,p)<=0` remains OPEN on these sources. The exact support formula and the two negative examples prove neither a universal sign nor an eligible positive complete-sum counterexample. No relevant formal gate was run. This is the unrestricted primary target, not its residual subclass (`cycles/cycle-1/C1-U1/REPORT.md`; `cycles/cycle-1/C1-CT-U1/REPORT.md`; `cycles/cycle-1/C1-CF-U1/REPORT.md`; `SOLUTION-CONTRACT.md`).

## C1-U2 and the two critique additions

**C1-U2-LOCAL-TOPSHELL-REDUCTION — proposed_retained.** The unified proof above establishes `alpha(H_v)=alpha(T)-1`, the witness-hit `q_v` count, exact selector, two-shell tagged sum, and per-leaf residual split. It works for every original leaf of every ordinary tree; the coefficient identities also survive low-alpha integer zero extension, although eligibility excludes those boundary ranks. No sign or injection is included. The original C1-U2 `RETURN.json` has a scratch `report_path`; its separately pinned `RETURN-NORMALIZED.json` maps it to the eventual cycle path. This provenance correction changes no mathematics (`cycles/cycle-1/C1-U2/{RETURN.json,RETURN-NORMALIZED.json,CONTROLLER-PATH-NORMALIZATION.json}`; `cycles/cycle-1/C1-CT-U2/REPORT.md`; `cycles/cycle-1/C1-CF-U2/REPORT.md`).

**C1-CT-U2-T-FAMILY-FIRST-INTERIOR — proposed_retained at family scope.** Define `T_m`, integer `m>=1`, by a root `r`, one length-two arm `r-s_0-v_0`, and `m` further root-adjacent centers, each with three leaves. It has `4m+3` vertices and `3m+1` original leaf tags. Put `b=1+4z+3z^2+z^3=(1+z)^3+z`. Conditioning on the root gives

`I(T_m)=(1+2z)b^m+z(1+z)^(3m+1)`.

Its leading term is at degree `3m+2`, so `alpha=3m+2` and `p=3m`. For the marked leaf, `q_0(z)=z(1+z)^(3m)`. Hence `q_0(p)=3m`, `q_0(p-1)=C(3m,2)`, and `g_0=3m-C(3m,2)`. Also `I(T_m-v_0)=(1+z)b^m+z(1+z)^(3m)` has coefficients `2` and `6m+1` at degrees `p+1,p`; thus its selector is `1-6m<0`.

For each of the `3m` leaves on three-leaf stars, the same root partition yields

`I(H_v)=(1+z)^2(1+2z)b^(m-1)+z(1+z)^(3m)`, `I(R_v)=(1+2z)b^(m-1)`,

so `q_v(z)=(2z+5z^2+2z^3)b^(m-1)+z(1+z)^(3m)`. The top two coefficients of `b^(m-1)` are `1` and `3(m-1)`, whence `q_v(p)=3m+2`, `q_v(p-1)=6m-1+C(3m,2)`, and `g_v=3-3m-C(3m,2)`. Finally `I(T_m-v)=(1+2z)(1+3z+z^2)b^(m-1)+z(1+z)^(3m)` has coefficients `1` and `3m+2` at degrees `p+1,p`; its selector is `-(3m+1)<0`. All `3m+1` tags are strictly favorable, and

`S(T_m,3m)=g_0+3m*g_v=(-27m^3-18m^2+27m)/2<0` for `m>=1`, since `3m^2+2m-3>0` there.

The algebra proves this **family** formula even when a particular `m` fails the global eligibility guard; on eligible members it proves the target sign only for that family. The reported `m=120` row has order `483`, `alpha=362`, `x=174`, `p=360`, all `361` tags favorable, and `S=-23,455,980`; it corroborates the formula but is not a premise (`cycles/cycle-1/C1-CT-U2/{REPORT.md,independent_T120_extension.json}`). The `1,100` sampled Prüfer trees at orders `16,24,40,60` have no positive aggregate in the eligible sampled rows; this is bounded null evidence, not a proof (`cycles/cycle-1/C1-CT-U2/top_shell_probe.json`). No universality or novelty is assigned to the family result.

**C1-CF-U2-ELIGIBLE-MIXED-TAGS — proposed_retained at one finite-tree scope.** Let `T` have vertices `0..11` and edges `01,12,23,04,45,46,47,08,89,8(10),8(11)`. Direct subset enumeration gives

`I(T)=[1,12,55,127,167,138,72,22,3]`, `alpha=8`, `x=4`, `p=6=x+2`.

The three maximum sets are `{0,2,5,6,7,9,10,11}`, `{0,3,5,6,7,9,10,11}`, and `{1,3,5,6,7,9,10,11}`. Thus leaf `3` is non-residual, while the six star leaves `5,6,7,9,10,11` are residual. All seven pass the *strict* selector: for `3`, selector `-25`, `(q_6,q_5)=(6,17)`, `g=-11`; for each star leaf, selector `-17`, `(q_6,q_5)=(19,51)`, `g=-32`. Hence the complete tagged sum is `-11+6(-32)=-203`. The hub-conditioned polynomial `(1+3z+z^2)b(z)^2+z(1+2z)(1+z)^6` independently gives the displayed coefficients (`cycles/cycle-1/C1-CF-U2/{REPORT.md,independent_audit.py,independent_audit.json}`). I copied that independent audit into `scratchpad/C1-AU/independent_audit_copy.py`, ran the copy, and obtained byte equality with its pinned JSON in `scratchpad/C1-AU/independent_audit_replay.json`; this adjudicator replay is the same code, not a third independent implementation. The row demonstrates that selected residual and non-residual tags coexist under the frozen eligibility condition; its negative sum does not settle the universal claim.

## C1-U3 provenance and exact scope

**C1-U3-EXACT-COUNT-OBSTRUCTION — proposed_retained_narrowed.** Retain the exact `S=A_p-A_(p-1)` and selector identities proved above, and retain the *open obligation* to compare those tagged counts. Narrow “obstruction” to mean a missing proof step: these formulas do not establish that no further tree-specific implication exists. They are largely the same counting identity as C1-U2 and the coefficient form of C1-U1, not an independent sign theorem. C1-U3's exact `T_m` rows at `m=75,100,150` have `(alpha,x,p,S)=(227,109,225,-5,744,925)`, `(302,145,300,-13,588,650)`, and `(452,217,450,-45,762,975)`. They are eligible bounded checks. C1-CT-U3's byte-identical copied replay and C1-CF-U3's independent recurrence agree (`cycles/cycle-1/C1-{U3,CT-U3,CF-U3}/REPORT.md`; their `fresh_family_results.json`/`replay_results.json`). The origin's description of these as fresh rank coverage is inaccurate: the admitted r24 terminal synthesis TD-16 already records `m=1..120` and `m=150` at the **top two ranks**, which include `p=alpha-2`; TD-14's unsearched “lower interior window” is lower than this rank (`sources/public/runs/r24-direct-favorable-leaf-aggregate-dre-2026-09-14/C6-TERMINAL-SYNTHESIS.md:1433-1456`). The rows remain corroboration, not new parameter/rank coverage.

## Consequence and next obligation

The exact primary statement remains unresolved: prove `A_p(T,p)<=A_(p-1)(T,p)` for every eligible ordinary tree at `p=alpha-2`, or exhibit a finite eligible tree with exact `alpha`, terminal-aware first descent `x`, all original favorable tags and a **positive complete** sum. The unified identities give a precise object for either route but no cardinality comparison. Any method must handle the mixed residual regime and leaf multiplicities. Historical positive pointwise/support-fibre and Hall failures are at their own stated ranks and mechanism scopes (for example, the T22 rank `34` is not its frozen `alpha-2=66`), and their recorded complete sums are negative; they neither prove nor refute this fixed-rank target (`control/REJECTED-MECHANISMS.json`, entries `E993-BETA-AGG-SUPPORT`, `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`, and `E993-R23-TAG-CLOSED-CUT-HALL`; `control/SCOPE-AUDIT.md:16-20`). No log-concavity, pointwise sign, Hall matching, or r26 transfer was used in the retained proofs.

The only new arithmetic executed in this seat was the synchronous copied-audit replay. From the run root, after admission, reproduce it with `python3 cycles/cycle-1/C1-AU/independent_audit_copy.py > cycles/cycle-1/C1-AU/independent_audit_replay.json`. No owned background job remains. No all-tree census, universal computation claim, Lean build, or formal gate was performed.
