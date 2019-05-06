import warnings
warnings.filterwarnings('ignore')

import sys 
import matplotlib.pylab as plt
import numpy as np
import bnpy

# pre=Processing
from sklearn.preprocessing import MinMaxScaler

# Convert the dataset for BNPY
from sklearn.preprocessing import normalize, MinMaxScaler
scaler = MinMaxScaler()
AllDataPoint_scaler=scaler.fit_transform(AllDataPoint)
dataset = bnpy.data.XData(AllDataPoint_scaler)

# Create Keywords for bnpy
merge_kwargs = dict(
					m_startLap=10,
					m_pair_ranking_procedure='total_size',
					m_pair_ranking_direction='descending',
					)
delete_kwargs = dict(
					d_startLap=20,
					d_nRefineSteps=50,
					)

birth_kwargs = dict(
					b_startLap=2,
					b_stopLap=6,
					b_Kfresh=3,
					b_nRefineSteps=5,
					)

local_step_kwargs = dict(
					# Perform at most this many iterations at each document
					nCoordAscentItersLP=100,
					# Stop local iters early when max change in doc-topic counts < this thr
					convThrLP=0.01,
					restartLP=0,
					doMemoizeLocalParams=0,
					)


# Set gamma , sf and initial cluster number
gamma = 5.0
sF = 5.0
ClusterNumber = 25

# Training models

trained_model, info_dict = bnpy.run(
	dataset, 'DPMixtureModel', 'Gauss', 'memoVB',
	output_path=('/tmp/StandardNormalK1/' +
	'trymoves-K=%d-gamma=%s-ECovMat=%s*eye-moves=delete,shuffle/' % (
	ClusterNumber, gamma, sF)),
	nLap=100, nTask=1, nBatch=1,#convergeThr=0.0001,
	gamma0=gamma, sF=sF, ECovMat='eye',
	K=ClusterNumber, initname='randexamplesbydist',
	moves='delete,shuffle',
	**dict(local_step_kwargs.items() +
		   delete_kwargs.items())
	)

# Birth and merge variational training for topic model

trained_model, info_dict = bnpy.run(
	dataset, 'HDPTopicModel', 'Mult', 'memoVB',
	output_path='/tmp/we8there/trymoves-model=hdp_topic+mult-K=5/',
	nLap=20, convergeThr=0.01, nBatch=1,
	K=5, initname='randomlikewang',
	gamma=50.0, alpha=0.5, lam=0.1,
	moves='birth,merge,shuffle',
	**dict(local_step_kwargs.items() +
	merge_kwargs.items() +
	birth_kwargs.items())
	)

#plot the loss function over time. We’ll skip the first few iterations, since performance is quite
bad.
pylab.figure(figsize=FIG_SIZE)
pylab.plot(info_dict['lap_history'][2:], info_dict['loss_history'][2:], 'k.-')
pylab.xlabel('num. laps')
pylab.ylabel('loss')
pylab.tight_layout()
