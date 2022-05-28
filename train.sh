#!/usr/bin/env bash
CONFIG_FILE=configs/pretrain.yaml
#CONFIG_FILE=configs/finetune.yaml
LOCAL_GPU_COUNT=$(nvidia-smi -L | wc -l)
#MASTER=$(scontrol show hostnames "$SLURM_JOB_NODELIST" | head -n 1)
echo "MASTER NODE" $MASTER
echo "NODE COUNT" $SLURM_JOB_NUM_NODES
echo "NODE RANK" $SLURM_NODEID
echo "LOCAL GPU COUNT" $LOCAL_GPU_COUNT

OMP_NUM_THREADS=4 python3 -m torch.distributed.launch --nnodes=$SLURM_JOB_NUM_NODES --node_rank=$SLURM_NODEID \
 --master_addr=$MASTER --master_port=6666 --nproc_per_node=$LOCAL_GPU_COUNT tools/train_net.py --config-file $CONFIG_FILE
