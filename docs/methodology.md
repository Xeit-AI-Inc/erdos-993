# Research Methodology

## Mathematical Solver DRE

Xeit AI investigates the problem with a governed, model-neutral Mathematical
Solver Dialectical Reasoning Engine (DRE). The method is designed to generate
candidate mechanisms aggressively while preventing unsupported candidates
from quietly becoming results.

A typical cycle contains:

1. nine isolated search routes divided among affirmative, negative, and
   uncertainty-preserving orientations;
2. two cross-orientation critiques of every route;
3. adjudication that classifies each claim as retained, narrowed, or rejected;
4. one neutral synthesis built only from sealed adjudications;
5. a Lean gate for theorem-ready claims;
6. a terminal ledger of results, rejections, incidents, and open obligations.

Only sealed synthesis and governed Lean feedback move between cycles. Raw
search and critique returns do not recursively become evidence.

## Formal Gate

A theorem receives formal credit only after:

- an exact theorem contract is frozen;
- the informal proof is independently audited;
- the Lean source builds without `sorry`, `admit`, or unsafe shortcuts;
- kernel and transitive-axiom checks pass;
- an independent reviewer checks statement fidelity;
- the source and receipts are sealed by hash.

Compilation alone is not treated as proof that the formal statement matches
the intended mathematics.

## Evidence Levels

Every public claim is assigned one of four levels:

1. governed formal theorem;
2. independently audited informal theorem;
3. bounded, replayable computation;
4. diagnostic or candidate mechanism.

The levels are not interchangeable.

## Latest Completed Run

The rooted residual-profile experiment completed eight cycles comprising 72
isolated search routes, 144 critiques, 24 adjudications, eight neutral
syntheses, and eight Lean gates. Its terminal verdict remained `still_open`.
This repository publishes a curated formal and evidentiary subset rather than
the raw operational record.
