#
# jedicmake -- The JEDI project CMake toolkit.
#
# This package is required for building all JEDI CMake packages.
#

cmake_minimum_required( VERSION 3.12 )
project( jedicmake VERSION 1.0.1 DESCRIPTION "JEDI CMake Toolkit" )

include(GNUInstallDirs)
set(JEDI_MODULES_INSTALL_DIR ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME})
install(DIRECTORY cmake/Functions DESTINATION ${JEDI_MODULES_INSTALL_DIR})
install(DIRECTORY cmake/Modules DESTINATION ${JEDI_MODULES_INSTALL_DIR})
install(DIRECTORY cmake/Toolchains DESTINATION ${JEDI_MODULES_INSTALL_DIR})

include(CMakePackageConfigHelpers)

#Build-tree export
set(FUNCTIONS_EXPORT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Functions)
set(MODULES_EXPORT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules)
set(TOOLCHAINS_EXPORT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Toolchains)
set(BUILD_INSTALL_DESTINATION lib/${PROJECT_NAME}/cmake)
configure_package_config_file(PackageConfig.cmake.in ${PROJECT_NAME}-config.cmake
                              INSTALL_DESTINATION .
                              INSTALL_PREFIX ${CMAKE_CURRENT_BINARY_DIR}
			      PATH_VARS FUNCTIONS_EXPORT_DIR MODULES_EXPORT_DIR TOOLCHAINS_EXPORT_DIR)

#Install-tree export
set(CONFIG_INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/${PROJECT_NAME}/cmake)
set(FUNCTIONS_EXPORT_DIR ${JEDI_MODULES_INSTALL_DIR}/Functions)
set(MODULES_EXPORT_DIR ${JEDI_MODULES_INSTALL_DIR}/Modules)
set(TOOLCHAINS_EXPORT_DIR ${JEDI_MODULES_INSTALL_DIR}/Toolchains)
configure_package_config_file(PackageConfig.cmake.in install/${PROJECT_NAME}-config.cmake
                              INSTALL_DESTINATION ${CONFIG_INSTALL_DESTINATION}
			      PATH_VARS FUNCTIONS_EXPORT_DIR MODULES_EXPORT_DIR TOOLCHAINS_EXPORT_DIR)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/install/${PROJECT_NAME}-config.cmake
        DESTINATION ${CONFIG_INSTALL_DESTINATION})

# config-version.cmake
write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY AnyNewerVersion)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake
        DESTINATION ${CONFIG_INSTALL_DESTINATION})

