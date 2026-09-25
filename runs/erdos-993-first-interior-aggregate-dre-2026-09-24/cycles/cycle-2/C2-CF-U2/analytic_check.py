#!/usr/bin/env python3
"""Independent exact polynomial check of the T_m family at m=151."""
from math import comb
import json

m = 151
p = 3*m
A = [1]
for _ in range(m):
    B = [0]*(len(A)+3)
    for j, c in enumerate(A):
        for t, d in enumerate((1, 4, 3, 1)):
            B[j+t] += c*d
    A = B

def c(poly, k):
    return poly[k] if 0 <= k < len(poly) else 0

def binom(n, k):
    return comb(n, k) if 0 <= k <= n else 0

def factor(poly, F):
    out = [0]*(len(poly)+len(F)-1)
    for j, d in enumerate(F):
        for k, v in enumerate(poly):
            out[j+k] += d*v
    return out

full = factor(A, (1, 2))
full.append(0)
for k in range(3*m+3):
    full[k] += binom(3*m+1, k-1)
x = next(k for k in range(len(full)) if c(full, k+1) < c(full, k))

# Divide A^m by A=1+4z+3z^2+z^3, recovering A^(m-1).
A_prev = [0]*(len(A)-3)
for j in range(len(A_prev)):
    A_prev[j] = A[j] - sum(d*c(A_prev,j-t) for t,d in enumerate((4,3,1),1))
assert factor(A_prev, (1,4,3,1)) == A

arm_deleted = factor(A, (1,1))
star_deleted = factor(A_prev, (1,5,7,2))
for poly in (arm_deleted, star_deleted):
    poly.extend([0]*max(0,p+2-len(poly)))
    for k in (p,p+1):
        poly[k] += binom(3*m,k-1)
arm_selector = c(arm_deleted,p+1)-c(arm_deleted,p)
star_selector = c(star_deleted,p+1)-c(star_deleted,p)

arm_term = binom(3*m,p-1)-binom(3*m,p-2)
star_shell = factor(A_prev,(0,2,5,2))
star_term = c(star_shell,p)-c(star_shell,p-1)+arm_term
print(json.dumps({
  "m":m,"order":4*m+3,"alpha":len(full)-1,"p":p,"x":x,
  "eligible":x+2<=p,"arm_selector":arm_selector,
  "star_selector":star_selector,"arm_term":arm_term,
  "star_term":star_term,"total":arm_term+3*m*star_term,
  "terminal_delta":-c(full,len(full)-1),
  "full_coefficients_equal_source":full==json.load(open(__import__('sys').argv[1]))["full_coefficients_through_alpha"]
},indent=2))
