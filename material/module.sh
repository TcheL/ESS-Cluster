#%Module1.0

conflict mpi

set version 3.1.1rc1

set OPENMPIROOT "/usr/mpi/gcc/openmpi-${version}"

module-whatis "Enable usage for openmpi version ${version}"

setenv MPI_ROOT "${OPENMPIROOT}"

#use 'normal' compact core binding as a default
setenv OMPI_MCA_rmaps_base_mapping_policy core
setenv OMPI_MCA_hwloc_base_binding_policy core

prepend-path PATH            "${OPENMPIROOT}/bin"
prepend-path INCLUDE         "${OPENMPIROOT}/include"
prepend-path LD_LIBRARY_PATH "${OPENMPIROOT}/lib"
prepend-path MANPATH         "${OPENMPIROOT}/share/man"

