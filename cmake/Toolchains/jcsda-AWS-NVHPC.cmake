####################################################################
# Compiler FLAGS
####################################################################

set( ECBUILD_CXX_FLAGS      "-Wc,--pending_instantiations=128" CACHE STRING "NVHPC base CXX compiler flags" FORCE )

####################################################################
# MPI
####################################################################

set( MPIEXEC_EXECUTABLE /opt/nvidia/hpc_sdk/Linux_x86_64/21.5/comm_libs/mpi/bin/mpirun CACHE STRING "Use nvidia SDK" FORCE )
set( MPIEXEC_NUMPROC_FLAG "-np" CACHE STRING "NUMPROC flag for mpirun" FORCE)

####################################################################
# Options
####################################################################

set( ENABLE_AEC OFF CACHE STRING "Disable AEC" FORCE)

####################################################################
# FYPP preprocessor (line numbering warning)
####################################################################

set( FYPP_NO_LINE_NUMBERING ON CACHE STRING "Disable FYPP line numbering" FORCE )
