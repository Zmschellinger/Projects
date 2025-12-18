p = 4339
a, b = 193, 647

def inv_mod(x):
    return pow(x, -1, p)

def add(P, Q):
    if P == "O": return Q
    if Q == "O": return P
    x1, y1 = P
    x2, y2 = Q
    if x1 == x2 and (y1 + y2) % p == 0:
        return "O"
    if P == Q:
        lam = ((3*x1*x1 + a) * inv_mod(2*y1)) % p
    else:
        lam = ((y2 - y1) * inv_mod(x2 - x1)) % p
    x3 = (lam*lam - x1 - x2) % p
    y3 = (lam*(x1 - x3) - y1) % p
    return (x3, y3)

def multiply(P, n):
    R = "O"
    Q = P
    while n:
        if n & 1:
            R = add(R, Q)
        Q = add(Q, Q)
        n >>= 1
    return R

P = (719, 3538)
Q = (3509, 334)

for m in range(1, 4379):
    if multiply(P, m) == Q:
        print("Private key m =", m)
        break
