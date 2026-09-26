from hashlib import sha256
from math import comb


def conv(f, g):
    out = [0] * (len(f) + len(g) - 1)
    for i, a in enumerate(f):
        for j, b in enumerate(g):
            out[i + j] += a * b
    return out


def b_power(m):
    # Coefficients from B(B^m)'=mB'B^m, solved triangularly.
    out = [1] + [0] * (3*m)
    for j in range(1, 3*m + 1):
        numerator = 4*(m-j+1)*out[j-1]
        if j >= 2: numerator += (6*m-3*j+6)*out[j-2]
        if j >= 3: numerator += (3*m-j+3)*out[j-3]
        out[j], rem = divmod(numerator, j)
        assert rem == 0
    return out


def add_scaled(dst, src, scale=1, shift=0):
    for j, x in enumerate(src):
        dst[j + shift] += scale * x


def coefficients(m):
    # P=(1+2z)B^m+z(1+z)^(3m); A0=(1+z)B^m+z(1+z)^(3m-1?); formulas below
    B = [1, 4, 3, 1]
    bm, prev = b_power(m), b_power(m - 1)
    Lm = [1]
    for j in range(1, 3*m + 1):
        Lm.append(Lm[-1] * (3*m-j+1) // j)
    P = [0] * (4*m + 5)
    A0 = [0] * (4*m + 5)
    Ast = [0] * (4*m + 5)
    R = [0] * (4*m + 5)
    add_scaled(P, bm); add_scaled(P, bm, 2, 1)
    add_scaled(P, Lm, 1, 1); add_scaled(P, Lm, 1, 2)
    add_scaled(A0, bm); add_scaled(A0, bm, 1, 1)
    add_scaled(A0, Lm, 1, 1)
    # (1+5z+7z^2+2z^3)B^(m-1) + z(1+z)^(3m)
    for shift, coeff in enumerate((1, 5, 7, 2)):
        add_scaled(Ast, prev, coeff, shift)
    add_scaled(Ast, Lm, 1, 1)
    # 3m(2+5z+2z^2)B^(m-1)+(3m+1)(1+z)^(3m)
    for shift, coeff in enumerate((2, 5, 2)):
        add_scaled(R, prev, 3*m*coeff, shift)
    add_scaled(R, Lm, 3*m+1)
    return P, (('A0', A0), ('Astar', Ast), ('R', R))


def main():
    lc_hash, minor_hash = sha256(), sha256()
    lc_count = minor_count = 0
    eligible = 0
    selector_failures = []
    minima = {'lc': None, 'minor': None}
    for m in range(1, 1000):
        P, Zs = coefficients(m)
        at = lambda xs, i: xs[i] if 0 <= i < len(xs) else 0
        x = next(j for j in range(len(P)) if at(P, j+1) < at(P, j))
        alpha = 3*m + 2
        named = dict(Zs)
        for p in range(x+2, alpha+1):
            if 3*p >= 2*alpha + 1:
                continue
            eligible += 1
            d0 = at(named['A0'], p+1) - at(named['A0'], p)
            ds = at(named['Astar'], p+1) - at(named['Astar'], p)
            total = at(named['R'], p-1) - at(named['R'], p-2)
            if not (d0 < 0 and ds < 0 and total < 0):
                selector_failures.append((m,p,x,d0,ds,total))
        if m < 3:
            continue
        for name, Z in Zs:
            for j in range(m, 2*m+3):
                lc = Z[j]**2 - Z[j-1]*Z[j+1]
                mn = Z[j]*P[j+1] - Z[j+1]*P[j]
                assert lc > 0, (m, name, j, lc)
                assert mn > 0, (m, name, j, mn)
                lc_hash.update(f'{m}:{name}:{j}:{lc}\n'.encode())
                minor_hash.update(f'{m}:{name}:{j}:{mn}\n'.encode())
                lc_count += 1; minor_count += 1
                if minima['lc'] is None or lc < minima['lc'][0]: minima['lc'] = (lc,m,name,j)
                if minima['minor'] is None or mn < minima['minor'][0]: minima['minor'] = (mn,m,name,j)
    print('LC', lc_count, lc_hash.hexdigest(), minima['lc'])
    print('MINOR', minor_count, minor_hash.hexdigest(), minima['minor'])
    print('ELIGIBLE', eligible, 'failures=', len(selector_failures), 'first=', selector_failures[:1])

if __name__ == '__main__': main()
