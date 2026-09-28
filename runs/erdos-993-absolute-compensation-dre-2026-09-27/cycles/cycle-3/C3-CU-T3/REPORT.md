# C3-CU-T3 critique

## Scope and source validation

I reviewed the assigned C3-T3 return and the four packet claims. The common dispatch, packet, shared-transport, and critique-transport manifests pass byte-for-byte SHA-256 checks: 86, 8, 3, and 3 members, respectively, with no mismatch (`cycles/cycle-3/C3-CU-T3/manifest_audit.json`). The sealed clarification files authorize the shared `sources/cycle3` inputs; the packet's eight paths are additional case inputs. I read both transport runners to verify their declared transport role and did not invoke either runner or controller operations. Replay the hash check with `PYTHONDONTWRITEBYTECODE=1 python3 manifest_audit.py`.

## Adjacent-arity Jensen exponent

**Disposition: proposed informal proof at the registered scope.** Let (M\ge10), (M/3\le k\le M), and

\[
g_r=\frac{2r}{2r+1}\frac{\binom{M-r}{k-1}}{\binom Mk}\quad(r=2,3,4),
\]

with out-of-range binomials zero. If (k=M), all three terms are zero. Otherwise set (u=M-k-1\ge0) and (v=3k-M\ge0). Expanding the three binomial quotients over a common denominator gives

\[
g_2-2g_3+g_4=\frac{4k(M-k)}{315M(M-1)(M-2)(M-3)}f,
\]

\[
f=63(M-2)(M-3)-135u(M-3)+70u(u-1),
\quad
9f=37(M-10)^2+290(M-10)+217+v(125M-585)+70v^2.
\]

The last expression is positive: (M-10,v\ge0), (125M-585\ge665), and the constant is 217. The prefactor is positive for (k<M), so (g_2-2g_3+g_4\ge0) throughout the domain. At fixed (m'=a_2+a_3+a_4) and (M=2a_2+3a_3+4a_4), replacing one 2-block and one 4-block by two 3-blocks changes (E=\sum a_rg_r) by (2g_3-g_2-g_4\le0). Repeating until (a_2=0) or (a_4=0) gives

\[
E\ge(3m'-M)g_2+(M-2m')g_3\quad(2m'\le M\le3m'),
\]

\[
E\ge(4m'-M)g_3+(M-3m')g_4\quad(3m'\le M\le4m').
\]

These are the minima over feasible arity-count profiles. The result says nothing about actual cofactor coefficients, parent descents, selectors, MASS, payment, or the refuted spread quotient.

The exact identity and endpoint comparison were additionally checked on (10\le M\le300) and all feasible count profiles with (m'\le24) by `cycles/cycle-3/C3-CU-T3/independent_critique_check.py`. The finite grid is a diagnostic; the displayed algebra and exchange argument carry the universal proof.

## Finite scalar certificate

**Disposition: proposed bounded evidence, confirmed independently.** I copied the producer script before executing it. The copied replay and my separate direct `Fraction`/binomial evaluator pass all 799,895 specified relaxed states for (70\le m\le119), with zero exclusions. All 50 per-(m) state counts, exact minimum ratios, and minimizers agree with the producer certificate and C3-T3's independent output. The global minimum ratio is

\[
\frac{112684538106937462073347997540188623037695726373663717}
{81619490325542400000000000000000000000000000000000000}>1,
\]

at ((m,N,r,j)=(70,278,2,112)). The replay outputs and independent state data are retained as `cycles/cycle-3/C3-CU-T3/independent_critique_check.json`, `cycles/cycle-3/C3-CU-T3/producer_replay.log`, and `cycles/cycle-3/C3-CU-T3/producer_balanced_finite_check_copy.json`; replay commands are `PYTHONDONTWRITEBYTECODE=1 python3 independent_critique_check.py` and `PYTHONDONTWRITEBYTECODE=1 python3 producer_balanced_finite_check_copy.py`.

The enumerated domain is (2m\le N\le4m), (r\in\{2,3,4\}), (2(m-1)\le M=N-r\le4(m-1)), and

\[
\left\lfloor\frac{2N-1}{5}\right\rfloor+1\le j\le\left\lfloor\frac{N-2}{2}\right\rfloor.
\]

Thus (5j>2N-1) and (2j\le N-2) are strict/weak as required. For each GF shift (0\le s\le r-1), the scan asserts (M\ge10) and (3(j-s)\ge M). The shift implication follows from (3j>3(2N-1)/5\ge N+2r-3=N-r+3(r-1)), since (N\ge140\ge10r-12); hence subtracting (3s\le3(r-1)) gives (3(j-s)>N-r), and integrality gives the asserted weak inequality. The scan uses the adjacent-arity minimum (E\), rounds it down to thousandths, then evaluates the degree-12 positive Taylor polynomial with integers. Downward flooring and nonnegative Taylor terms preserve a lower bound. Its exact strict comparison has a positive denominator throughout.

This is only the stated relaxed scalar check. It does not validate a universal occupancy/Jensen-to-actual-coefficient composition, cover actual first descents or current-(p) selectors, or prove selected MASS/payment. No aggregate sign is used as a payment premise. No analytic continuation removing this finite band or formal verification was produced. Independent artifacts are `cycles/cycle-3/C3-CU-T3/independent_critique_check.py`, `cycles/cycle-3/C3-CU-T3/independent_critique_check.json`, `cycles/cycle-3/C3-CU-T3/producer_balanced_finite_check_copy.py`, `cycles/cycle-3/C3-CU-T3/producer_balanced_finite_check_copy.json`, and `cycles/cycle-3/C3-CU-T3/producer_replay.log`; rerun with `PYTHONDONTWRITEBYTECODE=1 python3 <script>` from the admitted directory.

## Required claim dispositions

- `E993-PATH-STAR-COFACTOR-JENSEN-EXPONENT-ADJACENT-ARITY-BALANCING`: proposed informal proof, exactly for the registered rational exponent domain and endpoint minimum.
- `C3-T3-FINITE-BALANCED-SCALAR-REPLAY`: proposed bounded evidence; the specified finite scalar states pass independently.
- `E993-PATH-STAR-ARITY-2-4-SELECTED-LOWER-EXACT-RATIO-PAYMENT`: remains proposed open at its all-(m) actual-family scope. The scalar certificate does not prove the selectors or payment; preserve actual least strict first descent, all three rank guards, strict current-(p) flags, and original endpoint/tip tag multiplicities.
- `E993-PATH-STAR-ARITY-2-4-SELECTED-LOWER-MARK-MASS-COMPENSATION`: remains proposed open at its all-(m) actual-family scope. No all-(m) selected mass argument or counterexample is supplied here; the exact-ratio target remains distinct and weaker.

These scopes use the actual parent (P), (x=\min\{k\in\mathbb N:\Delta_kP<0\}) under zero extension including the terminal difference, and eligible ranks satisfying all three conditions (x+2\le p), (3p<2\alpha+1), and (2p\le\alpha). The flags remain the strict current-rank tests (e_0=1[\Delta_pA_0<0]), (e_i=1[\Delta_pA_i<0]). Selected totals retain (b=e_0+\sum_i r_ie_i), (A=\sum_i r_ie_iT_i[p-2]), the endpoint tag once, and each original tip tag with its branch multiplicity (r_i).

The primary and MASS findings are scope classifications, not dispositions based on a failed numerical example. No universal theorem, counterexample, or Lean award for either is claimed.
