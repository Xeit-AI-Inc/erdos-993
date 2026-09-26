from math import comb

def i(m, j):
    return comb(m-j+1, j) if 0 <= j <= (m+1)//2 else 0

def first_descent(n):
    return next(j for j in range(n+1) if i(n, j+1)-i(n, j) < 0)

rows=[]
for n in range(4,151):
    a=(n+1)//2
    x=first_descent(n)
    for p in range(x+2,a+1):
        if 3*p < 2*a+1:
            s=2*(i(n-4,p-1)-i(n-4,p-2))
            rows.append((n,p,s))
assert len(rows)==449
assert len({n for n,p,s in rows})==117
assert min(s for n,p,s in rows)==-140598451215242502192647212080
assert max(s for n,p,s in rows)==-38896
print('rows',len(rows),'orders',len({n for n,p,s in rows}),'min',min(s for n,p,s in rows),'max',max(s for n,p,s in rows))
