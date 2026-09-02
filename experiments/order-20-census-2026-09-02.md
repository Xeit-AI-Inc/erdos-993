# Order-20 Census With Receipts

Completed: 2026-09-02

## Result

All **823,065** unlabelled trees of order 20 (exactly the published count
A000055(20)) were enumerated exactly once, their independence vectors and
original-leaf deletion profiles computed by two independent procedures, and
every admissible endpoint pair scanned. **Zero hits on every predicate:**

| Predicate | Hits at order 20 | Hits, orders 14–20 combined |
|---|---:|---:|
| First recovery `FR(T,p,q)` | 0 of 156,382,350 pair instances | 0 of 239,736,524 |
| `Split` / `Cross` / `Obstruction` (leaf profiles) | 0 | 0 |
| `B4` (`Delta_4 < 0 < Delta_5`) | 0 | 0 |
| Negative total adjacent minor (`i_k^2 < i_(k-1) i_(k+1)`) | 0 | 0 |

Consequently, at bounded computational tier: any literal first-recovery
counterexample tree has order at least 21, and no tree through order 20 has
a non-log-concave (hence no non-TRS2-by-total-minor) independence sequence.
The prior single-implementation minor scan through order 18 is superseded at
this tier; orders 18 and 19, previously at weaker provenance, are now inside
the authenticated frontier.

**These are zero-hit certificates. They are bounded evidence only and are
never cited as universal evidence. TREE, FOREST, and TRANSFER remain open.**

## Verification Chain

1. **Frozen byte specification published before the first scan** (explicit
   AHU recursion, JSON formatting, integer syntax, array lengths, record
   sorting, LF; one logged calibration amendment). Validated the strong
   way: the specification reproduces **all five sealed r8 stream digests
   byte-exactly** (orders 14–17 and their concatenation), making orders
   14–20 one authenticated contiguous frontier under a single contract.
2. **Dual enumeration:** leaf augmentation vs Beyer–Hedetniemi rooted
   level-sequence generation (12,826,228 rooted trees at order 20 —
   A000081(20) exactly); canonical key sets identical at every order 14–20;
   class counts equal A000055 at every order (independent external
   control).
3. **Dual coefficient derivation:** rooted include/exclude products vs the
   vertex-deletion recurrence `I(G) = I(G−u) + x·I(G−N[u])`; serialized
   records byte-identical per class across all 1,343,736 classes, including
   every leaf-deletion profile; abort-on-mismatch, zero mismatches.
4. **Independent fresh-process replay:** the entire seven-order ladder
   regenerated from scratch; all seven streams byte-identical.
5. **Endpoint policy proved boundary-by-boundary:** every FR pair of an
   order-n tree lies in `1 ≤ p < q ≤ n−2` (the `p = 0`, `q = n−1`,
   `q ≥ n`, and one-vertex boundaries are each checked separately).

## Stream Digests (SHA-256)

| order | classes | digest |
|---:|---:|---|
| 14 | 3,159 | `83a32a10b31abca43faaf42e9f687e3c37c3f00999373e8bb20dfdd8ae70f419` |
| 15 | 7,741 | `cea95a15b89e3d7d9d79183de65cb350619eb0ab1a12debe8ef8396b97396867` |
| 16 | 19,320 | `e3d4283e1d023dbe0b8351b68bfa5a1fe06abbb66a58d2aae59e2c1819932a30` |
| 17 | 48,629 | `234f41c06532fc741c0920e89cff4538a962e1325e750e7cc1b5966ead4cb17d` |
| 18 | 123,867 | `5b0b9c5d8102ffea3369d097f97181e7db29450dfec45f3f780be3a0a22f9962` |
| 19 | 317,955 | `4a4e94dc8a45f0f16eb912d7f09d0a1b56364344f28452767dddffe3602ac44c` |
| 20 | 823,065 | `e23fff2ac395833a7f7f31aaaa3a07bf995bbd75a7343b0e6fe04b7b8c059213` |

Frontier concatenation 14–20:
`ba8911799c4029d39dd575ead8f53f0565a23540aab3dcaad538aabdd04fb021`.

Orders 14–17 digests are byte-identical to the sealed r8 census streams.
Full per-order digests, the frozen specification, and the replay recipe are
bound in `evidence/verification-2026-09-02-three-engine.md`.
