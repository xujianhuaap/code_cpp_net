set(Net_VERSION 1.0.1)
add_library(net SHARED Net.cpp)
set_property(TARGET net PROPERTY VERSION ${Net_VERSION})
set_property(TARGET net APPEND
        PROPERTY COMPATIBLE_INTERFACE_STRING Net_MAJOR_VERSION)

if(INSTALL_LIB)
    include(GenerateExportHeader)
    generate_export_header(net)
    set(Net_LIB_DIR "Net-${Net_VERSION}")
    set(ConfigPackageLocation "lib/${Net_LIB_DIR}")

    #====================== pkg-config ====================================
    set(NET_PKGCONFIG_FILE NetTarget.pc)
    set (prefix "${CMAKE_INSTALL_PREFIX}")
    set (exec_prefix "\${prefix}")
    set (libdir "\${exec_prefix}/${ConfigPackageLocation}")
    set (includedir "\${prefix}/include/${Net_LIB_DIR}")
    set (PACKAGE_VERSION "${Net_VERSION}")

    configure_file (Net.pc.in
            ${CMAKE_CURRENT_BINARY_DIR}/${NET_PKGCONFIG_FILE} @ONLY)
    install(FILES  ${CMAKE_CURRENT_BINARY_DIR}/${NET_PKGCONFIG_FILE}
            DESTINATION lib/pkgconfig
            )
    #============================pkg-config===================================

    #=====================config package==================================================
    include(CMakePackageConfigHelpers OPTIONAL
            RESULT_VARIABLE PkgHelpers_AVAILABLE)

    if(PkgHelpers_AVAILABLE)
        set(DIR_LIB ${ConfigPackageLocation})
        set(DIR_INCLUDE "include/${Net_LIB_DIR}")
        configure_package_config_file(NetConfig.cmake.in
                ${CMAKE_CURRENT_BINARY_DIR}/NetConfig.cmake
                INSTALL_DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
                PATH_VARS DIR_LIB DIR_INCLUDE)
        write_basic_package_version_file(
                ${CMAKE_CURRENT_BINARY_DIR}/NetConfigVersion.cmake
                VERSION ${Net_VERSION}
                COMPATIBILITY SameMajorVersion )

        install(FILES ${CMAKE_CURRENT_BINARY_DIR}/NetConfig.cmake
                ${CMAKE_CURRENT_BINARY_DIR}/NetConfigVersion.cmake
                DESTINATION ${ConfigPackageLocation})

        set(CONFIG_PACKAGE_LOCATION ${ConfigPackageLocation})
        configure_package_config_file(NetTargetConfig.cmake.in
                ${CMAKE_CURRENT_BINARY_DIR}/NetTargetConfig.cmake
                INSTALL_DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
                PATH_VARS CONFIG_PACKAGE_LOCATION)
        write_basic_package_version_file(
                ${CMAKE_CURRENT_BINARY_DIR}/NetTargetConfigVersion.cmake
                VERSION ${Net_VERSION}
                COMPATIBILITY SameMajorVersion )

        install(FILES ${CMAKE_CURRENT_BINARY_DIR}/NetTargetConfig.cmake
                ${CMAKE_CURRENT_BINARY_DIR}/NetTargetConfigVersion.cmake
                DESTINATION ${ConfigPackageLocation})
    endif(PkgHelpers_AVAILABLE)
    #=========================config package=================================================

    install(TARGETS net EXPORT NetTarget
            LIBRARY DESTINATION ${ConfigPackageLocation}
            INCLUDES DESTINATION "include/${Net_LIB_DIR}"
            )
    export(EXPORT NetTarget
            FILE "${CMAKE_CURRENT_BINARY_DIR}/NetTarget.cmake"
            NAMESPACE SkullMind::
            )

    #
    install(EXPORT NetTarget
            FILE NetTarget.cmake
            NAMESPACE SkullMind::
            DESTINATION ${ConfigPackageLocation})

    install(FILES Net.h
            DESTINATION "include/${Net_LIB_DIR}"
            )
    # 注册 Tools包到~/.cmake/packages/xxxxx
    set(CMAKE_EXPORT_PACKAGE_REGISTRY true)
    export(PACKAGE Net )
    export(PACKAGE NetTarget )
endif(INSTALL_LIB)