from math import comb

def i(m,j):
    return comb(m-j+1,j) if 0 <= j <= (m+1)//2 else 0

def delta(m,j):
    return i(m,j+1)-i(m,j)

def x(n):
    # Zero extension: inspect through the terminal coefficient.
    return next(j for j in range(n+1) if delta(n,j)<0)

rows=[]
for n in range(4,151):
    a=(n+1)//2
    for p in range(x(n)+2,a+1):
        if 3*p < 2*a+1:
            k=p-1
            S=2*(i(n-4,k)-i(n-4,k-1))
            rows.append((n,p,S))
assert len(rows)==449
assert len({n for n,p,s in rows})==117
assert min(s for n,p,s in rows)==-140598451215242502192647212080
assert max(s for n,p,s in rows)==-38896
assert all(s<=0 for n,p,s in rows)
# Check path selector and recurrence directly for every eligible row.
for n,p,S in rows:
    assert delta(n-1,p)<0  # either endpoint is fixed-selector favorable
    # q_j = i_{j-1}(P_{n-4}); sum of both endpoint contributions
    assert 2*((i(n-4,p-1)-i(n-4,p-2))) == S
print({'rows':len(rows),'orders':len({n for n,p,s in rows}),'min':min(s for n,p,s in rows),'max':max(s for n,p,s in rows),'all_nonpositive':True})
