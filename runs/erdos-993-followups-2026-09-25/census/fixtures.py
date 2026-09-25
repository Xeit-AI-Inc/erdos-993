#!/usr/bin/env python3
"""Small semantic fixtures, including decisions that shortcut checks miss."""
from forest24 import forest_x, plus_x, independent_poly_from_code
from math import comb


def padded(a):return a+[0]*(9-len(a))

def main():
    assert forest_x(padded([1]))==0
    assert plus_x(padded([1]))==1
    assert forest_x(padded([1,1]))==1  # plateau at rank zero
    assert plus_x(padded([1,1]))==1
    assert forest_x(padded([1,3,3,2]))==2  # internal plateau
    bad=padded([1,3,2,10])
    assert forest_x(bad)==1 and plus_x(bad)==3  # positive failure decision
    # A pair of negative deltas does not compute first strict descent.
    delayed=padded([1,4,4,3,2])
    assert forest_x(delayed)==2
    for code in [[],['U:()'],['U:(())'],['U:(()())'],['U:((()))'],
                 ['U:()','U:()'],['B:()|()']]:
        co=padded(independent_poly_from_code(code))
        # Convolution by 1+x, through i_8.
        plus=[co[j]+(co[j-1] if j else 0) for j in range(9)]
        assert plus_x(co)==forest_x(plus)
        for j in range(8):
            assert plus[j+1]-plus[j]==co[j+1]-(co[j-1] if j else 0)
    path=lambda n,k:comb(n-k+1,k) if n-k+1>=k else 0
    assert [path(22,6),path(22,7)]==[12376,11440]
    assert path(23,7)-path(23,6)==884
    print('fixtures passed: empty, plateaus, synthetic closure failure, K1 identity, P22/P23')

if __name__=='__main__':main()
