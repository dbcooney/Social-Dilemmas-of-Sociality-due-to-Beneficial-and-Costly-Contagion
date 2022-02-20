"""
Script used to generate panel a of Figure 3, illustrating pairwise invasiblity plots
for the adaptive dynamics under the Cobb-Douglas utility function.
"""

import matplotlib.pyplot as plt
import matplotlib as mpl
mpl.rcParams['text.usetex']=True
import numpy as np
from matplotlib.widgets import Slider
from scipy.optimize import fsolve

from matplotlib import rc
rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
## for Palatino and other serif fonts use:
#rc('font',**{'family':'serif','serif':['Palatino']})
rc('text', usetex=True)

slider_color = '#44782e'
slider_transparency = 0.6

"""
Defining the endemic equilbria achieved for the resident and mutant populations in the
presence of a rare mutant (as a function of the reproduction numbers for the two
types).
"""

def Ig_r(R_res):
    return np.maximum(0, 1 - 1 / R_res)

def Ig_m(R_res, R_mut):
    return np.maximum(
        0, (R_mut * (R_res - 1)) / (R_res + R_mut * (R_res - 1)))

def Sb_r(R_res, c):
    return np.minimum(1, 1 / (c * R_res))

def Sb_m(R_res, R_mut, c):
    return R_res / (R_res + R_mut * (np.maximum(1, c * R_res) - 1))
    
    
"""
Defining the Cobb-Douglas, linear, and Constant Elasticity of Substitution (CES) utility 
functions in terms of the endemic equilibria for the two contagions.
"""

def log_cd_fitness(Ig, Sb, alpha):
    return (alpha * np.log(Ig) +
            (1 - alpha) * np.log(Sb))

def linear_fitness(Ig, Sb, alpha):
    return np.array((alpha * Ig +
                     (1 - alpha) * Sb))


def log_ces_fitness(Ig, Sb, alpha, rho=1):
    return np.array((1 / rho) * np.log(
        alpha * np.power(Ig, rho)
        + (1 - alpha) * np.power(Sb, rho)))

def fitness(Ig, Sb, alpha, fitness_func='cd', **kwargs):
    funcs = {'linear': linear_fitness,
             'cd': log_cd_fitness,
             'ces': log_ces_fitness}

    return funcs[fitness_func](Ig, Sb, alpha, **kwargs)
    
    
"""
Charaterizing the criterion for when a rare mutant can invade a common resident.
"""    

def can_invade(R_res, R_mut, alpha, c,
               fitness_func='cd',
               **kwargs):
    mut_fitness = fitness(
        Ig_m(R_res, R_mut),
        Sb_m(R_res, R_mut, c),
        alpha,
        fitness_func=fitness_func,
        **kwargs)
    
    res_fitness = fitness(
        Ig_r(R_res),
        Sb_r(R_res, c),
        alpha,
        fitness_func=fitness_func,
        **kwargs)

    return mut_fitness > res_fitness


def can_mutually_invade(R_res, R_mut, alpha, c,
                        fitness_func='cd',
                        **kwargs):
    mut_inv_res = can_invade(R_res, R_mut, alpha, c,
                             fitness_func,
                             **kwargs)
    res_inv_mut = can_invade(R_mut, R_res, alpha, c,
                             fitness_func,
                             **kwargs)

    return 1.0 * mut_inv_res + (mut_inv_res * res_inv_mut)


def social_optimum_cd(alpha, c):
    """
    Cobb-Douglas utility social optimum
    """
    if alpha > 1 - c:
        return 1 / (1 - alpha)
    else:
        return 1 / c

def social_optimum_linear(alpha, c):
    """
    Linear utility social optimum
    """
    if alpha > 1 / (1 + c):
        return np.Inf
    else:
        return max(1, 1/c)


def social_optimum_ces(alpha, c, rho=1):
    if np.abs(rho - 1) < 1e-7:
        return social_optimum_linear(alpha, c)
    elif np.abs(rho) < 1e-7:
        return social_optimum_cd(alpha, c)
    else:
        def func(x):
            return (
                (1 - alpha) + (alpha - 1) * x +
                alpha * (c ** rho) * ((x - 1) ** rho))
        return fsolve(func, 2)[0]

def social_optimum(alpha, c, fitness_func='cd', **kwargs):

    funcs = {'linear': social_optimum_linear,
             'cd': social_optimum_cd,
             'ces': social_optimum_ces}

    return funcs[fitness_func](alpha, c, **kwargs)
        
def ess(alpha, c):
    return (((alpha - 1) - c * alpha) /
            (c * (alpha - 1)))

def pip(alpha,
        c,
        R_max,
        R_min=1 + 1e-6,
        axis=None,
        invade_color='red',
        no_invade_color='white',
        mutual_invade_color = 'pink',
        n_points=2000,
        plot_social_opt=True,
        fitness_func='cd',
        mutual=True,
        **kwargs):

    if axis is None:
        fig, axis = plt.subplots()

    if mutual:
        inv_func = can_mutually_invade
        inv_cmap = mpl.colors.ListedColormap([no_invade_color,
                                              invade_color,
                                              mutual_invade_color])
    else:
        inv_func = can_invade
        inv_cmap = mpl.colors.ListedColormap([no_invade_color,
                                              invade_color])
    
    
    edge_points = np.linspace(R_min, R_max, n_points)
    pip_extent = [R_min, R_max, R_min, R_max]
    
    res, mut = np.meshgrid(edge_points,
                           edge_points)
    
    imshow_img = axis.imshow(
        inv_func(res, mut, alpha, c, fitness_func,
                 **kwargs),
        origin='lower',
        cmap=inv_cmap,
        extent=pip_extent)

    if plot_social_opt:
        axis.axvline(
            social_optimum(alpha, c, fitness_func, **kwargs),
            color='k',
            lw=1.5,
            linestyle='dashed')

    return imshow_img


"""
Plotting the pairwise insvasibility plots (PIPs).
"""

def make_some_pips(fitness_func='cd'):

    #fig, axes = plt.subplots(3, 3, sharex = True, sharey = True, figsize = (9,9))
    fig, axes = plt.subplots(2, 3, sharex = True, sharey = True, figsize = (9,6))

    #for row, alpha in enumerate([0.25, 0.5, 0.75]):
    for row, alpha in enumerate([0.25, 0.75]):
        for col, c in enumerate([0.25, 1., 4.]):
            print(row, col)

            pip(alpha,
                c,
                R_max = 10,
                axis=axes[row, col],
                fitness_func=fitness_func)
        
            axes[row, col].set_title("$\\alpha = {}$, $c={}$".format(
                alpha,
                c), fontsize = 14.)
                
            axes[row,col].tick_params(axis='both', which='major', labelsize=14)
            axes[row,col].tick_params(axis='both', which='minor', labelsize=14)
      
    fig.add_subplot(111, frameon = False) 
    plt.tick_params(labelcolor='none', top=False, bottom=False, left=False, right=False)
    plt.grid(False)
    plt.xlabel(r"Resident Reproduction Number ($\mathcal{R}_r$)", fontsize = 20.)
    plt.ylabel(r"Mutant Reproduction Number ($\mathcal{R}_m$)", fontsize = 20.)
    
  

    
   
    plt.tight_layout()


def adjustable_pip(
        alpha_init=0.5,
        c_init=1,
        R_min=1 + 1e-6,
        R_max=5,
        n_points=2000,
        fitness_func='cd',
        mutual=False,
        plot_social_opt=True,
        **kwargs):
    edge_points = np.linspace(R_min, R_max, n_points)
    
    res, mut = np.meshgrid(edge_points,
                           edge_points)

    fig = plt.figure()
    pip_ax = fig.add_subplot(111)
    fig.subplots_adjust(left=0.25, bottom=0.25)

    if plot_social_opt:
        social_opt_line, = pip_ax.plot(
            (np.ones(edge_points.size) *
             social_optimum(alpha_init,
                            c_init,
                            fitness_func=fitness_func,
                            **kwargs)),
            edge_points,
            color='k',
            lw=1.5,
            linestyle='dashed')

    imshow_img = pip(
        alpha_init,
        c_init,
        R_max,
        R_min=R_min,
        n_points=n_points,
        axis=pip_ax,
        plot_social_opt=False,
        fitness_func=fitness_func,
        mutual=mutual,
        **kwargs)
    
    ax_alpha_slider = fig.add_axes(
        [0.25, 0.1, 0.65, 0.03],
        facecolor='white',
        alpha=slider_transparency)
    
    ax_c_slider = fig.add_axes(
        [0.25, 0.05, 0.65, 0.03],
        facecolor='white',
        alpha=slider_transparency)

    alpha_slider = Slider(ax_alpha_slider,
                          'alpha',
                          0,
                          1,
                          valinit=alpha_init,
                          color=slider_color,
                          edgecolor='k')

    c_slider = Slider(
        ax_c_slider,
        'c',
        0,
        4,
        valinit=c_init,
        color=slider_color)
    c_slider.vline.set_color('k')
    alpha_slider.vline.set_color('k')

    if mutual:
        inv_func = can_mutually_invade
    else:
        inv_func = can_invade
        
    def update(val):
        new_alpha = alpha_slider.val
        new_c = c_slider.val

        new_plot = inv_func(res, mut, new_alpha, new_c,
                            fitness_func=fitness_func,
                            **kwargs)
        imshow_img.set_data(new_plot)

        if plot_social_opt:
            social_opt_line.set_data(
                social_optimum(new_alpha,
                               new_c,
                               fitness_func,
                               **kwargs) * np.ones(edge_points.size),
                edge_points)
        
        fig.canvas.draw_idle()

    alpha_slider.on_changed(update)
    c_slider.on_changed(update)

    plt.show()

	#for alpha, color in zip([0.1, 0.2, 0.9, 0.95],['red', 'green', 'blue', 'black']):
	##
	#	xs= np.linspace(1.001, 15, 1000)
	#	plt.plot(xs, log_res_fitness(xs, alpha, c), color=color)
	#	plt.plot(social_optimum(alpha, c),log_res_fitness(social_optimum(alpha, c),alpha,c),'o',color=color)
	
make_some_pips('cd')

plt.savefig("sample_PIPs_2alpha.png")

plt.show()
