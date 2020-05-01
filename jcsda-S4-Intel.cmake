####################################################################
# MPI
####################################################################

set( MPIEXEC_EXECUTABLE   "/usr/bin/srun" CACHE STRING "srun executable for S4" FORCE )
set( MPIEXEC_NUMPROC_FLAG "-n" CACHE STRING "NUMPROC Flag for srun" FORCE )

####################################################################
# Options
####################################################################

set( ENABLE_AEC OFF CACHE STRING "Disable AEC" FORCE )
