"""
Script used to generate Figure 4, illustrating the pairs of sociality strategies for the
resident and mutant type that produce a stable endemic equilibrium for the two-type
contagion dynamics (for various fractions of the resident and mutant type in the
population).
"""

import matplotlib.pyplot as plt
import numpy as np
import matplotlib.font_manager



plt.rcParams['text.usetex'] = True 
plt.rcParams['text.latex.preamble'] = [r'\usepackage[cm]{sfmath}']
plt.rcParams['font.family'] = 'sans-serif'
plt.rcParams['font.sans-serif'] = 'cm'



"""
Using our formula for the basic reproduction number of the two-type contagion dynamics
to determine the stability boundary for the disease-free and endemic equilibria (where
$R_{net} = 1$).
"""

def Locus(Rm,Rr,f):
	first_term = 4. * f * ((Rm - 0.5) ** 2)
	second_term = 4. * (1. - f) * (((Rr - 0.5) ** 2))
	return first_term + second_term
	


d = np.linspace(0,2,2000)
Rm,Rr = np.meshgrid(d,d)
z = (Locus(Rm,Rr,0.4) >= 1).astype(int)


cmap = matplotlib.colors.ListedColormap(["b","b"])
cmap2 = matplotlib.colors.ListedColormap(["k","k"])


"""
Illustrating the stability regions for five sample fractions $f$ of the mutant strategy.
"""

fig, ax = plt.subplots(1,5, figsize = (10,3), sharey = True)

z = (Locus(Rm,Rr,0.0) >= 1).astype(int)
ax[0].contourf(Rr,Rm,z, [0.99999, 1.00001], cmap=cmap, alpha = 0.6)
#ax[0].contour(Rr,Rm,z, [0.99999,1.00001], cmap = cmap2, linewidths = 3., linestyles = 'dashed')
ax[0].axvline(x = 1., lw = 3., ls = '--', color = 'k')

ax[0].set_ylabel(r"$\mathcal{R}_m$", fontsize = 16.)
ax[0].set_xticks([0.0,0.5,1.0,1.5,2.0])
ax[0].grid(alpha = 0.6, ls = '-', lw = 1.)
ax[0].set_title(r"$f = 0$")


z = (Locus(Rm,Rr,0.25) >= 1).astype(int)
ax[1].contourf(Rr,Rm,z, [0.99999, 1.00001], cmap=cmap, alpha = 0.6)
ax[1].contour(Rr,Rm,z, [0.99999,1.00001], cmap = cmap2, linewidths = 3., linestyles = 'dashed')
ax[1].set_xticks([0.0,0.5,1.0,1.5,2.0])
ax[1].grid(alpha = 0.6, ls = '-', lw = 1.)
ax[1].set_title(r"$f = 0.25$")

z = (Locus(Rm,Rr,0.5) >= 1).astype(int)
ax[2].contourf(Rr,Rm,z, [0.99999, 1.00001], cmap=cmap, alpha = 0.6)
ax[2].contour(Rr,Rm,z, [0.99999,1.00001], cmap = cmap2, linewidths = 3., linestyles = 'dashed')
ax[2].set_xlabel(r"$\mathcal{R}_r$", fontsize = 16.)
ax[2].set_xticks([0.0,0.5,1.0,1.5,2.0])
ax[2].grid(alpha = 0.6, ls = '-', lw = 1.)
ax[2].set_title(r"$f = 0.5$")

z = (Locus(Rm,Rr,0.75) >= 1).astype(int)
ax[3].contourf(Rr,Rm,z, [0.99999, 1.00001], cmap=cmap, alpha = 0.6)
ax[3].contour(Rr,Rm,z, [0.99999,1.00001], cmap = cmap2, linewidths = 3., linestyles = 'dashed')
ax[3].set_xticks([0.0,0.5,1.0,1.5,2.0])
ax[3].grid(alpha = 0.6, ls = '-', lw = 1.)
ax[3].set_title(r"$f = 0.75$")

z = (Locus(Rm,Rr,1.) >= 1).astype(int)
ax[4].contourf(Rr,Rm,z, [0.99999, 1.00001], cmap=cmap, alpha = 0.6)
#ax[4].contour(Rr,Rm,z, [0.99999,1.00001], cmap = cmap2, linewidths = 3., linestyles = 'dashed')
ax[4].axhline(y = 1., lw = 3., ls = '--', color = 'k')
ax[4].grid(alpha = 0.6, ls = '-', lw = 1.)
ax[4].set_xticks([0.0,0.5,1.0,1.5,2.0])
ax[4].set_title(r"$f = 1$")
plt.tight_layout()

plt.savefig("stabilityregionfigure.png")
plt.show()