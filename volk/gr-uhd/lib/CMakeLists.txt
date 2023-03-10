# Copyright 2011-2013,2019 Free Software Foundation, Inc.
#
# This file is part of GNU Radio
#
# GNU Radio is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# GNU Radio is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Radio; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.

########################################################################
# Setup library
########################################################################
add_library(luowaveradio-uhd
    usrp_block_impl.cc
    usrp_source_impl.cc
    usrp_sink_impl.cc
    amsg_source_impl.cc
)

target_link_libraries(luowaveradio-uhd
  luowaveradio-runtime
  UHD::UHD
)

target_include_directories(luowaveradio-uhd
  PUBLIC
  $<INSTALL_INTERFACE:include>
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../include>
  )



#Add Windows DLL resource file if using MSVC
if(MSVC)
    include(${CMAKE_SOURCE_DIR}/cmake/Modules/GrVersion.cmake)

    configure_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/luowaveradio-uhd.rc.in
        ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio-uhd.rc
    @ONLY)

    target_sources(luowaveradio-uhd PRIVATE
        ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio-uhd.rc
    )
endif(MSVC)

if(BUILD_SHARED_LIBS)
  GR_LIBRARY_FOO(luowaveradio-uhd UHD)
endif()
