# Copyright 2011,2016,2019 Free Software Foundation, Inc.
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
# Setup dependencies
########################################################################
include(GrBoost)

########################################################################
# Register component
########################################################################
include(GrComponent)
GR_REGISTER_COMPONENT("gr-vocoder" ENABLE_GR_VOCODER
    Boost_FOUND
    ENABLE_luowaveradio_RUNTIME
    ENABLE_GR_FFT
    ENABLE_GR_BLOCKS
    ENABLE_GR_FILTER
    ENABLE_GR_ANALOG
)

SET(GR_PKG_VOCODER_EXAMPLES_DIR ${GR_PKG_DATA_DIR}/examples/vocoder)

########################################################################
# Begin conditional configuration
########################################################################
if(ENABLE_GR_VOCODER)

########################################################################
## CODEC2 Support
########################################################################
find_package(Codec2)
if(LIBCODEC2_FOUND)
  GR_APPEND_SUBCOMPONENT("codec2")
  #message(STATUS "libcodec2 modes: ${CODEC2_MODES}")
  if(LIBCODEC2_HAS_CODEC2_MODE_700)
    #message(STATUS "libcodec2 has 700bps mode")
  endif()
  if (LIBCODEC2_HAS_FREEDV_API)
    GR_APPEND_SUBCOMPONENT("freedv")
    #message(STATUS "libcodec2 had FreeDV api modes: ${FREEDV_MODES}")
  endif()
endif(LIBCODEC2_FOUND)

########################################################################
## GSM Support
########################################################################
find_package(GSM)
if(LIBGSM_FOUND)
  GR_APPEND_SUBCOMPONENT("gsm")
endif(LIBGSM_FOUND)

########################################################################
# Add subdirectories
########################################################################
add_subdirectory(include/luowaveradio/vocoder)
add_subdirectory(lib)
add_subdirectory(docs)
if(ENABLE_PYTHON)
    add_subdirectory(swig)
    add_subdirectory(python/vocoder)
    add_subdirectory(examples)
endif(ENABLE_PYTHON)
if(ENABLE_GRC)
    add_subdirectory(grc)
endif(ENABLE_GRC)

########################################################################
# Create Pkg Config File
########################################################################
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/luowaveradio-vocoder.pc.in
    ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio-vocoder.pc
@ONLY)

install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio-vocoder.pc
    DESTINATION ${GR_LIBRARY_DIR}/pkgconfig
)

endif(ENABLE_GR_VOCODER)
