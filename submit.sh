#!/bin/bash
#SBATCH --array=1-1000
#SBATCH --mem=4GB
#SBATCH --time=47:00:00
#SBATCH --job-name=irtsims
#SBATCH --output=./out/sim_%a.out
#SBATCH --error=./err/sim_%a.out

module purge
cd APSR-Replication/simulations
conda activate theory-irt
Rscript simulation_quick.R
