from math import comb

def x_star(m):
    # Directly scan zero-extended differences of the stated counts.
    def i(j):
        if j == 0: return 1
        if j == 1: return m+1
        if 2 <= j <= m: return comb(m,j)
        return 0
    return next(j for j in range(0,m+2) if i(j+1)-i(j)<0)

def delta_star(m,j):
    def i(r):
        if r==0: return 1
        if r==1: return m+1
        if 2<=r<=m: return comb(m,r)
        return 0
    return i(j+1)-i(j)

def check(m,p):
    x=x_star(m)
    assert x == (m-1)//2+1
    assert p >= x+2 and 3*p < 2*m+1
    # T-v has m-1 leaves; selector condition is checked from its exact counts.
    assert delta_star(m-1,p)<0
    per=comb(m-1,p)-comb(m-1,p-1)
    total=m*per
    assert per<0
    return {'m':m,'x':x,'p':p,'delta_Tminusv':delta_star(m-1,p),'per_leaf':per,'F_size':m,'S':total}

if __name__=='__main__':
    print(check(20,12))
    print(check(20,13))
    print({'d6_source':comb(19,6),'d6_target':comb(19,5),'injective_impossible':comb(19,6)>comb(19,5)})
