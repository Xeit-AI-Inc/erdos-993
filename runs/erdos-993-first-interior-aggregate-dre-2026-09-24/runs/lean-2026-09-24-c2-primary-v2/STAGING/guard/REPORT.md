# C2 Lean guard producer report

The assigned guard fragment proves the exact public interface:

```lean
lemma E993Interior.eligibleAlphaGeSeven {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hT : G.IsTree)
    (hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2) :
    7 ≤ G.indepNum
```

`lemma` carries the exact proposition and is used so the controller can reserve terminal `theorem` registration for the primary result. There is no extra alpha premise, order-bound import, enumeration, new top-level definition, or replacement for the universal tree argument. The proof uses the immutable BASE's r25 pair/triple count identities, a C5/G1 coefficient and delta bridge, and the one- and two-vertex complements of a maximum six-vertex independent set as vertex covers. It proves the small-order choose-degree lower bounds, then excludes the strict crossing at ranks zero, one and two.

The fragment is `Guard.lean.fragment`; `Check.lean` is the unchanged remote `BASE.lean` followed by the fragment. The real pinned remote command was `lake env lean <absolute guard/Check.lean>` from the run's `LeanProject` with `/Users/ashtonsperry/.elan/toolchains/leanprover--lean4---v4.32.2/bin` first on PATH. `Check.log` records `LEAN_EXIT_CODE 0`. A separate `AxiomCheck.lean` compiled with `#print axioms E993Interior.eligibleAlphaGeSeven`; its log records exactly `[propext, Classical.choice, Quot.sound]` and exit code zero. There are no `sorry`, `admit`, `native_decide`, or new axioms in the fragment.

All local work is under `scratchpad/C2-LEAN-GUARD`; all remote work is under `STAGING/guard`. The producer has not registered the source or run the governed kernel and fidelity gates. No proof obligations remain for this guard interface. The controller owns integration, registration, receipts and final gates.
