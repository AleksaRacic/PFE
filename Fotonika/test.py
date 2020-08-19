import numpy as np
import cmath
from math import pi
from math import e
from numpy import linalg as LA
#a = np.array([[1,2,3],[4,5,6],[7,8,9]])
b = [[1+1j,2,3],[4,5,6],[7,8,9]]
c = [[8,3],[2,7]]
#print(cmath.phase(e**(1j*pi*4/3))/pi)
#V, S, VH = LA.svd(c)
#print(V, '\n', S, '\n',VH)
#D, m = LA.eig(b)
#print(m)
#print(np.matmul(np.matmul(LA.inv(m),b),m))

T2 = [[ 0.0685226 +4.40770996e-17j , 0.9314774 +0.00000000e+00j,
   0.0000000 +0.00000000e+00j],
 [ 0.9314774 +5.99171960e-16j,  0.0685226 -0.00000000e+00j,
   0.0000000 +0.00000000e+00j],
 [ 0.0000000 +0.00000000e+00j,  0.0000000 +0.00000000e+00j,
   1.0000000 +0.00000000e+00j]]


KO =[[-18.51196212],
 [ -0.72523258],
 [ -0.88390965]]

T1 =[[ 0.51586524+0.j,  0.85666975+0.j,  0.00000000+0.j],
 [ 0.85666975+0.j, -0.51586524+0.j,  0.00000000+0.j],
 [ 0.00000000+0.j,  0.00000000+0.j,  1.00000000+0.j]]

T2 = [[ 0.01433247+0.j,  0.99989728+0.j,  0.00000000+0.j],
 [ 0.99989728+0.j, -0.01433247+0.j,  0.00000000+0.j],
 [ 0.00000000+0.j,  0.00000000+0.j,  1.00000000+0.j]]

T3 = [[ 1.00000000+0.j,  0.00000000+0.j,  0.00000000+0.j],
 [ 0.00000000+0.j,  0.72640028+0.j,  0.68727188+0.j],
 [ 0.00000000+0.j,  0.68727188+0.j, -0.72640028+0.j]]


X = [[2],[1],[0]]
#print(np.sqrt(T2))
print(np.matmul(T1,X)**2)