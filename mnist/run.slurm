#!/bin/bash

#SBATCH --job-name=tf_example    # create a short name for your job
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --cpus-per-task=10       # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --partition=gpu          # Name of the partition
#SBATCH --gres=gpu:rtx6000:1     # GPU nodes are only available in gpu partition
#SBATCH --mem=10G                # Total memory allocated
#SBATCH --hint=multithread       # we get logical cores (threads) not physical (cores)
#SBATCH --time=00:01:00          # total run time limit (HH:MM:SS)
#SBATCH --output=%x_%j.out   # output file name

echo "### Running $SLURM_JOB_NAME ###"

cd ${SLURM_SUBMIT_DIR}

module purge
module load cuda/10.1.105

# Set your conda environment
source /home/$USER/.bashrc
# tensorflow environment shloud bre created previously
source activate tf_env

python ./tf_example.py