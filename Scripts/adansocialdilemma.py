"""
Script used to generate panel c of Figure 3, Figure 6, and Figure 7, illustrating the
sociality strategies and utilities achieved by the socially-optimal and the
evolutionarily-stable outcomes.
"""


import matplotlib.pyplot as plt
import numpy as np



from matplotlib import rc
rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
## for Palatino and other serif fonts use:
#rc('font',**{'family':'serif','serif':['Palatino']})
rc('text', usetex=True)

"""
Defining the ESS and socially-optimal sociality strategies for Cobb-Douglas utility,
as well as the levels of the good and bad contagion achieved in a monomorphic
population. 
"""

def social_optimum(c,alpha):
	if c < 1.0 - alpha:
		return 1.0 / c
	else:
		return 1.0 / (1.0 - alpha)
		
def ESS(c,alpha):
	formula = 1.0 / c + alpha / (1.0 - alpha)
	return max(1.0,formula)
	
def Igoodmono(R_mono):
	return max(1.0 - 1.0 / R_mono,0.0)
	
def Sbadmono(c,R_mono):
	return min(1.0 / (c * R_mono),1.0)
	
def cobb_douglas_mono(alpha,c,R_mono):
	return (Igoodmono(R_mono) ** alpha) * (Sbadmono(c,R_mono) ** (1.0 - alpha))

#social_optimum_vec = np.vectorize(social_optimum)

alpha_max = .875
step = 0.01	
alpha_holder = np.arange(0.0,alpha_max + step, step)

social_one = []
social_two = []
social_half = []

ESS_one = []
ESS_two = []
ESS_half = []

cd_social_one = []
cd_social_two = []
cd_social_half = []

cd_ESS_one = []
cd_ESS_two = []
cd_ESS_half = []

PoA_two = []
PoA_half = []

Two_diff = []
half_diff = []

"""
Calculating sociality strategies $R_{ESS} and $R_{opt}$ and the utilities achieved under
these strategies as a function of the weight $\alpha$ placed on the good contagion under
Cobb-Douglas utility.
"""

for alpha in alpha_holder:
	social_one.append(social_optimum(1.0,alpha))
	social_two.append(social_optimum(2.0,alpha))
	social_half.append(social_optimum(0.5,alpha))

	ESS_one.append(ESS(1.0,alpha))
	ESS_two.append(ESS(2.0,alpha))
	ESS_half.append(ESS(0.5,alpha))
	
	
	cd_social_one.append(cobb_douglas_mono(alpha,1.0,social_optimum(1.0,alpha)))
	cd_social_two.append(cobb_douglas_mono(alpha,2.0,social_optimum(2.0,alpha)))
	cd_social_half.append(cobb_douglas_mono(alpha,0.5,social_optimum(0.5,alpha)))
	
	cd_ESS_one.append(cobb_douglas_mono(alpha,1.0,ESS(1.0,alpha)))
	cd_ESS_two.append(cobb_douglas_mono(alpha,2.0,ESS(2.0,alpha)))
	cd_ESS_half.append(cobb_douglas_mono(alpha,0.5,ESS(0.5,alpha)))
	
	PoA_two.append(cd_ESS_two[-1] / cd_social_two[-1])
	PoA_half.append(cd_ESS_half[-1] / cd_social_half[-1])
	
	Two_diff.append(social_two[-1] - ESS_two[-1])
	half_diff.append(ESS_half[-1] - social_half[-1])


#Dealing with piecewise value when c = 2
social_two.insert(1,1.0)
ESS_two.insert(1,1.0)
alpha_2 = alpha_holder.tolist()
alpha_2.insert(1,0.0)

PoA_two.insert(1,0.0)
cd_ESS_two.insert(1,0.0)

"""
Plotting difference between ESS and socially-optimal sociality strategies when the bad
contagion spreads more readily than the good contagion.
"""
	
plt.figure(1)

#plt.plot(alpha_holder,social_one, lw = 3., ls = '--', color = 'k')
plt.plot(alpha_2,social_two, lw = 6., ls = '--', color = 'b', label = r"$\mathcal{R}_{opt}$, $c = 2$")

#plt.plot(alpha_holder,ESS_one, lw = 3., color = 'k')
plt.plot(alpha_2,ESS_two, lw = 6., color = 'g', label = r"$\mathcal{R}_{ESS}$, $c= 2$")


plt.axis([0.0,alpha_max,0.0,10.0])

plt.axvline(x = 1.0 / 3.0, lw = 6., ls = '-.', label = r"$\alpha = 1 - \frac{c}{2c - 1}$", color = "Gray", alpha = 0.8)

plt.xlabel(r"Relative Weight $(\alpha)$", fontsize = 28., labelpad = 20.)
plt.ylabel(r"Reproduction Number ($\mathcal{R}$)", fontsize = 28.)

plt.xticks(fontsize = 14.)
plt.yticks(fontsize = 14.)



plt.legend(loc = "upper left", prop={'size': 24})
plt.tight_layout(pad=1) 

plt.savefig("socialdilemmaRc2.png")


"""
Plotting difference between ESS and socially-optimal sociality strategies when the  good
contagion spreads more readily than the bad contagion.
"""
plt.figure(2)

plt.axvline(x = 0.5, lw = 6., ls = '-.', label = r"$\alpha = 1 - c$", color = "Gray", alpha = 0.8)

plt.plot(alpha_holder,social_half, lw = 6., ls = '--', color = 'b', label = r"$\mathcal{R}_{opt}$, $c = \frac{1}{2}$")
plt.plot(alpha_holder,ESS_half, lw = 6., color = 'g', label = r"$\mathcal{R}_{ESS}$, $c= \frac{1}{2}$")
#plt.yscale("log")

plt.xlabel(r"Relative Weight $(\alpha)$", fontsize = 28., labelpad = 20.)
plt.ylabel(r"Reproduction Number ($\mathcal{R}$)", fontsize = 28.)

plt.xticks(fontsize = 14.)
plt.yticks(fontsize = 14.)



plt.axis([0.0,alpha_max,0.0,10.])
plt.tight_layout(pad=1) 

plt.legend(loc = "upper left", prop={'size': 24})

plt.savefig("socialdilemmaRchalf.png")


"""
Plotting difference between the utilities achieved under the ESS and socially-optimal
sociality strategies when the bad contagion spreads more readily than the good contagion.
"""

plt.figure(3)

#plt.plot(alpha_holder,social_one, lw = 3., ls = '--', color = 'k')
plt.plot(alpha_holder,cd_social_two, lw = 5., ls = '--', color = 'b', label = r"Social Optimum, $c = 2$")

#plt.plot(alpha_holder,ESS_one, lw = 3., color = 'k')
plt.plot(alpha_2,cd_ESS_two, lw = 5., color = 'g', label = r"ESS, $c= 2$")


plt.axis([0.0,alpha_max,0.0,2.1])


plt.axvline(x = 1.0 / 3.0, lw = 6., ls = '-.', label = r"$\alpha = 1 - \frac{c}{2c - 1}$", color = "Gray", alpha = 0.8)

plt.xlabel(r"Relative Weight $(\alpha)$", fontsize = 28., labelpad = 20.)
plt.ylabel(r"Equilibrium Utility ($U(\hat{I}_g,\hat{S}_b)$)", fontsize = 28.)

plt.xticks(fontsize = 14.)
plt.yticks(fontsize = 14.)


plt.legend(loc = "upper right", prop={'size': 18})
plt.tight_layout(pad=1) 

plt.savefig("socialdilemmaUc2.png")



"""
Plotting difference between the utilities achieved under the ESS and socially-optimal
sociality strategies when the good contagion spreads more readily than the bad contagion.
"""

plt.figure(4)

#plt.plot(alpha_holder,social_one, lw = 3., ls = '--', color = 'k')
plt.plot(alpha_holder,cd_social_half, lw = 6., ls = '--', color = 'b', label = r"Social Optimum, $c = \frac{1}{2}$")

#plt.plot(alpha_holder,ESS_one, lw = 3., color = 'k')
plt.plot(alpha_holder,cd_ESS_half, lw = 6., color = 'g', label = r"ESS, $c= \frac{1}{2}$")


plt.axis([0.0,alpha_max,0.0,2.1])


plt.axvline(x = 1.0 / 3.0, lw = 6., ls = '-.', label = r"$\alpha = 1 - \frac{c}{2c - 1}$", color = "Gray", alpha = 0.8)

plt.xlabel(r"Relative Weight $(\alpha)$", fontsize = 28., labelpad = 20.)
plt.ylabel(r"Equilibrium Utility ($U(\hat{I}^g,\hat{S}^b)$)", fontsize = 28.)

plt.xticks(fontsize = 14.)
plt.yticks(fontsize = 14.)


plt.legend(loc = "upper right", prop={'size': 18})
plt.tight_layout(pad=1) 

plt.savefig("socialdilemmaUchalf.png")

"""
Plotting the Price-of-Anarchy (the ratio of the utility achieved under the ESS and 
socially-optimal sociality strategies) for two cases for the relative spreading ability
$c$ of the good and bad contagion.
"""

plt.figure(5)

plt.plot(alpha_holder,PoA_half, lw = 6., color = 'k', label = r"$\mathrm{PoA}$ , $c = \frac{1}{2}$")
#plt.plot(alpha_holder,social_one, lw = 3., ls = '--', color = 'k')
plt.plot(alpha_2,PoA_two, lw = 6., ls = '--', color = 'r', label = r"$\mathrm{PoA}$, $c = 2$")

#plt.plot(alpha_holder,ESS_one, lw = 3., color = 'k')



plt.axis([0.0,alpha_max,0.0,1.2])

plt.xlabel(r"Relative Weight $(\alpha)$", fontsize = 28., labelpad = 20.)
plt.ylabel(r"Price of Anarchy ($\mathrm{PoA}$)", fontsize = 28.)

plt.xticks(fontsize = 14.)
plt.yticks(fontsize = 14.)

#plt.axvline(x = 1.0 / 3.0, lw = 4., ls = '-.', label = r"$\alpha = 1 - \frac{c}{2c - 1}$", color = "Gray")

plt.legend(loc = "lower right", prop={'size': 24})
plt.tight_layout(pad=1) 

plt.savefig("socialdilemmaPoA.png")

print Two_diff
print ESS_two
print social_two
print half_diff


"""
Comparing the ESS and socially-optimal sociality strategies or two cases for the relative 
spreading ability $c$ of the good and bad contagion
"""

fig, ax = plt.subplots(2,1,sharex = True, sharey = 'row', figsize = (4,6))


ax[0].plot(alpha_2,social_two, lw = 4., ls = '--', color = 'b', label = r"$\mathcal{R}_{opt}$, $c = 2$")

#plt.plot(alpha_holder,ESS_one, lw = 3., color = 'k')
ax[0].plot(alpha_2,ESS_two, lw = 4., color = 'g', label = r"$\mathcal{R}_{ESS}$, $c= 2$")


ax[0].axis([0.0,alpha_max,0.0,10.0])

#ax[0].axvline(x = 1.0 / 3.0, lw = 4., ls = '-.', label = r"$\alpha = 1 - \frac{c}{2c - 1}$", color = "Gray", alpha = 0.8)
ax[0].axvline(x = 1.0 / 3.0, lw = 4., ls = '-.', color = "Gray", alpha = 0.8)



plt.yticks(fontsize = 14.)
plt.xticks(fontsize = 14.)



ax[0].legend(loc = "upper left", prop={'size': 14})


#ax[1].axvline(x = 0.5, lw = 3., ls = '-.', label = r"$\alpha = 1 - c$", color = "Gray", alpha = 0.8)
ax[1].axvline(x = 0.5, lw = 3., ls = '-.', color = "Gray", alpha = 0.8)

ax[1].plot(alpha_holder,social_half, lw = 3., ls = '--', color = 'b', label = r"$\mathcal{R}_{opt}$, $c = \frac{1}{2}$")
ax[1].plot(alpha_holder,ESS_half, lw = 3., color = 'g', label = r"$\mathcal{R}_{ESS}$, $c= \frac{1}{2}$")
#plt.yscale("log")


plt.xticks(fontsize = 14.)
plt.yticks(fontsize = 14.)



ax[1].axis([0.0,alpha_max,0.0,10.])
 

ax[1].legend(loc = "upper left", prop={'size': 14})

# add a big axes, hide frame
fig.add_subplot(111, frameon=False)
# hide tick and tick label of the big axes
plt.tick_params(labelcolor='none', top=False, bottom=False, left=False, right=False)
plt.grid(False)
plt.xlabel(r"Relative Weight $(\alpha)$", fontsize = 20., labelpad = 20.)
plt.ylabel(r"Reproduction Number ($\mathcal{R}$)", fontsize = 20.)
#fig.text(-0.06, 0.5, r"Reproduction Number ($\mathcal{R}$)", ha='center', va='center', rotation='vertical', fontsize = 20.)

plt.tight_layout()
plt.savefig("social_dilemma_stack.png")

plt.show()
