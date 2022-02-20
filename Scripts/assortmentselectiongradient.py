import matplotlib.pyplot as plt
import numpy as np

from matplotlib import rc
rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
## for Palatino and other serif fonts use:
#rc('font',**{'family':'serif','serif':['Palatino']})
rc('text', usetex=True)

r_step = 0.01
r_range = np.arange(0.0,1.0 + r_step,r_step)

m_step = 0.05
m_max = 3.0
m_range = np.arange(1.0,m_max + m_step,m_step)

def boundaryM(alpha,c,r):
	b = alpha * c * r - alpha * c + alpha - c * r - 1.0
	denom = 2.0 * c * (1.0 - alpha)
	num = -b + np.sqrt(b ** 2 - 4.0 * r * c * (1.0 - alpha))
	return num / denom

def boundaryr(alpha,c,M):
	num = M * (1.0 - alpha + alpha * c) + M * M * (alpha * c - c)
	denom = 1.0 - c * M + alpha * c * M
	return num/denom + (1.0 - alpha + alpha * c) / (c * (1.0 - alpha))
	
def RESS(alpha,c):
	return 1. / c + alpha / (1.0 - alpha)
	
def Ropt(alpha,c):
	return 1. / (1.0 - alpha)
	
def interp(alpha,c,r):
	return (1.0 - r) * RESS(alpha,c) + r * Ropt(alpha,c)
	
boundary_curve = boundaryM(0.75,0.5,r_range)
interp_curve = interp(0.75,0.5,r_range)


plt.figure(1)
plt.plot(boundary_curve,r_range, lw = 3., color = "k", label = r"$\mathcal{R}_{\mathrm{ESS}}(\rho)$")
plt.plot(interp_curve,r_range,lw = 3., color = 'k', ls  = '--', label = r"$(1-\rho)\mathcal{R}_{\mathrm{ESS}}(0) + \rho \mathcal{R}_{\mathrm{opt}}$")
plt.axis([3.0,6.5,0.,1.])

plt.fill_betweenx(r_range,0,boundary_curve, alpha = 0.7, color = 'r')
plt.fill_betweenx(r_range,boundary_curve,100, alpha = 0.7, color = 'b')

plt.xlabel(r"Sociality Level ($\mathcal{R}_{r}$)", fontsize = 25., labelpad = 10.)
plt.ylabel(r"Assortment Probability ($\rho$)", fontsize = 25.)

plt.legend(loc = "upper right", prop = {"size" : 20.})

plt.annotate(r"$\mathcal{R}_r$ Increasing",xy = (3.35,0.2), fontsize = 25.)
plt.annotate(r"$\mathcal{R}_r$ Decreasing",xy = (5.15,0.2), fontsize = 25.)

plt.tight_layout()

paper_path = "/Users/danielcooney/Desktop/Moran Process/Multilevel/CoCCoN"
plt.savefig(paper_path + '/assortmentESScless1.png')

plt.figure(2)

boundary_curve2 = boundaryM(0.5,2.,r_range)
interp_curve2 = interp(0.5,2.,r_range)
plt.plot(boundary_curve2,r_range, lw = 3., color = "k", label = r"$\mathcal{R}_{\mathrm{ESS}}(\rho)$")
plt.plot(interp_curve2,r_range,lw = 3., color = 'k', ls  = '--', label = r"$(1-\rho)\mathcal{R}_{\mathrm{ESS}}(0) + \rho \mathcal{R}_{\mathrm{opt}}$")
plt.axis([1.2,2.4,0.,1.])

plt.fill_betweenx(r_range,0,boundary_curve2, alpha = 0.7, color = 'r')
plt.fill_betweenx(r_range,boundary_curve2,100, alpha = 0.7, color = 'b')

plt.xlabel(r"Sociality Level ($\mathcal{R}_{r}$)", fontsize = 25., labelpad = 10.)
plt.ylabel(r"Assortment Probability ($\rho$)", fontsize = 25.)

plt.annotate(r"$\mathcal{R}_r$ Increasing",xy = (1.35,0.6), fontsize = 25.)
plt.annotate(r"$\mathcal{R}_r$ Decreasing",xy = (1.95,0.6), fontsize = 25.)

plt.legend(loc = "lower right", prop = {"size" :20.})

plt.tight_layout()
plt.savefig(paper_path + '/assortmentESScgreater1.png')


plt.show()
	
