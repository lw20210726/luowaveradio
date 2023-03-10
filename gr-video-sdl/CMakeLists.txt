# Copyright 2011 Free Software Foundation, Inc.
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

find_package(SDL)

########################################################################
# Register component
########################################################################
include(GrComponent)
GR_REGISTER_COMPONENT("gr-video-sdl" ENABLE_GR_VIDEO_SDL
    SDL_FOUND
    Boost_FOUND
    ENABLE_luowaveradio_RUNTIME
)

########################################################################
# Begin conditional configuration
########################################################################
if(ENABLE_GR_VIDEO_SDL)

########################################################################
# Add subdirectories
########################################################################
add_subdirectory(include/luowaveradio/video_sdl)
add_subdirectory(lib)
if(ENABLE_PYTHON)
    add_subdirectory(swig)
    add_subdirectory(python/video_sdl)
endif(ENABLE_PYTHON)
if(ENABLE_GRC)
    add_subdirectory(grc)
endif(ENABLE_GRC)

########################################################################
# Create Pkg Config File
########################################################################
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/luowaveradio-video-sdl.pc.in
    ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio-video-sdl.pc
@ONLY)

install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio-video-sdl.pc
    DESTINATION ${GR_LIBRARY_DIR}/pkgconfig
)

endif(ENABLE_GR_VIDEO_SDL)
