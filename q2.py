import math

def pollard_rho(n, z=31, max_iters=10000000):
    f = lambda x: (x * x + 1) % n
    x = z % n
    y = x
    d = 1
    iters = 0

    while d == 1 and iters < max_iters:
        x = f(x)          
        y = f(f(y))      
        d = math.gcd(abs(x - y), n)
        iters += 1

    if d == n or d == 1:
        return None, iters  
    else:
        return d, iters    

numbers = [
    53081719,
    44818676050679,
    14690966543846720848264259950499
]

for n in numbers:
    factor, iters = pollard_rho(n, z=31)
    if factor:
        print(f"n = {n}")
        print(f"Factor found: {factor} × {n // factor}")
        print(f"Iterations needed: {iters}\n")
    else:
        print(f"n = {n}")
        print(f"No factor found\n")