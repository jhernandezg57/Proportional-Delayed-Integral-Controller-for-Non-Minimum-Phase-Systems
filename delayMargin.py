from qpmr import *
from scipy.io import savemat

s = sp.symbols('s')
r = np.array([-1, 1, 0, 1])
kp = -2
ki = 1/2
h = np.linspace(0.5, 2.2, 1000)
sol = []
for i in range(len(h)):
    qp = s**3-(1/2)*s**2+(13/4)*s+(1-(1/2)*s)*(kp*s + ki*exp(-h[i]*s))
    sol.append(QPmR(qp, r, 0.1*np.pi/2.5,0.0000001))
    if all(j < 0 for j in sol[-1].real):
        continue
    else:
        print('Critical value of h:', h[i])
        break

savemat('sol_data.mat', {'sol': sol, 'h': h})
