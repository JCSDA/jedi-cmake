####################################################################
# Compiler flags
####################################################################

set( CMAKE_CXX_FLAGS   "-gxx-name=/glade/u/apps/dav/opt/gnu/9.1.0/bin/g++" CACHE STRING "gnu headers for c++14" FORCE )
set( CMAKE_EXE_LINKER_FLAGS   "-gxx-name=/glade/u/apps/dav/opt/gnu/9.1.0/bin/g++ -Wl,-rpath,/glade/u/apps/dav/opt/gnu/9.1.0/lib64" CACHE STRING "gnu headers for c++14" FORCE )
set( CMAKE_SHARED_LINKER_FLAGS   "-gxx-name=/glade/u/apps/dav/opt/gnu/9.1.0/bin/g++ -Wl,-rpath,/glade/u/apps/dav/opt/gnu/9.1.0/lib64" CACHE STRING "gnu headers for c++14" FORCE )

####################################################################
# Options
####################################################################

set( ENABLE_AEC OFF CACHE STRING "Disable AEC" FORCE )

####################################################################
# FYPP preprocessor (line numbering warning)
####################################################################

set( FYPP_NO_LINE_NUMBERING ON CACHE STRING "Disable FYPP line numbering" FORCE )
