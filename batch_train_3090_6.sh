#!/usr/bin/env bash
#SBATCH -Ga3090:6
#SBATCH --chdir /nfs/home/schmittz/git/MaskTextSpotter
export MASTER=$(scontrol show hostnames "$SLURM_JOB_NODELIST" | head -n 1)
srun singularity exec ~/env/mts/mts.sif ./train.sh
