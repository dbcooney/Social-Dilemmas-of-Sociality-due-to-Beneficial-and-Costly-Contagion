"""
Script used to generate Figure 8 illustrating the regions in parameter space
(in terms of $c$ and $\alpha$) in which the evolutionarily-stable and socially-optimal 
sociality strategies take on various qualitative behaviors for the case of linear 
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
c_max = 2.
c_range = np.arange(c_step,1.0+c_step,alpha_step)
c_range_inequality = np.arange(c_step,0.5,alpha_step)
c_range_above = np.arange(0.5,1.0 + c_step, c_step)
c_range_below = np.arange(c_step,0.5, c_step)
print np.size(c_range)


"""
Characterizing threshold values of $c$ (as a function of $\alpha$ for which different 
qualitative behaviors are achieved for $R_{ESS}$ and $R_{opt}$.
"""

def c_thresh(alpha):
	if alpha >= 0.0:
		return (1. - alpha) / alpha
		
def c_one(alpha):
	return 1.
	
def c_thresh_min(alpha):
	return min(c_thresh(alpha),c_one(alpha))
	
def c_thresh_max(alpha):
	return max(c_thresh(alpha),c_one(alpha))
		

		
c_thresh_vec = np.vectorize(c_thresh)
c_one_vec = np.vectorize(c_one)
c_thresh_min_vec = np.vectorize(c_thresh_min)
c_max_vec = np.vectorize(c_thresh_max)



plt.plot(c_range,c_thresh_vec(c_range), lw = 5., ls = '--', color = 'k')
plt.plot(c_range,c_one_vec(c_range), lw = 5., ls = '--', color = 'k')


"""
Plotting the regions for different cases of $R_{ESS}$ and $R_{opt}$. 
"""


plt.fill_between(c_range,[0.0] * np.size(c_range),c_thresh_min_vec(c_range), color = plt.cm.YlOrRd(0.1), alpha = 0.6)
plt.fill_between(c_range_above,c_thresh_vec(c_range_above),c_one_vec(c_range_above), color = plt.cm.YlOrRd(0.35), alpha = 0.6)
plt.fill_between(c_range_below,c_one_vec(c_range_below), c_thresh_vec(c_range_below), color = plt.cm.YlOrRd(0.6), alpha = 0.6)
plt.fill_between(c_range,c_max_vec(c_range),[100.0] * np.size(c_range), color = plt.cm.YlOrRd(0.85), alpha = 0.6)


plt.annotate(r"$\mathcal{R}_{\mathrm{ESS}} > 1$", xy = (0.13,0.7), fontsize = 24.)
plt.annotate(r"$\mathcal{R}_{\mathrm{opt}} = 1$", xy = (0.14,0.5), fontsize = 24.)

plt.annotate(r"$\mathcal{R}_{\mathrm{ESS}} = 1$", xy = (0.13,1.5), fontsize = 24.)
plt.annotate(r"$\mathcal{R}_{\mathrm{opt}} = 1$", xy = (0.14,1.3), fontsize = 24.)

plt.annotate(r"$\mathcal{R}_{\mathrm{ESS}} \in \{1,\infty\}$", xy = (0.55,1.5), fontsize = 24.)
plt.annotate(r"$\mathcal{R}_{\mathrm{opt}} = \infty$", xy = (0.56,1.3), fontsize = 24.)

plt.annotate(r"$\mathcal{R}_{\mathrm{ESS}} = \infty$", xy = (0.75,0.7), fontsize = 24.)
plt.annotate(r"$\mathcal{R}_{\mathrm{opt}} = \infty$", xy = (0.76,0.5), fontsize = 24.)
  


		





plt.axis([0.,alpha_max,0.,c_max])


plt.xlabel(r"Relative Weight ($\alpha$)", fontsize = 24., labelpad = 10.)
plt.ylabel(r"Relative Infectiousness ($c$)", fontsize = 24.)

plt.tight_layout()


script_folder = os.getcwd()
plt.savefig(script_folder + '/ESSvsSOregimes_linear.png')

plt.show()
	