add_library(net SHARED Net.cpp)

if(INSTALL_LIB)
install(TARGETS net DESTINATION lib)
endif(INSTALL_LIB)