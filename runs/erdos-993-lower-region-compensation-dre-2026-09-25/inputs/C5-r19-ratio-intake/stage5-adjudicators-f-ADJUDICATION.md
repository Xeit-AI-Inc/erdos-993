# Cycle 3 Stage 5 Adjudication: Origin Portfolio F

Adjudicator: `C3-ADJ-F`  
Allocation: `c3-adj-f`  
Model / effort: `gpt-5.6-sol` / `xhigh`

## Packet And Authority

The adjudicator-packet inner seal recomputes to
`a1c6200e77365c146b6433e39a2b992fee98cb3d65e9d8814b784f3c95934a21`
after deleting the top-level `seal_sha256`, recursively sorting keys, compact
serializing JSON without a trailing newline, and taking SHA-256. All 25
`common_reads` entries (401474 bytes total) and all 70 F-portfolio
`portfolio_reads` entries (372358 bytes total) match both their sealed byte
counts and SHA-256 values. No sibling portfolio, sibling adjudicator,
excluded critic attempt, unadmitted scratch, memory, live registry, web, or
external source was read.

The active claim identity is the 55-claim pre-critic snapshot at SHA-256
`14b7f2dcdfed56dd66d37c9c18d3183b3e4e1e3a42cb8526c4c297d6ddf6f9d4`.
The master-ledger snapshot is SHA-256
`e433790a22e1cfdf932a747174d053b1c55ce42c957955c3d357876da6153d28`.
The pre-adjudication claim-status lint has zero findings and thirteen inherited
warnings; none changes a beta-lineage status.

## Portfolio Verdict

`E993-BETA-AGG` remains `OPEN`. Portfolio F supplies no universal proof and no
exact positive favorable-leaf aggregate. `E993-BETA-TARGET` remains `REFUTED`
at pointwise scope and `E993-BETA-AGG-SUPPORT` remains `REFUTED` at per-support
scope. The positive marked margin at the order-91 `T_22` tuple is a witness to
those narrower failures and to F2's termwise mechanism obstruction; its full
favorable-leaf aggregate is negative, so it is not a counterexample to the
global aggregate.

The portfolio contains exact auxiliary algebra and useful bounded
discrimination, but it does not yet supply a material Cycle 4 route to the
universal target. F1 isolates a new coefficient-ratio package only for the
special `T_m` family. F2 gives a correct four-arity root-conditioned reduction,
but its missing D6 inequality is the target restricted to `H`, not a derived
compensation mechanism. F3 gives generic edit identities, but no closed state,
guarded sign law, or arbitrary-sequence induction; moreover, its advertised
profile calculus needs the additional narrowing recorded below.

## Claim Reconciliation

### F1: `C3-F1-TM-COUPLED-CLOSURE`

- `C3-F1-TM-GRAPH-REDUCTION` is **retained**. Splitting on the root gives the
  displayed `I_m`, `M_0`, and `M_*` polynomials, and direct subtraction gives
  the marked and star margin polynomials for every `m>=1`. This is an informal
  construction identity, not a sign theorem.
- `C3-F1-TM-RATIO-SUFFICIENCY` is **retained** at the stated conditional,
  nonterminal scope. Positivity and the four cross-product hypotheses imply
  `a_0<0`, `a_*<0`, and `Delta_(p-1)K_m<0`. No ratio hypothesis is thereby
  proved.
- `C3-F1-TM-FRESH-2048` is **retained** as exact bounded computation for
  `513<=m<=2048`: 3060224 eligible ranks, with no listed failure.
- `C3-F1-TM-RATIO-PACKAGE` is **retained_narrowed** only to the independent
  exact check for `1<=m<=16`. The route's large replay does not test `R-0` or
  `R-*`, and no all-`m` proof is present.
- `C3-F1-TM-ALL-M-CLOSURE` is **retained_narrowed** to bounded exact evidence
  at `1<=m<=16` and `513<=m<=2048`. The universal family theorem remains open.
- `C2-F1-TM-TERMWISE-NEGATIVITY` is **retained** as a mechanism refutation at
  `(m,p,j)=(31,47,0)`; the positive slice was independently recomputed. It is
  not an aggregate witness.
- `C2-F1-TM-OPERATOR-SPLIT-GUARD` is **retained_narrowed** as an inherited
  mechanism fence only. The allocated F1 material does not define `R_6`, so
  the reported value `-27384` cannot be rebuilt here.
- `C3-F1-CLAIM-IDENTITY` is **retained** against the active additive rebase:
  `REFUTED`, `REFUTED`, `OPEN` for pointwise beta, per-support beta, and global
  favorable-leaf aggregate respectively.

### F2: `C3-F2-HETEROGENEOUS-COMPENSATION`

- `C3-F2-ROOT-CONDITIONED-REDUCTION` is **retained**. The branch factors,
  root split, three deletion polynomials, and multiplicities `k n_k` give the
  exact grouped favorable-leaf sum for all nonnegative counts. D6, the sign of
  that sum, is not part of the retained result.
- `C3-F2-ARITY-TERM-SIGN-OBSTRUCTION` is **retained** at exactly
  `H(0,0,22,0)`, arity one, `p=34`. It refutes only the termwise-per-arity
  implication and is an instance of the already-refuted narrower beta face.
- `C3-F2-FRESH-HETEROGENEOUS-RAY-NULL` is **retained** for exactly the four
  frozen rays, `1<=m<=128`, and 91907 evaluated eligible ranks. Its zero count
  is computation only.

### F3: `C3-F3-EDIT-TRANSFER`

- `C3-F3-EDIT-TRANSFER-LAWS` is **retained_narrowed** to the six core
  deletion-polynomial identities on their displayed domains, the endpoint
  leaf-set mass partition, and the `D_e` update only for `p>=1` when both the
  support and closed neighborhood are unchanged. Two critic-identified gaps
  survive: changed closed neighborhoods and pendant-prune mixed deletions.
  There is also a direct route-level error in the added-leaf profile for a
  one-leaf graft. If `G'` is obtained by adjoining `h` to `u`, the definitions
  give

  ```text
  a_h^(G')(p) = d_p P_G(empty),
  g_h^(G')(p) = d_(p-1)(P_G({u}) - P_G(N_G[u])).
  ```

  The return instead reuses the path-two formulas
  `d_p(P_G(empty)+zP_G({u}))` and
  `d_(p-1)^Z(P_G(empty)-P_G({u}))`; those two displayed leaf-graft profile
  formulas are rejected. This is a mechanism-formula defect, not a target
  counterexample.
- `C3-F3-RAW-POTENTIAL-PROBE` is **retained** exactly as a bounded null report:
  141 labelled trees, with shared-rank transition counts 15 for leaf graft,
  15 for path-two graft, 20 for subdivision, and zero for each other edit.
  It does not establish monotonicity for any edit family.
- `C3-F3-ROUTE-CEILING` is **retained**. No finite sufficient state,
  composition proof, or target counterexample was produced.

## Stage 7 Candidate

Exactly one face is complete enough to be a Stage 7 candidate without first
repairing graph semantics: the elementary rational implication named
`tm_rank_closure_of_ratio_control`. Its hypotheses and conclusion are closed,
and the proof is the three positive cross-multiplication chains displayed in
F1. It is only an auxiliary arithmetic lemma: it does not prove `R-I`, `R-0`,
`R-*`, or `R-K`, does not prove the `T_m` closure, and does not advance the
universal target by itself. It is not registered in the active claim identity;
the controller must register the proposed auxiliary face and freeze its exact
theorem contract before any governed Lean gate.

The `T_m` graph-polynomial face, F2's D1-D5 package, and F3's graph-edit faces
are mathematically useful but not current Stage 7 candidates as packaged:
their constructors and deletion semantics are not frozen in complete
declarations, and the F3 package additionally needs the corrections above.
No Lean was run and no formal status is awarded.

## Cycle 4 And Stop Gate

No F-portfolio product is a registered, lint-clean off-criteria result that
opens a genuinely new attack on `E993-BETA-AGG`; therefore this portfolio does
not satisfy the serendipity override. The explicit ratio and edit obligations
in `NEXT-OBLIGATIONS.csv` are proposed research faces, not registered results.

The stop gate is armed only at the completed Cycle 3 close, after synthesis
and any eligible Lean declaration. This adjudication cannot execute it now.
Further, `control/STOP-GATE-PRECOMMITMENT.md` is not in `c3-adj-f`'s sealed
`common_reads`; the allocated files expose only its path and hash through
earlier validation records, not its four named criteria. Honoring isolation,
this adjudicator did not read it and cannot certify a criterion-by-criterion
match. On the evidence that is actually sealed here, no decisive event, no
material universal route, and no registered serendipitous product is shown.
Thus portfolio F does not independently require Cycle 4 and is compatible
with an eventual controller stop, but it cannot authorize that stop or decide
the whole-run gate.

## Ceiling Attestation

- **Computation ceiling:** every replay and fresh check remains exact bounded
  evidence at its enumerated population only.
- **Informal ceiling:** the retained universal statements are auxiliary
  polynomial identities and a conditional arithmetic implication. No
  universal sign package, `T_m` closure, `H` compensation theorem, edit
  monotonicity theorem, arbitrary-RTree aggregate theorem, or Erdos #993
  theorem is proved.
- **Formal ceiling:** no Lean was run, no kernel or axiom check occurred, and
  no claim is labelled `formally_verified` by this adjudication.
- **Refutation fences:** pointwise beta and per-support beta remain `REFUTED`;
  a mechanism obstruction is never promoted to a global aggregate
  counterexample.

