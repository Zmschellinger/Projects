from math import isqrt
from typing import Optional, Tuple, Dict

def baby_step_giant_step(alpha: int, beta: int, p: int, trace: bool=False) -> Optional[Tuple[int,int,int,Dict[int,int]]]:
   
    n = p - 1
    m = isqrt(n) + 1 
    if trace:
        print(f"p = {p}, α = {alpha}, β = {beta}")
        print(f"Group order n = p-1 = {n}, m = ceil(sqrt(n)) = {m}\n")
    
    baby = {}
    cur = 1
    for j in range(m):
        
        if cur not in baby:
            baby[cur] = j
        cur = (cur * alpha) % p
    
    if trace:
        print(f"Computed {len(baby)} baby steps (showing up to first 20 entries):")
        sample_items = list(baby.items())[:20]
        for val, j in sample_items:
            print(f"  α^{j} ≡ {val} (mod {p})")
        print("  ...\n")
    
    inv_alpha = pow(alpha, p-2, p)
    alpha_inv_m = pow(inv_alpha, m, p)  
    
    gamma = beta % p
    if trace:
        print("Starting giant steps (checking β * α^{-m*i} for i = 0..m):")
    for i in range(m+1):
        if trace and i < 10: 
            print(f"  i={i}: γ = β * α^(-m*i) ≡ {gamma} (mod {p})", end='')
        if gamma in baby:
            j = baby[gamma]
            x = i * m + j
            if trace:
                print(f"\nFound solution: i = {i}, j = {j}, x = i*m + j = {x}")
            return x, i, j, baby
        if trace and i < 10:
            print()
        gamma = (gamma * alpha_inv_m) % p
    
    if trace:
        print("No solution found.")
    return None
problems = [
    (106, 12375, 24691, "log_106(12375) in Z*_24691"),
    (6, 248388, 458009, "log_6(248388) in Z*_458009"),
]

results = []
for alpha, beta, p, desc in problems:
    print("="*70)
    print(desc)
    print("-"*70)
    res = baby_step_giant_step(alpha, beta, p, trace=True)
    if res is None:
        print("No discrete log found.\n")
        results.append(None)
    else:
        x, i, j, baby = res
        verified = pow(alpha, x, p) == beta % p
        print(f"\nVerification: α^{x} mod p = {pow(alpha, x, p)}; target β = {beta % p}. Verified? {verified}\n")
        results.append((x, i, j))
print("="*70)

for (alpha, beta, p, desc), res in zip(problems, results):
    if res is None:
        print(f"{desc}: No solution")
    else:
        x,i,j = res
        print(f"{desc}: x = {x} (i={i}, j={j})")