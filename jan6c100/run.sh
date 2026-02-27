#!/bin/bash
#SBATCH --job-name=j6-c100-sp2
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
conda activate myenv

export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$LD_LIBRARY_PATH
# Run command
srun --exclusive -n1 \
/usr/local/anaconda3/bin/python -u dgl.py \
echo "All dgl/standard_split on cifar100 RUNS COMPLETED."
