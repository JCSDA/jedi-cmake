####################################################################
# Compiler FLAGS
####################################################################

set( ECBUILD_C_FLAGS        "-m64" CACHE STRING "Discover base C compiler flags" FORCE )
set( ECBUILD_CXX_FLAGS      "-m64" CACHE STRING "Discover base CXX compiler flags" FORCE )
set( ECBUILD_Fortran_FLAGS  "-m64" CACHE STRING "Discover base Fortran compiler flags" FORCE )

####################################################################
# MPI
####################################################################

set( MPIEXEC_EXECUTABLE   $ENV{MPIEXEC} CACHE STRING "Discover get MPIEXEC from environment" FORCE )
set( MPIEXEC_NUMPROC_FLAG "-np" CACHE STRING "NUMPROC flag for mpirun" FORCE)

####################################################################
# Options
####################################################################

set( ENABLE_AEC OFF CACHE STRING "Disable AEC" FORCE)

####################################################################
# FYPP preprocessor (line numbering warning)
####################################################################

set( FYPP_NO_LINE_NUMBERING ON CACHE STRING "Disable FYPP line numbering" FORCE )
