"""Independent exact checks of the algebraic identities and disputed layer row."""
import json
from fractions import Fraction
from math import comb
from pathlib import Path


def choose(n, k):
    return comb(n, k) if 0 <= k <= n else 0


def g(r, M, k):
    return Fraction(2*r*choose(M-r, k-1), (2*r+1)*choose(M, k))


local = {
    "D1_G": [6],
    "D2_B2": [7, -2],
    "D3_B3": [8, -2, 3],
    "D4_B4": [9, 0, 12, 4],
}
expected_adjusted = {
    2: [Fraction(23, 3), 0, Fraction(2, 3)],
    3: [Fraction(17, 2), 0, Fraction(9, 2), Fraction(1, 2)],
    4: [Fraction(9), 0, Fraction(12), Fraction(4), 0],
}
for r in (2, 3, 4):
    b = [choose(r, i) for i in range(r+1)]
    b[1] += 1
    db = [Fraction((5*(i+1)*b[i+1] if i+1 < len(b) else 0) + (4*i-4*r)*b[i]) for i in range(len(b))]
    h = {2: Fraction(2, 3), 3: Fraction(1, 2), 4: Fraction(0)}[r]
    assert db == [Fraction(x) for x in local[f"D{r}_B{r}"]] + [Fraction(0)]*(len(db)-len(local[f"D{r}_B{r}"]))
    assert [x+h*y for x, y in zip(db, b)] == expected_adjusted[r]

checked = 0
for M in range(10, 151):
    for k in range((M+2)//3, M+1):
        lhs = g(2, M, k)-2*g(3, M, k)+g(4, M, k)
        if k == M:
            assert lhs == 0
        else:
            v = 3*k-M
            nine_f = 37*(M-10)**2+290*(M-10)+217+v*(125*M-585)+70*v*v
            rhs = Fraction(4*k*(M-k)*nine_f, 9*315*M*(M-1)*(M-2)*(M-3))
            assert lhs == rhs and lhs > 0
        checked += 1

# Direct binomial evaluation at the disputed m=40,p=80 row.
m, N, p, j = 40, 160, 80, 78
delta = N+1-j
D = choose(N, j+1)-choose(N, j)
gf = [3, 9, 7, 2]
U = []
for depth in range(4):
    U.append(sum(choose(m-1, ell)*a*choose(N-4-4*ell, j-ell-s)
                 for ell in range(depth+1) for s, a in enumerate(gf)))
margins = [2*u-3*delta*D for u in U]
assert margins[1] > 0 and margins[2] > 0

# Size-one block at the full-set boundary: the probability is one, not zero.
size_one = {"M": 1, "k": 1, "H_k": 2, "singleton_probability": 1,
            "Jensen_exponent": "2/3"}
out = {"local_certificates": "exact coefficient identities and nonnegative adjusted rows pass",
       "balancing_identity_pairs": checked,
       "m40_p80": {"profile": [0, 0, m], "n": N+m+3, "N": N,
                   "alpha": N+2, "x": 78, "p": p, "j": j,
                   "delta": delta, "D": D, "e0": 1, "ei": 1,
                   "U_depths": U, "signed_margins": margins},
       "size_one_boundary": size_one}
Path("C3-AU-focused-audit.json").write_text(json.dumps(out, indent=2)+"\n")
print(json.dumps({"balancing_identity_pairs": checked,
                  "m40_p80_margins": margins}))
