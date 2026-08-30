# Complete Order-20 And Order-21 Tree Search

This directory publishes the exact generator and independent checker used for
the complete order-20 and order-21 recovery search. Both source files are
byte-identical to the sealed experiment sources.

## Result

| Order | Nonisomorphic trees | Recovery rows | Cayley orbit mass |
|---:|---:|---:|---:|
| 20 | 823,065 | 0 | `20^18` |
| 21 | 2,144,505 | 0 | `21^19` |

The generator enumerates canonical free-tree center codes, reconstructs each
tree, computes its independence coefficients by rooted dynamic programming,
and writes row-level hashes. The independent checker regenerates the carrier
by a different catalog construction and recomputes every code, coefficient,
recovery decision, automorphism order, orbit mass, and hash.

## Reproduce

The published generator uses Apple's `CommonCrypto` SHA-256 API and therefore
requires macOS as written. On the verified environment:

```bash
mkdir -p build certificates
clang++ -std=c++20 -O3 -DNDEBUG generate_certificate.cpp \
  -o build/generate_certificate
clang++ -std=c++20 -O3 -DNDEBUG independent_checker.cpp \
  -o build/independent_checker

./build/generate_certificate "$PWD/certificates"
shasum -a 256 certificates/order-20.csv certificates/order-21.csv
./build/independent_checker "$PWD/certificates"
```

The two generated CSV files require approximately 1.1 GB. The verified
generator run peaked near 5.8 GB of resident memory. The expected certificate
hashes and machine-readable summaries are in [`result.json`](result.json).
The large generated CSV files are reproducible outputs and are not committed.

## Claim Boundary

This is bounded computational evidence. It excludes recovery only at orders
20 and 21 under the stated scan. It is not an all-order proof and does not
solve or refute Erdős #993.
