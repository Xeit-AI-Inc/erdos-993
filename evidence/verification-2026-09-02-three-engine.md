# Verification Record: Three-Engine Public Update

Date: 2026-09-02

This record binds the public curation of three completed research efforts —
the r9 PAIR-G4/endpoint-strictness experiment, the r9 quotient-decoder
formalization experiment, and the order-20 census — to their terminal
source evidence, without reproducing internal prompts, raw returns, private
paths, manifests, logs, or failed workflow artifacts. TREE, FOREST,
TRANSFER, the literal counterexample target, and Erdős #993 remain open.

## r9 PAIR-G4 And Endpoint-Strictness (`erdos-993-math-dre-20260901-r9-pair-g4-endpoint-strictness`)

Terminal decision `AUTHORITY_STOP`; 16 of 16 cycles; source manifest 16/16
exact; terminal ledger 67 rows; every terminal regression and hash manifest
passed.

| Run-relative terminal artifact | SHA-256 |
|---|---|
| `FINAL-RECONCILIATION.md` | `d0868690f7845b0a940d77310bf74cc81ae9a2af783ad1e1a3d34768efdb73f2` |
| `TERMINAL-CHECKPOINT.md` | `b16fd4ecce7c13bdd34643729c3b9bba87cbdbb4fae6b7a19387f4f02e3f464e` |
| `OBLIGATIONS.csv` | `5e9196adfb4643ab0d9b2831605e3b3514b729b817c704e0334bc873e8de09da` |

## r9 Quotient-Decoder Formalization (`erdos-993-math-dre-20260901-r9-quotient-decoder-lean`)

Run closed at its committed terminal cycle 6. Lean pin: 4.32.2 /
pinned Mathlib snapshot / read-only cache manifest verified before and
after every invocation, zero drift. Six `governed` closures, two
`proved_informal` closures, all scoped; nothing `formally_verified`.

| Run-relative terminal artifact | SHA-256 |
|---|---|
| `CLOSING-RECORD.md` | `ab2c3b866a18ccee54f2ba3dcfa070c3b4441412ee3b3b243f91a2b910470f16` |
| `RUN-STATE.json` | `92a6dfe72e3d9656881cf623f99f4b328c7ca23782102d623cd2c01a4fd79a92` |
| `cycles/cycle-5/lean/C5-LEAN-GATE.md` | `584d37da19dcdda841c77f1eb817ade0a0cda11b4fe9eb5a50e20e83c24413f4` |
| `cycles/cycle-6/lean/C6-M2-GATE.md` | `97908fff9320656d230ec57ad7f594c633eccf956388eeee05771730a2f2f563` |

Public Lean package export for the six governed closures is a planned
follow-up curation in the `proofs/lean/` r8 package format (standalone lake
project + kernel and axiom check drivers per package); until it lands, the
grades above are claims about the sealed source run, not about files in
this repository.

## Order-20 Census (`erdos-993-order20-census-2026-09-02`)

Full chain executed under a frozen byte specification published before the
first scan; dual enumeration (A000081/A000055 exact at every order); dual
coefficient derivation byte-agreeing per class; independent fresh-process
replay byte-identical for all seven streams; zero hits on every predicate
(FR, Split, Cross, Obstruction, B4, negative total adjacent minor) across
orders 14–20. Orders 14–17 stream digests are byte-identical to the sealed
r8 census streams, authenticating the contiguous frontier.

| Run-relative artifact | SHA-256 |
|---|---|
| `FINAL-REPORT.md` | `b0ca3631549db0f264d80a0b6dac209a76a0ff480ee03c54fe0739071a7ea372` |
| `FROZEN-BYTE-SPEC.md` | `af43db1ee9f3b15c5fb2b3472c8a0311103459f01de69913647b24eb33f4b23a` |
| `receipts/FINAL-MANIFEST.json` | `149d69c009f3edfdb57968a5bc3db6e79df195edc0c374dd3133fff5ca9031a9` |

Per-order stream digests (SHA-256 of the complete frozen JSON-lines byte
stream) are listed in `experiments/order-20-census-2026-09-02.md`; the
concatenated 14–20 frontier digest is
`ba8911799c4029d39dd575ead8f53f0565a23540aab3dcaad538aabdd04fb021`.

## Companion Analyses

| Artifact | SHA-256 |
|---|---|
| Three-engine consolidated status (2026-09-02) | `e1163af632594178854fe7468a3844468354b1160a173f96c1d999c0dabb2bc3` |
| Workstreams 4+5 analytical report (2026-09-01) | `bed76c879431506a72c305268be911d0351dfd05845cd9a29d6b3cfa0c811665` |

## Claim Boundary

Nothing in this update proves or refutes TREE, FOREST, or TRANSFER;
exhibits a literal counterexample; or establishes independence. Zero-hit
census certificates are bounded evidence and are never cited as universal
evidence. Grades named `governed` and `proved_informal` are the source
runs' own rubric grades and are not `formally_verified`.
