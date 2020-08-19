import numpy as np
from numpy import e
import cmath
import math
from numpy import pi
from numpy import linalg as LA

eta = 0.000000001

def expand(Matrix, k, n):
    tmp = np.identity(n, dtype=complex)
    tmp[k[1]][k[1]] = Matrix[0][0]
    tmp[k[1]][k[0]] = Matrix[0][1]
    tmp[k[0]][k[1]] = Matrix[1][0]
    tmp[k[0]][k[0]] = Matrix[1][1]
    return tmp

def null(M):
    for i in range(0,np.size(M,0)):
        for j in range(0,np.size(M,1)):
            if abs(M[i][j].real) < eta:
                M[i][j] = M[i][j] -  M[i][j].real
            if abs(M[i][j].imag) < eta:
                M[i][j]= M[i][j] - M[i][j].imag
    return M



def rect(U):

    n = np.size(U,0)
    Us = []
    order = []
    order1 = []
    phis = []
    phis1 = []
    ks = []
    ks1 = []
    lows = []
    lows1 = []
    ups = []
    ups1 = []
    Ts = []
    for i in range(1, n):
        if i % 2 == 1:
            for j in range(0, i):
                y = i - j - 1
                x = n - j - 1
                # x je y a y je x
                if abs(U[x][y]) < eta:
                    t = 0
                    ks.append(0.0)
                    phis.append(-cmath.phase(U[x][y + 1]) - pi)
                    ups.append(math.acos(0))
                    lows.append(-math.acos(0))
                    order.append([y+1,y])

                else:
                    a1 = U[x][y]
                    a2 = U[x][y + 1]

                    t = math.sqrt(abs(a1) ** 2 / (abs(a1)**2 + abs(a2) ** 2))
                    phi = cmath.phase(a1) - cmath.phase(a2) - pi

                    T = np.identity(n, dtype=complex)
                    k = t ** 2

                    up =  math.acos(math.sqrt(k))
                    down = - math.acos(math.sqrt(k))

                    r = math.sqrt(1 - k)

                    ups.append(up)
                    lows.append(down)
                    ks.append(k)

                    T[y][y] = r * e ** (-1j * phi)
                    T[y][y + 1] = t * e ** (-1j * phi)
                    T[y + 1][y] = t
                    T[y + 1][y + 1] = -r
                    Ts.append(T)
                    order.append([y+1,y])
                    U = np.matmul(U, T)
                    Us.append(U)
                    phis.append(phi)



        else:
            for j in range(0, i):
                y = j
                x = n - i + j
                # zamenjeno
                if abs(U[x][y]) < eta:
                    t = 0
                    ks1.append(0.0)
                    phis1.append(-cmath.phase(U[x - 1][y]))
                    ups1.append(math.acos(0))
                    lows1.append(-math.acos(0))
                    order1.append([x,x-1])

                else:
                    a1 = U[x][y]
                    a2 = U[x - 1][y]
                    t = math.sqrt(abs(a1) ** 2 / (abs(a1)**2 + abs(a2) ** 2))

                    phi = cmath.phase(a1) - cmath.phase(a2)
                    T = np.identity(n, dtype=complex)
                    k = t ** 2
                    r = math.sqrt(1 - k)

                    up =  + math.acos(math.sqrt(k))
                    down = - math.acos(math.sqrt(k))
                    ups1.append(up)
                    lows1.append(down)

                    ks1.append(k)

                    T[x - 1][x - 1] = r * e ** (1j * phi)
                    T[x - 1][x] = t
                    T[x][x - 1] = t * e ** (1j * phi)
                    T[x][x] = -r

                    Ts.append(T)

                    order1.append([x,x-1])

                    U = np.matmul(T, U)
                    Us.append(U)
                    phis1.append(phi)

    for i in range(0, n):
        tmp = cmath.phase(U[i][i])
        U[i][i] = e**((tmp - 0.5*pi)*1j)
    #print('U',U)
    # print("UPS", phis)
    # print("LPS", 0)
    # print("up", ups)
    # print("low", lows)
    # print("ios", ios)
    # #print("ks", ks)

    return phis + phis1, 0, ups+ups1, lows+lows1, U, order + order1 , Ts, Us

def triang(U):
    n = np.size(U, 0)
    Us = []
    order = []
    phis = []
    ks = []
    lows = []
    ups = []
    Ts = []

    for i in range(0,n-1):
        for j in range(1,n-i):
            y = n - i -1
            x = y - j

            if abs(U[y][x]) < eta:
                ks.append(0.0)
                phis.append(-cmath.phase(U[y][y]))
                ups.append(math.acos(0))
                lows.append(-math.acos(0))
                order.append([y,y-1])

            else:
                a1 = U[y][x]
                a2 = U[y][y]
                t = math.sqrt(abs(a1) ** 2 / (abs(a1) ** 2 + abs(a2) ** 2))

                phi =  cmath.phase(a1) - cmath.phase(a2) - pi

                T = np.identity(n, dtype=complex)
                k = t ** 2
                r = math.sqrt(1 - k)
                up = + math.acos(math.sqrt(k))
                down = - math.acos(math.sqrt(k))

                ups.append(up)
                lows.append(down)
                ks.append(k)

                T[x][x] = r * e ** (-1j * phi)
                T[x][y] = t * e ** (-1j * phi)
                T[y][x] = t
                T[y][y] = -r

                Ts.append(T)
                order.append([y,y-1])
                U = np.matmul(U, T)
                Us.append(U)
                phis.append(phi)

    return phis, 0, ups, lows, U, order, Ts, Us

def hexa(U):

    n = np.size(U,0)
    Us = []
    order = []
    order1 = []
    phis = []
    phis1 = []
    ks = []
    ks1 = []
    lows = []
    lows1 = []
    ups = []
    ups1 = []
    Ts = []
    for i in range(1, n):
        if i % 2 == 1:
            for j in range(0, i):
                y = i - j - 1
                x = n - j - 1
                # x je y a y je x
                if abs(U[x][y]) < eta:
                    t = 0
                    ks.append(0.0)
                    phis.append(-cmath.phase(U[x][y + 1]) - pi)
                    ups.append(math.acos(0))
                    lows.append(-math.acos(0))
                    order.append([y+1,y])

                else:
                    a1 = U[x][y]
                    a2 = U[x][y + 1]

                    t = math.sqrt(abs(a1) ** 2 / (abs(a1)**2 + abs(a2) ** 2))
                    phi = cmath.phase(a1) - cmath.phase(a2) - pi

                    T = np.identity(n, dtype=complex)
                    k = t ** 2

                    up =  math.acos(math.sqrt(k))
                    down = - math.acos(math.sqrt(k))

                    r = math.sqrt(1 - k)

                    ups.append(up)
                    lows.append(down)
                    ks.append(k)

                    T[y][y] = r * e ** (-1j * phi)
                    T[y][y + 1] = t * e ** (-1j * phi)
                    T[y + 1][y] = t
                    T[y + 1][y + 1] = -r
                    Ts.append(T)
                    order.append([y+1,y])
                    U = np.matmul(U, T)
                    Us.append(U)
                    phis.append(phi)



        else:
            for j in range(0, i):
                y = j
                x = n - i + j
                # zamenjeno
                if abs(U[x][y]) < eta:
                    t = 0
                    ks1.append(0.0)
                    phis1.append(-cmath.phase(U[x - 1][y]))
                    ups1.append(math.acos(0))
                    lows1.append(-math.acos(0))
                    order1.append([x,x-1])

                else:
                    a1 = U[x][y]
                    a2 = U[x - 1][y]
                    t = math.sqrt(abs(a1) ** 2 / (abs(a1)**2 + abs(a2) ** 2))

                    phi = cmath.phase(a1) - cmath.phase(a2)
                    T = np.identity(n, dtype=complex)
                    k = t ** 2
                    r = math.sqrt(1 - k)

                    up =  + math.acos(math.sqrt(k))
                    down = - math.acos(math.sqrt(k))
                    ups1.append(up)
                    lows1.append(down)

                    ks1.append(k)

                    T[x - 1][x - 1] = r * e ** (1j * phi)
                    T[x - 1][x] = t
                    T[x][x - 1] = t * e ** (1j * phi)
                    T[x][x] = -r

                    Ts.append(T)

                    order1.append([x,x-1])

                    U = np.matmul(T, U)
                    Us.append(U)
                    phis1.append(phi)

    for i in range(0, n):
        tmp = cmath.phase(U[i][i])
        U[i][i] = tmp - 0.5*pi
    #print('U',U)
    # print("UPS", phis)
    # print("LPS", 0)
    # print("up", ups)
    # print("low", lows)
    # print("ios", ios)
    # #print("ks", ks)

    return phis + phis1, 0, ups+ups1, lows+lows1, U, order + order1 , Ts, Us