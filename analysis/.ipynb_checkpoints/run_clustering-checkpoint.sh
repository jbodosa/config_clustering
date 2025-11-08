#!/bin/bash
#SBATCH -A energybio-eng
#SBATCH -N 1
#SBATCH --partition=standard
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=128
#SBATCH --job-name=cluster
#SBATCH -t 10:00:00
#SBATCH --output="clusterFEP.out"

module load gcc/11.3.0   
module load openmpi/gcc/11.3.0/zen2/4.1.5   

source ~/.bashrc.conda
conda activate py3_mda



INPUT_NOTEBOOK="run_cluster.ipynb"
# Name for the executed, output notebook
OUTPUT_NOTEBOOK="run_cluster_executed.ipynb"

echo Time is `date`

papermill $INPUT_NOTEBOOK $OUTPUT_NOTEBOOK

# Deactivate environment
conda deactivate

echo "Job completed."


