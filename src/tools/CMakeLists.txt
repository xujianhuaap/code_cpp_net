
 set(Tools_VERSION 1.0.1)


# 指定生成动态库
# add_library(<name> [STATIC | SHARED | MODULE]
#            [EXCLUDE_FROM_ALL]
#            [<source>...])
# STATIC 是归档文件链接其他目标时候使用　产生.文件
#　SHARED 是在运行的时候动态链接和加载  产生.so文件
#　MODULE 不链接其他目标的插件，但在运行的时候使用dlopen-like的方法动态加载
add_library(tools SHARED Log.cpp)
# 指定生成版本号，VERSION指代动态库版本，SOVERSION指代API版本
# SET_TARGET_PROPERTIES(tools PROPERTIES VERSION 1.2 SOVERSION 1)
 set_property(TARGET tools PROPERTY VERSION ${Tools_VERSION})
 set_property(TARGET tools APPEND
         PROPERTY COMPATIBLE_INTERFACE_STRING Tools_MAJOR_VERSION)
if(INSTALL_LIB)
    include(GenerateExportHeader)
    generate_export_header(tools)


    install(TARGETS tools EXPORT toolsExpTarget
            LIBRARY DESTINATION lib
            INCLUDES DESTINATION include
            COMPONENT Tools)
    install(FILES Log.h
            DESTINATION include
            COMPONENT Tools)

    include(CMakePackageConfigHelpers)
    configure_package_config_file(ToolsConfig.cmake.in ToolsConfig.cmake
            INSTALL_DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
    write_basic_package_version_file(
            "${CMAKE_CURRENT_BINARY_DIR}/ToolsConfigVersion.cmake"
            VERSION ${Tools_VERSION}
            COMPATIBILITY SameMajorVersion
    )


    # 注册 Tools包
    set(CMAKE_EXPORT_PACKAGE_REGISTRY true)
    export(PACKAGE Tools)
    if(INSTALL_LIB_EXPORT)

        #    toolsExpTarget 永远不应该被安装，只是用于外部工程调用
        export(EXPORT toolsExpTarget
                FILE "${CMAKE_CURRENT_BINARY_DIR}/skull_mind/ToolsExpTarget.cmake"
                NAMESPACE SkullMind::
                )
        message("--CMAKE_CURRENT_BINARY_DIR" ${CMAKE_CURRENT_BINARY_DIR})

        set(ConfigPackageLocation lib/cmake/skull_mind)

        install(EXPORT toolsExpTarget
                FILE ToolsExpTarget.cmake
                NAMESPACE SkullMind::
                DESTINATION ${ConfigPackageLocation})

        #    安装config和configVersion文件到安装路径
        install(FILES "${CMAKE_CURRENT_BINARY_DIR}/ToolsConfig.cmake"
                "${CMAKE_CURRENT_BINARY_DIR}/ToolsConfigVersion.cmake"
                DESTINATION ${ConfigPackageLocation}
                COMPONENT Tools
                )

        # 注册 Tools包
        set(CMAKE_EXPORT_PACKAGE_REGISTRY true)
        export( PACKAGE Tools )
    endif(INSTALL_LIB_EXPORT)
endif(INSTALL_LIB)
