help([[
]])

local pkgName    = myModuleName()
local pkgVersion = myModuleVersion()
local pkgNameVer = myModuleFullName()

local hierA        = hierarchyA(pkgNameVer,1)
local compNameVer  = hierA[1]
local compNameVerD = compNameVer:gsub("/","-")

--io.stderr:write("compNameVer: ",compNameVer,"\n")
--io.stderr:write("compNameVerD: ",compNameVerD,"\n")

family("mpi")

conflict(pkgName)
conflict("openmpi","impi")

try_load("szip")

local opt = os.getenv("JEDI_OPT") or os.getenv("OPT") or "/opt/modules"
local base = pathJoin(opt,compNameVerD,pkgName,pkgVersion)

prepend_path("PATH", pathJoin(base,"bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base,"lib"))
prepend_path("DYLD_LIBRARY_PATH", pathJoin(base,"lib"))
prepend_path("CPATH", pathJoin(base,"include"))
prepend_path("MANPATH", pathJoin(base,"share","man"))

setenv("MPI_ROOT",base)

-- Enable FindMPI.cmake to automatically find and configure mpich
setenv("MPI_HOME", base)
setenv("MPI_Fortran_COMPILER", pathJoin(base,"bin/mpifort"))
setenv("MPI_C_COMPILER", pathJoin(base,"bin/mpicc"))
setenv("MPI_CXX_COMPILER", pathJoin(base,"bin/mpicxx"))

whatis("Name: ".. pkgName)
whatis("Version: " .. pkgVersion)
whatis("Category: library")
whatis("Description: MPICH library")
