# C4-F6 independent critique

## Disposition

**C4-F6-LOW-COVER-SHELL-FAMILY-CHECK — retained** at the exact bounded scope stated in the source claim: sorted positive arm sizes for the root-with-centers family, `p=10..13`, and `n=2p+4`. The claim is an exact finite family statement. It is not evidence for all trees of cover number at most six, a shell theorem, or the primary aggregate.

## Independent audit

Both packet inventories were checked: all six case-source hashes and all 179 common-source hashes matched. I copied the listed family script to `replay_copy.py` and ran only that copy. It reproduces the recorded totals (199, 279, 384, 517 candidates), with strict lower-region counts equal to those totals and eligible counts (1, 0, 0, 0).

I also used a separate formula check in `independent_check.py`. For branch sizes `m_i` and `L=sum m_i`, the independence polynomial is

`P(z)=product_i ((1+z)^m_i+z) + z(1+z)^L`.

This follows by conditioning on whether the root is selected: if it is not selected, each center arm contributes `(1+z)^m_i+z`; if it is selected, all centers are forbidden and all pendant leaves are free. Enumerating the sorted positive partitions independently reproduces every candidate and eligibility count.

For the sole eligible profile `(2,3,3,3,3,3)`, the formula gives `n=24`, `|E|=23`, `alpha=18`, `x=8`, `Delta_x=-78`, and terminal zero-extended `Delta_(alpha+1)=0`. Both guards hold: `x+2=10` and `3p=30<37=2alpha+1`. The explicit adjacency reconstruction has 17 degree-one vertices, precisely the 17 pendant leaves; each is favorable (`Delta_10(T-v)<0`). Leaves sharing one center were kept as separate tagged summands. The two leaves on the size-two arm contribute `-4875` each, and the fifteen leaves on size-three arms contribute `-7537` each. Thus `S=2(-4875)+15(-7537)=-122805`.

The source script's leaf iteration omits the root in the `c=1` member of the broader enumerated family, where the root is itself an original leaf. This does not change its eligibility census: eligibility is determined from the full-tree polynomial and guards, not the selector loop. The only eligible profile has `c=6`, so the omission does not affect the retained claim, its complete favorable set, or its sum. It does mean the report's generic statement that selectors were derived for every candidate should not be read as applying to the ineligible one-center candidate.

## Limits and usefulness

This is reproducible bounded evidence for one restricted tree family and boundary. It excludes general low-cover connector/cover skeletons, and the only eligible example has a negative complete aggregate. It neither gives a counterexample nor resolves the universal lower-region claim. No external theorem was imported. Evidence files are `replay_copy.py`, `low_cover_family.json` (produced by replaying that copy), `independent_check.py`, and `independent_check.json`.
