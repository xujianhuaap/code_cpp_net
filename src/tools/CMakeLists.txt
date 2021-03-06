
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
    set(TOOL_VERSION_DIR "tools-${Tools_VERSION}")
#
    include(GenerateExportHeader)
    generate_export_header(tools)
    if(INSTALL_LIB_EXPORT)
        #======================= 生成xxxConfig.cmake 和xxxConfigVersion.cmake================
        include(CMakePackageConfigHelpers)
        set(ConfigPackageLocation "lib/${TOOL_VERSION_DIR}")
        set(CONFIG_PACKAGE_LOCATION ${ConfigPackageLocation})
        configure_package_config_file(ToolsTargetConfig.cmake.in ToolsTargetConfig.cmake
                INSTALL_DESTINATION "${CMAKE_CURRENT_BINARY_DIR}"
                PATH_VARS  CONFIG_PACKAGE_LOCATION)
        write_basic_package_version_file(
                "${CMAKE_CURRENT_BINARY_DIR}/ToolsTargetConfigVersion.cmake"
                VERSION ${Tools_VERSION}
                COMPATIBILITY SameMajorVersion)
        # 安装config和configVersion文件到安装路径
        install(FILES "${CMAKE_CURRENT_BINARY_DIR}/ToolsTargetConfig.cmake"
                "${CMAKE_CURRENT_BINARY_DIR}/ToolsTargetConfigVersion.cmake"
                DESTINATION ${ConfigPackageLocation})
        #======================= 生成xxxConfig.cmake 和xxxConfigVersion.cmake================

        #======================================== install target or IMPORTED_target==================
        install(TARGETS tools EXPORT ToolsTarget
                LIBRARY DESTINATION lib
                INCLUDES DESTINATION "include/${TOOL_VERSION_DIR}")

        # 安装生成IMPORTED_TARGET的.cmake文件到安装路径
        install(EXPORT ToolsTarget
                FILE "ToolsTarget.cmake"
                DESTINATION ${ConfigPackageLocation})



        install(FILES Log.h
                DESTINATION "include/${TOOL_VERSION_DIR}")

        # ToolsTarget.cmake 在build 目录下面对应的路径永远不应该被安装，只是用于外部工程调用;
        export(TARGETS tools
                FILE "${CMAKE_CURRENT_BINARY_DIR}/ToolsTarget.cmake")
        #==================================== 注册 ToolsExport包=====================================
        set(CMAKE_EXPORT_PACKAGE_REGISTRY true)
        export( PACKAGE ToolsTarget )
        #==================================== 注册 ToolsExport包=====================================
    endif(INSTALL_LIB_EXPORT)
endif(INSTALL_LIB)
