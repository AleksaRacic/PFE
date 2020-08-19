import funkcije as fun
import komponente as kom
from numpy import linalg as LA
import numpy as np
from numpy import e
from numpy import pi
from numpy import linalg as LA
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import axes3d
from matplotlib import style
import komponente as kom
style.use('ggplot')

d = np.sqrt(1/5)
M = d * np.array([[0,1,0,0,0],[0,0,0,1,0],[1,0,0,0,0],[0,0,0,0,1], [0,0,1,0,0]])


fig = plt.figure()
ax1 = fig.add_subplot(111, projection='3d')
_x = np.arange(5)
_y = np.arange(5)
_xx, _yy = np.meshgrid(_x, _y)
x2, y2 = _xx.ravel(), _yy.ravel()
x2 = x2 + 0.75 * np.ones(25)
y2 = y2 + 0.75 * np.ones(25)

z2 = np.zeros(25)

dx = 0.5 * np.ones(25)
dy = 0.5 * np.ones(25)


flag = 1
dz = np.array([])

inter = []
phase = []

for i in range(0,5):
    ulaz = np.zeros((5, 1))
    ulaz[i][0] = 1

    UPS, _, up, down, IO, orde, Ts, Us = fun.rect(M)

    for i in range(0, up.__len__()):
        inter.append(kom.Interferometer(up[i], down[i], orde[i], 5))
        phase.append(kom.PhaseShifter(UPS[i], 0, orde[i], 5, flag))

    # Final = np.matmul(np.identity(3),ulaz)
    for i in range(0, up.__len__()):
        tmp = np.matmul(inter[i].inter(), phase[i].phase())
        ulaz = np.matmul(tmp, ulaz)
    ulaz = 100 *abs(ulaz)**2
    z = np.array(ulaz.T[0])
    dz = np.concatenate((dz,z))



ax1.bar3d(x2, y2, z2, dx, dy, dz, color = 'green')
print(x2)
print(y2)
print(z2)
print(dx)
print(dy)
print(dz)


ax1.set_xlabel('Izlazi')
ax1.set_ylabel('Ulazi')
ax1.set_zlabel('Transmitansa [%]')
plt.title('Transmitansa po izlazu matrice permutacije 5x5 (Triangularna)')
#ax1.set_zscale('log')
plt.show()