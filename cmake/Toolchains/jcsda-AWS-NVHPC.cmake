####################################################################
# Compiler FLAGS
####################################################################

set( ECBUILD_CXX_FLAGS      "-Wc,--pending_instantiations=128" CACHE STRING "NVHPC base CXX compiler flags" FORCE )

####################################################################
# Options
####################################################################

set( ENABLE_AEC OFF CACHE STRING "Disable AEC" FORCE)

####################################################################
# FYPP preprocessor (line numbering warning)
####################################################################

set( FYPP_NO_LINE_NUMBERING ON CACHE STRING "Disable FYPP line numbering" FORCE )
