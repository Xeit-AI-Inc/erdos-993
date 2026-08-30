# Verification Record: Proof-Gap Completion Update

Date: 2026-08-30

This record covers the public artifacts added from the completed proof-gap
completion experiment. It verifies one auxiliary Lean theorem and a complete
bounded computation at tree orders 20 and 21. It does not upgrade any headline
problem from `open`.

## Source Binding

- Sealed experiment manifest SHA-256:
  `07b9d7134eeca4eb6c37986614fc33b08bfb73c100094ffdba03ccb1d66ba961`
- Independent N4 kernel receipt SHA-256:
  `a58a798d517f6974a824ec3f3ad20c804d52756f1b9b86edf7f3165f6c9c1607`
- Published marked-extension source SHA-256:
  `627b74cf81b6cea185d11fd00ac1d3e97c60def1f4fa0850c960ab0a14c40387`
- Published generator source SHA-256:
  `e1aefaa0a239acce7f49c12d808a7cf6a53b9c94cb644b070d95027e60858668`
- Published independent-checker source SHA-256:
  `7d0a9e3231525cf6f8c7a18bec2231476b38f8f53e06ae4ca570ce44ecc61ae4`

Byte comparisons confirmed that all three published sources are identical to
their corresponding sealed experiment sources.

## Lean Verification

Pinned environment:

- Lean `4.32.2`, commit
  `f3b06c705e6c85f5314019d5d3baab0fec5b580c`
- Lake `5.0.0-src+f3b06c7`
- Mathlib revision
  `905b95818eb32af7874a58b427f50c1711a5e96c`

Command:

```bash
./scripts/verify-lean.sh
```

Result: `PASS`. All three public packages built, their kernel probe files
elaborated, and their axiom probe files completed. For the new declaration

```text
MarkedExtensionCharge.labelled_tree_marked_extension_charge_identity
```

`#print axioms` reported only:

```text
propext, Classical.choice, Quot.sound
```

No `sorry`, `admit`, custom axiom, or failed kernel check was reported. Lean
emitted nonblocking style-linter warnings.

## Computational Replay

Replay environment:

- Apple clang `21.0.0`
- Darwin `25.5.0` on arm64

Commands:

```bash
clang++ -std=c++20 -O3 -DNDEBUG generate_certificate.cpp \
  -o build/generate_certificate
clang++ -std=c++20 -O3 -DNDEBUG independent_checker.cpp \
  -o build/independent_checker
./build/generate_certificate "$PWD/certificates"
shasum -a 256 certificates/order-20.csv certificates/order-21.csv
./build/independent_checker "$PWD/certificates"
```

Fresh generator result: `GENERATOR_RESULT=ACCEPT`.

| Order | Tree rows | Recovery rows | Certificate bytes | Certificate SHA-256 |
|---:|---:|---:|---:|---|
| 20 | 823,065 | 0 | 293,040,572 | `1ec9d0d68d919dbf4d2199da1da51fbe296d6dc262fe27b825e859ed3cf5e44c` |
| 21 | 2,144,505 | 0 | 783,764,626 | `e1a24ec2774a96e68df2f79887ff2cd32022ecb72fb46834849fbe56f4259e90` |

The generator's orbit-mass sums were exactly `20^18` and `21^19`. Its wall
time was 145.13 seconds and its maximum resident set size was 5,759,123,456
bytes.

Fresh independent-checker result: `INDEPENDENT_CHECKER_RESULT=ACCEPT`. The
checker regenerated both carrier sizes by its separate catalog construction,
then recomputed and accepted every certificate row, recovery decision, row
hash, automorphism order, and orbit mass. Its wall time was 157.54 seconds and
its maximum resident set size was 1,088,028,672 bytes.

The generated CSV files are reproducible outputs of approximately 1.1 GB and
are not committed. Their exact sources, result summary, sizes, and hashes are
committed.

## Claim Boundary

- The Lean theorem is an exact identity for the specified induced extension
  residual `R_spec`; it is not a residual-sign or descent theorem.
- The computation excludes recovery only at orders 20 and 21.
- The audited `13..32` order band remains an informal theorem, not a Lean
  theorem.
- TREE, FOREST, TRANSFER, and Erdős #993 remain open.
