from math import prod

n_larry = 25777
n_moe   = 22879
n_curly = 66277

c1_larry = 19052
c1_moe   = 4546
c1_curly = 44619

c2_larry = 1708
c2_moe   = 11733
c2_curly = 19731

mods = [n_larry, n_moe, n_curly]

def crt(remainders, moduli):
    N = prod(moduli)
    x = 0
    for r, m in zip(remainders, moduli):
        Ni = N // m
        inv = pow(Ni, -1, m) 
        x += r * Ni * inv
    return x % N

def integer_cuberoot(n):
    a = int(round(n ** (1/3))) 
    while (a + 1)**3 <= n:
        a += 1
    while a**3 > n:
        a -= 1
    return a, (a**3 == n)
    
def decode_block(value):
    if not (0 <= value < 26**3):
        raise ValueError("block value out of range")
    a = value // (26**2)
    b = (value // 26) % 26
    c = value % 26
    letters = ''.join(chr(ord('A') + d) for d in (a, b, c))
    return (a, b, c), letters

def recover_message(c_triplet):
    m_cubed = crt(c_triplet, mods)
    root, exact = integer_cuberoot(m_cubed)
    return m_cubed, root, exact

if __name__ == "__main__":
    m3_1, m1, exact1 = recover_message([c1_larry, c1_moe, c1_curly])
    m3_2, m2, exact2 = recover_message([c2_larry, c2_moe, c2_curly])

    digits1, block1 = decode_block(m1)
    digits2, block2 = decode_block(m2)

    print("Decoded 3-letter blocks:")
    print(f" message1: digits {digits1} -> '{block1}'")
    print(f" message2: digits {digits2} -> '{block2}'")
    print("Final 6-character message (concatenate):", block1 + block2)