#!/usr/bin/env python

import sys, os

from meta_planning.parsers import parse_trajectory, parse_model
from meta_planning import LearningTask
from meta_planning.evaluation import SynEvaluator

model = sys.argv[1]
logs_folder = sys.argv[2]

# Define the initial model
M = parse_model(model)

# Define the set of observations
T = [parse_trajectory(os.path.join(logs_folder, log), M) for log in os.listdir(logs_folder)]
O = [t.observe(1, action_observability=1) for t in T]

# Create learning task
lt = LearningTask(M, O)

solution = lt.learn()
print(solution.learned_model)