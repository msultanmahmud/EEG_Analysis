
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
from sklearn.datasets import make_blobs

from sklearn.mixture import BayesianGaussianMixture
# centers = [(-5, -5), (0, 0), (5, 5)]
# X, y = make_blobs(n_samples=n_samples, n_features=2, cluster_std=1.0,
#                   centers=centers, shuffle=False, random_state=42)
N=10000
X=np.concatenate((np.random.normal(0, 1, int(0.3 * N)),
                        np.random.normal(5, 1, int(0.7 * N))))[:, np.newaxis]


BNPY=BayesianGaussianMixture(
        weight_concentration_prior_type="dirichlet_distribution",
        n_components=6, reg_covar=0, init_params='random',
        max_iter=1500, mean_precision_prior=.8,
        random_state=42,
        verbose=1, 
        verbose_interval=10)
BNPY.fit(X)

## Plot cluster probability

fig,ax2 = plt.subplots(1,1, figsize=(15,4))
n_components=6
index = np.arange(n_components)

ax2.yaxis.grid(True, alpha=0.7)
for k, w in enumerate(BNPY.weights_):
    ax2.bar(k, w, width=0.9, color='#56B4E9', zorder=3,
            align='center', edgecolor='black')
    ax2.text(k, w + 0.007, "%.1f%%" % (w * 100.),
             horizontalalignment='center')
ax2.set_xlim(-.6, n_components)
ax2.set_ylim(0., 0.9)
ax2.tick_params(axis='y', which='both', left='off',
                right='off', labelleft='off')
plt.xticks(np.arange(min(x), max(x)+1, 1.0))

ax2.tick_params(axis='x', which='both', top='off')