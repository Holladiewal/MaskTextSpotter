#!/usr/bin/env bash
#SBATCH -N 2
#SBATCH --gpus-per-node t2080ti:3
#SBATCH --chdir /nfs/home/schmittz/git/MaskTextSpotter
export MASTER=$(scontrol show hostnames "$SLURM_JOB_NODELIST" | head -n 1)
srun singularity exec ~/env/mts/mts.sif ./train.sh
