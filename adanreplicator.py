"""
Script for calculating contagion and replicator dynamics for two sociality strategies. This
is used to generate Figure 2 and Figure 5.
"""


import matplotlib.pyplot as plt
import numpy as np
import os, os.path

from matplotlib import rc
rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
## for Palatino and other serif fonts use:
#rc('font',**{'family':'serif','serif':['Palatino']})
rc('text', usetex=True)

time_step = 0.1
time_length = 8000




#Defines the grid for the fraction of mutant strategists $f$. 
f_step = 0.01
f_range = np.arange(f_step,1.0 + f_step,f_step)

c = 4.
alpha = 0.75

Rr = 4
Rm = 3

"""
Initial conditions for the two-contagion dynamics with a resident strategy r and
mutant strategy m. 
"""
Img0 = 0.2
Irg0 = 0.8

Imb0 = 0.2
Irb0 = 0.2

Img = Img0
Irg = Irg0

Imb = Imb0
Irb = Irb0

"""
Lists of epidemiological quantities used to track time-dependent dynamics.
"""

Imglist = [Img]
Irglist = [Irg]
Imblist = [Imb]
Irblist = [Irb]
time_list = [0.]


"""
Start with f = 0, so whole population consists of resident strategy. 
"""
f = 0.0

"""
Defining right-hand sides for the contagion dynamics for various strategy fractions
f, as well as the Cobb-Douglas utility function used for replicator equation.
"""

def Im_righthand(Rm,Rr,f,Im,Ir):
	weight = (Rr * (1-f) * Ir + Rm * f * Im) / (Rr * (1-f) + Rm * f)
	return Rm * weight * (1.0 - Im) - Im
	
def Ir_righthand(Rm,Rr,f,Im,Ir):
	weight = (Rr * (1-f) * Ir + Rm * f * Im) / (Rr * (1-f) + Rm * f)
	return Rr * weight * (1.0 - Ir) - Ir
	
def utility(alpha,Ig,Ib):
	return (Ig ** alpha) * ((1.0 - Ib)**(1.0 - alpha))
	
	
	
"""
Calculating example time-dependent trajectories for contagion dynamics. 
"""	
	
for time in range(20000):
	Img = Img + time_step * Im_righthand(Rm,Rr,f,Img,Irg)
	Irg = Irg + time_step * Ir_righthand(Rm,Rr,f,Img,Irg)
	
	Imb = Imb + time_step * Im_righthand(c*Rm,c*Rr,f,Imb,Irb)
	Irb = Irb + time_step * Ir_righthand(c*Rm,c*Rr,f,Imb,Irb)
	

	
	
	Imglist.append(Img)
	Irglist.append(Irg)
	
	Imblist.append(Imb)
	Irblist.append(Irb)
	
	time_list.append(time_step*time)
	
Imgendlist = [Img]
Irgendlist = [Irg]
Imbendlist = [Imb]
Irbendlist = [Irb]	


	
plt.figure(1)

"""
Plot of example trajectories for contagion dynamics. 
"""

plt.plot(time_list,Imglist,'b', lw = 3.)	
plt.plot(time_list,Irglist,'g', lw = 3.)	

plt.plot(time_list,Imblist,'b', lw = 3.,ls = '--')	
plt.plot(time_list,Irblist,'g', lw = 3., ls = '--')	

#print time_list
#print Imlist


"""
Now we calculate the long-time equilibrium achieved by contagion dynamics for our range
of possible fraction of mutant strategies $f$ contained in f_range.
"""

"""
List of equilibrium fractions of infectious individuals for each contagion for both
the resident and mutant strategy. List initialized with values corresponding 
"""

Imglist = [Img]
Irglist = [Irg]
Imblist = [Imb]
Irblist = [Irb]
time_list = [0.]


"""
Calculate contagion dynamics for 8000 time steps with step of 0.1, for each fraction of
mutant strategies. Initial condition for given f chosen as long-time state achieved for
previous mutant fraction $f$. This long-time state (either a disease-free or endemic 
equilibrium depending on basic reproduction number calculated in Section A.2) is unique
by the result of Hethcote and Yorke. 
"""
for f in f_range:
	for time in range(time_length):
		Img = Img + time_step * Im_righthand(Rm,Rr,f,Img,Irg)
		Irg = Irg + time_step * Ir_righthand(Rm,Rr,f,Img,Irg)
		
		Imb = Imb + time_step * Im_righthand(c*Rm,c*Rr,f,Imb,Irb)
		Irb = Irb + time_step * Ir_righthand(c*Rm,c*Rr,f,Imb,Irb)
	
		Imglist.append(Img)
		Irglist.append(Irg)
		Imblist.append(Imb)
		Irblist.append(Irb)
		
	Imgendlist.append(Img)
	Irgendlist.append(Irg)
	Imbendlist.append(Imb)
	Irbendlist.append(Irb)
	

"""
Figure illustrating long-time equilibrium level of infection for good and bad contagion
in the resident and mutant populations, plotted as a function of the mutant fraction $f$.
"""

plt.figure(2)
f_axis = f_range = np.arange(0.,1.0 + f_step,f_step)

plt.plot(f_axis,Imgendlist,'g',lw = 5., label = r"$\hat{I}_m^g$")
plt.plot(f_axis,Irgendlist,'b',lw = 5., label = r"$\hat{I}_r^g$")
plt.plot(f_axis,Imbendlist,'g',lw = 5.,ls = '--', label = r"$\hat{I}_m^b$")
plt.plot(f_axis,Irbendlist,'b',lw = 5.,ls = '--', label = r"$\hat{I}_r^b$")


plt.legend(loc = "lower right", ncol = 2, fontsize = 24., frameon = False)
plt.xlabel(r"Mutant Fraction ($f$)", fontsize = 22., labelpad = 10.)
plt.ylabel(r"Infected Fraction at Steady State", fontsize = 22.)

plt.axis([0.0,1.0,0.0,1.0])

paper_path = os.getcwd()
if Rr == 7 and Rm == 3:
	plt.savefig(paper_path + '/endemiccoexist.png')
elif Rr == 4 and Rm == 5 and time_length == 8000:
	plt.savefig(paper_path + '/endemiccless1.png')
elif Rr == 4 and Rm == 3 and time_length == 8000:
	plt.savefig(paper_path + '/endemicgreater1.png')

Umlist = []
Urlist = []


"""
Plot of Cobb-Douglas utility for resident and mutant population given equilibrium disease
state displayed in previous figure, plotted as a function of mutant fraction $f$. These
utilities determine whether mutant or resident fraction will increase under the
replicator equation for evolutionary competition between the two strategies.
"""
plt.figure(3)


"""
Calculating levels of utility as a function of previously calculated equilibrium 
contagion levels (as a function of mutant fraction $f$).
"""
for f in range(len(Imgendlist)):
	Umlist.append(utility(alpha,Imgendlist[f],Imbendlist[f]))
	Urlist.append(utility(alpha,Irgendlist[f],Irbendlist[f]))
	
plt.plot(f_axis,Umlist,'g', lw = 5., label = r"$U_m(\hat{I}_m^g,\hat{S}_m^b)$")
plt.plot(f_axis,Urlist,'b', lw = 5., label = r"$U_r(\hat{I}_r^g,\hat{S}_r^b)$")


"""
Calculate utility of resident type at all-resident equilibrium and utility of mutant type
at all-mutant equilibrium, which allows us to confirm presence of social dilemma.
"""
print Umlist[-1]
print Urlist[0]

plt.xlabel(r"Mutant Fraction ($f$)", fontsize = 22.)
plt.ylabel(r"Utility", fontsize = 22.)

plt.legend(loc = "lower left", fontsize = 24., frameon = False)

#plt.axis([0.0,1.0,.4,.407])
#plt.axis([0.0,1.0,0.19,0.25])
	

paper_path = os.getcwd()
if Rr == 7 and Rm == 3:
	plt.savefig(paper_path + '/replicatorcoexist.png')
elif Rr == 4 and Rm == 5 and time_length == 8000:
	plt.savefig(paper_path + '/replicatorcless1.png')
elif Rr == 4 and Rm == 3 and time_length == 8000:
	plt.savefig(paper_path + '/replicatorgreater1.png')
	


"""
Figure that displays the average Cobb-Douglas utility across the population as a function
of the fraction $f$ following the mutant strategy. 
"""
plt.figure(4)

group_utility_list = []
for f in range(len(Imgendlist)):
	f_frac = f / np.float(len(Imgendlist) + 1)
	util = f_frac * Umlist[f] + (1.0 - f_frac) * Urlist[f]
	group_utility_list.append(util)
	
plt.plot(f_axis,group_utility_list, lw = 3.)
plt.show()
	