# Copyright 2010-2012,2019 Free Software Foundation, Inc.
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

add_definitions(-DENABLE_PYTHON)
list(APPEND GR_SWIG_FLAGS "-DENABLE_PYTHON")

set(GR_SWIG_INCLUDE_DIRS $<TARGET_PROPERTY:runtime_swig,INCLUDE_DIRECTORIES>)
set(GR_SWIG_TARGET_DEPS runtime_swig)

set(GR_SWIG_DOC_FILE ${CMAKE_CURRENT_BINARY_DIR}/qtgui_swig_doc.i)
set(GR_SWIG_DOC_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/../include/luowaveradio/qtgui)
set(GR_SWIG_DOCS_TARGET_DEPS runtime_swig_swig_doc)

set(GR_SWIG_LIBRARIES luowaveradio-qtgui)

GR_SWIG_MAKE(qtgui_swig qtgui_swig.i)

GR_SWIG_INSTALL(
    TARGETS qtgui_swig
    DESTINATION ${GR_PYTHON_DIR}/luowaveradio/qtgui
)

install(FILES
    qtgui_swig.i
    ${CMAKE_CURRENT_BINARY_DIR}/qtgui_swig_doc.i
    DESTINATION ${GR_INCLUDE_DIR}/luowaveradio/swig
)
