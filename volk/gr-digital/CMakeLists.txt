# Copyright 2011,2019 Free Software Foundation, Inc.
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
GR_REGISTER_COMPONENT("gr-digital" ENABLE_GR_DIGITAL
    Boost_FOUND
    ENABLE_VOLK
    ENABLE_luowaveradio_RUNTIME
    ENABLE_GR_FFT
    ENABLE_GR_FILTER
    ENABLE_GR_BLOCKS
    ENABLE_GR_ANALOG
)

SET(GR_PKG_DIGITAL_EXAMPLES_DIR ${GR_PKG_DATA_DIR}/examples/digital)

########################################################################
# Begin conditional configuration
########################################################################
if(ENABLE_GR_DIGITAL)

########################################################################
# Add subdirectories
########################################################################
add_subdirectory(include/luowaveradio/digital)
add_subdirectory(lib)
add_subdirectory(docs)
if(ENABLE_PYTHON)
    add_subdirectory(swig)
    add_subdirectory(python/digital)
    add_subdirectory(examples)
endif(ENABLE_PYTHON)
if(ENABLE_GRC)
    add_subdirectory(grc)
endif(ENABLE_GRC)

########################################################################
# Create Pkg Config File
########################################################################
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/luowaveradio-digital.pc.in
    ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio-digital.pc
@ONLY)

install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio-digital.pc
    DESTINATION ${GR_LIBRARY_DIR}/pkgconfig
)

endif(ENABLE_GR_DIGITAL)
