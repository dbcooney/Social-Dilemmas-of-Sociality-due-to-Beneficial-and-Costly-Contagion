"""
Script used to generate panel b of Figure 3, illustrating the regions in parameter space
(in terms of $c$ and $\alpha$) in which the evolutionarily-stable and socially-optimal 
sociality strategies take on various qualitative behaviors for the case of Cobb-Douglas 
utility. 
"""

import numpy as np
import matplotlib.pyplot as plt
import scipy.integrate as spi
import os

from matplotlib import rc
rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
## for Palatino and other serif fonts use:
#rc('font',**{'family':'serif','serif':['Palatino']})
rc('text', usetex=True)

alpha_max = 1.
alpha_step = 0.001
c_step = 0.002
c_max = 4.5
c_range = np.arange(0.0,1.0+c_step,alpha_step)
c_range_inequality = np.arange(0.0,0.5,alpha_step)
c_range_feasible = np.arange(0.5,1.0 + c_step, c_step)
print np.size(c_range)


"""
Defining threshold values above which the evolutionarily-stable sociality strategy 
has good contagion reproductive number greater than 1 and above which the socially-optimal
sociality strategy with good-contagion reproduction number greater than $\frac{1}{c}$
(and therefore features positive levels of the bad contagion in the socially-optimal
case).
""" 

def c_thresh(alpha):
	if alpha >= 0.5:
		return 100.
	else:
		denom = (1. - 2.0 * alpha)
		num = 1. - alpha
		return num / denom
		
def c_opt_thresh(alpha):
	return 1.0 - alpha
		
c_thresh_vec = np.vectorize(c_thresh)
c_opt_thresh_vec = np.vectorize(c_opt_thresh)

"""
Plotting the regions for different cases of $R_{ESS}$ and $R_{opt}$. 
"""

plt.plot(c_range_inequality,c_thresh_vec(c_range_inequality), lw = 5., ls = '--', color = 'k')
plt.plot(c_range,c_opt_thresh_vec(c_range), lw = 5., ls = '--', color = 'k')


plt.axhline(y = 1., ls = '--', color = 'k', lw = 5.)

plt.fill_between(c_range,[0.0] * np.size(c_range),[1.0] * np.size(c_range), color = plt.cm.YlOrRd(0.1), alpha = 0.6)
plt.fill_between(c_range,c_opt_thresh_vec(c_range),[1.0] * np.size(c_range), color = plt.cm.YlOrRd(0.35), alpha = 0.6)
plt.fill_between(c_range,[1.0] * np.size(c_range),c_thresh_vec(c_range), color = plt.cm.YlOrRd(0.6), alpha = 0.6)
plt.fill_between(c_range_inequality,c_thresh_vec(c_range_inequality),[10.0] * np.size(c_range_inequality), color = plt.cm.YlOrRd(0.85), alpha = 0.6)


plt.annotate(r"$\mathcal{R}_{\mathrm{ESS}} > \mathcal{R}_{\mathrm{opt}} = \frac{1}{c}$", xy = (0.01,0.2), fontsize = 24.)
plt.annotate(r"$\mathcal{R}_{\mathrm{ESS}} > \mathcal{R}_{\mathrm{opt}} > \frac{1}{c}$", xy = (0.6,0.5), fontsize = 24.)
plt.annotate(r"$ \mathcal{R}_{\mathrm{opt}} > \mathcal{R}_{\mathrm{ESS}}  > 1$", xy = (0.6,2.5), fontsize = 24.)
plt.annotate(r"$ \mathcal{R}_{\mathrm{opt}} > \mathcal{R}_{\mathrm{ESS}}  = 1$", xy = (0.01,2.5), fontsize = 24.)


		


plt.axis([0.,alpha_max,0.,c_max])


plt.xlabel(r"Relative Weight ($\alpha$)", fontsize = 28., labelpad = 10.)
plt.ylabel(r"Relative Infectiousness ($c$)", fontsize = 28.)

plt.xticks(fontsize = 14.)
plt.yticks(fontsize = 14.)

plt.tight_layout()


script_folder = os.getcwd()
plt.savefig(script_folder + '/ESSvsSOregimes.png')

plt.show()
	