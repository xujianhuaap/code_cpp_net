#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "net" for configuration "Debug"
set_property(TARGET net APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(net PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/Net-1.0.1/libnet.so.1.0.1"
  IMPORTED_SONAME_DEBUG "libnet.so.1.0.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS net )
list(APPEND _IMPORT_CHECK_FILES_FOR_net "${_IMPORT_PREFIX}/lib/Net-1.0.1/libnet.so.1.0.1" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
