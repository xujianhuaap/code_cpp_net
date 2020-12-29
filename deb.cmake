############################# CPACK START###############

set(CPACK_GENERATOR "DEB")
set(CPACK_PACKAGE_VERSION "1.0.0")
set(CPACK_SET_DESTDIR ON)
set(CPACK_DEB_PACKAGE_GROUP "DEV")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "SkullMind")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "")

message("deb->" ${CMAKE_CURRENT_SOURCE_DIR})

include(CPack)
#cpack_add_component_group(DEV)
#cpack_add_component(tool GROUP DEV)

########### CPACK END###################################