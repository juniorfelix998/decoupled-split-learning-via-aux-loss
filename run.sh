#!/bin/bash
#SBATCH --job-name=j6-tiny-sp2
#SBATCH --partition=gpu-week-long
#SBATCH --time=7-00:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --gres=gpu:1
#SBATCH --output=%x-%A.out
#SBATCH --error=%x-%A.err

# Activate conda
source /usr/local/anaconda3/etc/profile.d/conda.sh

# Activate environment
conda activate venv

# Run command - use the venv's python, NOT the hardcoded anaconda base python
srun --exclusive -n1 \
python -u jan6tiny/dgl.py

echo "All dgl/standard_split on cifar10 RUNS COMPLETED."
