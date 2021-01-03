set(Net_VERSION 1.0.2)

add_library(net SHARED Net.cpp)
set_property(TARGET net PROPERTY VERSION ${Net_VERSION})
set_property(TARGET net APPEND
        PROPERTY COMPATIBLE_INTERFACE_STRING Net_MAJOR_VERSION)

if(INSTALL_LIB)
    include(GenerateExportHeader)
    generate_export_header(net)
    set(Net_VERSION_DIR "net-${Net_VERSION}")
    set(ConfigPackageLocation "lib/${Net_VERSION_DIR}")

    #====================== pkg-config ====================================
    set(NET_PKGCONFIG_FILE NetTarget.pc)
    set (prefix "${CMAKE_INSTALL_PREFIX}")
    set (exec_prefix "\${prefix}")
    set (libdir "\${exec_prefix}/${ConfigPackageLocation}")
    set (includedir "\${prefix}/include/${Net_VERSION_DIR}")
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
        set(INCLUDE_INSTALL_DIR include)
        configure_package_config_file(NetTargetConfig.cmake.in
                ${CMAKE_CURRENT_BINARY_DIR}/NetTargetConfig.cmake
                INSTALL_DESTINATION ${ConfigPackageLocation}
                PATH_VARS INCLUDE_INSTALL_DIR)
        write_basic_package_version_file(
                ${CMAKE_CURRENT_BINARY_DIR}/NetTargetConfigVersion.cmake
                VERSION ${Net_VERSION}
                COMPATIBILITY SameMajorVersion )

        install(FILES ${CMAKE_CURRENT_BINARY_DIR}/NetTargetConfig.cmake
                ${CMAKE_CURRENT_BINARY_DIR}/NetTargetConfigVersion.cmake
                DESTINATION ${ConfigPackageLocation})
    endif(PkgHelpers_AVAILABLE)
    #=========================config package=================================================

    #========================== install target or import_target================================
    install(TARGETS net EXPORT NetTarget
            RUNTIME DESTINATION "bin/${Net_VERSION_DIR}"
            LIBRARY DESTINATION lib
            ARCHIVE DESTINATION lib)
    # 在安装的路径下创建（/usr/local/lib)创建.cmake文件
    install(EXPORT NetTarget
            FILE "NetTarget-${Net_VERSION}.cmake"
            DESTINATION ${ConfigPackageLocation})

    #在对应的build路径下面创建.cmake文件，该文件不能用于安装；只是为了第三方工程编译使用
    export(TARGETS net
            FILE "${CMAKE_CURRENT_BINARY_DIR}/NetTarget.cmake")



    install(FILES Net.h
            DESTINATION "include/${Net_VERSION_DIR}")
    #========================== install target or import_target================================

    # ========================注册 Tools包到~/.cmake/packages/xxxxx=============================
    set(CMAKE_EXPORT_PACKAGE_REGISTRY true)
    export(PACKAGE Net )
    export(PACKAGE NetTarget )
    # ========================注册 Tools包到~/.cmake/packages/xxxxx=============================
    install(SCRIPT net.cmake)
endif(INSTALL_LIB)