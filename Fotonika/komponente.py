import cmath as cm
import numpy as np
import funkcije as fun
from numpy import pi
from numpy import random as rnd


coupler_er = 0.99
coupler = np.sqrt(coupler_er)*np.sqrt(1/2)*np.array([[1, 1j],[1j,1]])

class PhaseShifter:
    global coupler_er

    def __init__(self, ups, lps, k, n, flag):
        self.ups = ups + np.pi*(rnd.random()-0.5)/50
        self.lps = lps + np.pi*(rnd.random()-0.5)/50
        self.k = k
        self.n = n
        if flag == 0:
            self.Matrix = np.array([[np.exp(self.ups*1j), 0],[0, np.exp(self.lps*1j)]])
        else:
            self.Matrix = np.sqrt(coupler_er) * np.array([[np.exp(self.ups*1j), 0],[0, np.exp(self.lps*1j)]])

    def phase(self):
        return fun.expand(self.Matrix, self.k, self.n)

class Coupler:

    def __init__(self):
        self.Matrix = [[1, 1j],[1j,1]]

    def coupler(self):
        return self.Matrix


class Interferometer:

    global coupler

    def __init__(self, up, down, k, n):
        self.k = k
        self.n = n
        self.down = down + np.pi*(rnd.random()-0.5)/50
        self.up = up + np.pi*(rnd.random()-0.5)/50
        phase = np.array([[np.exp(self.up*1j), 0],[0,np.exp(self.down*1j)]])
        self.Matrix = np.matmul(np.matmul(coupler, phase),coupler)

    def inter(self):
        return fun.expand(self.Matrix, self.k, self.n)




