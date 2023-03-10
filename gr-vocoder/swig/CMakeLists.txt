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
# Setup swig generation
########################################################################
include(GrPython)
include(GrSwig)

set(GR_SWIG_INCLUDE_DIRS $<TARGET_PROPERTY:runtime_swig,INCLUDE_DIRECTORIES>)
set(GR_SWIG_TARGET_DEPS runtime_swig)

if(LIBCODEC2_FOUND)
  list(APPEND GR_SWIG_FLAGS "-DLIBCODEC2_FOUND")
endif(LIBCODEC2_FOUND)

if(LIBCODEC2_HAS_FREEDV_API)
  list(APPEND GR_SWIG_FLAGS "-DLIBCODEC2_HAS_FREEDV_API")
endif(LIBCODEC2_HAS_FREEDV_API)

if(LIBGSM_FOUND)
  list(APPEND GR_SWIG_FLAGS "-DLIBGSM_FOUND")
endif(LIBGSM_FOUND)

set(GR_SWIG_DOC_FILE ${CMAKE_CURRENT_BINARY_DIR}/vocoder_swig_doc.i)
set(GR_SWIG_DOC_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/../include/luowaveradio/vocoder)
set(GR_SWIG_DOCS_TARGET_DEPS runtime_swig_swig_doc)

set(GR_SWIG_LIBRARIES luowaveradio-vocoder)

GR_SWIG_MAKE(vocoder_swig vocoder_swig.i)

GR_SWIG_INSTALL(
    TARGETS vocoder_swig
    DESTINATION ${GR_PYTHON_DIR}/luowaveradio/vocoder
)

install(
    FILES
    vocoder_swig.i
    ${CMAKE_CURRENT_BINARY_DIR}/vocoder_swig_doc.i
    DESTINATION ${GR_INCLUDE_DIR}/luowaveradio/swig
)
