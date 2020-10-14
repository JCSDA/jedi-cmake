####################################################################
# MPI
####################################################################

set( MPIEXEC_EXECUTABLE   "/opt/slurm/bin/srun" CACHE STRING "srun executable for Orion" FORCE )
set( MPIEXEC_NUMPROC_FLAG "-n" CACHE STRING "NUMPROC Flag for srun" FORCE )

####################################################################
# Options
####################################################################

set( ENABLE_AEC OFF CACHE STRING "Disable AEC" FORCE )
