import numpy as np
import math
import cmath
from math import e
from math import pi
from numpy import linalg as LA
import funkcije as fun

eta = 0.000000001
X  = [[1], [1], [2]]

def inter(U):
    global X
    O = X

    n = np.size(U,0)

    ios = []
    phis = []
    ks = []
    lows = []
    ups = []

    for i in range(1, n):
        if i % 2 == 1:
            for j in range(0, i):
                y = i - j - 1
                x = n - j - 1
                # x je y a y je x
                if abs(U[x][y]) < eta:
                    t = 0
                    ks.append(0.0)
                    phis.append(cmath.phase(U[x][y + 1]) - pi)
                    ups.append(0.0)
                    lows.append(0.0)

                else:
                    a1 = U[x][y]
                    a2 = U[x][y + 1]
                    ##
                    # U[x][y] = 0
                    # U[x][y+1] = 0
                    ##
                    t = math.sqrt(abs(a1) ** 2 / (abs(a1)**2 + abs(a2) ** 2))
                    te= cmath.phase(a1)
                    te1 =cmath.phase(a2)
                    phi = cmath.phase(a1) - cmath.phase(a2) - pi

                    T = np.identity(n, dtype=complex)
                    k = t ** 2

                    up = math.acos(math.sqrt(k))
                    down = - math.acos(math.sqrt(k))
                    ups.append(up/pi)
                    lows.append(down/pi)

                    r = math.sqrt(1 - k)
                    # t = t* e**(1j*phi)
                    # r = r * e**(1j*phi)
                    ks.append(k)

                    T[y][y] = r * e ** (-1j * phi)
                    T[y][y + 1] = t * e ** (-1j * phi)
                    T[y + 1][y] = t
                    T[y + 1][y + 1] = -r
                    print("T1",'\n')
                    U = np.matmul(U, T)
                    print(T, '\n', U)
                    phi = phi / pi
                    phis.append(phi)



        else:
            for j in range(0, i):
                y = j
                x = n - i + j
                # zamenjeno
                if abs(U[x][y]) < eta:
                    t = 0
                    ks.append(0.0)
                    phis.append(cmath.phase(U[x - 1][y]))
                    ups.append(0.0)
                    lows.append(0.0)

                else:
                    a1 = U[x][y]
                    a2 = U[x - 1][y]
                    t = math.sqrt(abs(a1) ** 2 / (abs(a1)**2 + abs(a2) ** 2))
                    te = cmath.phase(a1)
                    te1 = cmath.phase(a2)

                    phi = cmath.phase(a1) - cmath.phase(a2)
                    T = np.identity(n, dtype=complex)
                    k = t ** 2
                    r = math.sqrt(1 - k)

                    up = math.acos(math.sqrt(k))
                    down = - math.acos(math.sqrt(k))
                    ups.append(up/pi)
                    lows.append(down/pi)

                    # t = t * e ** (1j * phi)
                    # r = r * e ** (1j * phi)
                    ks.append(k)

                    T[x - 1][x - 1] = r * e ** (1j * phi)
                    T[x - 1][x] = t
                    T[x][x - 1] = t * e ** (1j * phi)
                    T[x][x] = -r
                    print("T2", '\n')
                    U = np.matmul(T, U)
                    print(T, '\n', U)
                    phi = phi / pi
                    phis.append(phi)

    for i in range(0, n):
        ios.append((cmath.phase(U[i][i]) / pi) - 0.5)
    #print('U',U)
    print("UPS", phis)
    print("LPS", 0)
    print("up", ups)
    print("low", lows)
    print("ios", ios)
    print("ks", ks)

d = np.sqrt(1/3)
M = d*np.array([[1,1,1],[1, e**(1j*2*pi/3), e**(-1j*2*pi/3)], [1, e**(-1j*2*pi/3), e**(1j*2*pi/3)]])
print(fun.rect(M))