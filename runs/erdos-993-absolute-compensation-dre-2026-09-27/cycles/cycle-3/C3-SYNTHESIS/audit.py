"""Independent C3 synthesis spot checks; run with PYTHONDONTWRITEBYTECODE=1."""
import hashlib
import json
from fractions import Fraction
from math import comb, factorial
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = next(p for p in (HERE, *HERE.parents) if (p / "SOLUTION-CONTRACT.md").is_file())


def choose(n, k):
    return comb(n, k) if 0 <= k <= n else 0


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def coef(a, k):
    return a[k] if 0 <= k < len(a) else 0


def difference(a, k):
    return coef(a, k + 1) - coef(a, k)


def polynomial(counts):
    factors = {2: [1, 3, 1], 3: [1, 4, 3, 1], 4: [1, 5, 6, 4, 1]}
    out = [1]
    for r, count in zip((2, 3, 4), counts):
        for _ in range(count):
            out = mul(out, factors[r])
    return out


def add(a, b):
    return [coef(a, k) + coef(b, k) for k in range(max(len(a), len(b)))]


def z_binomial(n):
    return [0] + [choose(n, k) for k in range(n + 1)]


def witness(counts, p):
    m = sum(counts)
    N = sum(r * c for r, c in zip((2, 3, 4), counts))
    q, alpha = N + 1, N + 2
    Q = polynomial(counts)
    C = mul(Q, [1, 2])
    P = add(C, z_binomial(q))
    x = next(k for k in range(len(P)) if difference(P, k) < 0)
    guards = (x + 2 <= p, 3 * p < 2 * alpha + 1, 2 * p <= alpha)
    j, delta = p - 2, q - (p - 2)
    D = choose(N, j + 1) - choose(N, j)
    A0 = add(mul(Q, [1, 1]), z_binomial(N))
    e0 = difference(A0, p) < 0
    GF = {2: [1, 2], 3: [2, 5, 2], 4: [3, 9, 7, 2]}
    A = 0
    b = int(e0)
    branches = {}
    for r, count in zip((2, 3, 4), counts):
        if not count:
            continue
        reduced = list(counts)
        reduced[r - 2] -= 1
        H = polynomial(reduced)
        Ai = add(mul(mul([1, 2], [choose(r - 1, k) + int(k == 1) for k in range(r)]), H), z_binomial(N))
        ei = difference(Ai, p) < 0
        T = mul(GF[r], H)
        A += r * count * int(ei) * coef(T, j)
        b += r * count * int(ei)
        branches[str(r)] = {"count": count, "flag": int(ei), "deletion_difference": difference(Ai, p), "Tj": coef(T, j)}
    payment = (delta * coef(C, j) - (delta - 1) * coef(C, j + 1)) * A - b * delta * D * coef(C, j)
    return {"counts": counts, "m": m, "n": N + m + 3, "N": N, "alpha": alpha,
            "x": x, "p": p, "j": j, "delta": delta, "guards": guards,
            "e0": int(e0), "endpoint_deletion_difference": difference(A0, p),
            "branches": branches, "b": b, "A": A, "D": D,
            "Cj": coef(C, j), "Cj1": coef(C, j + 1),
            "mass_margin": A - b * delta * D, "payment_margin": payment}


transport = {}
for name in ("C3-COMMON-DISPATCH.json", "C3-TRANSPORT-CLARIFICATION.json", "C3-CRITIQUE-TRANSPORT.json"):
    seal = json.loads((ROOT / "manifests" / name).read_text())
    bad = [a["path"] for a in seal["members"] if hashlib.sha256((ROOT / a["path"]).read_bytes()).hexdigest() != a["sha256"]]
    transport[name] = {"members": len(seal["members"]), "mismatch": bad}
packet = json.loads((ROOT / "packets/C3-SYNTHESIS.json").read_text())
bad = [a["path"] for a in packet["allowed_source_files"] if hashlib.sha256((ROOT / a["path"]).read_bytes()).hexdigest() != a["sha256"]]
transport["C3-SYNTHESIS.json"] = {"members": len(packet["allowed_source_files"]), "mismatch": bad}
assert all(not x["mismatch"] for x in transport.values())

states = exclusions = 0
min_shift_slack = None
for m in range(70, 120):
    for N in range(2 * m, 4 * m + 1):
        for r in (2, 3, 4):
            M = N - r
            if not 2 * (m - 1) <= M <= 4 * (m - 1):
                continue
            for j in range((2 * N - 1) // 5 + 1, (N - 2) // 2 + 1):
                states += 1
                slack = min(3 * (j - s) - M for s in range(r))
                min_shift_slack = slack if min_shift_slack is None else min(min_shift_slack, slack)
                exclusions += slack < 0 or M < 10
assert (states, exclusions) == (799895, 0)


def g(r, M, k):
    return Fraction(2 * r * choose(M - r, k - 1), (2 * r + 1) * choose(M, k))


for M in range(10, 180):
    for k in range((M + 2) // 3, M + 1):
        actual = g(2, M, k) - 2 * g(3, M, k) + g(4, M, k)
        if k == M:
            assert actual == 0
            continue
        h, v, d = M - k - 1, 3 * k - M, M - 10
        f = 63 * (M - 2) * (M - 3) - 135 * h * (M - 3) + 70 * h * (h - 1)
        assert 9 * f == 37 * d * d + 290 * d + 217 + v * (125 * M - 585) + 70 * v * v
        assert actual == Fraction(4 * k * (M - k) * f, 315 * M * (M - 1) * (M - 2) * (M - 3))
        assert actual > 0

E8 = sum((Fraction(119, 20) ** h / factorial(h) for h in range(9)), Fraction(0))
E7 = sum((Fraction(119, 20) ** h / factorial(h) for h in range(8)), Fraction(0))
assert E8 > 288 and E7 > 48
cases = [witness([0, 22, 0], 34), witness([0, 12, 10], 39), witness([0, 0, 40], 80),
         witness([0, 0, 40], 81), witness([0, 0, 150], 294), witness([0, 0, 172], 336)]
assert all(all(w["guards"]) and w["mass_margin"] > 0 and w["payment_margin"] > 0 for w in cases)
assert all(w["e0"] and all(v["flag"] for v in w["branches"].values()) for w in cases)


def homogeneous_layer(w, depth):
    m, j, N = w["m"], w["j"], w["N"]
    assert N == 4 * m
    U = sum(choose(m - 1, h) * sum(c * choose(4 * (m - 1 - h), j - h - s)
                                      for s, c in enumerate((3, 9, 7, 2)))
            for h in range(depth + 1))
    AU = N * U
    return {"depth": depth, "Uj": U,
            "local_margin": 2 * U - 3 * w["delta"] * w["D"],
            "mass_margin": AU - w["b"] * w["delta"] * w["D"],
            "payment_margin": (w["delta"] * w["Cj"] - (w["delta"] - 1) * w["Cj1"]) * AU
                              - w["b"] * w["delta"] * w["D"] * w["Cj"]}


layers = {f'{w["m"]}:{w["p"]}': [homogeneous_layer(w, d) for d in (0, 1, 2)]
          for w in cases if w["N"] == 4 * w["m"]}
assert layers["40:80"][2]["local_margin"] > 0 and layers["40:80"][1]["local_margin"] > 0
assert layers["40:81"][2]["local_margin"] > 0 and layers["40:81"][1]["local_margin"] > 0
assert layers["150:294"][1]["local_margin"] < 0 and layers["150:294"][2]["local_margin"] > 0
assert layers["172:336"][1]["payment_margin"] < 0 and cases[-1]["payment_margin"] > 0

out = {"transport": transport, "scalar_domain_states": states, "scalar_domain_exclusions": exclusions,
       "scalar_min_shift_slack": min_shift_slack, "E8_119_over_20": str(E8), "E7_119_over_20": str(E7),
       "witnesses": cases, "homogeneous_center_layers": layers}
(HERE / "audit.json").write_text(json.dumps(out, indent=2) + "\n")
print(json.dumps({"transport_members": sum(x["members"] for x in transport.values()),
                  "scalar_domain_states": states, "scalar_domain_exclusions": exclusions,
                  "scalar_min_shift_slack": min_shift_slack, "witnesses": len(cases)}))
