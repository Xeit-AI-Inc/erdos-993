"""Independent exact spot checks of the C6-T3 bridge formulas."""
from math import comb


def add(a, b):
    n = max(len(a), len(b))
    return [(a[i] if i < len(a) else 0) + (b[i] if i < len(b) else 0)
            for i in range(n)]


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def sub(a, b):
    return add(a, [-x for x in b])


def lp(d):
    return [comb(d, i) for i in range(d + 1)]


def B(r):
    out = lp(r)
    out[1] += 1
    return out


def F(r):
    out = [0] * (r - 1)
    for d in range(r - 1):
        out = add(out, lp(d))
    return out


def at(a, i):
    return a[i] if 0 <= i < len(a) else 0


def minor(a, c, k):
    return at(a, k) * at(c, k) - at(a, k + 1) * at(c, k - 1)


def forward(a, k):
    return at(a, k + 1) - at(a, k)


def profile(rs):
    N = sum(rs)
    Q = [1]
    for r in rs:
        Q = mul(Q, B(r))
    G, L = [1, 2], [1, 1]
    C = mul(G, Q)
    E = [0] + lp(N)
    U0 = mul(L, Q)
    U = []
    for i, r in enumerate(rs):
        H = [1]
        for j, s in enumerate(rs):
            if i != j:
                H = mul(H, B(s))
        U.append(mul(mul(G, B(r - 1)), H))
    h = 1 + sum({2: 2, 3: 4, 4: 7}[r] for r in rs)
    maxk = (N + 2) // 2
    rows = []
    for i in range(len(rs)):
        for k in sorted({1, max(1, maxk // 2), maxk}):
            if k > maxk:
                continue
            # Main-product LR, exact cross-multiplied direction.
            lr = at(U[i], k + 1) * at(C, k) - at(U[i], k) * at(C, k + 1)
            assert lr <= 0, (rs, i, k, "tip LR", lr)
            # ULC order h, cleared only by positive denominators.
            left = k * (h - k) * at(C, k) ** 2
            right = (k + 1) * (h - k + 1) * at(C, k - 1) * at(C, k + 1)
            assert h - k > 0 and left >= right, (rs, k, "ULC", left-right)
            # Curvature lower bound, equivalently M(U)>=lambda*U[k]C[k].
            den = (k + 1) * (h - k + 1)
            assert den > 0
            curv = den * minor(U[i], C, k) - (h + 1) * at(U[i], k) * at(C, k)
            assert curv >= 0, (rs, i, k, "tip curvature", curv)
            surplus = (h + 1) * at(U[i], k) * at(C, k) + den * minor(E, C, k)
            rows.append((i, k, surplus))
    # Endpoint LR is checked independently (it does not follow from U0>=Ui).
    for k in sorted({1, max(1, maxk // 2), maxk}):
        if k > maxk:
            continue
        lr0 = at(U0, k + 1) * at(C, k) - at(U0, k) * at(C, k + 1)
        assert lr0 <= 0, (rs, k, "endpoint LR", lr0)
        for i, r in enumerate(rs):
            lhs = sub(mul(L, B(r)), mul(G, B(r - 1)))
            rhs = [0, 0] + [x - (1 if d == 0 else 0)
                              for d, x in enumerate(lp(r - 1))]
            assert lhs == rhs, (r, lhs, rhs)
            diff = sub(U0, U[i])
            H = [1]
            for j, s in enumerate(rs):
                if i != j:
                    H = mul(H, B(s))
            want = mul(rhs, H)
            assert diff == want, (rs, i, diff, want)
            assert at(U0, k) >= at(U[i], k)
            den = (k + 1) * (h - k + 1)
            endcurv = den * minor(U0, C, k) - (h + 1) * at(U0, k) * at(C, k)
            assert endcurv >= 0, (rs, k, "endpoint curvature", endcurv)
    return N, h, rows


profiles = [[2], [4], [2, 3, 4], [4, 4, 4], [2, 2, 2, 2]]
out = []
for rs in profiles:
    N, h, rows = profile(rs)
    out.append({"r": rs, "N": N, "h": h,
                "guard_max_k": (N + 2) // 2,
                "selected_surplus_samples": [
                    {"branch": i, "k": k, "integer_surplus": str(v)}
                    for i, k, v in rows]})
print({"exact_profiles": out,
       "scope": "spot checks only; no universal tip-surplus claim"})
