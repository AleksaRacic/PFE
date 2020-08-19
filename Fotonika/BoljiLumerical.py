import funkcije as fun
import komponente as kom
from numpy import linalg as LA
import numpy as np
from numpy import e
from numpy import pi
from numpy import linalg as LA
import matplotlib.pyplot as plt

functions = [fun.rect, fun.triang, fun.hexa]
colours = ['blue','green','red']
labels = ['PravougaonaPrvi.csv', 'TriangularnaPrvi.csv', 'HeksagonalnaPrvi.csv']
fig = plt.figure()
plt.ylim(0 ,100)
plt.xlabel('N x N')
plt.ylabel('Transmitansa [%]')
plt.xticks(np.arange(0,101,5))
plt.yticks(np.arange(0,100,10))
plt.grid()

for q in range(0,3):
    X =[]
    Y =[]
    for j in range(2,100):
        V1 = np.sqrt(1/j)*np.identity(j,dtype= complex)
        ulaz = np.zeros((j,1))
        ulaz[0][0] = 1





        inter = []
        phase = []
        tmp = []
        tmpinter = []
        tmpphase = []

        UPS, _, up, down, IO, orde, Ts, Us = functions[q](V1)

        if q == 2:
            flag = 1

        else:
            flag = 0


        for i in range(0, up.__len__()):
            inter.append(kom.Interferometer(up[i], down[i], orde[i], j))
            phase.append(kom.PhaseShifter(UPS[i], 0, orde[i], j, flag))


        #Final = np.matmul(np.identity(3),ulaz)
        for i in range(0, up.__len__()):
            tmp = np.matmul(inter[i].inter(),phase[i].phase())
            ulaz = np.matmul(tmp,ulaz)

        print('\n',j)
        print(abs(ulaz)**2)
        X.append(j)
        Y.append(100*abs(ulaz[0][0])**2)
        #print(j)

    plt.plot(X,Y, scaley = False, color = colours[q])
    X = np.array(X)
    Y = np.array(Y)
    X = X[:,np.newaxis]
    Y = Y[:, np.newaxis]
    np.savetxt(labels[q], np.concatenate((X, Y), 1), delimiter=",")


plt.legend(('Pravougaona', 'Triangularna', 'Heksagonalna'),
           loc='lower left')
plt.title('Transmitansa u zavisnosti od veličine mreže na poslednjem izlazu')
plt.show()