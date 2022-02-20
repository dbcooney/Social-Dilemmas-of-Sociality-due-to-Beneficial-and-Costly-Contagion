"""
Code used to generate Figure 1, which illustrates the Cobb-Douglas utility function, the
endemic equilibriua for the good and bad contagion, and the population utility ahieved at 
equilibrium and the result socially-optimal sociality strategy. 
"""


import matplotlib.pyplot as plt
import numpy as np
import matplotlib.font_manager

#from matplotlib import rc
#rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
## for Palatino and other serif fonts use:
#rc('font',**{'family':'serif','serif':['Palatino']})
#rc('text', usetex=True)

plt.rcParams['text.usetex'] = True 
plt.rcParams['text.latex.preamble'] = [r'\usepackage[cm]{sfmath}']
plt.rcParams['font.family'] = 'sans-serif'
plt.rcParams['font.sans-serif'] = 'cm'

alpha1 = 0.25 
alpha2 = 0.5 
alpha3 = 0.75 

c1 = 0.5
c2 = 1.
c3 = 2.

"""
Defining expressions for the Cobb-Douglas utility, as well as the equilibrium fraction
of individuals infected by the good contagion and susceptible to the bad contagions. 
"""

def Utility(Ig,Sb,alpha):
	return (Ig ** alpha) * (Sb ** (1.0 - alpha))
	
def Equilibrium_Ig(Rr):
	return 1. - (1. / Rr)
	
def Equilibrium_Sb(Rr,c):
	return min(1.,1. / (c * Rr))
	
def Utility_eq(Rr,c,alpha):
	return Utility(Equilibrium_Ig(Rr),Equilibrium_Sb(Rr,c),alpha)
	
Equilibrium_Sb_vec = np.vectorize(Equilibrium_Sb)
Utility_eq_vec = np.vectorize(Utility_eq)

value_step  = 0.01
value_array = np.arange(0.0,1.0 + value_step,value_step)
value_list = [value for value in value_array]
value_length = len(value_list)


R_range = np.arange(1.,5.,value_step)


"""
Calculating Cobb-Douglas utility for range of levels of the good and bad contagion.
"""

utility_matrix1 = np.zeros([value_length,value_length])
utility_matrix2 = np.zeros([value_length,value_length])
utility_matrix3 = np.zeros([value_length,value_length])

for Sb in value_list:
	for Ig in value_list:
		utility_matrix1[value_list.index(Sb),value_list.index(Ig)] = Utility(Ig,Sb,alpha1)
		utility_matrix2[value_list.index(Sb),value_list.index(Ig)] = Utility(Ig,Sb,alpha2)
		utility_matrix3[value_list.index(Sb),value_list.index(Ig)] = Utility(Ig,Sb,alpha3)


"""
Generating heatmap of Cobb-Douglas utility as a function of Ig and Sb.
"""

d = np.linspace(0.,1.,200)
Ig,Sb = np.meshgrid(d,d)
z1 = Utility(Ig,Sb,alpha1)
z2 = Utility(Ig,Sb,alpha2)
z3 = Utility(Ig,Sb,alpha3)

cmap2 = matplotlib.colors.ListedColormap(["k","k"])

fig,axs = plt.subplots(3,3, sharey = 'row', figsize = (12,12))

#im1 = axs[0,0].imshow(np.flipud(utility_matrix1), "viridis")
im1 = axs[0,0].contourf(Ig,Sb,z1,levels = 100, cmap = "viridis")
im1a = axs[0,0].contour(Ig,Sb,z1,[0.2,0.5,0.8],cmap = cmap2, linewidths = 3., linestyles = 'dashed')
manual_locations = [(0.8,0.2), (0.825,0.5), (0.85,0.8)]
axs[0,0].clabel(im1a,inline=1, fontsize=16,manual = manual_locations, fmt='%1.1f')
print(z1)
#im4 = axs[1, 1].imshow(Z, interpolation='nearest')
fig.colorbar(im1, ax=axs[0, 0],fraction=0.056, pad=0.04)

#ax.colorbar(ax,fraction=0.04, pad=0.04)

state_labels = [0.0,0.2,0.4,0.6,0.8,1.0]
r_state_labels = [1.0,0.8,0.6,0.4,0.2,0.0]

axs[0,0].set_xlabel(r"Probability Informed $\overline{I}^g$", fontsize = 16.)
axs[0,0].set_ylabel(r"Probability Healthy $\overline{S}^b$", fontsize = 16.)





#im2 = axs[0,1].imshow(np.flipud(utility_matrix2), "viridis")
im2 = axs[0,1].contourf(Ig,Sb,z2,levels = 100, cmap = "viridis")
#im4 = axs[1, 1].imshow(Z, interpolation='nearest')
im2a = axs[0,1].contour(Ig,Sb,z2,[0.2,0.5,0.8],cmap = cmap2, linewidths = 3., linestyles = 'dashed')
manual_locations = [(0.175,0.2), (0.5,0.5), (0.75,0.75)]
axs[0,1].clabel(im2a,inline=1, fontsize=16, manual = manual_locations, fmt='%1.1f')
fig.colorbar(im2, ax=axs[0, 1],fraction=0.056, pad=0.04)



axs[0,1].set_xlabel(r"Probability Informed $\overline{I}^g$", fontsize = 16.)#

im3 = axs[0,2].contourf(Ig,Sb,z3,levels = 100, cmap = "viridis")
im3a = axs[0,2].contour(Ig,Sb,z3,[0.2,0.5,0.8],cmap = cmap2, linewidths = 3., linestyles = 'dashed')
manual_locations = [(0.15,0.4), (0.5,0.5), (0.9,0.6)]
axs[0,2].clabel(im3a,inline=1, fontsize=16,manual = manual_locations, fmt='%1.1f')

fig.colorbar(im3, ax=axs[0, 2],fraction=0.056, pad=0.04)



"""
Plotting the endemic equilibria for the good and bad contagion for several cases of the 
relative infectiousness of the good and bad contagion (as characterized by the parameter
$c$).
"""

axs[0,2].set_xlabel(r"Probability Informed $\overline{I}^g$", fontsize = 16.)#

axs[1,0].plot(R_range,Equilibrium_Ig(R_range), lw = 3., color = 'b', label = r"$\overline{I}^g$")
axs[1,0].plot(R_range,Equilibrium_Sb_vec(R_range,c1), lw = 3., color = 'g', label = r"$\overline{S}^b$")

axs[1,1].plot(R_range,Equilibrium_Ig(R_range), lw = 3., color = 'b')
axs[1,1].plot(R_range,Equilibrium_Sb_vec(R_range,c2), lw = 3., color = 'g')

axs[1,2].plot(R_range,Equilibrium_Ig(R_range), lw = 3., color = 'b')
axs[1,2].plot(R_range,Equilibrium_Sb_vec(R_range,c3), lw = 3., color = 'g')

axs[1,0].legend(loc = "lower center")

axs[1,0].set_ylabel(r"Equilibrium States $\overline{I}^g$, $\overline{S}^b$", fontsize = 16.)


"""
Plots of the Cobb-Douglas utility achieved at the endemic equilibrium for a several
cases of the relative infectiousness parameter $c$ and relative weight $\alpha$ placed
on the good and bad contagion in the Cobb-Douglas formula. 
"""

axs[2,0].plot(R_range,Utility_eq_vec(R_range,c1,alpha1), lw = 3., color = 'b')
axs[2,1].plot(R_range,Utility_eq_vec(R_range,c2,alpha2), lw = 3., color = 'b')
axs[2,2].plot(R_range,Utility_eq_vec(R_range,c3,alpha3), lw = 3., color = 'b')

axs[2,0].set_ylabel(r"Utility $U(\overline{I}^g,\overline{S}^b)$", fontsize = 16.)
axs[2,1].set_xlabel(r"Good Contagion Reproduction Number $\mathcal{R}^g$", fontsize = 16.)

axs[2,0].axis([1,5,0.,1.])
axs[2,1].axis([1,5,0.,1.])
axs[2,2].axis([1,5,0.,1.])


axs[0,0].set_title(r"$\alpha = 0.25$, $c = 0.5$", fontsize =16.)
axs[0,1].set_title(r"$\alpha = 0.5$, $c = 1$", fontsize =16.)
axs[0,2].set_title(r"$\alpha = 0.75$, $c = 2$", fontsize =16.)

panel_label_x = 1.
panel_label_y = 1.075
axs[0,0].text(panel_label_x, panel_label_y, 'a', transform=axs[0,0].transAxes,
      fontsize=16, fontweight='bold', va='top', ha='right')
axs[0,1].text(panel_label_x, panel_label_y, 'b', transform=axs[0,1].transAxes,
      fontsize=16, fontweight='bold', va='top', ha='right')
axs[0,2].text(panel_label_x, panel_label_y, 'c', transform=axs[0,2].transAxes,
      fontsize=16, fontweight='bold', va='top', ha='right')
axs[1,0].text(panel_label_x, panel_label_y, 'd', transform=axs[1,0].transAxes,
      fontsize=16, fontweight='bold', va='top', ha='right')
axs[1,1].text(panel_label_x,  panel_label_y, 'e', transform=axs[1,1].transAxes,
      fontsize=16, fontweight='bold', va='top', ha='right')
axs[1,2].text(panel_label_x,  panel_label_y, 'f', transform=axs[1,2].transAxes,
      fontsize=16, fontweight='bold', va='top', ha='right')
axs[2,0].text(panel_label_x,  panel_label_y, 'g', transform=axs[2,0].transAxes,
      fontsize=16, fontweight='bold', va='top', ha='right')
axs[2,1].text(panel_label_x,  panel_label_y, 'h', transform=axs[2,1].transAxes,
      fontsize=16, fontweight='bold', va='top', ha='right')
axs[2,2].text(panel_label_x,  panel_label_y, 'i', transform=axs[2,2].transAxes,
      fontsize=16, fontweight='bold', va='top', ha='right')

plt.tight_layout()
plt.savefig("socialoptimumfigure.png")

plt.figure(2)

plt.contourf(Ig,Sb,z1,levels = 100, cmap = "viridis")
plt.contour(Ig,Sb,z1,[0.8],cmap = cmap2)


plt.show()
