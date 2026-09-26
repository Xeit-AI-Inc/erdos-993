# C4-F6 search report: bounded low-cover third-shell check

## Question and scope

The assigned route asks for boundary falsification in the first/second/third-shell program, emphasizing the third-shell boundary `n=2p+4`, `p=10..13`, where a proposed cover-at-least-seven reduction fails. I made an exact finite check on the following explicitly restricted six-cover family:

- one root adjacent to `c` centers, with `1 <= c <= 6`;
- each center has `m_i >= 1` distinct pendant leaves and no other vertices;
- the branch sizes are sorted, `m_1 <= ... <= m_c`, to identify isomorphic members;
- `sum m_i = 2p+3-c`, so the tree has exactly `2p+4` vertices.

This family includes the known six-center obstruction at `p=10`, but is not a parameterization of all trees with vertex-cover number at most six.

## Exact computation

`low_cover_family.py` explicitly generates every integer partition in the stated boundary for all `p=10,11,12,13` and `c=1,...,6`. For each tree it computes the independence polynomial by the standard include/exclude tree recurrence, computes all original-tree first differences through the terminal zero-extended rank `alpha+1`, derives the favorable original leaves from `Delta_p(T-v)<0`, and for each selected leaf separately recomputes the two deletion polynomials in its summand. The executable script and complete machine-readable rows are supplied as evidence.

The partition-generation counts are 199, 279, 384, and 517 for `p=10,11,12,13`, respectively. Every one satisfies the strict lower-region guard `3p<2alpha+1`. Exactly one meets `x+2<=p`: at `p=10`, branch sizes `(2,3,3,3,3,3)`. No candidate is eligible for `p=11,12,13` in this family. These are exhaustive counts only for the stated family and ranks.

For the sole eligible tree, the count vector by independent-set size is

`[1,24,253,1566,6400,18419,38970,62650,78593,78515,63348,41582,22199,9548,3240,836,154,18,1]`.

Thus `alpha=18`; its complete zero-extended difference vector at ranks `0` through `19` is

`[23,229,1313,4834,12019,20551,23680,15943,-78,-15167,-21766,-19383,-12651,-6308,-2404,-682,-136,-17,-1,0]`.

Consequently `x=8`, `Delta_8=-78`, and the guards hold: `8+2<=10` and `30<37`. The favorable set has 17 of the 17 original leaves. For each leaf on a three-leaf arm, the summand is `-9409 - (-1872) = -7537`; there are 15 such tagged leaves across the five arms. For each of the two leaves on the two-leaf arm, it is `-8532 - (-3657) = -4875`. Hence the complete sum is `15(-7537)+2(-4875)=-122805`. No pointwise-positive summand and no positive complete sum occurs in this bounded family.

## Mathematical disposition

This check independently reproduces the eligible six-cover obstruction to the attempted `tau(T)>=7` extension, but it does not falsify the pointwise third-shell sign or the primary aggregate. In this one eligible case the pointwise terms are all negative. It also does not establish the proposed small-rank singleton degree-budget reduction: proving that reduction for arbitrary six-cover trees requires handling their general cover/connector skeletons, which this star-of-centers family omits.

I found no primary-literature result used here that settles the universal third-shell or lower-region aggregate statement. No universal inference is drawn from this finite family census. The primary aggregate and general low-cover pointwise sign remain open on the evidence produced by this route.

## Reproduction

Run `python3 low_cover_family.py` with Python 3. The script writes `low_cover_family.json` beside itself and prints the family boundary and eligible-row count. All integer computations are exact; there is no random seed or external package dependency.
