import math
from itertools import combinations

n = 347881
factor_base = [-1, 2, 3, 5, 7, 11, 13, 17, 19, 23]
start, end = 600, 660

def factor_over_base(a, base):
    exps = []
    if a < 0:
        exps.append(1)
        a = -a
    else:
        exps.append(0)
    for p in base[1:]:
        e = 0
        while a % p == 0:
            a //= p
            e += 1
        exps.append(e)
    if a != 1:
        return None
    return exps

relations = []
zs = []
for z in range(start, end + 1):
    a = (z * z) % n
    factors = factor_over_base(a, factor_base)
    if factors:
        relations.append(factors)
        zs.append(z)
        print(f"z={z}, a={a}, factors={factors}")