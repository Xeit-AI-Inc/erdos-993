"""Check the K1,6 boundary wording in the incoming report."""
from math import comb

counts = (1, 7) + tuple(comb(6, k) for k in range(2, 7))
deltas = tuple((counts[k + 1] if k + 1 < len(counts) else 0) - counts[k]
               for k in range(len(counts)))
print("K1,6_counts", counts)
print("K1,6_deltas", deltas)
print("alpha", 6, "x", next(k for k, d in enumerate(deltas) if d < 0), "p", 4)
